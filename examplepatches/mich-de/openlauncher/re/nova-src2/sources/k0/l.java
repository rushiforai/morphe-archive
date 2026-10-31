package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes2.dex */
public final class l extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public float f70664a;

    public final long B(long j11, boolean z11) {
        int iRound;
        int iG = y3.a.g(j11);
        if (iG == Integer.MAX_VALUE || (iRound = Math.round(iG * this.f70664a)) <= 0) {
            return 0L;
        }
        if (!z11 || androidx.compose.foundation.layout.a.c(iRound, iG, j11)) {
            return (iRound << 32) | (iG & 4294967295L);
        }
        return 0L;
    }

    public final long D(long j11, boolean z11) {
        int iRound;
        int iH = y3.a.h(j11);
        if (iH == Integer.MAX_VALUE || (iRound = Math.round(iH / this.f70664a)) <= 0) {
            return 0L;
        }
        if (!z11 || androidx.compose.foundation.layout.a.c(iH, iRound, j11)) {
            return (iH << 32) | (iRound & 4294967295L);
        }
        return 0L;
    }

    public final long E(long j11, boolean z11) {
        int i5 = y3.a.i(j11);
        int iRound = Math.round(i5 * this.f70664a);
        if (iRound <= 0) {
            return 0L;
        }
        if (!z11 || androidx.compose.foundation.layout.a.c(iRound, i5, j11)) {
            return (iRound << 32) | (i5 & 4294967295L);
        }
        return 0L;
    }

    public final long F(long j11, boolean z11) {
        int iJ = y3.a.j(j11);
        int iRound = Math.round(iJ / this.f70664a);
        if (iRound <= 0) {
            return 0L;
        }
        if (!z11 || androidx.compose.foundation.layout.a.c(iJ, iRound, j11)) {
            return (iJ << 32) | (iRound & 4294967295L);
        }
        return 0L;
    }

    @Override // b3.e0
    public final int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return i5 != Integer.MAX_VALUE ? Math.round(i5 / this.f70664a) : sVar.b(i5);
    }

    @Override // b3.e0
    public final int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return i5 != Integer.MAX_VALUE ? Math.round(i5 * this.f70664a) : sVar.F(i5);
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        long jD = D(j11, true);
        if (y3.m.a(jD, 0L)) {
            jD = B(j11, true);
            if (y3.m.a(jD, 0L)) {
                jD = F(j11, true);
                if (y3.m.a(jD, 0L)) {
                    jD = E(j11, true);
                    if (y3.m.a(jD, 0L)) {
                        jD = D(j11, false);
                        if (y3.m.a(jD, 0L)) {
                            jD = B(j11, false);
                            if (y3.m.a(jD, 0L)) {
                                jD = F(j11, false);
                                if (y3.m.a(jD, 0L)) {
                                    jD = E(j11, false);
                                    if (y3.m.a(jD, 0L)) {
                                        jD = 0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (!y3.m.a(jD, 0L)) {
            int i5 = (int) (jD >> 32);
            int i11 = (int) (jD & 4294967295L);
            if (!((i11 >= 0) & (i5 >= 0))) {
                y3.j.a("width and height must be >= 0");
            }
            j11 = y3.b.h(i5, i5, i11, i11);
        }
        z2.i1 i1VarH = q0Var.H(j11);
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.k(i1VarH, 1));
    }

    @Override // b3.e0
    public final int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return i5 != Integer.MAX_VALUE ? Math.round(i5 / this.f70664a) : sVar.t(i5);
    }

    @Override // b3.e0
    public final int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return i5 != Integer.MAX_VALUE ? Math.round(i5 * this.f70664a) : sVar.E(i5);
    }
}
