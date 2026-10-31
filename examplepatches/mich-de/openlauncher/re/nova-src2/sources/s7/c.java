package s7;

import android.app.job.JobParameters;
import android.net.Uri;

/* loaded from: classes.dex */
public abstract class c {
    public static String[] a(JobParameters jobParameters) {
        return jobParameters.getTriggeredContentAuthorities();
    }

    public static Uri[] b(JobParameters jobParameters) {
        return jobParameters.getTriggeredContentUris();
    }
}
