package r3;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final int f85451a;

    public static String a(int i5) {
        return i5 == -1 ? "Unspecified" : i5 == 0 ? "None" : i5 == 1 ? "Default" : i5 == 2 ? "Go" : i5 == 3 ? "Search" : i5 == 4 ? "Send" : i5 == 5 ? "Previous" : i5 == 6 ? "Next" : i5 == 7 ? "Done" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof l) {
            return this.f85451a == ((l) obj).f85451a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f85451a);
    }

    public final String toString() {
        return a(this.f85451a);
    }
}
