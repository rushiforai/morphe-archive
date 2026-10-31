package r3;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final int f85452a;

    public static String a(int i5) {
        return i5 == -1 ? "Unspecified" : i5 == 0 ? "None" : i5 == 1 ? "Characters" : i5 == 2 ? "Words" : i5 == 3 ? "Sentences" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof n) {
            return this.f85452a == ((n) obj).f85452a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f85452a);
    }

    public final String toString() {
        return a(this.f85452a);
    }
}
