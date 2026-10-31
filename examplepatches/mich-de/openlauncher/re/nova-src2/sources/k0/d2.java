package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class d2 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public float f70591a;

    /* renamed from: b, reason: collision with root package name */
    public float f70592b;

    @Override // b3.e0
    public final int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        int iB = sVar.b(i5);
        int iMo96roundToPx0680j_4 = !Float.isNaN(this.f70592b) ? tVar.mo96roundToPx0680j_4(this.f70592b) : 0;
        return iB < iMo96roundToPx0680j_4 ? iMo96roundToPx0680j_4 : iB;
    }

    @Override // b3.e0
    public final int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        int iF = sVar.F(i5);
        int iMo96roundToPx0680j_4 = !Float.isNaN(this.f70591a) ? tVar.mo96roundToPx0680j_4(this.f70591a) : 0;
        return iF < iMo96roundToPx0680j_4 ? iMo96roundToPx0680j_4 : iF;
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        int iJ;
        int i5;
        if (Float.isNaN(this.f70591a) || y3.a.j(j11) != 0) {
            iJ = y3.a.j(j11);
        } else {
            int iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(this.f70591a);
            iJ = y3.a.h(j11);
            if (iMo96roundToPx0680j_4 < 0) {
                iMo96roundToPx0680j_4 = 0;
            }
            if (iMo96roundToPx0680j_4 <= iJ) {
                iJ = iMo96roundToPx0680j_4;
            }
        }
        int iH = y3.a.h(j11);
        if (Float.isNaN(this.f70592b) || y3.a.i(j11) != 0) {
            i5 = y3.a.i(j11);
        } else {
            int iMo96roundToPx0680j_42 = t0Var.mo96roundToPx0680j_4(this.f70592b);
            i5 = y3.a.g(j11);
            int i11 = iMo96roundToPx0680j_42 >= 0 ? iMo96roundToPx0680j_42 : 0;
            if (i11 <= i5) {
                i5 = i11;
            }
        }
        z2.i1 i1VarH = q0Var.H(y3.b.a(iJ, iH, i5, y3.a.g(j11)));
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.f(i1VarH, 3));
    }

    @Override // b3.e0
    public final int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        int iT = sVar.t(i5);
        int iMo96roundToPx0680j_4 = !Float.isNaN(this.f70592b) ? tVar.mo96roundToPx0680j_4(this.f70592b) : 0;
        return iT < iMo96roundToPx0680j_4 ? iMo96roundToPx0680j_4 : iT;
    }

    @Override // b3.e0
    public final int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        int iE = sVar.E(i5);
        int iMo96roundToPx0680j_4 = !Float.isNaN(this.f70591a) ? tVar.mo96roundToPx0680j_4(this.f70591a) : 0;
        return iE < iMo96roundToPx0680j_4 ? iMo96roundToPx0680j_4 : iE;
    }
}
