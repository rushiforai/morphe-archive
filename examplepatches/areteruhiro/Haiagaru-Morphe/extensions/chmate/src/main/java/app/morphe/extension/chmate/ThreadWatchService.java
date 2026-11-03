package app.morphe.extension.chmate;

import android.app.job.JobParameters;
import android.app.job.JobService;
import java.util.concurrent.atomic.AtomicBoolean;

public final class ThreadWatchService extends JobService {
    private AtomicBoolean stopped;
    @Override public boolean onStartJob(JobParameters parameters){
        AtomicBoolean cancel=new AtomicBoolean();stopped=cancel;
        new Thread(()->{try{ThreadWatch.check(getApplicationContext(),cancel);}finally{
            new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
                if(stopped!=cancel||cancel.get())return;
                jobFinished(parameters,false);
                ThreadWatch.completed(getApplicationContext());
            });
        }},"Haiagaru-thread-notifications").start();
        return true;
    }
    @Override public boolean onStopJob(JobParameters parameters){if(stopped!=null)stopped.set(true);return true;}
    @Override public void onDestroy(){if(stopped!=null)stopped.set(true);super.onDestroy();}
}
