package q3;

/* loaded from: classes.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final int f83601a;

    public static String a(int i5) {
        return i5 == 0 ? "Normal" : i5 == 1 ? "Italic" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof v) {
            return this.f83601a == ((v) obj).f83601a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f83601a);
    }

    public final String toString() {
        return a(this.f83601a);
    }
}
