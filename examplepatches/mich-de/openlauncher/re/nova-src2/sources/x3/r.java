package x3;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final int f95032a;

    public final boolean equals(Object obj) {
        if (obj instanceof r) {
            return this.f95032a == ((r) obj).f95032a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f95032a);
    }

    public final String toString() {
        int i5 = this.f95032a;
        return i5 == 1 ? "Linearity.Linear" : i5 == 2 ? "Linearity.FontHinting" : i5 == 3 ? "Linearity.None" : "Invalid";
    }
}
