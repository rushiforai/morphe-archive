package y3;

/* loaded from: classes.dex */
public final class f implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final float f96602a;

    public static final boolean a(float f11, float f12) {
        return Float.compare(f11, f12) == 0;
    }

    public static String b(float f11) {
        if (Float.isNaN(f11)) {
            return "Dp.Unspecified";
        }
        return f11 + ".dp";
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return Float.compare(this.f96602a, ((f) obj).f96602a);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof f) {
            return Float.compare(this.f96602a, ((f) obj).f96602a) == 0;
        }
        return false;
    }

    public final int hashCode() {
        return Float.hashCode(this.f96602a);
    }

    public final String toString() {
        return b(this.f96602a);
    }
}
