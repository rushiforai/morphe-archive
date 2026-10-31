package y3;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final long f96603a;

    public static String a(long j11) {
        if (j11 == 9205357640488583168L) {
            return "DpOffset.Unspecified";
        }
        return "(" + ((Object) f.b(Float.intBitsToFloat((int) (j11 >> 32)))) + ", " + ((Object) f.b(Float.intBitsToFloat((int) (j11 & 4294967295L)))) + ')';
    }

    public final boolean equals(Object obj) {
        if (obj instanceof g) {
            return this.f96603a == ((g) obj).f96603a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96603a);
    }

    public final String toString() {
        return a(this.f96603a);
    }
}
