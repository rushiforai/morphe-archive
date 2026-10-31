package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class q1 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public o1 f70721a;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        float fB = this.f70721a.b(t0Var.getLayoutDirection());
        float fD = this.f70721a.d();
        float fC = this.f70721a.c(t0Var.getLayoutDirection());
        float fA = this.f70721a.a();
        float f11 = 0;
        if (!((Float.compare(fA, f11) >= 0) & (Float.compare(fB, f11) >= 0) & (Float.compare(fD, f11) >= 0) & (Float.compare(fC, f11) >= 0))) {
            l0.a.a("Padding must be non-negative");
        }
        int iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(fB);
        int iMo96roundToPx0680j_42 = t0Var.mo96roundToPx0680j_4(fC) + iMo96roundToPx0680j_4;
        int iMo96roundToPx0680j_43 = t0Var.mo96roundToPx0680j_4(fD);
        int iMo96roundToPx0680j_44 = t0Var.mo96roundToPx0680j_4(fA) + iMo96roundToPx0680j_43;
        z2.i1 i1VarH = q0Var.H(y3.b.i(-iMo96roundToPx0680j_42, -iMo96roundToPx0680j_44, j11));
        return t0Var.y(y3.b.g(i1VarH.f98081a + iMo96roundToPx0680j_42, j11), y3.b.f(i1VarH.f98082b + iMo96roundToPx0680j_44, j11), b70.h.f17594a, new x0(iMo96roundToPx0680j_4, iMo96roundToPx0680j_43, 1, i1VarH));
    }
}
