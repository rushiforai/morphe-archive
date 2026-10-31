package com.moloco.sdk.internal.publisher;

import android.content.Context;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.ortb.model.C2933c;
import com.moloco.sdk.internal.ortb.model.C2935e;
import com.moloco.sdk.internal.ortb.model.C2936f;
import com.moloco.sdk.internal.publisher.A;
import com.moloco.sdk.internal.services.InterfaceC2958f;
import com.moloco.sdk.publisher.AdFormatType;
import com.moloco.sdk.publisher.AdLoad;
import com.moloco.sdk.publisher.AdShowListener;
import com.moloco.sdk.publisher.FullscreenAd;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.MolocoAdKt;
import com.moloco.sdk.service_locator.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2971a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2972b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.h;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2981h;
import java.util.Locale;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.r1;
import w70.g2;
import w70.u1;

/* loaded from: classes.dex */
public final class w<T extends AdShowListener> implements FullscreenAd<T>, s {

    /* renamed from: v, reason: collision with root package name */
    @NotNull
    public static final a f37475v = new a(null);

    /* renamed from: w, reason: collision with root package name */
    public static final int f37476w = 8;

    /* renamed from: x, reason: collision with root package name */
    @NotNull
    public static final String f37477x = "FullscreenAdImpl";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f37478a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC2958f f37479b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a f37480c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f37481d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i f37482e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r f37483f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Function1<com.moloco.sdk.internal.ortb.model.B, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i> f37484g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final v<T> f37485h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final AdFormatType f37486i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z f37487j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final C2939a f37488k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f37489l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final j0 f37490m;

    @NotNull
    public final TimerEvent n;

    @Nullable
    public TimerEvent o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final AdLoad f37491p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i f37492q;

    /* renamed from: r, reason: collision with root package name */
    @Nullable
    public C2933c f37493r;

    /* renamed from: s, reason: collision with root package name */
    @Nullable
    public Function1<? super Boolean, Unit> f37494s;

    /* renamed from: t, reason: collision with root package name */
    @Nullable
    public Function0<Unit> f37495t;

    /* renamed from: u, reason: collision with root package name */
    @Nullable
    public Function0<Unit> f37496u;

