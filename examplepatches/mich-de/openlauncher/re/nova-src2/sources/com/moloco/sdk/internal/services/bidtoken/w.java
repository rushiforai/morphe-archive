package com.moloco.sdk.internal.services.bidtoken;

import ads_mobile_sdk.pd;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.I;
import com.moloco.sdk.internal.x;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class w implements v {

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final a f37889e = new a(null);

    /* renamed from: f, reason: collision with root package name */
    public static final int f37890f = 8;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final String f37891g = "ServerBidTokenCache";

    /* renamed from: h, reason: collision with root package name */
    public static final long f37892h = 15;

    /* renamed from: i, reason: collision with root package name */
    public static final long f37893i = 2;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.bidtoken.b f37894b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final I f37895c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public k f37896d;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.bidtoken.ServerBidTokenCacheImpl", f = "ServerBidTokenCache.kt", l = {62}, m = "tokenStatus")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f37897a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f37898b;

        /* renamed from: d, reason: collision with root package name */
        public int f37900d;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f37898b = obj;
            this.f37900d |= Integer.MIN_VALUE;
            return w.this.a(this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.bidtoken.ServerBidTokenCacheImpl", f = "ServerBidTokenCache.kt", l = {pd.f8203p0, pd.Q0}, m = "updateCache")
    public static final class c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f37901a;

        /* renamed from: b, reason: collision with root package name */
        public Object f37902b;

        /* renamed from: c, reason: collision with root package name */
        public Object f37903c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f37904d;

        /* renamed from: f, reason: collision with root package name */
        public int f37906f;

        public c(Continuation<? super c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f37904d = obj;
            this.f37906f |= Integer.MIN_VALUE;
            return w.this.a(null, this);
        }
    }

    public w(@NotNull com.moloco.sdk.internal.bidtoken.b bidTokenParser, @NotNull I timeProviderService) {
        Intrinsics.g(bidTokenParser, "bidTokenParser");
        Intrinsics.g(timeProviderService, "timeProviderService");
        this.f37894b = bidTokenParser;
        this.f37895c = timeProviderService;
        this.f37896d = new k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, e.a());
    }

    public static /* synthetic */ void d() {
    }

    public final void a(@NotNull k kVar) {
        Intrinsics.g(kVar, "<set-?>");
        this.f37896d = kVar;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.v
    public void b() {
        this.f37896d = new k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, e.a());
    }

    @NotNull
    public final k c() {
        return this.f37896d;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.v
    @NotNull
    public k a() {
        return this.f37896d;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // com.moloco.sdk.internal.services.bidtoken.v
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull Continuation<? super B> continuation) {
        b bVar;
        w wVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f37900d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f37900d = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object objA = bVar.f37898b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f37900d;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (a().d().length() == 0) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, f37891g, "[Thread: " + Thread.currentThread().getName() + "] cached bidToken is empty, needs refresh", null, false, 12, null);
                return B.f37662a;
            }
            com.moloco.sdk.internal.bidtoken.b bVar2 = this.f37894b;
            String strD = a().d();
            bVar.f37897a = this;
            bVar.f37900d = 1;
            objA = bVar2.a(strD, bVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            wVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            wVar = (w) bVar.f37897a;
            ResultKt.b(objA);
        }
        com.moloco.sdk.internal.x xVar = (com.moloco.sdk.internal.x) objA;
        if (xVar instanceof x.a) {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, f37891g, "[Thread: " + Thread.currentThread().getName() + "] Failed to parse cached token for expiration, needs refresh", null, false, 12, null);
            return B.f37662a;
        }
        if (xVar instanceof x.b) {
            com.moloco.sdk.internal.bidtoken.a aVar = (com.moloco.sdk.internal.bidtoken.a) ((x.b) xVar).a();
            long jA = wVar.f37895c.a();
            if (x.a(aVar, jA)) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, f37891g, "[Thread: " + Thread.currentThread().getName() + "] Bid token expired, needs refresh", null, false, 12, null);
                return B.f37662a;
            }
            if (x.b(aVar, jA)) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, f37891g, "[Thread: " + Thread.currentThread().getName() + "] Bid token is near expiry. It will expire soon", null, false, 12, null);
                return B.f37663b;
            }
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            MolocoLogger.info$default(molocoLogger, f37891g, "[Thread: " + Thread.currentThread().getName() + "] Bid token has not expired", null, false, 12, null);
            MolocoLogger.info$default(molocoLogger, f37891g, "[Thread: " + Thread.currentThread().getName() + "] Bid token doesn't need refresh", null, false, 12, null);
            return B.f37664c;
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // com.moloco.sdk.internal.services.bidtoken.v
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull k kVar, @NotNull Continuation<? super Unit> continuation) {
        c cVar;
        w wVar;
        k kVar2;
        com.moloco.sdk.internal.bidtoken.a aVar;
        w wVar2;
        com.moloco.sdk.internal.x xVar;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f37906f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f37906f = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(continuation);
            }
        }
        Object objA = cVar.f37904d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f37906f;
        if (i11 == 0) {
            ResultKt.b(objA);
            a("[Thread: " + Thread.currentThread().getName() + "] Acquired lock, checking for new token expiry");
            if (Intrinsics.b(this.f37896d.d(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
                this.f37896d = kVar;
                a("[Thread: " + Thread.currentThread().getName() + "] Updated cache with new bidToken as existing token was empty");
                return Unit.f71706a;
            }
            com.moloco.sdk.internal.bidtoken.b bVar = this.f37894b;
            String strD = kVar.d();
            cVar.f37901a = this;
            cVar.f37902b = kVar;
            cVar.f37906f = 1;
            objA = bVar.a(strD, cVar);
            if (objA != coroutineSingletons) {
                wVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = (com.moloco.sdk.internal.bidtoken.a) cVar.f37903c;
            kVar2 = (k) cVar.f37902b;
            wVar2 = (w) cVar.f37901a;
            ResultKt.b(objA);
            xVar = (com.moloco.sdk.internal.x) objA;
            if (!(xVar instanceof x.b)) {
                if (aVar.a() > ((com.moloco.sdk.internal.bidtoken.a) ((x.b) xVar).a()).a()) {
                    wVar2.f37896d = kVar2;
                    wVar2.a("[Thread: " + Thread.currentThread().getName() + "] Updated cache with new bidToken");
                } else {
                    wVar2.a("[Thread: " + Thread.currentThread().getName() + "] New token's expiration is not greater than the existing token's expiration. Cache not updated.");
                }
            } else {
                wVar2.f37896d = kVar2;
                wVar2.a("[Thread: " + Thread.currentThread().getName() + "] Current token parsing failed. Updated cache with new bidToken");
            }
            return Unit.f71706a;
        }
        kVar = (k) cVar.f37902b;
        wVar = (w) cVar.f37901a;
        ResultKt.b(objA);
        com.moloco.sdk.internal.x xVar2 = (com.moloco.sdk.internal.x) objA;
        if (xVar2 instanceof x.b) {
            com.moloco.sdk.internal.bidtoken.a aVar2 = (com.moloco.sdk.internal.bidtoken.a) ((x.b) xVar2).a();
            com.moloco.sdk.internal.bidtoken.b bVar2 = wVar.f37894b;
            String strD2 = wVar.f37896d.d();
            cVar.f37901a = wVar;
            cVar.f37902b = kVar;
            cVar.f37903c = aVar2;
            cVar.f37906f = 2;
            Object objA2 = bVar2.a(strD2, cVar);
            if (objA2 != coroutineSingletons) {
                kVar2 = kVar;
                aVar = aVar2;
                objA = objA2;
                wVar2 = wVar;
                xVar = (com.moloco.sdk.internal.x) objA;
                if (!(xVar instanceof x.b)) {
                }
                return Unit.f71706a;
            }
            return coroutineSingletons;
        }
        wVar.a("[Thread: " + Thread.currentThread().getName() + "] New token parsing failed. Cache not updated.");
        return Unit.f71706a;
    }

    public final void a(String str) {
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37891g, "[Thread: " + Thread.currentThread().getName() + "][sbt] " + str, false, 4, null);
    }
}
