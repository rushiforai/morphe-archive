package q3;

/* loaded from: classes.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final int f83602a;

    public final boolean equals(Object obj) {
        if (obj instanceof w) {
            return this.f83602a == ((w) obj).f83602a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f83602a);
    }

    public final String toString() {
        int i5 = this.f83602a;
        return i5 == 0 ? "None" : i5 == 1 ? "Weight" : i5 == 2 ? "Style" : i5 == 65535 ? "All" : "Invalid";
    }
}
