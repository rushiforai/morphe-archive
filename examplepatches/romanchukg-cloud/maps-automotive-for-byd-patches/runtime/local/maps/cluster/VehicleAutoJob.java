// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

/** A bounded startup retry. The independently running shell reader is never a job. */
public final class VehicleAutoJob extends JobService {
    static final int JOB_ID=0x4d565201;
    static final long MIN_DELAY_MS=30000,MAX_DELAY_MS=21600000;
    private static final Object LOCK=new Object();
    private static long generation;
    private static Run running;
    private final Handler main=new Handler(Looper.getMainLooper());

    private static final class Run {
        final VehicleAutoJob service;
        final JobParameters parameters;
        final long generation;
        boolean stopped;
        long retryAt=-1;
        Run(VehicleAutoJob service,JobParameters parameters,long generation){this.service=service;this.parameters=parameters;this.generation=generation;}
    }

    /** The manager calls this only after both independent opt-ins were loaded and enabled. */
    static boolean schedule(Context context,long delayMillis){
        if(context==null)return false;
        synchronized(LOCK){return scheduleLocked(context,delayMillis,-1);}
    }

    private static boolean scheduleLocked(Context context,long delayMillis,long expectedGeneration){
        if(expectedGeneration>=0&&expectedGeneration!=generation)return false;
        long delay=Math.max(MIN_DELAY_MS,Math.min(MAX_DELAY_MS,delayMillis));
        if(running!=null&&!running.stopped){
            long due=SystemClock.elapsedRealtime()+delay;
            if(running.retryAt<0||due<running.retryAt)running.retryAt=due;
            return true;
        }
        try{
            JobScheduler scheduler=(JobScheduler)context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
            if(scheduler==null)return false;
            ComponentName service=new ComponentName(context,VehicleAutoJob.class);
            JobInfo pending=scheduler.getPendingJob(JOB_ID);
            // Never replace a native Maps job if this private identifier happens to collide.
            if(pending!=null){
                if(!service.equals(pending.getService()))return false;
                // jobFinished is asynchronous in Android. A deferred retry must replace our
                // finishing job even if JobScheduler still reports that old job as pending.
                if(expectedGeneration<0)return true;
            }
            JobInfo job=new JobInfo.Builder(JOB_ID,service)
                .setPersisted(true).setMinimumLatency(delay)
                .setBackoffCriteria(MIN_DELAY_MS,JobInfo.BACKOFF_POLICY_EXPONENTIAL).build();
            return scheduler.schedule(job)==JobScheduler.RESULT_SUCCESS;
        }catch(RuntimeException failure){
            Log.w("MapsVehicleAuto","Retry scheduling unavailable: "+failure.getClass().getSimpleName());return false;
        }
    }

    /** Cancels only this module's scheduled attempt; it never signals the shell reader. */
    static void cancel(Context context){
        if(context==null)return;
        synchronized(LOCK){
            generation++;
            if(running!=null){running.stopped=true;running.retryAt=-1;running=null;}
            try{
                JobScheduler scheduler=(JobScheduler)context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
                if(scheduler==null)return;
                JobInfo pending=scheduler.getPendingJob(JOB_ID);
                if(pending!=null&&new ComponentName(context,VehicleAutoJob.class).equals(pending.getService()))scheduler.cancel(JOB_ID);
            }catch(RuntimeException failure){Log.w("MapsVehicleAuto","Retry cancellation unavailable: "+failure.getClass().getSimpleName());}
        }
    }

    @Override public boolean onStartJob(JobParameters parameters){
        if(parameters==null||parameters.getJobId()!=JOB_ID)return false;
        Run request;
        synchronized(LOCK){
            if(running!=null)return running.service==this&&running.parameters==parameters&&!running.stopped;
            request=new Run(this,parameters,generation);running=request;
        }
        try{
            // Posting also handles a manager that completes synchronously inside runJob.
            VehicleAutoReader.runJob(this,()->main.post(()->finish(request)));
            return true;
        }catch(RuntimeException failure){
            synchronized(LOCK){if(running==request){request.stopped=true;running=null;}}
            Log.w("MapsVehicleAuto","Retry request unavailable: "+failure.getClass().getSimpleName());return false;
        }
    }

    private void finish(Run request){
        long retryAt;
        synchronized(LOCK){
            if(running!=request||request.stopped||request.generation!=generation)return;
            request.stopped=true;running=null;retryAt=request.retryAt;
        }
        jobFinished(request.parameters,false);
        if(retryAt>=0)synchronized(LOCK){scheduleLocked(this,Math.max(0,retryAt-SystemClock.elapsedRealtime()),request.generation);}
    }

    @Override public boolean onStopJob(JobParameters parameters){
        synchronized(LOCK){
            if(running!=null&&running.service==this&&running.parameters==parameters){
                running.stopped=true;running.retryAt=-1;running=null;generation++;
            }
        }
        // The manager bounds its independent attempt. Ignore its late completion, not its reader.
        return false;
    }

    @Override public void onDestroy(){
        synchronized(LOCK){
            if(running!=null&&running.service==this){running.stopped=true;running.retryAt=-1;running=null;generation++;}
        }
        super.onDestroy();
    }
}
