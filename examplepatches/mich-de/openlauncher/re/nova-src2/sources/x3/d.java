package x3;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final int f95005a;

    public static String a(int i5) {
        return i5 == 1 ? "Hyphens.None" : i5 == 2 ? "Hyphens.Auto" : i5 == Integer.MIN_VALUE ? "Hyphens.Unspecified" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof d) {
            return this.f95005a == ((d) obj).f95005a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f95005a);
    }

    public final String toString() {
        return a(this.f95005a);
    }
}
