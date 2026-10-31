package io.branch.search.internal;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import io.branch.search.internal.AbstractC3491ze;
import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.services.model.BranchJobKt;
import java.text.DateFormat;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class U2 implements InterfaceC3416v7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63411a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final F2 f63412b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Ad f63413c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3151fc f63414d;

    /* renamed from: e, reason: collision with root package name */
    public final JobScheduler f63415e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final F9 f63416f;

    public static final class a {
    }

    public U2(@NotNull Context context, @NotNull P1 branchConfiguration, @NotNull G2 remoteConfigManager, @NotNull Bd executor, @NotNull Ed state, @NotNull C3151fc runningJobMonitor) {
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(executor, "executor");
        Intrinsics.g(state, "state");
        Intrinsics.g(runningJobMonitor, "runningJobMonitor");
        this.f63411a = context;
        this.f63412b = remoteConfigManager;
        this.f63413c = executor;
        this.f63414d = runningJobMonitor;
        this.f63415e = (JobScheduler) context.getSystemService(JobScheduler.class);
        F9 f92 = new F9(context, branchConfiguration.c(), new W2(this));
        this.f63416f = f92;
        f92.a(this, true);
    }

    @Override // io.branch.search.internal.InterfaceC3416v7
    public final void a(@NotNull AbstractC3491ze status) {
        Intrinsics.g(status, "status");
        if (status instanceof AbstractC3491ze.a) {
            C3309p1.c(EnumC3131e9.ProcessLifecycle, "onOffline() : defer all jobs");
            this.f63413c.a(new V2(this, (AbstractC3491ze.a) status));
            return;
        }
        C3309p1.c(EnumC3131e9.ProcessLifecycle, "onOnline() : reschedule all deferred jobs");
        JobScheduler scheduler = this.f63415e;
        Intrinsics.f(scheduler, "scheduler");
        for (JobInfo jobInfo : Sa.a(scheduler)) {
            if (BranchJobKt.isDeferred(jobInfo) && (!this.f63414d.a(this.f63411a, jobInfo.getId()) || BranchJob.INSTANCE.wasPeriodic(jobInfo))) {
                AbstractC3491ze.b bVar = new AbstractC3491ze.b(false);
                this.f63415e.cancel(jobInfo.getId());
                BranchJob.Companion companion = BranchJob.INSTANCE;
                JobInfo jobInfoBuildDeferrableJobInfo = companion.buildDeferrableJobInfo(jobInfo, bVar);
                this.f63415e.schedule(companion.buildDeferrableJobInfo(jobInfo, bVar));
                jobInfoBuildDeferrableJobInfo.getService().getShortClassName();
                a aVar = Companion;
                long minLatencyMillis = jobInfoBuildDeferrableJobInfo.getMinLatencyMillis() + System.currentTimeMillis();
                aVar.getClass();
                Intrinsics.f(DateFormat.getDateTimeInstance().format(Long.valueOf(minLatencyMillis)), "getDateTimeInstance().format(milliSec)");
            }
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public U2(@NotNull Context context, @NotNull P1 branchConfiguration, @NotNull G2 remoteConfigManager, @NotNull ReentrantLock lock, @NotNull C3151fc runningJobMonitor) {
        this(context, branchConfiguration, remoteConfigManager, new Bd(lock), new Ed(context, lock), runningJobMonitor);
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(lock, "lock");
        Intrinsics.g(runningJobMonitor, "runningJobMonitor");
    }
}
