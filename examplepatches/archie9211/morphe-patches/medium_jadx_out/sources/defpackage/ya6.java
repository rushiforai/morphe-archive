package defpackage;

import android.app.job.JobScheduler;
import android.content.Context;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ya6 {
    public static final String a = d87.k("SystemJobScheduler");

    public static final JobScheduler a(Context context) {
        context.getClass();
        Object systemService = context.getSystemService("jobscheduler");
        systemService.getClass();
        JobScheduler jobScheduler = (JobScheduler) systemService;
        return Build.VERSION.SDK_INT >= 34 ? m4.j(jobScheduler) : jobScheduler;
    }
}
