package com.moloco.sdk.internal.services.bidtoken;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.x;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.r1;

/* loaded from: classes.dex */
public final class z implements y {

    /* renamed from: i, reason: collision with root package name */
    public static final int f37909i = 8;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC2953a f37910b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final j0 f37911c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final v f37912d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f37913e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f37914f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final c80.a f37915g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public r1 f37916h;

    @DebugMetadata(c = "com.moloco.sdk.internal.services.bidtoken.ServerBidTokenServiceImpl$bidToken$2", f = "ServerBidTokenService.kt", l = {190, Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function1<Continuation<? super k>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37917a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ MetricsRecorder f37919c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(MetricsRecorder metricsRecorder, Continuation<? super a> continuation) {
            super(1, continuation);
            this.f37919c = metricsRecorder;
        }

        @Override // kotlin.jvm.functions.Function1
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(Continuation<? super k> continuation) {
            return ((a) create(continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Continuation<?> continuation) {
            return z.this.new a(this.f37919c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f37917a;
            if (i5 == 0) {
                ResultKt.b(obj);
                z.this.b("[Thread: " + Thread.currentThread().getName() + "] Acquired lock, fetching status of current token");
                v vVar = z.this.f37912d;
                this.f37917a = 1;
                obj = vVar.a(this);
                if (obj != coroutineSingletons) {
                }
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            B b11 = (B) obj;
            z.this.a("[Thread: " + Thread.currentThread().getName() + "] bidToken status: " + b11);
            if (!b11.b()) {
                z.this.b("[Thread: " + Thread.currentThread().getName() + "] bidToken needs refresh, fetching new token");
                z zVar = z.this;
                MetricsRecorder metricsRecorder = this.f37919c;
                k kVarB = e.b();
                this.f37917a = 2;
                Object objA = zVar.a(metricsRecorder, kVarB, false, false, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
            MetricsRecorder metricsRecorder2 = this.f37919c;
            CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36284v.c());
            String strC = com.moloco.sdk.internal.client_metrics_data.d.f36296d.c();
            String str = InneractiveMediationDefs.SHOW_HOUSE_AD_YES;
            CountEvent countEventWithTag = countEvent.withTag(strC, InneractiveMediationDefs.SHOW_HOUSE_AD_YES).withTag("initial_fetch", "false");
            B b12 = B.f37663b;
            if (b11 != b12) {
                str = "false";
            }
            metricsRecorder2.recordCountEvent(countEventWithTag.withTag("expiring", str));
            k kVarA = z.this.f37912d.a();
            if (b11 != b12) {
                z.this.a("[Thread: " + Thread.currentThread().getName() + "] bidToken doesn't need refresh, returning cached");
                return kVarA;
            }
            z.this.a("[Thread: " + Thread.currentThread().getName() + "] bidToken is expiring, returning cached, and refreshing async");
            z.this.a(this.f37919c);
            return kVarA;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.bidtoken.ServerBidTokenServiceImpl", f = "ServerBidTokenService.kt", l = {Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173}, m = "fetchServerBidToken$moloco_sdk_release")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f37920a;

        /* renamed from: b, reason: collision with root package name */
        public Object f37921b;

        /* renamed from: c, reason: collision with root package name */
        public Object f37922c;

        /* renamed from: d, reason: collision with root package name */
        public Object f37923d;

        /* renamed from: e, reason: collision with root package name */
        public boolean f37924e;

        /* renamed from: f, reason: collision with root package name */
        public boolean f37925f;

        /* renamed from: g, reason: collision with root package name */
        public /* synthetic */ Object f37926g;

        /* renamed from: i, reason: collision with root package name */
        public int f37928i;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f37926g = obj;
            this.f37928i |= Integer.MIN_VALUE;
            return z.this.a(null, null, false, false, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.bidtoken.ServerBidTokenServiceImpl$fetchServerBidToken$bidTokenComponents$1", f = "ServerBidTokenService.kt", l = {174}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37929a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ com.moloco.sdk.internal.x<k, com.moloco.sdk.internal.m> f37931c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(com.moloco.sdk.internal.x<k, com.moloco.sdk.internal.m> xVar, Continuation<? super c> continuation) {
            super(1, continuation);
            this.f37931c = xVar;
        }

        @Override // kotlin.jvm.functions.Function1
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(Continuation<? super Unit> continuation) {
            return ((c) create(continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Continuation<?> continuation) {
            return z.this.new c(this.f37931c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f37929a;
            if (i5 == 0) {
                ResultKt.b(obj);
                v vVar = z.this.f37912d;
                k kVar = (k) ((x.b) this.f37931c).a();
                this.f37929a = 1;
                if (vVar.a(kVar, this) == coroutineSingletons) {
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

    @DebugMetadata(c = "com.moloco.sdk.internal.services.bidtoken.ServerBidTokenServiceImpl$refreshTokenAsyncOnExpiry$1", f = "ServerBidTokenService.kt", l = {106}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class d extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37932a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ MetricsRecorder f37934c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(MetricsRecorder metricsRecorder, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f37934c = metricsRecorder;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return z.this.new d(this.f37934c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            d dVar;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f37932a;
            if (i5 == 0) {
                ResultKt.b(obj);
                z.this.b("[Thread: " + Thread.currentThread().getName() + "] Fetching token from server");
                z zVar = z.this;
                MetricsRecorder metricsRecorder = this.f37934c;
                k kVarB = e.b();
                this.f37932a = 1;
                dVar = this;
                if (zVar.a(metricsRecorder, kVarB, true, true, dVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                dVar = this;
            }
            z.this.b("[Thread: " + Thread.currentThread().getName() + "] Finished fetching token from server");
            return Unit.f71706a;
        }
    }

    public z(@NotNull InterfaceC2953a bidTokenApi, @NotNull j0 scope, @NotNull v tokenCache) {
        Intrinsics.g(bidTokenApi, "bidTokenApi");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(tokenCache, "tokenCache");
        this.f37910b = bidTokenApi;
        this.f37911c = scope;
        this.f37912d = tokenCache;
        this.f37913e = "ServerBidTokenServiceImpl";
        this.f37914f = true;
        this.f37915g = new c80.d();
    }

    public final void b(String str) {
        MolocoLogger.info$default(MolocoLogger.INSTANCE, this.f37913e, "[Thread: " + Thread.currentThread().getName() + "][sbt] " + str, null, false, 12, null);
    }

    public final void a(@NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        b("[Thread: " + Thread.currentThread().getName() + "] Refreshing token async");
        CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36286x.c());
        r1 r1Var = this.f37916h;
        metricsRecorder.recordCountEvent(countEvent.withTag("async", String.valueOf(r1Var != null ? r1Var.b() : false)));
        r1 r1Var2 = this.f37916h;
        if (r1Var2 != null && r1Var2.b()) {
            b("[Thread: " + Thread.currentThread().getName() + "] Async refresh already in progress. Returning");
            return;
        }
        b("[Thread: " + Thread.currentThread().getName() + "] Scheduling to fetch token from server");
        this.f37916h = m0.t(this.f37911c, null, null, new d(metricsRecorder, null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull MetricsRecorder metricsRecorder, @NotNull k kVar, boolean z11, boolean z12, @NotNull Continuation<? super k> continuation) {
        b bVar;
        k kVar2;
        boolean z13;
        TimerEvent timerEvent;
        boolean z14;
        MetricsRecorder metricsRecorder2;
        z zVar;
        z zVar2;
        com.moloco.sdk.internal.x xVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f37928i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f37928i = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj = bVar.f37926g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f37928i;
        if (i11 == 0) {
            ResultKt.b(obj);
            TimerEvent timerEventStartTimerEvent = metricsRecorder.startTimerEvent(com.moloco.sdk.internal.client_metrics_data.e.f36317m.c());
            b("[Thread: " + Thread.currentThread().getName() + "] fetchServerBidToken");
            InterfaceC2953a interfaceC2953a = this.f37910b;
            bVar.f37920a = this;
            bVar.f37921b = metricsRecorder;
            kVar2 = kVar;
            bVar.f37922c = kVar2;
            bVar.f37923d = timerEventStartTimerEvent;
            bVar.f37924e = z11;
            z13 = z12;
            bVar.f37925f = z13;
            bVar.f37928i = 1;
            Object objA = interfaceC2953a.a(metricsRecorder, bVar);
            if (objA != coroutineSingletons) {
                timerEvent = timerEventStartTimerEvent;
                obj = objA;
                z14 = z11;
                metricsRecorder2 = metricsRecorder;
                zVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            xVar = (com.moloco.sdk.internal.x) bVar.f37921b;
            zVar2 = (z) bVar.f37920a;
            ResultKt.b(obj);
            k kVar3 = (k) ((x.b) xVar).a();
            zVar2.f37914f = false;
            return kVar3;
        }
        boolean z15 = bVar.f37925f;
        z14 = bVar.f37924e;
        timerEvent = (TimerEvent) bVar.f37923d;
        kVar2 = (k) bVar.f37922c;
        metricsRecorder2 = (MetricsRecorder) bVar.f37921b;
        z zVar3 = (z) bVar.f37920a;
        ResultKt.b(obj);
        z13 = z15;
        zVar = zVar3;
        com.moloco.sdk.internal.x xVar2 = (com.moloco.sdk.internal.x) obj;
        if (xVar2 instanceof x.a) {
            CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36283u.c());
            com.moloco.sdk.internal.client_metrics_data.d dVar = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
            CountEvent countEventWithTag = countEvent.withTag(dVar.c(), "failure");
            com.moloco.sdk.internal.client_metrics_data.d dVar2 = com.moloco.sdk.internal.client_metrics_data.d.f36294b;
            x.a aVar = (x.a) xVar2;
            metricsRecorder2.recordCountEvent(countEventWithTag.withTag(dVar2.c(), String.valueOf(((com.moloco.sdk.internal.m) aVar.a()).b())).withTag("initial_fetch", String.valueOf(zVar.f37914f)).withTag("was_expiring", String.valueOf(z13)).withTag("async", String.valueOf(z14)));
            metricsRecorder2.recordTimerEvent(timerEvent.withTag(dVar.c(), "failure").withTag(dVar2.c(), String.valueOf(((com.moloco.sdk.internal.m) aVar.a()).b())).withTag("initial_fetch", String.valueOf(zVar.f37914f)).withTag("was_expiring", String.valueOf(z13)).withTag("async", String.valueOf(z14)));
            MolocoLogger.error$default(MolocoLogger.INSTANCE, zVar.f37913e, "bidtoken request failed: " + ((com.moloco.sdk.internal.m) aVar.a()).b() + ", details: " + ((com.moloco.sdk.internal.m) aVar.a()).a(), null, false, 12, null);
            return kVar2;
        }
        if (xVar2 instanceof x.b) {
            CountEvent countEvent2 = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36283u.c());
            com.moloco.sdk.internal.client_metrics_data.d dVar3 = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
            metricsRecorder2.recordCountEvent(countEvent2.withTag(dVar3.c(), "success").withTag("initial_fetch", String.valueOf(zVar.f37914f)).withTag("was_expiring", String.valueOf(z13)).withTag("async", String.valueOf(z14)));
            metricsRecorder2.recordTimerEvent(timerEvent.withTag(dVar3.c(), "success").withTag("initial_fetch", String.valueOf(zVar.f37914f)).withTag("was_expiring", String.valueOf(z13)).withTag("async", String.valueOf(z14)));
            metricsRecorder2.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36284v.c()).withTag(dVar3.c(), "false").withTag("initial_fetch", String.valueOf(zVar.f37914f)).withTag("async", String.valueOf(z14)));
            zVar.b("[Thread: " + Thread.currentThread().getName() + "] bidtoken request success");
            c80.a aVar2 = zVar.f37915g;
            c cVar = zVar.new c(xVar2, null);
            bVar.f37920a = zVar;
            bVar.f37921b = xVar2;
            bVar.f37922c = null;
            bVar.f37923d = null;
            bVar.f37928i = 2;
            if (com.moloco.sdk.internal.utils.a.a(aVar2, cVar, bVar) != coroutineSingletons) {
                zVar2 = zVar;
                xVar = xVar2;
                k kVar32 = (k) ((x.b) xVar).a();
                zVar2.f37914f = false;
                return kVar32;
            }
            return coroutineSingletons;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.y
    @Nullable
    public Object a(@NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super k> continuation) {
        b("[Thread: " + Thread.currentThread().getName() + "] Fetching bidToken(), acquiring lock");
        return com.moloco.sdk.internal.utils.a.a(this.f37915g, new a(metricsRecorder, null), continuation);
    }

    public final void a(String str) {
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, this.f37913e, "[Thread: " + Thread.currentThread().getName() + "] " + str, false, 4, null);
    }
}
