package io.branch.search.internal;

import android.app.Application;
import android.app.job.JobParameters;
import android.app.job.JobService;
import io.branch.search.internal.Cd;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.u0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public class JobServiceC3392u0<T extends Cd> extends JobService {

    @Nullable
    private InterfaceC3490zd<T> controllerCache;

    @NotNull
    private final Function1<Function0<? extends Y1>, InterfaceC3490zd<T>> controllerFactory;

    @NotNull
    private final J4 coroutinesJobManager;

    @NotNull
    private final Function1<JobParameters, T> createRequest;
    public C3151fc runningJobMonitor;

    @NotNull
    private final InterfaceC3304od selfInitializeJob;

    /* renamed from: io.branch.search.internal.u0$a */
    public /* synthetic */ class a extends FunctionReferenceImpl implements Function0<Y1> {
        public a(Object obj) {
            super(0, 0, JobServiceC3392u0.class, obj, "assertBsi", "assertBsi()Lio/branch/search/internal/BranchDependencyProvider;");
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return ((JobServiceC3392u0) this.receiver).assertBsi();
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.services.templates.AndroidServiceTemplate$onStartJob$1", f = "AndroidServiceTemplate.kt", l = {53, 56}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.u0$b */
    public static final class b extends SuspendLambda implements Function2<T, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public Cd f65941a;

        /* renamed from: b, reason: collision with root package name */
        public int f65942b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f65943c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ JobServiceC3392u0<T> f65944d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ T f65945e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(JobServiceC3392u0<T> jobServiceC3392u0, T t6, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f65944d = jobServiceC3392u0;
            this.f65945e = t6;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            b bVar = new b(this.f65944d, this.f65945e, continuation);
            bVar.f65943c = obj;
            return bVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((b) create((Cd) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            JobServiceC3392u0<T> jobServiceC3392u0;
            Cd cd2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65942b;
            try {
            } catch (Exception e3) {
                jobServiceC3392u0 = this.f65944d;
                T t6 = this.f65945e;
                InterfaceC3490zd controller = jobServiceC3392u0.getController();
                Application application = this.f65944d.getApplication();
                Intrinsics.f(application, "application");
                F4 f42 = new F4(application);
                T t9 = this.f65945e;
                this.f65943c = jobServiceC3392u0;
                this.f65941a = t6;
                this.f65942b = 2;
                obj = controller.a(f42, t9, e3);
                if (obj != coroutineSingletons) {
                    cd2 = t6;
                }
            }
            if (i5 == 0) {
                ResultKt.b(obj);
                Cd cd3 = (Cd) this.f65943c;
                InterfaceC3490zd controller2 = this.f65944d.getController();
                Application application2 = this.f65944d.getApplication();
                Intrinsics.f(application2, "application");
                F4 f43 = new F4(application2);
                this.f65942b = 1;
                obj = controller2.a(f43, (F4) cd3, (Continuation<? super Boolean>) this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    cd2 = this.f65941a;
                    jobServiceC3392u0 = (JobServiceC3392u0) this.f65943c;
                    ResultKt.b(obj);
                    jobServiceC3392u0.jobFinishedInternal(cd2, ((Boolean) obj).booleanValue());
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
            }
            this.f65944d.jobFinishedInternal(this.f65945e, ((Boolean) obj).booleanValue());
            return Unit.f71706a;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public JobServiceC3392u0(@NotNull t70.c0 ioDispatcher, @NotNull Function1<? super JobParameters, ? extends T> createRequest, @NotNull Function1<? super Function0<? extends Y1>, ? extends InterfaceC3490zd<T>> controllerFactory, @NotNull InterfaceC3304od selfInitializeJob) {
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        Intrinsics.g(createRequest, "createRequest");
        Intrinsics.g(controllerFactory, "controllerFactory");
        Intrinsics.g(selfInitializeJob, "selfInitializeJob");
        this.createRequest = createRequest;
        this.controllerFactory = controllerFactory;
        this.selfInitializeJob = selfInitializeJob;
        this.coroutinesJobManager = new J4(ioDispatcher);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final InterfaceC3490zd<T> getController() {
        InterfaceC3490zd<T> interfaceC3490zd = this.controllerCache;
        if (interfaceC3490zd != null) {
            return interfaceC3490zd;
        }
        InterfaceC3490zd<T> interfaceC3490zd2 = (InterfaceC3490zd) this.controllerFactory.invoke(new a(this));
        this.controllerCache = interfaceC3490zd2;
        return interfaceC3490zd2;
    }

    @NotNull
    public final Y1 assertBsi() {
        Application application = getApplication();
        Intrinsics.f(application, "application");
        Y1 y12 = (Y1) t70.m0.u(EmptyCoroutineContext.f71803a, new E6(new F4(application), 30000L, null));
        if (y12 == null) {
            throw new C3142f3();
        }
        y12.a((JobServiceC3392u0<?>) this);
        return y12;
    }

    @NotNull
    public final C3151fc getRunningJobMonitor() {
        C3151fc c3151fc = this.runningJobMonitor;
        if (c3151fc != null) {
            return c3151fc;
        }
        Intrinsics.m("runningJobMonitor");
        throw null;
    }

    public void jobFinishedInternal(@NotNull T params, boolean z11) {
        Intrinsics.g(params, "params");
        if (params.a()) {
            if (this.runningJobMonitor != null) {
                getRunningJobMonitor().a(params);
            }
            jobFinished(params.c(), z11);
        }
    }

    @Override // android.app.job.JobService
    public boolean onStartJob(@NotNull JobParameters params) {
        Intrinsics.g(params, "params");
        Cd cd2 = (Cd) this.createRequest.invoke(params);
        boolean zA = cd2.a();
        runSelfInit();
        try {
            J4 j42 = this.coroutinesJobManager;
            b bVar = new b(this, cd2, null);
            j42.getClass();
            t70.m0.t(j42.f62719b, null, null, new K4(j42, cd2, t70.m0.t(j42.f62719b, j42.f62718a, null, new L4(bVar, cd2, null), 2), null), 3);
        } catch (C3142f3 unused) {
            C3309p1.a("ServiceTemplate", "Branch singleton is null, cancel " + getClass().getName() + ", we will update when SDK initializes");
            jobFinishedInternal(cd2, true);
        }
        if (!zA && this.runningJobMonitor != null) {
            getRunningJobMonitor().a(cd2);
        }
        return zA;
    }

    @Override // android.app.job.JobService
    public boolean onStopJob(@NotNull JobParameters params) {
        Intrinsics.g(params, "params");
        Cd cd2 = (Cd) this.createRequest.invoke(params);
        int jobId = params.getJobId();
        J4 j42 = this.coroutinesJobManager;
        t70.m0.t(j42.f62719b, null, null, new I4(j42, jobId, null), 3);
        InterfaceC3490zd<T> controller = getController();
        if (this.runningJobMonitor != null) {
            getRunningJobMonitor().a(cd2);
        }
        Application application = getApplication();
        Intrinsics.f(application, "application");
        controller.a(new F4(application), cd2);
        return true;
    }

    public void runSelfInit() {
        InterfaceC3304od interfaceC3304od = this.selfInitializeJob;
        Application application = getApplication();
        Intrinsics.f(application, "application");
        interfaceC3304od.a(application, this.coroutinesJobManager.f62719b);
    }

    public final void setRunningJobMonitor(@NotNull C3151fc c3151fc) {
        Intrinsics.g(c3151fc, "<set-?>");
        this.runningJobMonitor = c3151fc;
    }

    public /* synthetic */ JobServiceC3392u0(t70.c0 c0Var, Function1 function1, Function1 function12, InterfaceC3304od interfaceC3304od, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(c0Var, function1, function12, (i5 & 8) != 0 ? new C3321pd(c0Var) : interfaceC3304od);
    }
}
