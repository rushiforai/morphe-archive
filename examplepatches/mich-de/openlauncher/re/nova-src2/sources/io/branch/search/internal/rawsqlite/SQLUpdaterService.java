package io.branch.search.internal.rawsqlite;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Context;
import io.branch.search.internal.C3309p1;
import io.branch.search.internal.EnumC3131e9;
import io.branch.search.internal.F4;
import io.branch.search.internal.shared.IBranchOnRawSQLEvents;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u00012\u00020\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lio/branch/search/internal/rawsqlite/SQLUpdaterService;", "Landroid/app/job/JobService;", "Lio/branch/search/internal/shared/IBranchOnRawSQLEvents;", "<init>", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class SQLUpdaterService extends JobService implements IBranchOnRawSQLEvents {
    @Override // io.branch.search.internal.shared.IBranchOnRawSQLEvents
    public final void onBundleUpdateComplete(boolean z11, long j11) {
    }

    @Override // io.branch.search.internal.shared.IBranchOnRawSQLEvents
    public final void onBundleUpdateInit() {
    }

    @Override // android.app.job.JobService
    public final boolean onStartJob(@NotNull JobParameters params) {
        Intrinsics.g(params, "params");
        EnumC3131e9 enumC3131e9 = EnumC3131e9.ScheduledJobRuns;
        StringBuilder sb2 = new StringBuilder("Starting SQLUpdaterService on ");
        Context applicationContext = getApplicationContext();
        Intrinsics.f(applicationContext, "applicationContext");
        new F4(applicationContext);
        sb2.append(F4.c());
        C3309p1.c(enumC3131e9, sb2.toString());
        return false;
    }

    @Override // android.app.job.JobService
    public final boolean onStopJob(@NotNull JobParameters params) {
        Intrinsics.g(params, "params");
        return false;
    }
}
