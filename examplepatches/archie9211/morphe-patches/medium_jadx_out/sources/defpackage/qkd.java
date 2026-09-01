package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qkd {
    public static final rkd[] b = {new rkd(0), new rkd(4294967296L), new rkd(8589934592L)};
    public static final long c = en7.M(Float.NaN, 0);
    public final long a;

    public /* synthetic */ qkd(long j) {
        this.a = j;
    }

    public static final boolean a(long j, long j2) {
        return j == j2;
    }

    public static final long b(long j) {
        return b[(int) ((j & 1095216660480L) >>> 32)].a;
    }

    public static final float c(long j) {
        return Float.intBitsToFloat((int) (j & 4294967295L));
    }

    public static final boolean d(long j) {
        return (j & 1095216660480L) == 8589934592L;
    }

    public static String e(long j) {
        long jB = b(j);
        if (rkd.a(jB, 0L)) {
            return "Unspecified";
        }
        if (rkd.a(jB, 4294967296L)) {
            return c(j) + ".sp";
        }
        if (!rkd.a(jB, 8589934592L)) {
            return "Invalid";
        }
        return c(j) + ".em";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof qkd) {
            return this.a == ((qkd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return ev6.n(this.a);
    }

    public final String toString() {
        return e(this.a);
    }
}
