package x3;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final int f95024a;

    public static String a(int i5) {
        return i5 == 1 ? "Ltr" : i5 == 2 ? "Rtl" : i5 == 3 ? "Content" : i5 == 4 ? "ContentOrLtr" : i5 == 5 ? "ContentOrRtl" : i5 == Integer.MIN_VALUE ? "Unspecified" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof m) {
            return this.f95024a == ((m) obj).f95024a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f95024a);
    }

    public final String toString() {
        return a(this.f95024a);
    }
}
