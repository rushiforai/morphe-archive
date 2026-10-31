package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes2.dex */
public abstract class d1 extends Modifier$Node implements b3.e0 {
    public abstract long B(z2.q0 q0Var, long j11);

    public abstract boolean D();

    public int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return sVar.b(i5);
    }

    @Override // b3.e0
    public int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return sVar.F(i5);
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        long jB = B(q0Var, j11);
        if (D()) {
            jB = y3.b.e(j11, jB);
        }
        z2.i1 i1VarH = q0Var.H(jB);
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.k(i1VarH, 3));
    }

    public int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return sVar.t(i5);
    }

    @Override // b3.e0
    public int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return sVar.E(i5);
    }
}
