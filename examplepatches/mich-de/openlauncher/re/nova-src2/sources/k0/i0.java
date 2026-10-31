package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class i0 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public g0 f70641a;

    /* renamed from: b, reason: collision with root package name */
    public float f70642b;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        int iJ;
        int iH;
        int iG;
        int iG2;
        if (!y3.a.d(j11) || this.f70641a == g0.f70607a) {
            iJ = y3.a.j(j11);
            iH = y3.a.h(j11);
        } else {
            int iRound = Math.round(y3.a.h(j11) * this.f70642b);
            int iJ2 = y3.a.j(j11);
            iJ = y3.a.h(j11);
            if (iRound < iJ2) {
                iRound = iJ2;
            }
            if (iRound <= iJ) {
                iJ = iRound;
            }
            iH = iJ;
        }
        if (!y3.a.c(j11) || this.f70641a == g0.f70608b) {
            int i5 = y3.a.i(j11);
            iG = y3.a.g(j11);
            iG2 = i5;
        } else {
            int iRound2 = Math.round(y3.a.g(j11) * this.f70642b);
            int i11 = y3.a.i(j11);
            iG2 = y3.a.g(j11);
            if (iRound2 < i11) {
                iRound2 = i11;
            }
            if (iRound2 <= iG2) {
                iG2 = iRound2;
            }
            iG = iG2;
        }
        z2.i1 i1VarH = q0Var.H(y3.b.a(iJ, iH, iG2, iG));
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.f(i1VarH, 1));
    }
}
