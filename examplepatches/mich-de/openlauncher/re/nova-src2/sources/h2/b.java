package h2;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final long f59016a;

    public static long a(long j11, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = Float.intBitsToFloat((int) (j11 >> 32));
        }
        if ((i5 & 2) != 0) {
            f12 = Float.intBitsToFloat((int) (j11 & 4294967295L));
        }
        return (Float.floatToRawIntBits(f11) << 32) | (Float.floatToRawIntBits(f12) & 4294967295L);
    }

    public static final boolean b(long j11, long j12) {
        return j11 == j12;
    }

    public static final float c(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L));
        return (float) Math.sqrt((fIntBitsToFloat2 * fIntBitsToFloat2) + (fIntBitsToFloat * fIntBitsToFloat));
    }

    public static final float d(long j11) {
        return Float.intBitsToFloat((int) (j11 >> 32));
    }

    public static final float e(long j11) {
        return Float.intBitsToFloat((int) (j11 & 4294967295L));
    }

    public static final long f(long j11, long j12) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) - Float.intBitsToFloat((int) (j12 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L)) - Float.intBitsToFloat((int) (j12 & 4294967295L));
        return (Float.floatToRawIntBits(fIntBitsToFloat) << 32) | (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L);
    }

    public static final long g(long j11, long j12) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j12 >> 32)) + Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j12 & 4294967295L)) + Float.intBitsToFloat((int) (j11 & 4294967295L));
        return (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }

    public static final long h(float f11, long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) * f11;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L)) * f11;
        return (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }

    public static String i(long j11) {
        if ((9223372034707292159L & j11) == 9205357640488583168L) {
            return "Offset.Unspecified";
        }
        return "Offset(" + t2.c.P(Float.intBitsToFloat((int) (j11 >> 32))) + ", " + t2.c.P(Float.intBitsToFloat((int) (j11 & 4294967295L))) + ')';
    }

    public final boolean equals(Object obj) {
        if (obj instanceof b) {
            return this.f59016a == ((b) obj).f59016a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f59016a);
    }

    public final String toString() {
        return i(this.f59016a);
    }
}
