package r3;

/* loaded from: classes.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final int f85453a;

    public static String a(int i5) {
        return i5 == 0 ? "Unspecified" : i5 == 1 ? "Text" : i5 == 2 ? "Ascii" : i5 == 3 ? "Number" : i5 == 4 ? "Phone" : i5 == 5 ? "Uri" : i5 == 6 ? "Email" : i5 == 7 ? "Password" : i5 == 8 ? "NumberPassword" : i5 == 9 ? "Decimal" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof o) {
            return this.f85453a == ((o) obj).f85453a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f85453a);
    }

    public final String toString() {
        return a(this.f85453a);
    }
}
