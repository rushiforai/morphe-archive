package xk;

import java.io.Serializable;

/* loaded from: classes.dex */
public abstract class j0 implements Comparable, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Object f95941a;

    public j0(Comparable comparable) {
        this.f95941a = comparable;
    }

    /* JADX WARN: Type inference failed for: r3v1, types: [java.lang.Comparable, java.lang.Object] */
    @Override // java.lang.Comparable
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compareTo(j0 j0Var) {
        if (j0Var == h0.f95923d) {
            return 1;
        }
        if (j0Var == h0.f95922c) {
            return -1;
        }
        Object obj = j0Var.f95941a;
        n2 n2Var = n2.f95978c;
        int iCompareTo = this.f95941a.compareTo(obj);
        if (iCompareTo != 0) {
            return iCompareTo;
        }
        boolean z11 = this instanceof i0;
        if (z11 == (j0Var instanceof i0)) {
            return 0;
        }
        return z11 ? 1 : -1;
    }

    public abstract void b(StringBuilder sb2);

    public abstract void c(StringBuilder sb2);

    public abstract boolean d(Comparable comparable);

    public final boolean equals(Object obj) {
        if (obj instanceof j0) {
            try {
                if (compareTo((j0) obj) == 0) {
                    return true;
                }
            } catch (ClassCastException unused) {
            }
        }
        return false;
    }

    public abstract int hashCode();
}
