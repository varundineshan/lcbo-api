class Api::V1::RootController < Api::V1::ApiController
  def deprecated
    msg = case params[:name]
    when :dataset_by_date
      "The dataset by date [ZIP] endpoint has been deprecated and is no " \
      "longer available. Datasets are now available at /datasets and are no " \
      "longer SQLite dumps."
    when :current_dataset
      "The current dataset [ZIP] endpoint has been deprecated and is no " \
      "longer available. Datasets are now available at /datasets and are no " \
      "longer SQLite dumps. You can still download individual datasets at " \
      "/datasets/:id.zip but the format is now CSV and not SQLite."
    when :store_history
      "The store history endpoint has been deprecated and is no longer " \
      "available. Historical dataset snapshots are available at /datasets."
    when :inventory_history
      "The inventory history endpoint has been deprecated and is no longer " \
      "available. Historical dataset snapshots are available at /datasets."
    when :product_history
      "The product history endpoint has been deprecated and is no longer " \
      "available. Historical dataset snapshots are available at /datasets."
    end
    render_error :deprecation_notice, msg, 410
  end

  def show
    render text: ''
  end
end