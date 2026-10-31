package io.branch.search.internal;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class R7 {
    public static final void a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService(JobScheduler.class);
        Intrinsics.f(jobScheduler, "jobScheduler");
        JobInfo pendingJob = jobScheduler.getPendingJob(1131036410);
        if (pendingJob != null) {
            jobScheduler.cancel(pendingJob.getId());
        }
    }
}
