package h2;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final long f59030a;

    public static final boolean a(long j11, long j12) {
        return j11 == j12;
    }

    public static final float b(long j11) {
        return Float.intBitsToFloat((int) (j11 & 4294967295L));
    }

    public static final float c(long j11) {
        return Math.min(Float.intBitsToFloat((int) ((j11 >> 32) & 2147483647L)), Float.intBitsToFloat((int) (j11 & 2147483647L)));
    }

    public static final float d(long j11) {
        return Float.intBitsToFloat((int) (j11 >> 32));
    }

    public static final boolean e(long j11) {
        return (j11 == 9205357640488583168L) | (Float.intBitsToFloat((int) (j11 >> 32)) <= 0.0f) | (Float.intBitsToFloat((int) (j11 & 4294967295L)) <= 0.0f);
    }

    public static String f(long j11) {
        if (j11 == 9205357640488583168L) {
            return "Size.Unspecified";
        }
        return "Size(" + t2.c.P(Float.intBitsToFloat((int) (j11 >> 32))) + ", " + t2.c.P(Float.intBitsToFloat((int) (j11 & 4294967295L))) + ')';
    }

    public final boolean equals(Object obj) {
        if (obj instanceof e) {
            return this.f59030a == ((e) obj).f59030a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f59030a);
    }

    public final String toString() {
        return f(this.f59030a);
    }
}
