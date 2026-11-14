package app.morphe.extension.mapsautomotive.android9;

import android.app.job.JobInfo;
import android.os.Build;

/**
 * JobInfo.Builder.build (patch "Android 9 (API 28)"). Android 9 refuses a job without constraints (AOSP 9 JobInfo:
 * "You're trying to build a job with no constraints, this is not allowed."), which Android 10 allows: such a job gets
 * an override deadline of 0, so it runs as soon as possible, as on Android 10.
 */
public final class JobInfoBuilder28 {
    public static final String OWNER = "Landroid/app/job/JobInfo$Builder;";
    private static final String NO_CONSTRAINTS = "You're trying to build a job with no constraints, this is not allowed.";
    private static boolean logged;

    private JobInfoBuilder28() {
    }

    public static JobInfo build(JobInfo.Builder builder) {
        if (Build.VERSION.SDK_INT >= 29) return builder.build();
        try {
            return builder.build();
        } catch (IllegalArgumentException exception) {
            if (!NO_CONSTRAINTS.equals(exception.getMessage())) throw exception;
            builder.setOverrideDeadline(0);
            JobInfo job = builder.build();
            synchronized (JobInfoBuilder28.class) {
                if (!logged) {
                    logged = true;
                    Android9.Log9.i("Android 9: a job without constraints gets an override deadline of 0 (job " + job.getId() + ")");
                }
            }
            return job;
        }
    }
}
