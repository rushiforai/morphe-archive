package ads_mobile_sdk;

import b.t2;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import t70.m0;

/* loaded from: classes.dex */
public final class kh0 {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f5737b = {t2.C(kh0.class, "thirdPartyEventEmitter", "getThirdPartyEventEmitter()Lcom/google/android/libraries/ads/mobile/sdk/internal/event/ThirdPartyEventEmitter;")};

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.e3 f5738a = new io.sentry.e3((Boolean) null);

    public final of3 a() {
        return (of3) this.f5738a.getValue(this, f5737b[0]);
    }

    public final void b() {
        of3 of3VarA = a();
        if (of3VarA != null) {
            t70.j0 j0Var = of3VarA.f7910a;
            af3 af3Var = new af3(of3VarA, null, 6);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(af3Var, null), 2);
        }
    }

    public final void c() {
        of3 of3VarA = a();
        if (of3VarA != null) {
            t70.j0 j0Var = of3VarA.f7910a;
            Continuation continuation = null;
            af3 af3Var = new af3(of3VarA, continuation, 7);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(af3Var, null), 2);
            y1 y1Var = of3VarA.f7911b.f12396p0;
            if (y1Var == y1.f11907d || y1Var == y1.f11908e) {
                m0.t(j0Var, context, null, new ar.a(new af3(of3VarA, continuation, 8), null), 2);
            }
        }
    }

    public final void d() {
        of3 of3VarA = a();
        if (of3VarA != null) {
            t70.j0 j0Var = of3VarA.f7910a;
            af3 af3Var = new af3(of3VarA, null, 0);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(af3Var, null), 2);
        }
    }

    public final void e() {
        of3 of3VarA = a();
        if (of3VarA != null) {
            of3VarA.a();
        }
    }

    public final void f() {
        of3 of3VarA = a();
        if (of3VarA != null) {
            t70.j0 j0Var = of3VarA.f7910a;
            jf3 jf3Var = new jf3(of3VarA, null, 0);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(jf3Var, null), 2);
        }
    }

    public final void a(bg.a aVar) {
        of3 of3VarA = a();
        if (of3VarA != null) {
            t70.g2 g2Var = of3VarA.f7916g;
            Continuation continuation = null;
            if (g2Var != null) {
                g2Var.c(null);
            }
            t70.j0 j0Var = of3VarA.f7910a;
            ar.a aVar2 = new ar.a(of3VarA, aVar, continuation, 14);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(aVar2, null), 2);
        }
    }
}
