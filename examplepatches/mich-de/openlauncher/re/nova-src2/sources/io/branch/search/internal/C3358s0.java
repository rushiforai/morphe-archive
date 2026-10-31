package io.branch.search.internal;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import io.branch.search.internal.AbstractC3491ze;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.U2;
import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.services.model.BranchJobType;
import io.branch.search.internal.services.model.JobId;
import io.branch.search.internal.services.stub.android.AndroidBundleUpdateService;
import io.branch.search.internal.services.stub.android.AndroidCacheUpdateService;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Lazy;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.s0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3358s0 implements InterfaceC3164g8 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f65694a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f65695b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final InterfaceC3244l4 f65696c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3446x3 f65697d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3193i3 f65698e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3151fc f65699f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Ad f65700g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final F2 f65701h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final C3190i0 f65702i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final Dd f65703j;

    /* renamed from: k, reason: collision with root package name */
    public final JobScheduler f65704k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final F9 f65705l;

    /* renamed from: io.branch.search.internal.s0$a */
    public static final class a extends Lambda implements Function0<Unit> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Function1<InterfaceC3164g8, Boolean> f65706a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C3358s0 f65707b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ BranchJob f65708c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public a(Function1<? super InterfaceC3164g8, Boolean> function1, C3358s0 c3358s0, BranchJob branchJob) {
            super(0);
            this.f65706a = function1;
            this.f65707b = c3358s0;
            this.f65708c = branchJob;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            if (((Boolean) this.f65706a.invoke(this.f65707b)).booleanValue()) {
                BranchJob branchJob = this.f65708c;
                if (branchJob instanceof BranchJob.AggregateAnalyticsPing) {
                    this.f65707b.b();
                } else if (branchJob instanceof BranchJob.ErrorPing) {
                    this.f65707b.a();
                }
                JobInfo deferrableJobInfo = this.f65708c.getDeferrableJobInfo(this.f65707b.f65694a);
                AbstractC3491ze abstractC3491ze = this.f65707b.f65705l.f62461g.get();
                Intrinsics.f(abstractC3491ze, "lastStateIsOffline.get()");
                AbstractC3491ze abstractC3491ze2 = abstractC3491ze;
                boolean zA = abstractC3491ze2 instanceof AbstractC3491ze.a ? C3358s0.a(this.f65707b, deferrableJobInfo, (AbstractC3491ze.a) abstractC3491ze2) : C3358s0.a(this.f65707b, deferrableJobInfo);
                if (!zA) {
                    String strB = this.f65707b.f65702i.b("io.branch.search");
                    String str = "scheduling " + this.f65708c.getClass().getSimpleName() + ", success = " + zA;
                    C3296o5.a aVar = C3296o5.f65426a;
                    C3296o5.a(new F6(strB, "BranchServiceManager.schedule", str, null));
                }
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.services.AndroidJobManager", f = "AndroidJobManager.kt", l = {52}, m = "scheduleBundleUpdate")
    /* renamed from: io.branch.search.internal.s0$b */
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3358s0 f65709a;

        /* renamed from: b, reason: collision with root package name */
        public long f65710b;

        /* renamed from: c, reason: collision with root package name */
        public long f65711c;

        /* renamed from: d, reason: collision with root package name */
        public boolean f65712d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f65713e;

        /* renamed from: g, reason: collision with root package name */
        public int f65715g;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65713e = obj;
            this.f65715g |= Integer.MIN_VALUE;
            return C3358s0.this.a(0L, 0L, false, this);
        }
    }

    public C3358s0(@NotNull Context context, @NotNull P1 branchConfiguration, @NotNull C3261m4 clock, @NotNull C3446x3 bundleUpdateSharedPrefLock, @NotNull C3193i3 bundleJobScheduleRepository, @NotNull C3151fc runningJobMonitor, @NotNull Bd executor, @NotNull G2 remoteConfigManager, @NotNull C3190i0 analyticsSessionDataSource, @NotNull Ed state) {
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(bundleUpdateSharedPrefLock, "bundleUpdateSharedPrefLock");
        Intrinsics.g(bundleJobScheduleRepository, "bundleJobScheduleRepository");
        Intrinsics.g(runningJobMonitor, "runningJobMonitor");
        Intrinsics.g(executor, "executor");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(analyticsSessionDataSource, "analyticsSessionDataSource");
        Intrinsics.g(state, "state");
        this.f65694a = context;
        this.f65695b = branchConfiguration;
        this.f65696c = clock;
        this.f65697d = bundleUpdateSharedPrefLock;
        this.f65698e = bundleJobScheduleRepository;
        this.f65699f = runningJobMonitor;
        this.f65700g = executor;
        this.f65701h = remoteConfigManager;
        this.f65702i = analyticsSessionDataSource;
        this.f65703j = state;
        this.f65704k = (JobScheduler) context.getSystemService(JobScheduler.class);
        this.f65705l = new F9(context, branchConfiguration.c(), new C3341r0(this));
    }

    public static final boolean a(C3358s0 c3358s0, JobInfo jobInfo, AbstractC3491ze.a aVar) {
        c3358s0.f65704k.cancel(jobInfo.getId());
        JobInfo jobInfoBuildDeferrableJobInfo = BranchJob.INSTANCE.buildDeferrableJobInfo(jobInfo, aVar);
        jobInfoBuildDeferrableJobInfo.getService().getShortClassName();
        U2.a aVar2 = U2.Companion;
        long minLatencyMillis = jobInfoBuildDeferrableJobInfo.getMinLatencyMillis() + System.currentTimeMillis();
        aVar2.getClass();
        Intrinsics.f(DateFormat.getDateTimeInstance().format(Long.valueOf(minLatencyMillis)), "getDateTimeInstance().format(milliSec)");
        return c3358s0.f65704k.schedule(jobInfoBuildDeferrableJobInfo) == 1;
    }

    public final void b() {
        if (this.f65701h.a().o <= this.f65703j.b().size()) {
            Iterator it = this.f65703j.b().iterator();
            JobInfo jobInfo = null;
            long j11 = Long.MAX_VALUE;
            while (it.hasNext()) {
                JobInfo jobInfo2 = (JobInfo) it.next();
                long j12 = jobInfo2.getExtras().getLong(BranchJob.AggregateAnalyticsPing.EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP) + jobInfo2.getMinLatencyMillis();
                if (jobInfo == null || j12 < j11) {
                    jobInfo = jobInfo2;
                    j11 = j12;
                }
            }
            if (jobInfo != null) {
                this.f65704k.cancel(jobInfo.getId());
            }
        }
    }

    public static final boolean a(C3358s0 c3358s0, JobInfo jobInfo) {
        c3358s0.getClass();
        jobInfo.getService().getShortClassName();
        U2.a aVar = U2.Companion;
        long minLatencyMillis = jobInfo.getMinLatencyMillis() + System.currentTimeMillis();
        aVar.getClass();
        Intrinsics.f(DateFormat.getDateTimeInstance().format(Long.valueOf(minLatencyMillis)), "getDateTimeInstance().format(milliSec)");
        return c3358s0.f65704k.schedule(jobInfo) == 1;
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    public final Object a(@NotNull Continuation<? super Unit> continuation) {
        C3309p1.a(AndroidBundleUpdateService.TAG, "SQLUpdaterService.expediteScheduledBundleUpdate()");
        if (this.f65699f.a(this.f65694a, JobId.BUNDLE_UPDATE.getId())) {
            C3309p1.a(AndroidBundleUpdateService.TAG, "ignore expediteScheduledBundleUpdate, bundle request already in flight/being expedited");
            return Unit.f71706a;
        }
        Object objA = a(0L, 0L, true, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    public final JobInfo a(int i5) {
        return this.f65703j.a(i5);
    }

    public final void a() {
        ArrayList arrayListA = this.f65703j.a();
        ArrayList arrayList = new ArrayList(b70.c.u0(arrayListA, 10));
        Iterator it = arrayListA.iterator();
        while (it.hasNext()) {
            arrayList.add(Integer.valueOf(((JobInfo) it.next()).getId()));
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (((Number) next).intValue() != JobId.ERROR_PING.getId()) {
                arrayList2.add(next);
            }
        }
        JobScheduler scheduler = this.f65704k;
        Intrinsics.f(scheduler, "scheduler");
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            scheduler.cancel(((Number) it3.next()).intValue());
        }
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    public final void a(@NotNull BranchJob job, @NotNull Function1<? super InterfaceC3164g8, Boolean> prerequisite) {
        Intrinsics.g(job, "job");
        Intrinsics.g(prerequisite, "prerequisite");
        this.f65700g.a(new a(prerequisite, this, job));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, long j12, boolean z11, @NotNull Continuation<? super Unit> continuation) {
        b bVar;
        C3358s0 c3358s0;
        boolean z12;
        BranchJobType periodic;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f65715g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f65715g = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj = bVar.f65713e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f65715g;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (j11 > 0) {
                this.f65697d.a(j11);
            }
            C3193i3 c3193i3 = this.f65698e;
            Bc bc2 = new Bc(this.f65696c.getCurrentTimeMillis(), (this.f65695b.f63057z == y40.m.f96676b || j11 <= 0) ? j11 : j11 - (j11 / 5));
            bVar.f65709a = this;
            bVar.f65710b = j11;
            bVar.f65711c = j12;
            bVar.f65712d = z11;
            bVar.f65715g = 1;
            if (c3193i3.a(bc2, bVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3358s0 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = bVar.f65712d;
            j12 = bVar.f65711c;
            j11 = bVar.f65710b;
            c3358s0 = bVar.f65709a;
            ResultKt.b(obj);
        }
        Context context = c3358s0.f65694a;
        P1 branchConfiguration = c3358s0.f65695b;
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        C3446x3 c3446x3A = C3446x3.Companion.a(context);
        synchronized (c3446x3A) {
            z12 = c3446x3A.f66255a.getBoolean("KEY_LOCK_BUNDLE_UPDATE", false);
        }
        if (z12) {
            C3309p1.a(AndroidBundleUpdateService.TAG, "bundle update locked");
        } else {
            C3309p1.a(AndroidBundleUpdateService.TAG, "schedule " + j11);
            boolean z13 = branchConfiguration.f63057z != y40.m.f96676b;
            if (z13) {
                periodic = new BranchJobType.Delayed(j11);
            } else {
                periodic = new BranchJobType.Periodic(j12);
            }
            if (c3358s0.f65703j.a(JobId.BUNDLE_UPDATE.getId()) != null && !z11) {
                C3309p1.a(AndroidBundleUpdateService.TAG, "Abort scheduling a new job because there is one scheduled already and the new job is not being forced.");
            } else {
                BranchJob.BundleUpdate bundleUpdate = new BranchJob.BundleUpdate(periodic, z13);
                Intrinsics.f(c3358s0.f65705l.f62461g.get(), "lastStateIsOffline.get()");
                C3375t0 prerequisite = C3375t0.f65811a;
                Intrinsics.g(prerequisite, "prerequisite");
                c3358s0.f65700g.a(new a(prerequisite, c3358s0, bundleUpdate));
            }
        }
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    public final void a(@NotNull C3282n8 remoteConfiguration, @NotNull y40.u config, @NotNull Lazy<? extends y40.p> client) {
        Intrinsics.g(remoteConfiguration, "remoteConfiguration");
        Intrinsics.g(config, "config");
        y40.m mVar = config.f96703d;
        Intrinsics.g(client, "client");
        if (config.o.b()) {
            C3309p1.a(AndroidCacheUpdateService.TAG, "Scheduling cache update job");
            Object value = client.getValue();
            Intrinsics.e(value, "null cannot be cast to non-null type io.branch.search.internal.BranchNavigatorClientImpl");
            if (!((C3411v2) value).f66084c) {
                C3309p1.a(a50.b.f402c, AndroidCacheUpdateService.TAG, "Failed to schedule cache update job", (Throwable) null);
                return;
            }
            long j11 = remoteConfiguration.Z;
            y40.m mVar2 = y40.m.f96676b;
            BranchJob.CacheUpdateJob cacheUpdateJob = new BranchJob.CacheUpdateJob(j11, mVar != mVar2);
            JobInfo jobInfoA = this.f65703j.a(JobId.CACHE_UPDATE.getId());
            if (jobInfoA != null && cacheUpdateJob.compareWithJobInfo(jobInfoA)) {
                C3309p1.a(AndroidCacheUpdateService.TAG, "Cache update job already scheduled");
            } else {
                a(new BranchJob.CacheUpdateJob(remoteConfiguration.Z, mVar != mVar2), C3147f8.f64479a);
            }
        }
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    public final void a(@NotNull ArrayList jobs) {
        Intrinsics.g(jobs, "jobs");
        Iterator it = jobs.iterator();
        while (it.hasNext()) {
            a((BranchJob.AggregateAnalyticsPing) it.next(), C3147f8.f64479a);
        }
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    public final Unit a(boolean z11) {
        return Unit.f71706a;
    }
}
