package com.moloco.sdk.internal.services;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.p2;
import t70.t0;

/* loaded from: classes4.dex */
public final class v implements u {

    /* renamed from: c, reason: collision with root package name */
    public static final int f38155c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f38156a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f38157b;

    @DebugMetadata(c = "com.moloco.sdk.internal.services.ConnectivityServiceImpl", f = "ConnectivityService.kt", l = {40}, m = "waitForNetwork")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f38158a;

        /* renamed from: c, reason: collision with root package name */
        public int f38160c;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f38158a = obj;
            this.f38160c |= Integer.MIN_VALUE;
            return v.this.a(0L, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.ConnectivityServiceImpl$waitForNetwork$hasConnectivity$1", f = "ConnectivityService.kt", l = {46}, m = "invokeSuspend")
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Boolean>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38161a;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Boolean> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return v.this.new b(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f38161a;
            if (i5 != 0 && i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            while (!v.this.a()) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, v.this.f38157b, "waiting because of no network connection", null, false, 12, null);
                this.f38161a = 1;
                if (t0.b(100L, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Boolean.TRUE;
        }
    }

    public v(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f38156a = context;
        this.f38157b = "ConnectivityServiceImpl";
    }

    @Override // com.moloco.sdk.internal.services.u
    public boolean b() {
        try {
            return a(this.f38156a).isActiveNetworkMetered();
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, "isNetworkMetered", e3.toString(), e3, false, 8, null);
            return false;
        }
    }

    @NotNull
    public final Context c() {
        return this.f38156a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // com.moloco.sdk.internal.services.u
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(long j11, @NotNull Continuation<? super Boolean> continuation) {
        a aVar;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f38160c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f38160c = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object objD = aVar.f38158a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f38160c;
        if (i11 == 0) {
            ResultKt.b(objD);
            b bVar = new b(null);
            aVar.f38160c = 1;
            objD = p2.d(j11, bVar, aVar);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objD);
        }
        Boolean bool = (Boolean) objD;
        return Boolean.valueOf(bool != null ? bool.booleanValue() : false);
    }

    @Override // com.moloco.sdk.internal.services.u
    public boolean a() {
        NetworkCapabilities networkCapabilities;
        Object systemService = this.f38156a.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
        Network activeNetwork = connectivityManager.getActiveNetwork();
        if (activeNetwork == null || (networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)) == null) {
            return false;
        }
        return networkCapabilities.hasTransport(1) || networkCapabilities.hasTransport(0) || networkCapabilities.hasTransport(3);
    }

    public final ConnectivityManager a(Context context) {
        Object systemService = context.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        return (ConnectivityManager) systemService;
    }
}
