package ads_mobile_sdk;

import java.security.GeneralSecurityException;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes2.dex */
public final class b30 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f1238c;

    /* renamed from: d, reason: collision with root package name */
    public final kz2 f1239d;

    /* renamed from: e, reason: collision with root package name */
    public final ci3 f1240e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f1241f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b30(t70.j0 backgroundScope, kz2 rootTraceCreator, ci3 traceLogger, jr0 flags) {
        super((wv0) null, 3);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(flags, "flags");
        this.f1238c = backgroundScope;
        this.f1239d = rootTraceCreator;
        this.f1240e = traceLogger;
        this.f1241f = flags;
    }

    public final void c() {
        kz2 kz2Var = this.f1239d;
        wv0 wv0Var = wv0.CUI_NAME_SDKINIT_INIT_CRYPTO;
        EmptyList emptyList = EmptyList.f71733a;
        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
            try {
                try {
                    fl.a.a();
                } catch (Throwable th2) {
                    try {
                        em2VarA.b(th2);
                        if (th2 instanceof b.a4) {
                            throw th2;
                        }
                        if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                            em2VarA.a(th2);
                        }
                        if (th2 instanceof TimeoutCancellationException) {
                            throw new lw0(th2);
                        }
                        if (th2 instanceof CancellationException) {
                            throw new du0(th2);
                        }
                        if (!(th2 instanceof dv0)) {
                            throw new iu0(th2);
                        }
                        throw th2;
                    } catch (Throwable th3) {
                        try {
                            throw th3;
                        } catch (Throwable th4) {
                            CloseableKt.a(em2VarA, th3);
                            throw th4;
                        }
                    }
                }
            } catch (GeneralSecurityException e3) {
                this.f1240e.a("CryptoUtil: AeadConfig.register()", (Throwable) e3);
            }
            Unit unit = Unit.f71706a;
            em2VarA.close();
            return;
        }
        th3 th3VarA = ji3.a(wv0Var, emptyList, true);
        try {
            try {
                fl.a.a();
            } catch (Throwable th5) {
                try {
                    th3VarA.b(th5);
                    if (th5 instanceof b.a4) {
                        throw th5;
                    }
                    if (!(th5 instanceof TimeoutCancellationException) && !(th5 instanceof CancellationException)) {
                        th3VarA.a(th5);
                    }
                    if (th5 instanceof TimeoutCancellationException) {
                        throw new lw0(th5);
                    }
                    if (th5 instanceof CancellationException) {
                        throw new du0(th5);
                    }
                    if (!(th5 instanceof dv0)) {
                        throw new iu0(th5);
                    }
                    throw th5;
                } catch (Throwable th6) {
                    try {
                        throw th6;
                    } catch (Throwable th7) {
                        CloseableKt.a(th3VarA, th6);
                        throw th7;
                    }
                }
            }
        } catch (GeneralSecurityException e11) {
            this.f1240e.a("CryptoUtil: AeadConfig.register()", (Throwable) e11);
        }
        Unit unit2 = Unit.f71706a;
        th3VarA.close();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.c61
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(Continuation continuation) {
        z20 z20Var;
        b30 b30Var;
        if (continuation instanceof z20) {
            z20Var = (z20) continuation;
            int i5 = z20Var.f12426d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z20Var.f12426d = i5 - Integer.MIN_VALUE;
            } else {
                z20Var = new z20(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = z20Var.f12424b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z20Var.f12426d;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = this.f1241f;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:block_init_on_crypto:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                c();
                return new xu0(Unit.f71706a);
            }
            z20Var.f12423a = this;
            z20Var.f12426d = 1;
            if (m0.z(z20Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            b30Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            b30Var = z20Var.f12423a;
            ResultKt.b(obj);
        }
        t70.j0 j0Var = b30Var.f1238c;
        androidx.room.c cVar = new androidx.room.c(b30Var, null, 1);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(cVar, null), 2);
        return new xu0(Unit.f71706a);
    }
}
