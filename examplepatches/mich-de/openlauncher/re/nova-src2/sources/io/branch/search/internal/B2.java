package io.branch.search.internal;

import android.content.Context;
import com.google.gson.JsonIOException;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.BranchNavigatorCore$Exception;
import io.branch.search.internal.B2;
import io.branch.search.internal.util.CorosKt;
import java.lang.Thread;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class B2 implements y40.s {

    /* renamed from: e, reason: collision with root package name */
    public static boolean f62099e;

    /* renamed from: g, reason: collision with root package name */
    public static volatile B2 f62101g;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final y40.u f62103a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final M2 f62104b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3479z2 f62105c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Lazy<y40.p> f62106d;

    @NotNull
    public static final a Companion = new a();

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final ArrayList f62100f = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public static final t70.r f62102h = new t70.s(null);

    public B2(@NotNull y40.u config, @NotNull t70.j0 coroutineScope, @NotNull M4 crashHelper, @NotNull C3363s5 crashLoopHandler, @NotNull C3371sd sentryLogger, @NotNull M2 bsi) {
        Intrinsics.g(config, "config");
        Intrinsics.g(coroutineScope, "coroutineScope");
        Intrinsics.g(crashHelper, "crashHelper");
        Intrinsics.g(crashLoopHandler, "crashLoopHandler");
        Intrinsics.g(sentryLogger, "sentryLogger");
        Intrinsics.g(bsi, "bsi");
        this.f62103a = config;
        this.f62104b = bsi;
        this.f62105c = new C3479z2();
        t70.m0.t(coroutineScope, null, null, new A2(this, null), 3);
        this.f62106d = LazyKt.a(new D2(this));
    }

    public final void dispatchInitEvent() {
        C3185hc.a(this.f62104b);
    }

    public static final class a {

        @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorCoreImpl$Companion$init$2", f = "BranchNavigatorCoreImpl.kt", l = {197, Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.B2$a$a, reason: collision with other inner class name */
        /* loaded from: classes4.dex */
        public static final class C0312a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public Object f62107a;

            /* renamed from: b, reason: collision with root package name */
            public Object f62108b;

            /* renamed from: c, reason: collision with root package name */
            public Object f62109c;

            /* renamed from: d, reason: collision with root package name */
            public C3371sd f62110d;

            /* renamed from: e, reason: collision with root package name */
            public M4 f62111e;

            /* renamed from: f, reason: collision with root package name */
            public C3363s5 f62112f;

            /* renamed from: g, reason: collision with root package name */
            public int f62113g;

            /* renamed from: h, reason: collision with root package name */
            public final /* synthetic */ F4 f62114h;

            /* renamed from: i, reason: collision with root package name */
            public final /* synthetic */ E9 f62115i;

            /* renamed from: j, reason: collision with root package name */
            public final /* synthetic */ y40.u f62116j;

            /* renamed from: k, reason: collision with root package name */
            public final /* synthetic */ Z2 f62117k;

            /* renamed from: l, reason: collision with root package name */
            public final /* synthetic */ C3371sd f62118l;

            /* renamed from: m, reason: collision with root package name */
            public final /* synthetic */ M4 f62119m;
            public final /* synthetic */ C3363s5 n;

            @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorCoreImpl$Companion$init$2$3$1", f = "BranchNavigatorCoreImpl.kt", l = {}, m = "invokeSuspend")
            /* renamed from: io.branch.search.internal.B2$a$a$a, reason: collision with other inner class name */
            public static final class C0313a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

                /* renamed from: a, reason: collision with root package name */
                public final /* synthetic */ y40.r f62120a;

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ B2 f62121b;

                /* renamed from: c, reason: collision with root package name */
                public final /* synthetic */ Throwable f62122c;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                public C0313a(y40.r rVar, B2 b22, Throwable th2, Continuation<? super C0313a> continuation) {
                    super(2, continuation);
                    this.f62120a = rVar;
                    this.f62121b = b22;
                    this.f62122c = th2;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                @NotNull
                public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                    return new C0313a(this.f62120a, this.f62121b, this.f62122c, continuation);
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return ((C0313a) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                @Nullable
                public final Object invokeSuspend(@NotNull Object obj) {
                    CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                    ResultKt.b(obj);
                    this.f62120a.onComplete(this.f62121b, this.f62122c);
                    return Unit.f71706a;
                }
            }

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0312a(F4 f42, E9 e92, y40.u uVar, Z2 z22, C3371sd c3371sd, M4 m42, C3363s5 c3363s5, Continuation<? super C0312a> continuation) {
                super(2, continuation);
                this.f62114h = f42;
                this.f62115i = e92;
                this.f62116j = uVar;
                this.f62117k = z22;
                this.f62118l = c3371sd;
                this.f62119m = m42;
                this.n = c3363s5;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new C0312a(this.f62114h, this.f62115i, this.f62116j, this.f62117k, this.f62118l, this.f62119m, this.n, continuation);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return ((C0312a) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            }

            /* JADX WARN: Removed duplicated region for block: B:33:0x00e8  */
            /* JADX WARN: Removed duplicated region for block: B:37:0x010e  */
            /* JADX WARN: Removed duplicated region for block: B:39:0x0115  */
            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object invokeSuspend(@NotNull Object obj) throws JsonIOException {
                Pair pair;
                B2 b22;
                ArrayList arrayListK1;
                Throwable th2;
                Iterator it;
                F4 f42;
                y40.u uVar;
                Z2 z22;
                C3371sd c3371sd;
                M4 m42;
                C3363s5 c3363s5;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f62113g;
                try {
                } catch (Throwable th3) {
                    pair = new Pair(null, th3);
                }
                if (i5 == 0) {
                    ResultKt.b(obj);
                    f42 = this.f62114h;
                    E9 e92 = this.f62115i;
                    uVar = this.f62116j;
                    z22 = this.f62117k;
                    c3371sd = this.f62118l;
                    m42 = this.f62119m;
                    C3363s5 c3363s52 = this.n;
                    C3434w8 c3434w8 = new C3434w8(f42.f62438a, e92);
                    this.f62107a = f42;
                    this.f62108b = uVar;
                    this.f62109c = z22;
                    this.f62110d = c3371sd;
                    this.f62111e = m42;
                    this.f62112f = c3363s52;
                    this.f62113g = 1;
                    if (c3434w8.a(uVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    c3363s5 = c3363s52;
                } else {
                    if (i5 != 1) {
                        if (i5 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        it = (Iterator) this.f62109c;
                        th2 = (Throwable) this.f62108b;
                        b22 = (B2) this.f62107a;
                        ResultKt.b(obj);
                        while (it.hasNext()) {
                            y40.r rVar = (y40.r) it.next();
                            a80.e eVar = t70.y0.f88884a;
                            u70.d dVar = y70.o.f96819a;
                            C0313a c0313a = new C0313a(rVar, b22, th2, null);
                            this.f62107a = b22;
                            this.f62108b = th2;
                            this.f62109c = it;
                            this.f62110d = null;
                            this.f62111e = null;
                            this.f62112f = null;
                            this.f62113g = 2;
                            if (t70.m0.y(dVar, c0313a, this) == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        }
                        if (b22 != null) {
                            C3185hc.a(b22.f62104b);
                        }
                        if (b22 != null) {
                            M2 m22 = b22.f62104b;
                            C3479z2 branchNavigatorCoreData = b22.f62105c;
                            m22.getClass();
                            Intrinsics.g(branchNavigatorCoreData, "branchNavigatorCoreData");
                            C3282n8 c3282n8A = m22.f62880u.a();
                            Intrinsics.g(c3282n8A, "<set-?>");
                            branchNavigatorCoreData.f66354a = c3282n8A;
                            InterfaceC3164g8 interfaceC3164g8 = m22.f62878s;
                            Intrinsics.g(interfaceC3164g8, "<set-?>");
                            branchNavigatorCoreData.f66355b = interfaceC3164g8;
                            C3479z2 c3479z2 = b22.f62105c;
                            InterfaceC3164g8 interfaceC3164g82 = c3479z2.f66355b;
                            if (interfaceC3164g82 == null) {
                                Intrinsics.m("jobManager");
                                throw null;
                            }
                            C3282n8 c3282n8 = c3479z2.f66354a;
                            if (c3282n8 == null) {
                                Intrinsics.m("remoteConfiguration");
                                throw null;
                            }
                            interfaceC3164g82.a(c3282n8, b22.f62103a, b22.f62106d);
                        }
                        return Unit.f71706a;
                    }
                    c3363s5 = this.f62112f;
                    m42 = this.f62111e;
                    c3371sd = this.f62110d;
                    z22 = (Z2) this.f62109c;
                    uVar = (y40.u) this.f62108b;
                    f42 = (F4) this.f62107a;
                    ResultKt.b(obj);
                }
                y40.u uVar2 = uVar;
                C3354rd.a(f42, z22);
                C3309p1.f65465a.getClass();
                C3309p1.f65467c = new C3300o9(C3309p1.f65467c, c3371sd);
                pair = new Pair(new B2(uVar2, CorosKt.getBNCScope(), m42, c3363s5, c3371sd, new M2(new P1(uVar2), m42, c3363s5, c3371sd)), null);
                b22 = (B2) pair.f71683a;
                Throwable th4 = (Throwable) pair.f71684b;
                ArrayList arrayList = B2.f62100f;
                synchronized (arrayList) {
                    if (b22 != null) {
                        try {
                            B2.Companion.getClass();
                            B2.f62101g = b22;
                            ((t70.s) B2.f62102h).X(b22);
                        } catch (Throwable th5) {
                            throw th5;
                        }
                    }
                    B2.f62099e = false;
                    arrayListK1 = b70.g.K1(arrayList);
                    arrayList.clear();
                }
                Iterator it2 = arrayListK1.iterator();
                th2 = th4;
                it = it2;
                while (it.hasNext()) {
                }
                if (b22 != null) {
                }
                if (b22 != null) {
                }
                return Unit.f71706a;
            }
        }

        @JvmStatic
        @NotNull
        public static C3462y2 a(@NotNull Context context) {
            Intrinsics.g(context, "context");
            F4 f42 = new F4(context);
            a80.e eVar = t70.y0.f88884a;
            return new C3462y2(new Nd(f42, a80.d.f488c));
        }

        @JvmStatic
        public static void a(@NotNull y40.u config, @NotNull y40.r cb2) {
            B2 b22;
            Intrinsics.g(config, "config");
            Intrinsics.g(cb2, "cb");
            InterfaceC3133eb interfaceC3133ebB = config.b();
            if (interfaceC3133ebB.d() && !interfaceC3133ebB.c()) {
                Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: z40.a
                    @Override // java.lang.Thread.UncaughtExceptionHandler
                    public final void uncaughtException(Thread thread, Throwable th2) {
                        B2.a.a(thread, th2);
                    }
                });
                return;
            }
            if (!interfaceC3133ebB.c()) {
                cb2.onComplete(null, new BranchNavigatorCore$Exception("BranchNavigatorCore is being initialized in a process it is not configured to be in"));
                return;
            }
            ArrayList arrayList = B2.f62100f;
            synchronized (arrayList) {
                try {
                    if (B2.f62101g != null) {
                        C3309p1 c3309p1 = C3309p1.f65465a;
                        C3309p1.a(a50.b.f402c, "BranchSearchSDK", "BranchNavigatorCore already initialize, ignoring new configuration", (Throwable) null);
                        B2.Companion.getClass();
                        b22 = B2.f62101g;
                        if (b22 == null) {
                            Intrinsics.m("instance");
                            throw null;
                        }
                    } else {
                        arrayList.add(cb2);
                        if (B2.f62099e) {
                            C3309p1 c3309p12 = C3309p1.f65465a;
                            C3309p1.a(a50.b.f402c, "BranchSearchSDK", "BranchNavigatorCore is initializing, ignoring new configuration", (Throwable) null);
                            return;
                        } else {
                            B2.f62099e = true;
                            b22 = null;
                        }
                    }
                    if (b22 != null) {
                        cb2.onComplete(b22, null);
                        return;
                    }
                    F4 f4A = config.a();
                    M4 m42 = new M4(f4A);
                    E9 e92 = new E9(f4A);
                    String strE = interfaceC3133ebB.e();
                    a80.e eVar = t70.y0.f88884a;
                    a80.d dVar = a80.d.f488c;
                    C3363s5 c3363s5 = new C3363s5(f4A, strE, e92, dVar);
                    C3371sd c3371sd = new C3371sd(CorosKt.getBNCScope());
                    Z2.Companion.getClass();
                    Z2 z22 = Z2.f63802f;
                    if (z22 == null) {
                        z22 = new Z2(interfaceC3133ebB, m42, c3363s5);
                        z22.f63806d = Thread.getDefaultUncaughtExceptionHandler();
                        Thread.setDefaultUncaughtExceptionHandler(z22);
                        Z2.f63802f = z22;
                    }
                    t70.m0.t(CorosKt.getBNCScope(), dVar, null, new C0312a(f4A, e92, config, z22, c3371sd, m42, c3363s5, null), 2);
                } finally {
                }
            }
        }

        public static final void a(Thread thread, Throwable th2) {
            System.exit(0);
            throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
        }
    }
}
