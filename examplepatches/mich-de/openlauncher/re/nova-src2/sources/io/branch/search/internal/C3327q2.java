package io.branch.search.internal;

import android.app.Application;
import android.app.job.JobInfo;
import android.content.ComponentName;
import android.content.Context;
import android.os.PersistableBundle;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.services.model.BranchJob;
import io.branch.search.internal.services.model.BranchJobType;
import io.branch.search.internal.services.model.JobId;
import io.branch.search.internal.services.storage.ExtraValue;
import io.branch.search.internal.services.storage.JobInfoRaw;
import io.branch.search.internal.services.stub.android.AndroidCacheUpdateService;
import io.branch.search.internal.services.stub.branch.BranchBundleUpdateService;
import io.branch.search.internal.services.stub.branch.BranchCacheUpdateService;
import io.branch.search.internal.services.stub.branch.BranchPingService;
import io.branch.search.internal.services.stub.branch.BranchScheduledQueryService;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.q2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3327q2 implements InterfaceC3164g8 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f65497a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f65498b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final InterfaceC3244l4 f65499c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3446x3 f65500d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3193i3 f65501e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3151fc f65502f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Cc f65503g;

    /* renamed from: h, reason: collision with root package name */
    public final int f65504h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final Function0<Boolean> f65505i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final t70.j0 f65506j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final Function1<JobInfoRaw, Unit> f65507k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final String f65508l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final Map<String, X2<? extends Cd>> f65509m;

    @NotNull
    public final LinkedHashMap n;

    @NotNull
    public final AtomicBoolean o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final List<String> f65510p;

    /* renamed from: io.branch.search.internal.q2$a */
    public static final class a extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ JobInfoRaw f65511a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ BranchJob f65512b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ C3327q2 f65513c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(JobInfoRaw jobInfoRaw, BranchJob branchJob, C3327q2 c3327q2) {
            super(0);
            this.f65511a = jobInfoRaw;
            this.f65512b = branchJob;
            this.f65513c = c3327q2;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            StringBuilder sb2 = new StringBuilder("BranchJobManager#scheduleBranchJob ");
            sb2.append(this.f65511a);
            sb2.append("} checking ");
            sb2.append(this.f65512b.getID());
            sb2.append(" nextRunTime:");
            JobInfoRaw.Companion companion = JobInfoRaw.INSTANCE;
            JobInfoRaw jobInfoRaw = this.f65511a;
            Intrinsics.d(jobInfoRaw);
            long j11 = jobInfoRaw.f65788b;
            companion.getClass();
            sb2.append(JobInfoRaw.Companion.a(j11));
            sb2.append(" now:");
            sb2.append(JobInfoRaw.Companion.a(this.f65513c.f65499c.getCurrentTimeMillis()));
            sb2.append(AbstractJsonLexerKt.END_OBJ);
            return sb2.toString();
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.services.BranchJobManager$scheduleBranchJob$4", f = "BranchJobManager.kt", l = {245}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.q2$b */
    public static final class b extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65514a;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3327q2.this.new b(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3327q2.this.new b((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65514a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3327q2 c3327q2 = C3327q2.this;
                this.f65514a = 1;
                if (c3327q2.a(true) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.services.BranchJobManager", f = "BranchJobManager.kt", l = {Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE}, m = "scheduleBundleUpdate")
    /* renamed from: io.branch.search.internal.q2$c */
    public static final class c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3327q2 f65516a;

        /* renamed from: b, reason: collision with root package name */
        public long f65517b;

        /* renamed from: c, reason: collision with root package name */
        public long f65518c;

        /* renamed from: d, reason: collision with root package name */
        public boolean f65519d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f65520e;

        /* renamed from: g, reason: collision with root package name */
        public int f65522g;

        public c(Continuation<? super c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65520e = obj;
            this.f65522g |= Integer.MIN_VALUE;
            return C3327q2.this.a(0L, 0L, false, this);
        }
    }

    /* renamed from: io.branch.search.internal.q2$d */
    public static final class d extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ long f65523a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f65524b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ boolean f65525c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(long j11, long j12, boolean z11) {
            super(0);
            this.f65523a = j11;
            this.f65524b = j12;
            this.f65525c = z11;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "BranchJobManager#scheduleBundleUpdate minDe: " + this.f65523a + " period:" + this.f65524b + " force:" + this.f65525c;
        }
    }

    public /* synthetic */ C3327q2(Context context, P1 p12, C3261m4 c3261m4, C3446x3 c3446x3, C3193i3 c3193i3, C3151fc c3151fc, Dc dc, int i5, S2 s22, t70.j0 j0Var) {
        this(context, p12, c3261m4, c3446x3, c3193i3, c3151fc, dc, i5, s22, j0Var, C3175h2.f64632a);
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    public final Object a(@NotNull Continuation<? super Unit> continuation) {
        C3309p1.a(this.f65508l, "SQLUpdaterService.expediteScheduledBundleUpdate()");
        if (this.f65502f.a(this.f65497a, JobId.BUNDLE_UPDATE.getId())) {
            C3309p1.a(this.f65508l, "ignore expediteScheduledBundleUpdate, bundle request already in flight/being expedited");
            return Unit.f71706a;
        }
        Object objA = a(0L, 0L, true, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public C3327q2(@NotNull Context context, @NotNull P1 branchConfiguration, @NotNull C3261m4 clock, @NotNull C3446x3 bundleUpdateSharedPrefLock, @NotNull C3193i3 bundleJobScheduleRepository, @NotNull C3151fc runningJobMonitor, @NotNull Dc scheduledJobDataSource, int i5, @NotNull S2 isNetworkAvailable, @NotNull t70.j0 scope, @NotNull Function1 onJobRun) {
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(bundleUpdateSharedPrefLock, "bundleUpdateSharedPrefLock");
        Intrinsics.g(bundleJobScheduleRepository, "bundleJobScheduleRepository");
        Intrinsics.g(runningJobMonitor, "runningJobMonitor");
        Intrinsics.g(scheduledJobDataSource, "scheduledJobDataSource");
        Intrinsics.g(isNetworkAvailable, "isNetworkAvailable");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(onJobRun, "onJobRun");
        this.f65497a = context;
        this.f65498b = branchConfiguration;
        this.f65499c = clock;
        this.f65500d = bundleUpdateSharedPrefLock;
        this.f65501e = bundleJobScheduleRepository;
        this.f65502f = runningJobMonitor;
        this.f65503g = scheduledJobDataSource;
        this.f65504h = i5;
        this.f65505i = isNetworkAvailable;
        this.f65506j = scope;
        this.f65507k = onJobRun;
        this.f65508l = "BranchJM";
        Context applicationContext = context.getApplicationContext();
        Intrinsics.e(applicationContext, "null cannot be cast to non-null type android.app.Application");
        Application application = (Application) applicationContext;
        this.f65509m = MapsKt.j0(new Pair("bundle_update_service", new BranchBundleUpdateService(application, new C3242l2(this))), new Pair("cache_update_service", new BranchCacheUpdateService(application, new C3259m2(this))), new Pair("ping_service", new BranchPingService(application, new C3276n2(this))), new Pair("scheduled_queries_service", new BranchScheduledQueryService(application, new C3293o2(this))));
        this.n = new LinkedHashMap();
        this.o = new AtomicBoolean(false);
        this.f65510p = ul.b.Q("bundle_update_service", "scheduled_queries_service");
    }

    public final ArrayList a() {
        List<JobInfoRaw> listLoad = this.f65503g.load();
        ArrayList arrayList = new ArrayList();
        for (Object obj : listLoad) {
            List<ExtraValue> list = ((JobInfoRaw) obj).f65796j;
            ArrayList arrayList2 = new ArrayList(b70.c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                arrayList2.add(((ExtraValue) it.next()).getF65784a());
            }
            if (arrayList2.contains(BranchJob.AggregateAnalyticsPing.EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP)) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    public final JobInfo a(int i5) {
        Object next;
        Iterator<T> it = this.f65503g.load().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((JobInfoRaw) next).f65787a == i5) {
                break;
            }
        }
        JobInfoRaw jobInfoRaw = (JobInfoRaw) next;
        if (jobInfoRaw == null) {
            return null;
        }
        JobInfo.Builder builder = new JobInfo.Builder(jobInfoRaw.f65787a, new ComponentName(this.f65497a, jobInfoRaw.f65794h));
        if (jobInfoRaw.f65790d) {
            builder.setPeriodic(jobInfoRaw.f65789c);
        } else {
            builder.setMinimumLatency(jobInfoRaw.f65789c);
        }
        PersistableBundle persistableBundle = new PersistableBundle();
        for (ExtraValue extraValue : jobInfoRaw.f65796j) {
            if (extraValue instanceof ExtraValue.BooleanValue) {
                persistableBundle.putBoolean(extraValue.getF65784a(), ((ExtraValue.BooleanValue) extraValue).f65778b);
            } else if (extraValue instanceof ExtraValue.IntValue) {
                persistableBundle.putInt(extraValue.getF65784a(), ((ExtraValue.IntValue) extraValue).f65781b);
            } else if (extraValue instanceof ExtraValue.LongValue) {
                persistableBundle.putLong(extraValue.getF65784a(), ((ExtraValue.LongValue) extraValue).f65783b);
            } else if (extraValue instanceof ExtraValue.StringValue) {
                persistableBundle.putString(extraValue.getF65784a(), ((ExtraValue.StringValue) extraValue).f65785b);
            }
        }
        builder.setExtras(persistableBundle);
        return builder.build();
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    public final Unit a(boolean z11) {
        try {
            C3309p1.b(this.f65508l, new C3192i2(z11, this));
            if (this.o.compareAndSet(false, true)) {
                long currentTimeMillis = this.f65499c.getCurrentTimeMillis();
                boolean zBooleanValue = ((Boolean) this.f65505i.invoke()).booleanValue();
                List<JobInfoRaw> listLoad = this.f65503g.load();
                ArrayList arrayList = new ArrayList();
                for (Object obj : listLoad) {
                    if (!((JobInfoRaw) obj).f65795i || zBooleanValue) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    Object next = it.next();
                    JobInfoRaw jobInfoRaw = (JobInfoRaw) next;
                    boolean z12 = jobInfoRaw.f65788b - currentTimeMillis <= 15000;
                    boolean z13 = !z11 || this.f65510p.contains(jobInfoRaw.f65794h);
                    C3309p1.b(this.f65508l, new C3208j2(jobInfoRaw, z12, currentTimeMillis));
                    if (z12 && z13) {
                        arrayList2.add(next);
                    }
                }
                HashSet hashSet = new HashSet();
                ArrayList arrayList3 = new ArrayList();
                Iterator it2 = arrayList2.iterator();
                while (it2.hasNext()) {
                    Object next2 = it2.next();
                    if (hashSet.add(((JobInfoRaw) next2).f65794h)) {
                        arrayList3.add(next2);
                    }
                }
                ArrayList arrayList4 = new ArrayList();
                Iterator it3 = arrayList3.iterator();
                while (it3.hasNext()) {
                    Object next3 = it3.next();
                    JobInfoRaw jobInfoRaw2 = (JobInfoRaw) next3;
                    Long l9 = (Long) this.n.get(jobInfoRaw2.f65794h);
                    boolean z14 = (l9 != null ? l9.longValue() : 0L) + 1800000 < currentTimeMillis;
                    String str = this.f65508l;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("checking job ");
                    sb2.append(jobInfoRaw2.f65787a);
                    sb2.append(' ');
                    sb2.append(z14 ? "did not run in last 1800000 ms, Proceed" : "ran in last 1800000 ms, Pause");
                    C3309p1.b(str, sb2.toString());
                    if (z14) {
                        arrayList4.add(next3);
                    }
                }
                Iterator it4 = arrayList4.iterator();
                while (it4.hasNext()) {
                    a((JobInfoRaw) it4.next());
                }
            }
            this.o.compareAndSet(true, false);
            return Unit.f71706a;
        } catch (Throwable th2) {
            this.o.compareAndSet(true, false);
            throw th2;
        }
    }

    public final void a(@NotNull String serviceName, @NotNull JobInfoRaw params, boolean z11) {
        JobInfoRaw jobInfoRaw;
        Intrinsics.g(serviceName, "serviceName");
        Intrinsics.g(params, "params");
        if (params.f65790d) {
            jobInfoRaw = params;
            this.f65503g.b(JobInfoRaw.a(params, System.currentTimeMillis() + Math.max(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, Math.min(params.f65789c, 43200000L)), 0L, 1021));
        } else {
            jobInfoRaw = params;
            if (z11) {
                long jMax = Math.max(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, Math.min((2 * jobInfoRaw.f65789c) + jobInfoRaw.f65793g, 18000000L));
                C3309p1.b(this.f65508l, new C3225k2(serviceName, jMax, jobInfoRaw));
                this.f65503g.b(JobInfoRaw.a(jobInfoRaw, System.currentTimeMillis() + jMax, jMax, 1017));
            }
        }
        X2<? extends Cd> x22 = this.f65509m.get(serviceName);
        if (x22 != null) {
            x22.onStopJob(jobInfoRaw);
        }
    }

    public final void a(JobInfoRaw jobInfoRaw) {
        this.f65507k.invoke(jobInfoRaw);
        X2<? extends Cd> x22 = this.f65509m.get(jobInfoRaw.f65794h);
        if (x22 == null) {
            return;
        }
        this.n.put(jobInfoRaw.f65794h, Long.valueOf(this.f65499c.getCurrentTimeMillis()));
        this.f65503g.a(jobInfoRaw);
        x22.onStartJob(jobInfoRaw);
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    public final void a(@NotNull BranchJob job, @NotNull Function1<? super InterfaceC3164g8, Boolean> prerequisite) {
        Intrinsics.g(job, "job");
        Intrinsics.g(prerequisite, "prerequisite");
        if (((Boolean) prerequisite.invoke(this)).booleanValue()) {
            if (job instanceof BranchJob.AggregateAnalyticsPing) {
                ArrayList arrayListA = a();
                if (this.f65504h < arrayListA.size()) {
                    List listE1 = b70.g.E1(b70.g.D1(new C3310p2(), arrayListA), arrayListA.size() - this.f65504h);
                    Cc cc = this.f65503g;
                    Iterator it = listE1.iterator();
                    while (it.hasNext()) {
                        cc.a((JobInfoRaw) it.next());
                    }
                }
            } else if (job instanceof BranchJob.ErrorPing) {
                List<JobInfoRaw> listLoad = this.f65503g.load();
                ArrayList arrayList = new ArrayList();
                for (Object obj : listLoad) {
                    if (Intrinsics.b(((JobInfoRaw) obj).f65794h, "ping_service")) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    Object next = it2.next();
                    List<ExtraValue> list = ((JobInfoRaw) next).f65796j;
                    ArrayList arrayList3 = new ArrayList(b70.c.u0(list, 10));
                    Iterator<T> it3 = list.iterator();
                    while (it3.hasNext()) {
                        arrayList3.add(((ExtraValue) it3.next()).getF65784a());
                    }
                    if (!arrayList3.contains(BranchJob.AggregateAnalyticsPing.EXTRAS_KEY_AA_PING_SCHEDULING_TIMESTAMP)) {
                        arrayList2.add(next);
                    }
                }
                ArrayList arrayList4 = new ArrayList();
                Iterator it4 = arrayList2.iterator();
                while (it4.hasNext()) {
                    Object next2 = it4.next();
                    if (((JobInfoRaw) next2).f65787a != JobId.ERROR_PING.getId()) {
                        arrayList4.add(next2);
                    }
                }
                Cc cc2 = this.f65503g;
                Iterator it5 = arrayList4.iterator();
                while (it5.hasNext()) {
                    cc2.a((JobInfoRaw) it5.next());
                }
            }
            JobInfoRaw.Companion companion = JobInfoRaw.INSTANCE;
            Context context = this.f65497a;
            InterfaceC3244l4 interfaceC3244l4 = this.f65499c;
            companion.getClass();
            JobInfoRaw jobInfoRawA = JobInfoRaw.Companion.a(context, job, interfaceC3244l4);
            C3309p1.b(this.f65508l, new a(jobInfoRawA, job, this));
            if (this.f65510p.contains(jobInfoRawA.f65794h)) {
                Long l9 = (Long) this.n.get(jobInfoRawA.f65794h);
                if ((l9 != null ? l9.longValue() : 0L) + 1800000 < this.f65499c.getCurrentTimeMillis() && jobInfoRawA.f65788b < this.f65499c.getCurrentTimeMillis() + 1000 && (((Boolean) this.f65505i.invoke()).booleanValue() || !jobInfoRawA.f65795i)) {
                    X2<? extends Cd> x22 = this.f65509m.get(jobInfoRawA.f65794h);
                    if (x22 != null) {
                        this.n.put(jobInfoRawA.f65794h, Long.valueOf(this.f65499c.getCurrentTimeMillis()));
                        x22.onStartJob(jobInfoRawA);
                        return;
                    }
                    return;
                }
            }
            this.f65503g.b(jobInfoRawA);
            t70.m0.t(this.f65506j, null, null, new b(null), 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    @Override // io.branch.search.internal.InterfaceC3164g8
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, long j12, boolean z11, @NotNull Continuation<? super Unit> continuation) {
        c cVar;
        long j13;
        long j14;
        boolean z12;
        C3327q2 c3327q2;
        boolean z13;
        BranchJobType periodic;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f65522g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f65522g = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(continuation);
            }
        }
        c cVar2 = cVar;
        Object obj = cVar2.f65520e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar2.f65522g;
        if (i11 == 0) {
            ResultKt.b(obj);
            j13 = j11;
            C3309p1.b(this.f65508l, new d(j13, j12, z11));
            if (j13 > 0) {
                this.f65500d.a(j13);
            }
            C3193i3 c3193i3 = this.f65501e;
            Bc bc2 = new Bc(this.f65499c.getCurrentTimeMillis(), (this.f65498b.f63057z == y40.m.f96676b || j13 <= 0) ? j13 : j13 - (j13 / 5));
            cVar2.f65516a = this;
            cVar2.f65517b = j13;
            j14 = j12;
            cVar2.f65518c = j14;
            z12 = z11;
            cVar2.f65519d = z12;
            cVar2.f65522g = 1;
            if (c3193i3.a(bc2, cVar2) == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3327q2 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            boolean z14 = cVar2.f65519d;
            long j15 = cVar2.f65518c;
            long j16 = cVar2.f65517b;
            c3327q2 = cVar2.f65516a;
            ResultKt.b(obj);
            j14 = j15;
            z12 = z14;
            j13 = j16;
        }
        Context context = c3327q2.f65497a;
        P1 branchConfiguration = c3327q2.f65498b;
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        C3446x3 c3446x3A = C3446x3.Companion.a(context);
        synchronized (c3446x3A) {
            z13 = c3446x3A.f66255a.getBoolean("KEY_LOCK_BUNDLE_UPDATE", false);
        }
        if (z13) {
            C3309p1.a(c3327q2.f65508l, "bundle update locked");
        } else {
            C3309p1.a(c3327q2.f65508l, "schedule " + j13);
            boolean z15 = branchConfiguration.f63057z != y40.m.f96676b;
            if (z15) {
                periodic = new BranchJobType.Delayed(j13);
            } else {
                periodic = new BranchJobType.Periodic(j14);
            }
            if (c3327q2.a(JobId.BUNDLE_UPDATE.getId()) != null && !z12) {
                C3309p1.a(c3327q2.f65508l, "Abort scheduling a new job because there is one scheduled already and the new job is not being forced.");
            } else {
                c3327q2.a(new BranchJob.BundleUpdate(periodic, z15), C3343r2.f65606a);
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
            JobInfo jobInfoA = a(JobId.CACHE_UPDATE.getId());
            if (jobInfoA != null && cacheUpdateJob.compareWithJobInfo(jobInfoA)) {
                C3309p1.a(AndroidCacheUpdateService.TAG, "Cache update job already scheduled");
            } else {
                a(new BranchJob.CacheUpdateJob(remoteConfiguration.Z, mVar != mVar2), C3147f8.f64479a);
            }
        }
    }

    @Override // io.branch.search.internal.InterfaceC3164g8
    public final void a(@NotNull ArrayList jobs) {
        Iterable<BranchJob.AggregateAnalyticsPing> iterableSubList;
        Intrinsics.g(jobs, "jobs");
        ArrayList arrayListA = a();
        List listD1 = b70.g.D1(new C3360s2(), arrayListA);
        int iMax = Math.max(0, Math.min(listD1.size(), (jobs.size() + arrayListA.size()) - this.f65504h));
        int iMax2 = Math.max(0, (((jobs.size() + arrayListA.size()) - iMax) - this.f65504h) - 1);
        if (iMax2 < jobs.size()) {
            iterableSubList = jobs.subList(iMax2, jobs.size());
        } else {
            iterableSubList = EmptyList.f71733a;
        }
        Cc cc = this.f65503g;
        List listE1 = b70.g.E1(listD1, iMax);
        ArrayList arrayList = new ArrayList(b70.c.u0(listE1, 10));
        Iterator it = listE1.iterator();
        while (it.hasNext()) {
            arrayList.add(Integer.valueOf(((JobInfoRaw) it.next()).f65787a));
        }
        ArrayList arrayList2 = new ArrayList();
        for (BranchJob.AggregateAnalyticsPing aggregateAnalyticsPing : iterableSubList) {
            JobInfoRaw.Companion companion = JobInfoRaw.INSTANCE;
            Context context = this.f65497a;
            InterfaceC3244l4 interfaceC3244l4 = this.f65499c;
            companion.getClass();
            arrayList2.add(JobInfoRaw.Companion.a(context, aggregateAnalyticsPing, interfaceC3244l4));
        }
        cc.a(arrayList, arrayList2);
    }
}
