package io.branch.search.internal.services;

import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/services/ScheduledQueryService;", "Landroid/app/job/JobService;", "<init>", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class ScheduledQueryService extends JobService {
    @Override // android.app.job.JobService
    public final boolean onStartJob(@NotNull JobParameters params) {
        Intrinsics.g(params, "params");
        JobScheduler jobScheduler = (JobScheduler) getSystemService("jobscheduler");
        if (jobScheduler != null) {
            jobScheduler.cancel(params.getJobId());
        }
        jobFinished(params, false);
        return false;
    }

    @Override // android.app.job.JobService
    public final boolean onStopJob(@Nullable JobParameters jobParameters) {
        return false;
    }
}
