package y3;

/* loaded from: classes2.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final long f96620a;

    public /* synthetic */ r(long j11) {
        this.f96620a = j11;
    }

    public static final /* synthetic */ r a(long j11) {
        return new r(j11);
    }

    public static long b(long j11, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = Float.intBitsToFloat((int) (j11 >> 32));
        }
        if ((i5 & 2) != 0) {
            f12 = Float.intBitsToFloat((int) (j11 & 4294967295L));
        }
        return (Float.floatToRawIntBits(f11) << 32) | (Float.floatToRawIntBits(f12) & 4294967295L);
    }

    public static final boolean c(long j11) {
        return j11 == 0;
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
        return "(" + d(j11) + ", " + e(j11) + ") px/sec";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof r) {
            return this.f96620a == ((r) obj).f96620a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96620a);
    }

    public final /* synthetic */ long j() {
        return this.f96620a;
    }

    public final String toString() {
        return i(this.f96620a);
    }
}
