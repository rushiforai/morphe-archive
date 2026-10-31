package tx;

/* loaded from: classes4.dex */
public final class k4 extends n4 {

    /* renamed from: a, reason: collision with root package name */
    public final l4 f89847a;

    public k4(l4 l4Var) {
        this.f89847a = l4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k4) && this.f89847a == ((k4) obj).f89847a;
    }

    public final int hashCode() {
        return this.f89847a.hashCode();
    }

    public final String toString() {
        return "Plus(source=" + this.f89847a + ")";
    }
}
