package l1;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes2.dex */
public final class m3 extends Modifier$Node implements b3.m, b3.e0 {
    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        float f11 = ((y3.f) b3.g.c(this, c3.f73102a)).f96602a;
        float f12 = 0;
        if (f11 < f12) {
            f11 = f12;
        }
        z2.i1 i1VarH = q0Var.H(j11);
        boolean z11 = getIsAttached() && !Float.isNaN(f11) && Float.compare(f11, f12) > 0;
        int iMo96roundToPx0680j_4 = Float.isNaN(f11) ? 0 : t0Var.mo96roundToPx0680j_4(f11);
        int iMax = z11 ? Math.max(i1VarH.f98081a, iMo96roundToPx0680j_4) : i1VarH.f98081a;
        int iMax2 = z11 ? Math.max(i1VarH.f98082b, iMo96roundToPx0680j_4) : i1VarH.f98082b;
        return t0Var.y(iMax, iMax2, b70.h.f17594a, new l3(iMax, iMax2, i1VarH));
    }
}
