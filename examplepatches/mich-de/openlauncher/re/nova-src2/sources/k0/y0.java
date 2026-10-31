package k0;

import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes.dex */
public final class y0 implements z2.c0, a3.d, a3.i {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f70778a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f70779b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f70780c;

    public y0(g2 g2Var) {
        this.f70778a = g2Var;
        this.f70779b = androidx.compose.runtime.d.k(g2Var);
        this.f70780c = androidx.compose.runtime.d.k(g2Var);
    }

    @Override // a3.d
    public final void b(a3.j jVar) {
        g2 g2Var = (g2) jVar.getCurrent(i2.f70646a);
        g2 g2Var2 = this.f70778a;
        ((s2) this.f70779b).setValue(new h0(g2Var2, g2Var));
        ((s2) this.f70780c).setValue(new c2(g2Var, g2Var2));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof y0) {
            return Intrinsics.b(((y0) obj).f70778a, this.f70778a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f70778a.hashCode();
    }

    @Override // z2.c0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo295measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        p1.e1 e1Var = this.f70779b;
        int iA = ((g2) ((s2) e1Var).getValue()).a(t0Var, t0Var.getLayoutDirection());
        int iD = ((g2) ((s2) e1Var).getValue()).d(t0Var);
        int iB = ((g2) ((s2) e1Var).getValue()).b(t0Var, t0Var.getLayoutDirection()) + iA;
        int iC = ((g2) ((s2) e1Var).getValue()).c(t0Var) + iD;
        z2.i1 i1VarH = q0Var.H(y3.b.i(-iB, -iC, j11));
        return t0Var.y(y3.b.g(i1VarH.f98081a + iB, j11), y3.b.f(i1VarH.f98082b + iC, j11), b70.h.f17594a, new x0(iA, iD, 0, i1VarH));
    }
}
