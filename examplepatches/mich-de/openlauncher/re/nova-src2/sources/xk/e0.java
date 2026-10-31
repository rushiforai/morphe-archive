package xk;

import java.util.Comparator;

/* loaded from: classes3.dex */
public final class e0 extends g0 {
    public static g0 g(int i5) {
        return i5 < 0 ? g0.f95917b : i5 > 0 ? g0.f95918c : g0.f95916a;
    }

    @Override // xk.g0
    public final g0 a(int i5, int i11) {
        return g(ul.b.t(i5, i11));
    }

    @Override // xk.g0
    public final g0 b(Object obj, Object obj2, Comparator comparator) {
        return g(comparator.compare(obj, obj2));
    }

    @Override // xk.g0
    public final g0 c(j0 j0Var, j0 j0Var2) {
        return g(j0Var.compareTo(j0Var2));
    }

    @Override // xk.g0
    public final g0 d(boolean z11, boolean z12) {
        return g(z11 == z12 ? 0 : z11 ? 1 : -1);
    }

    @Override // xk.g0
    public final g0 e(boolean z11, boolean z12) {
        return g(z12 == z11 ? 0 : z12 ? 1 : -1);
    }

    @Override // xk.g0
    public final int f() {
        return 0;
    }
}
