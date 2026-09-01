package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wv1 implements zk7, lmb {
    public final j70 a;
    public final yq0 b;

    public wv1(j70 j70Var, yq0 yq0Var) {
        this.a = j70Var;
        this.b = yq0Var;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        int iI0 = y66Var.i0(this.a.f());
        if (list.isEmpty()) {
            return 0;
        }
        int iMin = Math.min((list.size() - 1) * iI0, i);
        int size = list.size();
        int iMax = 0;
        float f = 0.0f;
        for (int i2 = 0; i2 < size; i2++) {
            tk7 tk7Var = (tk7) list.get(i2);
            float F = ek7.F(ek7.D(tk7Var));
            if (F == 0.0f) {
                int iMin2 = Math.min(tk7Var.a(Integer.MAX_VALUE), i == Integer.MAX_VALUE ? Integer.MAX_VALUE : i - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, tk7Var.n(iMin2));
            } else if (F > 0.0f) {
                f += F;
            }
        }
        int iRound = f == 0.0f ? 0 : i == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.round(Math.max(i - iMin, 0) / f);
        int size2 = list.size();
        for (int i3 = 0; i3 < size2; i3++) {
            tk7 tk7Var2 = (tk7) list.get(i3);
            float F2 = ek7.F(ek7.D(tk7Var2));
            if (F2 > 0.0f) {
                iMax = Math.max(iMax, tk7Var2.n(iRound != Integer.MAX_VALUE ? Math.round(iRound * F2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        return hk7.B(this, f72.i(j), f72.j(j), f72.g(j), f72.h(j), bl7Var.i0(this.a.f()), bl7Var, list, new t99[list.size()], 0, list.size(), null, 0);
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
        int iI0 = y66Var.i0(this.a.f());
        if (list.isEmpty()) {
            return 0;
        }
        int iMin = Math.min((list.size() - 1) * iI0, i);
        int size = list.size();
        int iMax = 0;
        float f = 0.0f;
        for (int i2 = 0; i2 < size; i2++) {
            tk7 tk7Var = (tk7) list.get(i2);
            float F = ek7.F(ek7.D(tk7Var));
            if (F == 0.0f) {
                int iMin2 = Math.min(tk7Var.a(Integer.MAX_VALUE), i == Integer.MAX_VALUE ? Integer.MAX_VALUE : i - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, tk7Var.k(iMin2));
            } else if (F > 0.0f) {
                f += F;
            }
        }
        int iRound = f == 0.0f ? 0 : i == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.round(Math.max(i - iMin, 0) / f);
        int size2 = list.size();
        for (int i3 = 0; i3 < size2; i3++) {
            tk7 tk7Var2 = (tk7) list.get(i3);
            float F2 = ek7.F(ek7.D(tk7Var2));
            if (F2 > 0.0f) {
                iMax = Math.max(iMax, tk7Var2.k(iRound != Integer.MAX_VALUE ? Math.round(iRound * F2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    @Override // defpackage.zk7
    public final int d(y66 y66Var, List list, int i) {
        int iI0 = y66Var.i0(this.a.f());
        if (list.isEmpty()) {
            return 0;
        }
        int size = list.size();
        int iMax = 0;
        int i2 = 0;
        float f = 0.0f;
        for (int i3 = 0; i3 < size; i3++) {
            tk7 tk7Var = (tk7) list.get(i3);
            float F = ek7.F(ek7.D(tk7Var));
            int iA = tk7Var.a(i);
            if (F == 0.0f) {
                i2 += iA;
            } else if (F > 0.0f) {
                f += F;
                iMax = Math.max(iMax, Math.round(iA / F));
            }
        }
        return ((list.size() - 1) * iI0) + Math.round(iMax * f) + i2;
    }

    @Override // defpackage.zk7
    public final int e(y66 y66Var, List list, int i) {
        int iI0 = y66Var.i0(this.a.f());
        if (list.isEmpty()) {
            return 0;
        }
        int size = list.size();
        int iMax = 0;
        int i2 = 0;
        float f = 0.0f;
        for (int i3 = 0; i3 < size; i3++) {
            tk7 tk7Var = (tk7) list.get(i3);
            float F = ek7.F(ek7.D(tk7Var));
            int iL = tk7Var.L(i);
            if (F == 0.0f) {
                i2 += iL;
            } else if (F > 0.0f) {
                f += F;
                iMax = Math.max(iMax, Math.round(iL / F));
            }
        }
        return ((list.size() - 1) * iI0) + Math.round(iMax * f) + i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wv1)) {
            return false;
        }
        wv1 wv1Var = (wv1) obj;
        return this.a.equals(wv1Var.a) && this.b.equals(wv1Var.b);
    }

    @Override // defpackage.lmb
    public final void f(int i, int[] iArr, int[] iArr2, bl7 bl7Var) {
        this.a.f0(bl7Var, i, iArr, iArr2);
    }

    @Override // defpackage.lmb
    public final long g(int i, int i2, int i3, boolean z) {
        return !z ? h72.a(0, i3, i, i2) : g01.P(0, i3, i, i2);
    }

    @Override // defpackage.lmb
    public final al7 h(t99[] t99VarArr, bl7 bl7Var, int[] iArr, int i, int i2, int[] iArr2, int i3, int i4, int i5) {
        return bl7Var.q0(i2, i, fy3.a, new vv1(i2, 0, t99VarArr, this, bl7Var, iArr));
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b.a) + (this.a.hashCode() * 31);
    }

    @Override // defpackage.lmb
    public final int i(t99 t99Var) {
        return t99Var.a;
    }

    @Override // defpackage.lmb
    public final int j(t99 t99Var) {
        return t99Var.b;
    }

    public final String toString() {
        return "ColumnMeasurePolicy(verticalArrangement=" + this.a + ", horizontalAlignment=" + this.b + ')';
    }
}
