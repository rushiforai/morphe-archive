package f1;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes2.dex */
public final class p2 extends Modifier$Node implements b3.m, b3.e0 {
    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        boolean z11 = getIsAttached() && ((Boolean) b3.g.c(this, g2.f53558a)).booleanValue();
        long j12 = g2.f53559b;
        z2.i1 i1VarH = q0Var.H(j11);
        int iMax = z11 ? Math.max(i1VarH.f98081a, t0Var.mo96roundToPx0680j_4(y3.i.b(j12))) : i1VarH.f98081a;
        int iMax2 = z11 ? Math.max(i1VarH.f98082b, t0Var.mo96roundToPx0680j_4(y3.i.a(j12))) : i1VarH.f98082b;
        return t0Var.y(iMax, iMax2, b70.h.f17594a, new o2(iMax, iMax2, 0, i1VarH));
    }
}
