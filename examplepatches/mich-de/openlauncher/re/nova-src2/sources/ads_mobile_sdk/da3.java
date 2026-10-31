package ads_mobile_sdk;

import b.e1;
import b.i;
import cl.m0;
import cl.r0;
import cl.w0;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public final class da3 {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f2241a;

    /* renamed from: b, reason: collision with root package name */
    public final b.w4 f2242b;

    /* renamed from: c, reason: collision with root package name */
    public final b.w4 f2243c;

    /* renamed from: d, reason: collision with root package name */
    public final b.w4 f2244d;

    /* renamed from: e, reason: collision with root package name */
    public final ExecutorService f2245e;

    /* renamed from: f, reason: collision with root package name */
    public final vi3 f2246f;

    /* renamed from: g, reason: collision with root package name */
    public final c8 f2247g;

    public da3(b.w4 w4Var, b.w4 w4Var2, b.w4 w4Var3, b.w4 w4Var4, j7 j7Var, ExecutorService executorService, vi3 vi3Var) {
        this.f2241a = w4Var;
        this.f2242b = w4Var2;
        this.f2243c = w4Var3;
        this.f2244d = w4Var4;
        this.f2245e = executorService;
        this.f2246f = vi3Var;
        this.f2247g = j7Var.B();
    }

    public final r0 a(c8 c8Var, boolean z11) {
        r0 r0VarR = r0.r(w0.d(new i(1, this, c8Var), this.f2245e));
        e1 e1Var = new e1();
        m0 m0Var = m0.f20038a;
        cl.u uVarF = w0.f(r0VarR, e1Var, m0Var);
        return (!z11 || c8Var == this.f2247g) ? uVarF : w0.f(cl.c.t(r0.r(uVarF), Throwable.class, new b.e(1), m0Var), new ca3(this), m0Var);
    }
}
