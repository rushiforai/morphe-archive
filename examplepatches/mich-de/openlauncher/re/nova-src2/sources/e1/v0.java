package e1;

import kotlin.jvm.internal.Intrinsics;
import p1.s2;
import t0.w1;

/* loaded from: classes2.dex */
public final class v0 implements t0.g1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ a1 f51400a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f51401b;

    public v0(a1 a1Var, boolean z11) {
        this.f51400a = a1Var;
        this.f51401b = z11;
    }

    @Override // t0.g1
    public final void a() {
        w1 w1VarD;
        boolean z11 = this.f51401b;
        t0.j0 j0Var = z11 ? t0.j0.f88052b : t0.j0.f88053c;
        a1 a1Var = this.f51400a;
        ((s2) a1Var.f51243q).setValue(j0Var);
        long jA = e0.a(a1Var.m(z11));
        t0.y0 y0Var = a1Var.f51232d;
        if (y0Var == null || (w1VarD = y0Var.d()) == null) {
            return;
        }
        long jE = w1VarD.e(jA);
        a1Var.n = jE;
        ((s2) a1Var.f51244r).setValue(new h2.b(jE));
        a1Var.f51242p = 0L;
        a1Var.f51245s = -1;
        t0.y0 y0Var2 = a1Var.f51232d;
        if (y0Var2 != null) {
            ((s2) y0Var2.f88293q).setValue(Boolean.TRUE);
        }
        a1Var.u(false);
    }

    @Override // t0.g1
    public final void b(long j11) {
    }

    @Override // t0.g1
    public final void c() {
        a1 a1Var = this.f51400a;
        a1.d(a1Var, null);
        a1.c(a1Var, null);
        a1Var.u(true);
    }

    @Override // t0.g1
    public final void d(long j11) {
        a1 a1Var = this.f51400a;
        long jG = h2.b.g(a1Var.f51242p, j11);
        a1Var.f51242p = jG;
        ((s2) a1Var.f51244r).setValue(new h2.b(h2.b.g(a1Var.n, jG)));
        r3.z zVarO = a1Var.o();
        h2.b bVarK = a1Var.k();
        Intrinsics.d(bVarK);
        a1.e(a1Var, zVarO, bVarK.f59016a, false, this.f51401b, t.f51387g, true);
        a1Var.u(false);
    }

    @Override // t0.g1
    public final void onCancel() {
    }

    @Override // t0.g1
    public final void onStop() {
        a1 a1Var = this.f51400a;
        a1.d(a1Var, null);
        a1.c(a1Var, null);
        a1Var.u(true);
    }
}
