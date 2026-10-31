package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class b2 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public float f70569a;

    /* renamed from: b, reason: collision with root package name */
    public float f70570b;

    /* renamed from: c, reason: collision with root package name */
    public float f70571c;

    /* renamed from: d, reason: collision with root package name */
    public float f70572d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f70573e;

    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long B(z2.t0 t0Var) {
        int iMo96roundToPx0680j_4;
        int iMo96roundToPx0680j_42;
        int iMo96roundToPx0680j_43;
        int i5 = 0;
        if (Float.isNaN(this.f70571c)) {
            iMo96roundToPx0680j_4 = Integer.MAX_VALUE;
        } else {
            iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(this.f70571c);
            if (iMo96roundToPx0680j_4 < 0) {
                iMo96roundToPx0680j_4 = 0;
            }
        }
        if (Float.isNaN(this.f70572d)) {
            iMo96roundToPx0680j_42 = Integer.MAX_VALUE;
        } else {
            iMo96roundToPx0680j_42 = t0Var.mo96roundToPx0680j_4(this.f70572d);
            if (iMo96roundToPx0680j_42 < 0) {
                iMo96roundToPx0680j_42 = 0;
            }
        }
        if (Float.isNaN(this.f70569a)) {
            iMo96roundToPx0680j_43 = 0;
        } else {
            iMo96roundToPx0680j_43 = t0Var.mo96roundToPx0680j_4(this.f70569a);
            if (iMo96roundToPx0680j_43 < 0) {
                iMo96roundToPx0680j_43 = 0;
            }
            if (iMo96roundToPx0680j_43 > iMo96roundToPx0680j_4) {
                iMo96roundToPx0680j_43 = iMo96roundToPx0680j_4;
            }
            if (iMo96roundToPx0680j_43 == Integer.MAX_VALUE) {
            }
        }
        if (!Float.isNaN(this.f70570b)) {
            int iMo96roundToPx0680j_44 = t0Var.mo96roundToPx0680j_4(this.f70570b);
            if (iMo96roundToPx0680j_44 < 0) {
                iMo96roundToPx0680j_44 = 0;
            }
            if (iMo96roundToPx0680j_44 > iMo96roundToPx0680j_42) {
                iMo96roundToPx0680j_44 = iMo96roundToPx0680j_42;
            }
            if (iMo96roundToPx0680j_44 != Integer.MAX_VALUE) {
                i5 = iMo96roundToPx0680j_44;
            }
        }
        return y3.b.a(iMo96roundToPx0680j_43, iMo96roundToPx0680j_4, i5, iMo96roundToPx0680j_42);
    }

    @Override // b3.e0
    public final int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        long jB = B((z2.t0) tVar);
        if (y3.a.e(jB)) {
            return y3.a.g(jB);
        }
        if (!this.f70573e) {
            i5 = y3.b.g(i5, jB);
        }
        return y3.b.f(sVar.b(i5), jB);
    }

    @Override // b3.e0
    public final int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        long jB = B((z2.t0) tVar);
        if (y3.a.f(jB)) {
            return y3.a.h(jB);
        }
        if (!this.f70573e) {
            i5 = y3.b.f(i5, jB);
        }
        return y3.b.g(sVar.F(i5), jB);
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        int iJ;
        int iH;
        int i5;
        int iG;
        long jA;
        long jB = B(t0Var);
        if (this.f70573e) {
            jA = y3.b.e(j11, jB);
        } else {
            if (Float.isNaN(this.f70569a)) {
                iJ = y3.a.j(j11);
                int iH2 = y3.a.h(jB);
                if (iJ > iH2) {
                    iJ = iH2;
                }
            } else {
                iJ = y3.a.j(jB);
            }
            if (Float.isNaN(this.f70571c)) {
                iH = y3.a.h(j11);
                int iJ2 = y3.a.j(jB);
                if (iH < iJ2) {
                    iH = iJ2;
                }
            } else {
                iH = y3.a.h(jB);
            }
            if (Float.isNaN(this.f70570b)) {
                i5 = y3.a.i(j11);
                int iG2 = y3.a.g(jB);
                if (i5 > iG2) {
                    i5 = iG2;
                }
            } else {
                i5 = y3.a.i(jB);
            }
            if (Float.isNaN(this.f70572d)) {
                iG = y3.a.g(j11);
                int i11 = y3.a.i(jB);
                if (iG < i11) {
                    iG = i11;
                }
            } else {
                iG = y3.a.g(jB);
            }
            jA = y3.b.a(iJ, iH, i5, iG);
        }
        z2.i1 i1VarH = q0Var.H(jA);
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.f(i1VarH, 2));
    }

    @Override // b3.e0
    public final int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        long jB = B((z2.t0) tVar);
        if (y3.a.e(jB)) {
            return y3.a.g(jB);
        }
        if (!this.f70573e) {
            i5 = y3.b.g(i5, jB);
        }
        return y3.b.f(sVar.t(i5), jB);
    }

    @Override // b3.e0
    public final int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        long jB = B((z2.t0) tVar);
        if (y3.a.f(jB)) {
            return y3.a.h(jB);
        }
        if (!this.f70573e) {
            i5 = y3.b.f(i5, jB);
        }
        return y3.b.g(sVar.E(i5), jB);
    }
}
