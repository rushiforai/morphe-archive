package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ni.i0;
import t70.m0;

/* loaded from: classes.dex */
public final class sy0 implements ni.h0 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f9730a;

    /* renamed from: b, reason: collision with root package name */
    public final tx0 f9731b;

    /* renamed from: e, reason: collision with root package name */
    public final t70.s f9732e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f9733f;

    /* renamed from: h, reason: collision with root package name */
    public float f9734h;

    /* renamed from: i, reason: collision with root package name */
    public my0 f9735i;

    /* renamed from: k, reason: collision with root package name */
    public boolean f9736k;

    /* renamed from: m, reason: collision with root package name */
    public boolean f9737m;

    public sy0(tx0 webView, t70.j0 uiScope) {
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(webView, "webView");
        this.f9730a = uiScope;
        this.f9731b = webView;
        this.f9732e = m0.b();
        this.f9733f = new Object();
        this.f9735i = my0.f7373b;
        this.f9737m = true;
    }

    public final void a(my0 my0Var, boolean z11, float f11) {
        boolean z12;
        synchronized (this.f9733f) {
            try {
                synchronized (this.f9733f) {
                    z12 = this.f9737m;
                }
                synchronized (this.f9733f) {
                    this.f9737m = z11;
                    Unit unit = Unit.f71706a;
                }
                my0 my0Var2 = this.f9735i;
                this.f9735i = my0Var;
                float f12 = this.f9734h;
                this.f9734h = f11;
                if (Math.abs(f11 - f12) > 1.0E-4f) {
                    this.f9731b.invalidate();
                }
                m0.t(this.f9730a, null, null, new ny0(this, my0Var2, my0Var, z12, z11, null), 3);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // ni.h0
    public final void getVideoLifecycleCallbacks() {
        synchronized (this.f9733f) {
        }
    }

    public final Object a(i0 i0Var, ContinuationImpl continuationImpl) throws Throwable {
        Unit unit;
        synchronized (this.f9733f) {
            unit = Unit.f71706a;
        }
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.s("muteStart", i0Var.c() ? "1" : "0");
        rVar.s("customControlsRequested", i0Var.b() ? "1" : "0");
        rVar.s("clickToExpandRequested", i0Var.a() ? "1" : "0");
        rVar.s("action", "initialState");
        Object objA = this.f9731b.a(rVar, "pubVideoCmd", continuationImpl);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (objA != coroutineSingletons) {
            objA = unit;
        }
        return objA == coroutineSingletons ? objA : unit;
    }
}
