class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_permitted)

    @review.restaurant = @restaurant
    # @review = Review.new(review_params.merge(restaurant: @restaurant))
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end
  private
  def review_permitted
    params.require(:review).permit(:content, :rating)
  end
end
