package app.s.chzzk.extension;

import android.app.job.JobParameters;
import android.app.job.JobService;

public final class FollowMonitorJobService extends JobService {
    private LocalFollowing.Completion completion;

    @Override public boolean onStartJob(JobParameters parameters) {
        LocalFollowing.attach(getApplicationContext());
        completion = LocalFollowing.startJob(() -> {
            completion = null;
            jobFinished(parameters, false);
        });
        return true;
    }

    @Override public boolean onStopJob(JobParameters parameters) {
        LocalFollowing.stopJob(completion);
        completion = null;
        return LocalFollowing.isMonitoringEnabled();
    }
}
