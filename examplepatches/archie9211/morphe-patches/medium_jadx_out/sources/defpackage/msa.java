package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class msa {
    public static final lsa a = new lsa();
    public static final z1 b;

    static {
        Integer num = l86.a;
        b = (num == null || num.intValue() >= 34) ? new cb9() : new q94();
    }

    public abstract int a(int i);

    public abstract int b();

    public int c(int i, int i2) {
        int iB;
        int i3;
        int iA;
        if (i2 <= i) {
            ywb.g(gq7.h(Integer.valueOf(i), Integer.valueOf(i2)));
            return 0;
        }
        int i4 = i2 - i;
        if (i4 > 0 || i4 == Integer.MIN_VALUE) {
            if (((-i4) & i4) == i4) {
                iA = a(31 - Integer.numberOfLeadingZeros(i4));
            } else {
                do {
                    iB = b() >>> 1;
                    i3 = iB % i4;
                } while ((i4 - 1) + (iB - i3) < 0);
                iA = i3;
            }
            return i + iA;
        }
        while (true) {
            int iB2 = b();
            if (i <= iB2 && iB2 < i2) {
                return iB2;
            }
        }
    }

    public long d() {
        return (((long) b()) << 32) + ((long) b());
    }

    public long e(long j, long j2) {
        long jD;
        long j3;
        long jA;
        int iB;
        if (j2 <= j) {
            ywb.g(gq7.h(Long.valueOf(j), Long.valueOf(j2)));
            return 0L;
        }
        long j4 = j2 - j;
        if (j4 > 0) {
            if (((-j4) & j4) == j4) {
                int i = (int) j4;
                int i2 = (int) (j4 >>> 32);
                if (i != 0) {
                    iB = a(31 - Integer.numberOfLeadingZeros(i));
                } else if (i2 == 1) {
                    iB = b();
                } else {
                    jA = (((long) a(31 - Integer.numberOfLeadingZeros(i2))) << 32) + (((long) b()) & 4294967295L);
                }
                jA = ((long) iB) & 4294967295L;
            } else {
                do {
                    jD = d() >>> 1;
                    j3 = jD % j4;
                } while ((j4 - 1) + (jD - j3) < 0);
                jA = j3;
            }
            return j + jA;
        }
        while (true) {
            long jD2 = d();
            if (j <= jD2 && jD2 < j2) {
                return jD2;
            }
        }
    }
}
