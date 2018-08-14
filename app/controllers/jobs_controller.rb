class JobsController < ApplicationController

  def index
    @jobs = Job.all_unfilled
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_create_params)
    if @job.save
      redirect_to '/jobs'
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_edit_params)
      redirect_to '/jobs'
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to "/jobs"
    else
      render :show
    end
  end

  def select_succsessful_application
    
  end

  def select_job_completed
    
  end


  private
  def create_autofill_params
    {
      # CHANGE THIS ONCE USER HELPERS ARE AVAIABLE
      host: Host.first,
      # job_application: ,
      complete: false,
      filled: false
    }
  end

  def job_create_params
    params.require(:job).permit(:title, :description, :budget, :location, :date_time, :duration).merge(create_autofill_params)
  end

  def job_edit_params
    params.require(:job).permit(:title, :description, :budget, :location, :date_time, :duration, :complete)
  end
end
