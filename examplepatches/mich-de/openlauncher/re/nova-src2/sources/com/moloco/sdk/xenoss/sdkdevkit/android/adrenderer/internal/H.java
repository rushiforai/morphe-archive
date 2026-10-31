package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import ads_mobile_sdk.pd;
import android.content.Context;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2972b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.StaticAdActivity;
import java.util.Iterator;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.PropertyReference0Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.r1;
import w70.g2;
import w70.i2;
import w70.j1;
import w70.m1;
import w70.q1;
import w70.u1;
import w70.y1;

/* loaded from: classes4.dex */
public final class H implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.f> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f38439a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z f38440b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f38441c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j f38442d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final j0 f38443e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.a f38444f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final F f38445g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final m1 f38446h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final Lazy f38447i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final m1 f38448j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final g2 f38449k;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.StaticFullscreenAdImpl$isAdDisplaying$2$1", f = "StaticFullscreenAd.kt", l = {}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function3<Boolean, Boolean, Continuation<? super Boolean>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38450a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ boolean f38451b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ boolean f38452c;

        public a(Continuation<? super a> continuation) {
            super(3, continuation);
        }

        public final Object a(boolean z11, boolean z12, Continuation<? super Boolean> continuation) {
            a aVar = new a(continuation);
            aVar.f38451b = z11;
            aVar.f38452c = z12;
            return aVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3) {
            return a(((Boolean) obj).booleanValue(), ((Boolean) obj2).booleanValue(), (Continuation) obj3);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f38450a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Boolean.valueOf(this.f38451b && this.f38452c);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.StaticFullscreenAdImpl$show$1", f = "StaticFullscreenAd.kt", l = {104}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38453a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f38454b;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.f f38456d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e f38457e;

        public /* synthetic */ class a extends FunctionReferenceImpl implements Function0<Unit> {
            public a(Object obj) {
                super(0, 0, H.class, obj, "onClose", "onClose()V");
            }

            public final void a() {
                ((H) this.receiver).o();
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Object invoke() {
                a();
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.StaticFullscreenAdImpl$show$1$eventHandlers$1", f = "StaticFullscreenAd.kt", l = {90}, m = "invokeSuspend")
        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.H$b$b, reason: collision with other inner class name */
        public static final class C0187b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f38458a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ H f38459b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e f38460c;

            @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.StaticFullscreenAdImpl$show$1$eventHandlers$1$error$1", f = "StaticFullscreenAd.kt", l = {}, m = "invokeSuspend")
            /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.H$b$b$a */
            public static final class a extends SuspendLambda implements Function2<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.g, Continuation<? super Boolean>, Object> {

                /* renamed from: a, reason: collision with root package name */
                public int f38461a;

                /* renamed from: b, reason: collision with root package name */
                public /* synthetic */ Object f38462b;

                public a(Continuation<? super a> continuation) {
                    super(2, continuation);
                }

                @Override // kotlin.jvm.functions.Function2
                /* renamed from: a, reason: merged with bridge method [inline-methods] */
                public final Object invoke(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.g gVar, Continuation<? super Boolean> continuation) {
                    return ((a) create(gVar, continuation)).invokeSuspend(Unit.f71706a);
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    a aVar = new a(continuation);
                    aVar.f38462b = obj;
                    return aVar;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Object invokeSuspend(Object obj) {
                    CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                    if (this.f38461a != 0) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Boolean.valueOf(((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.g) this.f38462b) != null);
                }
            }

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0187b(H h5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar, Continuation<? super C0187b> continuation) {
                super(2, continuation);
                this.f38459b = h5;
                this.f38460c = eVar;
            }

            @Override // kotlin.jvm.functions.Function2
            /* renamed from: a, reason: merged with bridge method [inline-methods] */
            public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
                return ((C0187b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                return new C0187b(this.f38459b, this.f38460c, continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f38458a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    g2 unrecoverableError = this.f38459b.f38444f.getUnrecoverableError();
                    a aVar = new a(null);
                    this.f38458a = 1;
                    obj = u1.p(unrecoverableError, aVar, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.g gVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.g) obj;
                if (gVar != null && (eVar = this.f38460c) != null) {
                    eVar.a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.h.b(gVar));
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.StaticFullscreenAdImpl$show$1$eventHandlers$2", f = "StaticFullscreenAd.kt", l = {pd.A0}, m = "invokeSuspend")
        public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f38463a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ H f38464b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e f38465c;

            public static final class a<T> implements w70.n {

                /* renamed from: a, reason: collision with root package name */
                public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e f38466a;

                public a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar) {
                    this.f38466a = eVar;
                }

                @Override // w70.n
                /* renamed from: a, reason: merged with bridge method [inline-methods] */
                public final Object emit(Unit unit, Continuation<? super Unit> continuation) {
                    com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar = this.f38466a;
                    if (eVar != null) {
                        eVar.c();
                    }
                    return Unit.f71706a;
                }
            }

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public c(H h5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar, Continuation<? super c> continuation) {
                super(2, continuation);
                this.f38464b = h5;
                this.f38465c = eVar;
            }

            @Override // kotlin.jvm.functions.Function2
            /* renamed from: a, reason: merged with bridge method [inline-methods] */
            public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
                return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                return new c(this.f38464b, this.f38465c, continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f38463a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    q1 clickthroughEvent = this.f38464b.f38444f.getClickthroughEvent();
                    a aVar = new a(this.f38465c);
                    this.f38463a = 1;
                    if (clickthroughEvent.collect(aVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                throw new KotlinNothingValueException();
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.f fVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f38456d = fVar;
            this.f38457e = eVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            b bVar = H.this.new b(this.f38456d, this.f38457e, continuation);
            bVar.f38454b = obj;
            return bVar;
        }

        /* JADX WARN: Removed duplicated region for block: B:20:0x00ab A[LOOP:0: B:18:0x00a5->B:20:0x00ab, LOOP_END] */
        /* JADX WARN: Removed duplicated region for block: B:28:0x00d4 A[LOOP:1: B:26:0x00ce->B:28:0x00d4, LOOP_END] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws Throwable {
            List list;
            Iterator it;
            Iterator it2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f38453a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                list = (List) this.f38454b;
                try {
                    ResultKt.b(obj);
                    it2 = list.iterator();
                    while (it2.hasNext()) {
                        ((r1) it2.next()).c(null);
                    }
                    m1 m1Var = H.this.f38446h;
                    Boolean bool = Boolean.FALSE;
                    i2 i2Var = (i2) m1Var;
                    i2Var.getClass();
                    i2Var.k(null, bool);
                    return Unit.f71706a;
                } catch (Throwable th2) {
                    th = th2;
                    it = list.iterator();
                    while (it.hasNext()) {
                        ((r1) it.next()).c(null);
                    }
                    m1 m1Var2 = H.this.f38446h;
                    Boolean bool2 = Boolean.FALSE;
                    i2 i2Var2 = (i2) m1Var2;
                    i2Var2.getClass();
                    i2Var2.k(null, bool2);
                    throw th;
                }
            }
            ResultKt.b(obj);
            j0 j0Var = (j0) this.f38454b;
            List listQ = ul.b.Q(m0.t(j0Var, null, null, new C0187b(H.this, this.f38457e, null), 3), m0.t(j0Var, null, null, new c(H.this, this.f38457e, null), 3));
            try {
                m1 m1Var3 = H.this.f38446h;
                Boolean bool3 = Boolean.TRUE;
                i2 i2Var3 = (i2) m1Var3;
                i2Var3.getClass();
                i2Var3.k(null, bool3);
                StaticAdActivity.Companion companion = StaticAdActivity.INSTANCE;
                Context context = H.this.f38439a;
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.a aVar = H.this.f38444f;
                a aVar2 = new a(H.this);
                a0 a0Var = new a0(this.f38457e, 2);
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.f fVar = this.f38456d;
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar = H.this.f38440b;
                MetricsRecorder metricsRecorder = H.this.f38441c;
                b0 b0Var = new b0(this.f38457e, 1);
                this.f38454b = listQ;
                this.f38453a = 1;
                if (companion.a(context, aVar, aVar2, a0Var, fVar, zVar, metricsRecorder, b0Var, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                list = listQ;
                it2 = list.iterator();
                while (it2.hasNext()) {
                }
                m1 m1Var4 = H.this.f38446h;
                Boolean bool4 = Boolean.FALSE;
                i2 i2Var4 = (i2) m1Var4;
                i2Var4.getClass();
                i2Var4.k(null, bool4);
                return Unit.f71706a;
            } catch (Throwable th3) {
                th = th3;
                list = listQ;
                it = list.iterator();
                while (it.hasNext()) {
                }
                m1 m1Var22 = H.this.f38446h;
                Boolean bool22 = Boolean.FALSE;
                i2 i2Var22 = (i2) m1Var22;
                i2Var22.getClass();
                i2Var22.k(null, bool22);
                throw th;
            }
        }

        public static final Unit a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar) {
            if (eVar != null) {
                eVar.b();
            }
            return Unit.f71706a;
        }

        public static final Unit a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVar) {
            if (eVar != null) {
                eVar.a(cVar);
            }
            return Unit.f71706a;
        }
    }

    public H(@NotNull Context context, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull String adm, @NotNull r externalLinkHandler, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z watermark, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(context, "context");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(adm, "adm");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        Intrinsics.g(watermark, "watermark");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f38439a = context;
        this.f38440b = watermark;
        this.f38441c = metricsRecorder;
        this.f38442d = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42120c;
        y70.d dVarS = k2.s();
        this.f38443e = dVarS;
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.a aVar = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.a(context, null, new com.moloco.sdk.internal.services.t(externalLinkHandler, customUserEventBuilderService), com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.j.a(), false, null, 50, null);
        this.f38444f = aVar;
        this.f38445g = new F(adm, dVarS, aVar, null, null, 24, null);
        Boolean bool = Boolean.FALSE;
        this.f38446h = u1.c(bool);
        this.f38447i = LazyKt.a(new as.c(this, 19));
        i2 i2VarC = u1.c(bool);
        this.f38448j = i2VarC;
        this.f38449k = i2VarC;
    }

    public static final g2 g(H h5) {
        return u1.z(new j1(h5.f38446h, h5.f38444f.c(), new a(null)), h5.f38443e, y1.f94086a, Boolean.FALSE);
    }

    public static Object h(H h5) {
        return Reflection.f71864a.property0(new PropertyReference0Impl(h5.f38445g, F.class, "isLoaded", "isLoaded()Lkotlinx/coroutines/flow/StateFlow;", 0));
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l
    public void destroy() {
        k0.c(this.f38443e, null);
        this.f38444f.destroy();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.k
    @NotNull
    public com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j getCreativeType() {
        return this.f38442d;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2972b
    @NotNull
    public g2 isLoaded() {
        return this.f38445g.isLoaded();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.n
    @NotNull
    public g2 k() {
        return this.f38449k;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2971a
    @NotNull
    public g2 l() {
        return (g2) this.f38447i.getValue();
    }

    public final void o() {
        m1 m1Var = this.f38446h;
        Boolean bool = Boolean.FALSE;
        i2 i2Var = (i2) m1Var;
        i2Var.getClass();
        i2Var.k(null, bool);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2972b
    public void a(long j11, @Nullable InterfaceC2972b.a aVar) {
        this.f38445g.a(j11, aVar);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m
    public void a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.f options, @Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar) {
        Intrinsics.g(options, "options");
        m0.t(this.f38443e, null, null, new b(options, eVar, null), 3);
    }
}
