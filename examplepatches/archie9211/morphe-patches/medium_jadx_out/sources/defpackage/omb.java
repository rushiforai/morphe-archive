package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class omb implements zk7, lmb {
    public final g70 a;
    public final zq0 b;

    public omb(g70 g70Var, zq0 zq0Var) {
        this.a = g70Var;
        this.b = zq0Var;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
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
            int iN = tk7Var.n(i);
            if (F == 0.0f) {
                i2 += iN;
            } else if (F > 0.0f) {
                f += F;
                iMax = Math.max(iMax, Math.round(iN / F));
            }
        }
        return ((list.size() - 1) * iI0) + Math.round(iMax * f) + i2;
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        return hk7.B(this, f72.j(j), f72.i(j), f72.h(j), f72.g(j), bl7Var.i0(this.a.f()), bl7Var, list, new t99[list.size()], 0, list.size(), null, 0);
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
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
            int iK = tk7Var.k(i);
            if (F == 0.0f) {
                i2 += iK;
            } else if (F > 0.0f) {
                f += F;
                iMax = Math.max(iMax, Math.round(iK / F));
            }
        }
        return ((list.size() - 1) * iI0) + Math.round(iMax * f) + i2;
    }

    @Override // defpackage.zk7
    public final int d(y66 y66Var, List list, int i) {
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
                int iMin2 = Math.min(tk7Var.n(Integer.MAX_VALUE), i == Integer.MAX_VALUE ? Integer.MAX_VALUE : i - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, tk7Var.a(iMin2));
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
                iMax = Math.max(iMax, tk7Var2.a(iRound != Integer.MAX_VALUE ? Math.round(iRound * F2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    @Override // defpackage.zk7
    public final int e(y66 y66Var, List list, int i) {
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
                int iMin2 = Math.min(tk7Var.n(Integer.MAX_VALUE), i == Integer.MAX_VALUE ? Integer.MAX_VALUE : i - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, tk7Var.L(iMin2));
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
                iMax = Math.max(iMax, tk7Var2.L(iRound != Integer.MAX_VALUE ? Math.round(iRound * F2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof omb)) {
            return false;
        }
        omb ombVar = (omb) obj;
        return this.a.equals(ombVar.a) && g76.L(this.b, ombVar.b);
    }

    @Override // defpackage.lmb
    public final void f(int i, int[] iArr, int[] iArr2, bl7 bl7Var) {
        this.a.w(bl7Var, i, iArr, bl7Var.getLayoutDirection(), iArr2);
    }

    @Override // defpackage.lmb
    public final long g(int i, int i2, int i3, boolean z) {
        return !z ? h72.a(i, i2, 0, i3) : g01.Q(i, i2, 0, i3);
    }

    @Override // defpackage.lmb
    public final al7 h(t99[] t99VarArr, bl7 bl7Var, int[] iArr, int i, int i2, int[] iArr2, int i3, int i4, int i5) {
        return bl7Var.q0(i, i2, fy3.a, new h83(t99VarArr, this, i2, iArr));
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b.a) + (this.a.hashCode() * 31);
    }

    @Override // defpackage.lmb
    public final int i(t99 t99Var) {
        return t99Var.b;
    }

    @Override // defpackage.lmb
    public final int j(t99 t99Var) {
        return t99Var.a;
    }

    public final String toString() {
        return "RowMeasurePolicy(horizontalArrangement=" + this.a + ", verticalAlignment=" + this.b + ')';
    }
}
