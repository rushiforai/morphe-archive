package y3;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final long f96604a;

    public static final float a(long j11) {
        return Float.intBitsToFloat((int) (j11 & 4294967295L));
    }

    public static final float b(long j11) {
        return Float.intBitsToFloat((int) (j11 >> 32));
    }

    public static final long c(float f11, long j11) {
        float fB = b(j11) * f11;
        float fA = a(j11) * f11;
        return (Float.floatToRawIntBits(fA) & 4294967295L) | (Float.floatToRawIntBits(fB) << 32);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof i) {
            return this.f96604a == ((i) obj).f96604a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96604a);
    }

    public final String toString() {
        long j11 = this.f96604a;
        if (j11 == 9205357640488583168L) {
            return "DpSize.Unspecified";
        }
        return ((Object) f.b(b(j11))) + " x " + ((Object) f.b(a(j11)));
    }
}
