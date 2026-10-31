package com.moloco.sdk.internal.ilrd;

import android.content.Context;
import b10.d0;
import com.moloco.sdk.Init;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.ilrd.c;
import com.moloco.sdk.internal.ilrd.g;
import com.moloco.sdk.internal.services.bidtoken.providers.p;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.r1;
import w70.h1;
import w70.u1;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final a f36531f = new a(null);

    /* renamed from: g, reason: collision with root package name */
    public static final int f36532g = 8;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public static final String f36533h = "IlrdService";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final j0 f36534a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final IlrdEventsRepository f36535b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f36536c;

    /* renamed from: d, reason: collision with root package name */
    public final Set<com.moloco.sdk.internal.ilrd.c> f36537d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public r1 f36538e;

    /* loaded from: classes4.dex */
    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.ilrd.IlrdService$subscribe$1", f = "IlrdService.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    /* loaded from: classes4.dex */
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f36539a;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return e.this.new b(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f36539a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            List<com.moloco.sdk.internal.ilrd.c> listA = e.this.a();
            e eVar = e.this;
            for (com.moloco.sdk.internal.ilrd.c cVar : listA) {
                g gVar = (g) cVar.getState().getValue();
                if (gVar instanceof g.a) {
                    MolocoLogger.warn$default(MolocoLogger.INSTANCE, e.f36533h, "Failed to subscribe to " + cVar.a() + " ILRD: " + ((g.a) gVar).b(), null, false, 12, null);
                } else if (gVar instanceof g.c) {
                    eVar.a(cVar);
                } else if (!(gVar instanceof g.b)) {
                    throw new NoWhenBranchMatchedException();
                }
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.ilrd.IlrdService$subscribeToProvider$2$1", f = "IlrdService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class c extends SuspendLambda implements Function2<c.a, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f36541a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f36542b;

        public c(Continuation<? super c> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(c.a aVar, Continuation<? super Unit> continuation) {
            return ((c) create(aVar, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            c cVar = e.this.new c(continuation);
            cVar.f36542b = obj;
            return cVar;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f36541a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            c.a aVar = (c.a) this.f36542b;
            MolocoLogger.info$default(MolocoLogger.INSTANCE, e.f36533h, "Revenue event: " + aVar, null, false, 12, null);
            e.this.f36535b.b(aVar);
            return Unit.f71706a;
        }
    }

    public e(@NotNull j0 scope, @NotNull Context context, @NotNull IlrdEventsRepository eventsRepository, @NotNull List<? extends Init.SDKInitResponse.SupportedNetworks> supportedNetworksList) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(context, "context");
        Intrinsics.g(eventsRepository, "eventsRepository");
        Intrinsics.g(supportedNetworksList, "supportedNetworksList");
        this.f36534a = scope;
        this.f36535b = eventsRepository;
        this.f36536c = LazyKt.a(new d0(7, supportedNetworksList, context, this));
        this.f36537d = Collections.synchronizedSet(new LinkedHashSet());
    }

    public final synchronized void c() {
        r1 r1Var = this.f36538e;
        if (r1Var == null || !r1Var.b()) {
            this.f36538e = m0.t(this.f36534a, null, null, new b(null), 3);
        }
    }

    @Nullable
    public final p b() {
        p pVarB;
        IlrdEventsRepository ilrdEventsRepository = this.f36535b;
        ilrdEventsRepository.i();
        com.moloco.sdk.internal.ilrd.a aVarE = ilrdEventsRepository.getSession();
        if (aVarE != null && (pVarB = f.b(aVarE)) != null) {
            return pVarB;
        }
        MolocoLogger.warn$default(MolocoLogger.INSTANCE, f36533h, "provideDataForBidToken() Session is null", null, false, 12, null);
        return null;
    }

    public final List<com.moloco.sdk.internal.ilrd.c> a() {
        return (List) this.f36536c.getValue();
    }

    public static final List a(List list, Context context, e eVar) {
        ArrayList arrayList = new ArrayList();
        if (list.contains(Init.SDKInitResponse.SupportedNetworks.MAX)) {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, f36533h, "Adding AppLovin as ILRD provider", null, false, 12, null);
            arrayList.add(new com.moloco.sdk.internal.ilrd.provider.a(context, eVar.f36534a));
        }
        if (list.contains(Init.SDKInitResponse.SupportedNetworks.LEVEL_PLAY)) {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, f36533h, "Adding IronSource as ILRD provider", null, false, 12, null);
            arrayList.add(new com.moloco.sdk.internal.ilrd.provider.b(context, eVar.f36534a));
        }
        return b70.g.I1(arrayList);
    }

    public final void a(com.moloco.sdk.internal.ilrd.c cVar) {
        Object objB = cVar.b();
        Throwable thA = Result.a(objB);
        if (thA != null) {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, f36533h, "Failed to subscribe to " + cVar.a() + " ILRD: " + thA, null, false, 12, null);
        }
        if (objB instanceof Result.Failure) {
            return;
        }
        this.f36537d.add(cVar);
        u1.u(h1.a(new c(null), cVar.c()), this.f36534a);
    }
}
