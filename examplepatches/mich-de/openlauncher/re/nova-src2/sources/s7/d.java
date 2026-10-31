package s7;

import android.app.job.JobParameters;
import android.net.Network;

/* loaded from: classes.dex */
public abstract class d {
    public static Network a(JobParameters jobParameters) {
        return jobParameters.getNetwork();
    }
}
