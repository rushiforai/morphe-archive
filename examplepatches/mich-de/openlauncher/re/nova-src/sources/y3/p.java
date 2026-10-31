package y3;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: b, reason: collision with root package name */
    public static final q[] f96616b = {new q(0), new q(4294967296L), new q(8589934592L)};

    /* renamed from: c, reason: collision with root package name */
    public static final long f96617c = w20.h.m(Float.NaN, 0);

    /* renamed from: a, reason: collision with root package name */
    public final long f96618a;

    public /* synthetic */ p(long j11) {
        this.f96618a = j11;
    }

    public static final boolean a(long j11, long j12) {
        return j11 == j12;
    }

    public static final long b(long j11) {
        return f96616b[(int) ((j11 & 1095216660480L) >>> 32)].f96619a;
    }

    public static final float c(long j11) {
        return Float.intBitsToFloat((int) (j11 & 4294967295L));
    }

    public static String d(long j11) {
        long jB = b(j11);
        if (q.a(jB, 0L)) {
            return "Unspecified";
        }
        if (q.a(jB, 4294967296L)) {
            return c(j11) + ".sp";
        }
        if (!q.a(jB, 8589934592L)) {
            return "Invalid";
        }
        return c(j11) + ".em";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof p) {
            return this.f96618a == ((p) obj).f96618a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96618a);
    }

    public final String toString() {
        return d(this.f96618a);
    }
}
