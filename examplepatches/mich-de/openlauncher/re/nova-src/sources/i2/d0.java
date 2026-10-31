package i2;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f61102a;

    public final boolean equals(Object obj) {
        if (obj instanceof d0) {
            return this.f61102a == ((d0) obj).f61102a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f61102a);
    }

    public final String toString() {
        int i5 = this.f61102a;
        return i5 == 0 ? "Argb8888" : i5 == 1 ? "Alpha8" : i5 == 2 ? "Rgb565" : i5 == 3 ? "F16" : i5 == 4 ? "Gpu" : "Unknown";
    }
}
