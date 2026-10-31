package op;

import h6.c1;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public int f80560a;

    /* renamed from: b, reason: collision with root package name */
    public int f80561b;

    public k(int i5, int i11) {
        this.f80560a = i5;
        this.f80561b = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return this.f80560a == kVar.f80560a && this.f80561b == kVar.f80561b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f80561b) + (Integer.hashCode(this.f80560a) * 31);
    }

    public final String toString() {
        return c1.n(this.f80560a, "ImpressionCounter(overallImpressions=", ", notEmptyImpressions=", this.f80561b, ")");
    }
}
