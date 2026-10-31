package y8;

/* loaded from: classes.dex */
public final class a extends v4.a {

    /* renamed from: d, reason: collision with root package name */
    public final int f96839d;

    public a(int i5) {
        this.f96839d = i5;
        if (i5 <= 0) {
            throw new IllegalArgumentException("px must be > 0.");
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof a) {
            return this.f96839d == ((a) obj).f96839d;
        }
        return false;
    }

    public final int hashCode() {
        return this.f96839d;
    }

    public final String toString() {
        return String.valueOf(this.f96839d);
    }
}