    /* loaded from: classes4.dex */
    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    /* loaded from: classes4.dex */
    public /* synthetic */ class b extends FunctionReferenceImpl implements Function1<C2935e, InterfaceC2972b> {
        public b(Object obj) {
            super(1, 0, w.class, obj, "recreateXenossAd", "recreateXenossAd(Lcom/moloco/sdk/internal/ortb/model/Bid;)Lcom/moloco/sdk/xenoss/sdkdevkit/android/adrenderer/AdLoad;");
        }

        @Override // kotlin.jvm.functions.Function1
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final InterfaceC2972b invoke(C2935e p02) {
            Intrinsics.g(p02, "p0");
            return ((w) this.receiver).a(p02);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.publisher.FullscreenAdImpl$listenToAdDisplayState$1$1", f = "FullscreenAdImpl.kt", l = {280, 282}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37497a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ InterfaceC2971a f37498b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ A f37499c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ w<T> f37500d;

        @DebugMetadata(c = "com.moloco.sdk.internal.publisher.FullscreenAdImpl$listenToAdDisplayState$1$1$1", f = "FullscreenAdImpl.kt", l = {}, m = "invokeSuspend")
        public static final class a extends SuspendLambda implements Function2<Boolean, Continuation<? super Boolean>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f37501a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ boolean f37502b;

            public a(Continuation<? super a> continuation) {
                super(2, continuation);
            }

            public final Object a(boolean z11, Continuation<? super Boolean> continuation) {
                return ((a) create(Boolean.valueOf(z11), continuation)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                a aVar = new a(continuation);
                aVar.f37502b = ((Boolean) obj).booleanValue();
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
                return a(((Boolean) obj).booleanValue(), (Continuation) obj2);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                if (this.f37501a != 0) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Boolean.valueOf(this.f37502b);
            }
        }

        @DebugMetadata(c = "com.moloco.sdk.internal.publisher.FullscreenAdImpl$listenToAdDisplayState$1$1$2", f = "FullscreenAdImpl.kt", l = {}, m = "invokeSuspend")
        public static final class b extends SuspendLambda implements Function2<Boolean, Continuation<? super Boolean>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f37503a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ boolean f37504b;

            public b(Continuation<? super b> continuation) {
                super(2, continuation);
            }

            public final Object a(boolean z11, Continuation<? super Boolean> continuation) {
                return ((b) create(Boolean.valueOf(z11), continuation)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                b bVar = new b(continuation);
                bVar.f37504b = ((Boolean) obj).booleanValue();
                return bVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
                return a(((Boolean) obj).booleanValue(), (Continuation) obj2);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                if (this.f37503a != 0) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Boolean.valueOf(!this.f37504b);
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public c(InterfaceC2971a interfaceC2971a, A a11, w<? super T> wVar, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f37498b = interfaceC2971a;
            this.f37499c = a11;
            this.f37500d = wVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new c(this.f37498b, this.f37499c, this.f37500d, continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:17:0x0057, code lost:
        
            if (w70.u1.p(r7, r1, r6) == r0) goto L18;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f37497a;
            if (i5 == 0) {
                ResultKt.b(obj);
                g2 g2VarL = this.f37498b.l();
                a aVar = new a(null);
                this.f37497a = 1;
                if (u1.p(g2VarL, aVar, this) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                A a11 = this.f37499c;
                if (a11 != null) {
                    a11.onAdHidden(MolocoAdKt.createAdInfo$default(this.f37500d.f37481d, null, null, 6, null));
                }
                return Unit.f71706a;
            }
            ResultKt.b(obj);
            A a12 = this.f37499c;
            if (a12 != null) {
                A.a.a(a12, MolocoAdKt.createAdInfo$default(this.f37500d.f37481d, null, null, 6, null), null, 2, null);
            }
            g2 g2VarL2 = this.f37498b.l();
            b bVar = new b(null);
            this.f37497a = 2;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.publisher.FullscreenAdImpl$load$1", f = "FullscreenAdImpl.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class d extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37505a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ w<T> f37506b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37507c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ AdLoad.Listener f37508d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public d(w<? super T> wVar, String str, AdLoad.Listener listener, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f37506b = wVar;
            this.f37507c = str;
            this.f37508d = listener;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new d(this.f37506b, this.f37507c, this.f37508d, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37505a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            this.f37506b.f37491p.load(this.f37507c, this.f37508d);
            return Unit.f71706a;
        }
    }

    /* loaded from: classes4.dex */
    public static final class e implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.h {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ w<T> f37509a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ A f37510b;

        /* JADX WARN: Multi-variable type inference failed */
        public e(w<? super T> wVar, A a11) {
            this.f37509a = wVar;
            this.f37510b = a11;
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void a() {
            h.a.a(this);
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void b() {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, w.f37477x, "Ad skip button shown, triggering callback", null, false, 12, null);
            Function0<Unit> function0C = this.f37509a.c();
            if (function0C != null) {
                function0C.invoke();
            }
            A a11 = this.f37510b;
            if (a11 != null) {
                a11.b();
            }
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void c() {
            A a11 = this.f37510b;
            if (a11 != null) {
                a11.onAdClicked(MolocoAdKt.createAdInfo$default(this.f37509a.f37481d, null, null, 6, null));
            }
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.x
        public void a(boolean z11) {
            String eventLink;
            C2933c c2933c = this.f37509a.f37493r;
            if (c2933c != null) {
                w<T> wVar = this.f37509a;
                if (c2933c.getEnabled() && ((!z11 || c2933c.getOnSkip()) && (eventLink = c2933c.getEventLink()) != null)) {
                    wVar.f37482e.a(eventLink);
                }
            }
            Function1<Boolean, Unit> function1F = this.f37509a.f();
            if (function1F != null) {
                function1F.invoke(Boolean.valueOf(z11));
            }
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c internalShowError) {
            Intrinsics.g(internalShowError, "internalShowError");
            w<T> wVar = this.f37509a;
            wVar.a(com.moloco.sdk.internal.u.a(wVar.f37481d, MolocoAdError.ErrorType.AD_SHOW_ERROR, internalShowError, null, 8, null));
        }
    }

    /* loaded from: classes4.dex */
    public static final class f implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.v {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ w<T> f37511a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ A f37512b;

        /* JADX WARN: Multi-variable type inference failed */
        public f(w<? super T> wVar, A a11) {
            this.f37511a = wVar;
            this.f37512b = a11;
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c internalShowError) {
            Intrinsics.g(internalShowError, "internalShowError");
            w<T> wVar = this.f37511a;
            wVar.a(com.moloco.sdk.internal.u.a(wVar.f37481d, MolocoAdError.ErrorType.AD_SHOW_ERROR, internalShowError, null, 8, null));
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void b() {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, w.f37477x, "Template ad skip/close button shown", null, false, 12, null);
            Function0<Unit> function0C = this.f37511a.c();
            if (function0C != null) {
                function0C.invoke();
            }
            A a11 = this.f37512b;
            if (a11 != null) {
                a11.b();
            }
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void c() {
            A a11 = this.f37512b;
            if (a11 != null) {
                a11.onAdClicked(MolocoAdKt.createAdInfo$default(this.f37511a.f37481d, null, null, 6, null));
            }
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e
        public void a() {
            Function0<Unit> function0D = this.f37511a.d();
            if (function0D != null) {
                function0D.invoke();
            }
            A a11 = this.f37512b;
            if (a11 != null) {
                a11.a();
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.publisher.FullscreenAdImpl$show$2", f = "FullscreenAdImpl.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class g extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37513a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ T f37514b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ w<T> f37515c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public g(T t6, w<? super T> wVar, Continuation<? super g> continuation) {
            super(2, continuation);
            this.f37514b = t6;
            this.f37515c = wVar;
        }

        public static final C2949k b(w wVar) {
            return wVar.a();
        }

        public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j c(w wVar) {
            return wVar.b();
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((g) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new g(this.f37514b, this.f37515c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37513a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            InterfaceC2971a interfaceC2971a = null;
            if (this.f37514b != null) {
                v vVar = this.f37515c.f37485h;
                T t6 = this.f37514b;
                InterfaceC2958f interfaceC2958f = this.f37515c.f37479b;
                com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar = this.f37515c.f37480c;
                w<T> wVar = this.f37515c;
                vVar.a(new E(t6, interfaceC2958f, aVar, new f0(wVar, 1), new f0(wVar, 2), wVar.f37486i, this.f37515c.f37489l, new f0(this.f37515c, 3)));
            } else {
                this.f37515c.f37485h.a((A) null);
            }
            A aD = this.f37515c.f37485h.d();
            if (this.f37515c.f37485h.a() instanceof com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.w) {
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVarA = this.f37515c.f37485h.a();
                if (mVarA instanceof com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.w) {
                    interfaceC2971a = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.w) mVarA;
                }
            } else {
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVarA2 = this.f37515c.f37485h.a();
                if (mVarA2 instanceof com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.p) {
                    interfaceC2971a = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.p) mVarA2;
                }
            }
            if (interfaceC2971a == null || !this.f37515c.isLoaded()) {
                if (aD != null) {
                    aD.a(com.moloco.sdk.internal.u.a(this.f37515c.f37481d, MolocoAdError.ErrorType.AD_SHOW_ERROR_NOT_LOADED, com.moloco.sdk.internal.o.f36607f, null, 8, null));
                }
                return Unit.f71706a;
            }
            if (((Boolean) interfaceC2971a.l().getValue()).booleanValue()) {
                if (aD != null) {
                    aD.a(com.moloco.sdk.internal.u.a(this.f37515c.f37481d, MolocoAdError.ErrorType.AD_SHOW_ERROR_ALREADY_DISPLAYING, com.moloco.sdk.internal.o.f36608g, null, 8, null));
                }
                return Unit.f71706a;
            }
            this.f37515c.a(interfaceC2971a, aD);
            if (interfaceC2971a instanceof com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.w) {
                ((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.w) interfaceC2971a).a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.w) new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.u(), (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.u) this.f37515c.b(aD));
            } else if (interfaceC2971a instanceof com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.p) {
                ((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.p) interfaceC2971a).a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.p) this.f37515c.f37492q, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i) this.f37515c.a(aD));
            }
            return Unit.f71706a;
        }

        public static final com.moloco.sdk.internal.ortb.model.D a(w wVar) {
            return wVar.e();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public w(@NotNull Context context, @NotNull InterfaceC2958f appLifecycleTrackerService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull String adUnitId, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i persistentHttpRequest, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r externalLinkHandler, @NotNull Function1<? super com.moloco.sdk.internal.ortb.model.B, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i> generateAggregatedOptions, @NotNull v<T> adDataHolder, @NotNull AdFormatType adFormatType, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z watermark, @NotNull C2939a adCreateLoadTimeoutManager, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(context, "context");
        Intrinsics.g(appLifecycleTrackerService, "appLifecycleTrackerService");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(persistentHttpRequest, "persistentHttpRequest");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        Intrinsics.g(generateAggregatedOptions, "generateAggregatedOptions");
        Intrinsics.g(adDataHolder, "adDataHolder");
        Intrinsics.g(adFormatType, "adFormatType");
        Intrinsics.g(watermark, "watermark");
        Intrinsics.g(adCreateLoadTimeoutManager, "adCreateLoadTimeoutManager");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f37478a = context;
        this.f37479b = appLifecycleTrackerService;
        this.f37480c = customUserEventBuilderService;
        this.f37481d = adUnitId;
        this.f37482e = persistentHttpRequest;
        this.f37483f = externalLinkHandler;
        this.f37484g = generateAggregatedOptions;
        this.f37485h = adDataHolder;
        this.f37486i = adFormatType;
        this.f37487j = watermark;
        this.f37488k = adCreateLoadTimeoutManager;
        this.f37489l = metricsRecorder;
        y70.d dVarS = k2.s();
        this.f37490m = dVarS;
        TimerEvent timerEventStartTimerEvent = metricsRecorder.startTimerEvent(com.moloco.sdk.internal.client_metrics_data.e.f36319q.c());
        String strC = com.moloco.sdk.internal.client_metrics_data.d.f36295c.c();
        String lowerCase = adFormatType.name().toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        this.n = timerEventStartTimerEvent.withTag(strC, lowerCase);
        this.f37491p = C2943e.a(dVarS, new a1.e(this, 15), adUnitId, new b(this), adFormatType, a.C0182a.f38274a.b(), metricsRecorder, new f0(this, 0));
        this.f37492q = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i) generateAggregatedOptions.invoke(null);
    }

    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j k(w wVar) {
        return wVar.b();
    }

    @Override // com.moloco.sdk.internal.publisher.s
    public void a(long j11, long j12) {
        this.f37488k.a(j11, j12);
    }

    @Override // com.moloco.sdk.publisher.Destroyable
    public void destroy() {
        k0.c(this.f37490m, null);
        a(this, null, 1, null);
        this.f37494s = null;
    }

    @Override // com.moloco.sdk.internal.publisher.s
    /* renamed from: getCreateAdObjectDuration-UwyO8pc */
    public long mo266getCreateAdObjectDurationUwyO8pc() {
        return this.f37488k.mo266getCreateAdObjectDurationUwyO8pc();
    }

    @Override // com.moloco.sdk.publisher.AdLoad
    public boolean isLoaded() {
        return this.f37491p.isLoaded();
    }

    @Override // com.moloco.sdk.publisher.AdLoad
    public void load(@NotNull String bidResponseJson, @Nullable AdLoad.Listener listener) {
        Intrinsics.g(bidResponseJson, "bidResponseJson");
        this.f37489l.recordTimerEvent(this.n);
        this.o = this.f37489l.startTimerEvent(com.moloco.sdk.internal.client_metrics_data.e.f36318p.c());
        m0.t(this.f37490m, null, null, new d(this, bidResponseJson, listener, null), 3);
    }

    @Override // com.moloco.sdk.internal.publisher.s
    /* renamed from: setCreateAdObjectDuration-LRDsOJo */
    public void mo267setCreateAdObjectDurationLRDsOJo(long j11) {
        this.f37488k.mo267setCreateAdObjectDurationLRDsOJo(j11);
    }

    @Override // com.moloco.sdk.publisher.FullscreenAd
    public void show(@Nullable T t6) {
        String string;
        TimerEvent timerEvent = this.o;
        if (timerEvent != null) {
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j jVarB = b();
            if (jVarB == null || (string = jVarB.name()) == null) {
                string = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42124g.toString();
            }
            String lowerCase = string.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            MetricsRecorder metricsRecorder = this.f37489l;
            String strC = com.moloco.sdk.internal.client_metrics_data.d.f36295c.c();
            String lowerCase2 = this.f37486i.name().toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase2, "toLowerCase(...)");
            metricsRecorder.recordTimerEvent(timerEvent.withTag(strC, lowerCase2).withTag(com.moloco.sdk.internal.client_metrics_data.d.f36300h.c(), lowerCase));
        }
        MetricsRecorder metricsRecorder2 = this.f37489l;
        CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.A.c());
        String strC2 = com.moloco.sdk.internal.client_metrics_data.d.f36295c.c();
        String lowerCase3 = this.f37486i.name().toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase3, "toLowerCase(...)");
        metricsRecorder2.recordCountEvent(countEvent.withTag(strC2, lowerCase3));
        m0.t(this.f37490m, null, null, new g(t6, this, null), 3);
    }

    @Nullable
    public final Function0<Unit> c() {
        return this.f37495t;
    }

    @Nullable
    public final Function0<Unit> d() {
        return this.f37496u;
    }

    @Nullable
    public final com.moloco.sdk.internal.ortb.model.D e() {
        return this.f37485h.e();
    }

    @Nullable
    public final Function1<Boolean, Unit> f() {
        return this.f37494s;
    }

    @Nullable
    public final Boolean g() {
        g2 g2VarK;
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVarA = this.f37485h.a();
        if (mVarA == null || (g2VarK = mVarA.k()) == null) {
            return null;
        }
        return (Boolean) g2VarK.getValue();
    }

    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j b() {
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVarA = this.f37485h.a();
        if (mVarA != null) {
            return mVarA.getCreativeType();
        }
        return null;
    }

    public final void b(@Nullable Function0<Unit> function0) {
        this.f37496u = function0;
    }

    public final f b(A a11) {
        return new f(this, a11);
    }

    @Nullable
    public final C2949k a() {
        return this.f37485h.c();
    }

    public static /* synthetic */ void a(w wVar, com.moloco.sdk.internal.t tVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            tVar = null;
        }
        wVar.a(tVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(com.moloco.sdk.internal.t tVar) {
        boolean z11;
        g2 g2VarL;
        v<T> vVar = this.f37485h;
        r1 r1VarB = vVar.b();
        if (r1VarB != null) {
            r1VarB.c(null);
        }
        vVar.a((r1) null);
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVarA = this.f37485h.a();
        if (mVarA == null || (g2VarL = mVarA.l()) == null) {
            z11 = false;
        } else {
            z11 = true;
            if (!((Boolean) g2VarL.getValue()).booleanValue()) {
            }
        }
        v<T> vVar2 = this.f37485h;
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVarA2 = vVar2.a();
        if (mVarA2 != null) {
            mVarA2.destroy();
        }
        vVar2.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?>) null);
        v<T> vVar3 = this.f37485h;
        A aD = vVar3.d();
        vVar3.a((A) null);
        if (tVar != null && aD != null) {
            aD.a(tVar);
        }
        if (z11 && aD != null) {
            aD.onAdHidden(MolocoAdKt.createAdInfo$default(this.f37481d, null, null, 6, null));
        }
        this.f37485h.a((com.moloco.sdk.internal.ortb.model.D) null);
        this.f37485h.a((C2949k) null);
    }

    public static final Duration a(w wVar, long j11) {
        return new Duration(wVar.f37488k.a());
    }

    public /* synthetic */ w(Context context, InterfaceC2958f interfaceC2958f, com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, String str, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i iVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, Function1 function1, v vVar, AdFormatType adFormatType, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, C2939a c2939a, MetricsRecorder metricsRecorder, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, interfaceC2958f, aVar, str, iVar, rVar, function1, (i5 & 128) != 0 ? new v(null, null, null, null, null, 31, null) : vVar, adFormatType, zVar, c2939a, metricsRecorder);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final InterfaceC2972b a(C2935e c2935e) {
        com.moloco.sdk.internal.ortb.model.B player;
        com.moloco.sdk.internal.ortb.model.u experimental;
        Boolean serverRenderingIgnoreNetErrFailed;
        boolean zBooleanValue = true;
        a(this, null, 1, null);
        com.moloco.sdk.internal.ortb.model.z configs = c2935e.getExt().getConfigs();
        if (configs != null ? Intrinsics.b(configs.getServerRenderingEnabled(), Boolean.TRUE) : false) {
            com.moloco.sdk.internal.ortb.model.z configs2 = c2935e.getExt().getConfigs();
            if (configs2 != null && (experimental = configs2.getExperimental()) != null && (serverRenderingIgnoreNetErrFailed = experimental.getServerRenderingIgnoreNetErrFailed()) != null) {
                zBooleanValue = serverRenderingIgnoreNetErrFailed.booleanValue();
            }
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.v, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.u> mVarA = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.o.a(this.f37478a, c2935e.getAdm(), new com.moloco.sdk.internal.services.t(this.f37483f, this.f37480c), this.f37487j, this.f37489l, zBooleanValue, u.a(c2935e, C2981h.f38834a.d(c2935e.getAdm())));
            v<T> vVar = this.f37485h;
            vVar.a(mVarA);
            C2936f ext = c2935e.getExt();
            vVar.a(ext != null ? ext.getSdkEvents() : null);
            vVar.a(c2935e.getBurl() != null ? new C2949k(c2935e.getBurl(), Float.valueOf(c2935e.getPrice())) : null);
            return mVarA;
        }
        Function1<com.moloco.sdk.internal.ortb.model.B, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i> function1 = this.f37484g;
        C2936f ext2 = c2935e.getExt();
        this.f37492q = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.i) function1.invoke(ext2 != null ? ext2.getPlayer() : null);
        C2936f ext3 = c2935e.getExt();
        this.f37493r = (ext3 == null || (player = ext3.getPlayer()) == null) ? null : player.getAutoStore();
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVarA2 = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.o.a(this.f37478a, this.f37480c, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j) null, c2935e, this.f37483f, this.f37487j, this.f37489l, 4, (Object) null);
        v<T> vVar2 = this.f37485h;
        vVar2.a(mVarA2);
        C2936f ext4 = c2935e.getExt();
        vVar2.a(ext4 != null ? ext4.getSdkEvents() : null);
        vVar2.a(c2935e.getBurl() != null ? new C2949k(c2935e.getBurl(), Float.valueOf(c2935e.getPrice())) : null);
        return mVarA2;
    }

    public final void a(InterfaceC2971a interfaceC2971a, A a11) {
        v<T> vVar = this.f37485h;
        r1 r1VarB = vVar.b();
        if (r1VarB != null) {
            r1VarB.c(null);
        }
        vVar.a(m0.t(this.f37490m, null, null, new c(interfaceC2971a, a11, this, null), 3));
    }

    public final void a(@Nullable Function1<? super Boolean, Unit> function1) {
        this.f37494s = function1;
    }

    public final void a(@Nullable Function0<Unit> function0) {
        this.f37495t = function0;
    }

    public final e a(A a11) {
        return new e(this, a11);
    }
}
