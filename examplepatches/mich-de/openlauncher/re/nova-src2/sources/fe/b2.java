package fe;

import xk.r2;

/* loaded from: classes3.dex */
public final class b2 implements e {

    /* renamed from: b, reason: collision with root package name */
    public static final b2 f54718b;

    /* renamed from: a, reason: collision with root package name */
    public final xk.v0 f54719a;

    static {
        xk.l0 l0Var = xk.v0.f96030b;
        f54718b = new b2(r2.f96007e);
    }

    public b2(xk.v0 v0Var) {
        this.f54719a = xk.v0.o(v0Var);
    }

    public final boolean a(int i5) {
        int i11 = 0;
        while (true) {
            xk.v0 v0Var = this.f54719a;
            if (i11 >= v0Var.size()) {
                return false;
            }
            a2 a2Var = (a2) v0Var.get(i11);
            boolean[] zArr = a2Var.f54712e;
            int length = zArr.length;
            int i12 = 0;
            while (true) {
                if (i12 >= length) {
                    break;
                }
                if (!zArr[i12]) {
                    i12++;
                } else if (a2Var.f54709b.f57657c == i5) {
                    return true;
                }
            }
            i11++;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || b2.class != obj.getClass()) {
            return false;
        }
        return this.f54719a.equals(((b2) obj).f54719a);
    }

    public final int hashCode() {
        return this.f54719a.hashCode();
    }
}
