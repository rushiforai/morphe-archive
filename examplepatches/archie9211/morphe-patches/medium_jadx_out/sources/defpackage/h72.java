package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class h72 {
    public static final long a(int i, int i2, int i3, int i4) {
        if (!((i3 >= 0) & (i2 >= i) & (i4 >= i3) & (i >= 0))) {
            d26.a("maxWidth must be >= than minWidth,\nmaxHeight must be >= than minHeight,\nminWidth and minHeight must be >= 0");
        }
        return h(i, i2, i3, i4);
    }

    public static /* synthetic */ long b(int i, int i2, int i3, int i4, int i5) {
        if ((i5 & 1) != 0) {
            i = 0;
        }
        if ((i5 & 2) != 0) {
            i2 = Integer.MAX_VALUE;
        }
        if ((i5 & 4) != 0) {
            i3 = 0;
        }
        if ((i5 & 8) != 0) {
            i4 = Integer.MAX_VALUE;
        }
        return a(i, i2, i3, i4);
    }

    public static final int c(int i) {
        if (i < 8191) {
            return 13;
        }
        if (i < 32767) {
            return 15;
        }
        if (i < 65535) {
            return 16;
        }
        return i < 262143 ? 18 : 255;
    }

    public static final long d(long j, long j2) {
        int i = (int) (j2 >> 32);
        int iJ = f72.j(j);
        int iH = f72.h(j);
        if (i < iJ) {
            i = iJ;
        }
        if (i <= iH) {
            iH = i;
        }
        int i2 = (int) (j2 & 4294967295L);
        int i3 = f72.i(j);
        int iG = f72.g(j);
        if (i2 < i3) {
            i2 = i3;
        }
        if (i2 <= iG) {
            iG = i2;
        }
        return (((long) iH) << 32) | (4294967295L & ((long) iG));
    }

    public static final long e(long j, long j2) {
        int iJ = f72.j(j);
        int iH = f72.h(j);
        int i = f72.i(j);
        int iG = f72.g(j);
        int iJ2 = f72.j(j2);
        if (iJ2 < iJ) {
            iJ2 = iJ;
        }
        if (iJ2 > iH) {
            iJ2 = iH;
        }
        int iH2 = f72.h(j2);
        if (iH2 >= iJ) {
            iJ = iH2;
        }
        if (iJ <= iH) {
            iH = iJ;
        }
        int i2 = f72.i(j2);
        if (i2 < i) {
            i2 = i;
        }
        if (i2 > iG) {
            i2 = iG;
        }
        int iG2 = f72.g(j2);
        if (iG2 >= i) {
            i = iG2;
        }
        if (i <= iG) {
            iG = i;
        }
        return a(iJ2, iH, i2, iG);
    }

    public static final int f(int i, long j) {
        int i2 = f72.i(j);
        int iG = f72.g(j);
        if (i < i2) {
            i = i2;
        }
        return i > iG ? iG : i;
    }

    public static final int g(int i, long j) {
        int iJ = f72.j(j);
        int iH = f72.h(j);
        if (i < iJ) {
            i = iJ;
        }
        return i > iH ? iH : i;
    }

    public static final long h(int i, int i2, int i3, int i4) {
        int i5 = i4 == Integer.MAX_VALUE ? i3 : i4;
        int iC = c(i5);
        int i6 = i2 == Integer.MAX_VALUE ? i : i2;
        int iC2 = c(i6);
        if (iC + iC2 > 31) {
            k(i6, i5);
        }
        int i7 = i2 + 1;
        int i8 = i4 + 1;
        int i9 = iC2 - 13;
        return (((long) (i7 & (~(i7 >> 31)))) << 33) | ((long) ((i9 >> 1) + (i9 & 1))) | (((long) i) << 2) | (((long) i3) << (iC2 + 2)) | (((long) (i8 & (~(i8 >> 31)))) << (iC2 + 33));
    }

    public static final long i(int i, int i2, long j) {
        int iJ = f72.j(j) + i;
        if (iJ < 0) {
            iJ = 0;
        }
        int iH = f72.h(j);
        if (iH != Integer.MAX_VALUE && (iH = iH + i) < 0) {
            iH = 0;
        }
        int i3 = f72.i(j) + i2;
        if (i3 < 0) {
            i3 = 0;
        }
        int iG = f72.g(j);
        return a(iJ, iH, i3, (iG == Integer.MAX_VALUE || (iG = iG + i2) >= 0) ? iG : 0);
    }

    public static /* synthetic */ long j(int i, int i2, int i3, long j) {
        if ((i3 & 1) != 0) {
            i = 0;
        }
        if ((i3 & 2) != 0) {
            i2 = 0;
        }
        return i(i, i2, j);
    }

    public static final void k(int i, int i2) {
        throw new IllegalArgumentException(ev6.s(i, i2, "Can't represent a width of ", " and height of ", " in Constraints"));
    }

    public static final Void l(int i) {
        throw new IllegalArgumentException(ev6.w("Can't represent a size of ", i, " in Constraints"));
    }
}
