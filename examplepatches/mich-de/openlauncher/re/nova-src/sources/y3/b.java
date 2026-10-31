package y3;

import b.c0;
import h6.c1;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class b {
    public static final long a(int i5, int i11, int i12, int i13) {
        if (!((i12 >= 0) & (i11 >= i5) & (i13 >= i12) & (i5 >= 0))) {
            j.a("maxWidth must be >= than minWidth,\nmaxHeight must be >= than minHeight,\nminWidth and minHeight must be >= 0");
        }
        return h(i5, i11, i12, i13);
    }

    public static /* synthetic */ long b(int i5, int i11, int i12) {
        if ((i12 & 2) != 0) {
            i5 = Integer.MAX_VALUE;
        }
        if ((i12 & 8) != 0) {
            i11 = Integer.MAX_VALUE;
        }
        return a(0, i5, 0, i11);
    }

    public static final int c(int i5) {
        if (i5 < 8191) {
            return 13;
        }
        if (i5 < 32767) {
            return 15;
        }
        if (i5 < 65535) {
            return 16;
        }
        return i5 < 262143 ? 18 : 255;
    }

    public static final long d(long j11, long j12) {
        int i5 = (int) (j12 >> 32);
        int iJ = a.j(j11);
        int iH = a.h(j11);
        if (i5 < iJ) {
            i5 = iJ;
        }
        if (i5 <= iH) {
            iH = i5;
        }
        int i11 = (int) (j12 & 4294967295L);
        int i12 = a.i(j11);
        int iG = a.g(j11);
        if (i11 < i12) {
            i11 = i12;
        }
        if (i11 <= iG) {
            iG = i11;
        }
        return (iH << 32) | (iG & 4294967295L);
    }

    public static final long e(long j11, long j12) {
        int iJ = a.j(j11);
        int iH = a.h(j11);
        int i5 = a.i(j11);
        int iG = a.g(j11);
        int iJ2 = a.j(j12);
        if (iJ2 < iJ) {
            iJ2 = iJ;
        }
        if (iJ2 > iH) {
            iJ2 = iH;
        }
        int iH2 = a.h(j12);
        if (iH2 >= iJ) {
            iJ = iH2;
        }
        if (iJ <= iH) {
            iH = iJ;
        }
        int i11 = a.i(j12);
        if (i11 < i5) {
            i11 = i5;
        }
        if (i11 > iG) {
            i11 = iG;
        }
        int iG2 = a.g(j12);
        if (iG2 >= i5) {
            i5 = iG2;
        }
        if (i5 <= iG) {
            iG = i5;
        }
        return a(iJ2, iH, i11, iG);
    }

    public static final int f(int i5, long j11) {
        int i11 = a.i(j11);
        int iG = a.g(j11);
        if (i5 < i11) {
            i5 = i11;
        }
        return i5 > iG ? iG : i5;
    }

    public static final int g(int i5, long j11) {
        int iJ = a.j(j11);
        int iH = a.h(j11);
        if (i5 < iJ) {
            i5 = iJ;
        }
        return i5 > iH ? iH : i5;
    }

    public static final long h(int i5, int i11, int i12, int i13) {
        int i14 = i13 == Integer.MAX_VALUE ? i12 : i13;
        int iC = c(i14);
        int i15 = i11 == Integer.MAX_VALUE ? i5 : i11;
        int iC2 = c(i15);
        if (iC + iC2 > 31) {
            k(i15, i14);
        }
        int i16 = i11 + 1;
        int i17 = i13 + 1;
        int i18 = iC2 - 13;
        return ((i16 & (~(i16 >> 31))) << 33) | ((i18 >> 1) + (i18 & 1)) | (i5 << 2) | (i12 << (iC2 + 2)) | ((i17 & (~(i17 >> 31))) << (iC2 + 33));
    }

    public static final long i(int i5, int i11, long j11) {
        int iJ = a.j(j11) + i5;
        if (iJ < 0) {
            iJ = 0;
        }
        int iH = a.h(j11);
        if (iH != Integer.MAX_VALUE && (iH = iH + i5) < 0) {
            iH = 0;
        }
        int i12 = a.i(j11) + i11;
        if (i12 < 0) {
            i12 = 0;
        }
        int iG = a.g(j11);
        return a(iJ, iH, i12, (iG == Integer.MAX_VALUE || (iG = iG + i11) >= 0) ? iG : 0);
    }

    public static /* synthetic */ long j(int i5, int i11, int i12, long j11) {
        if ((i12 & 1) != 0) {
            i5 = 0;
        }
        if ((i12 & 2) != 0) {
            i11 = 0;
        }
        return i(i5, i11, j11);
    }

    public static final void k(int i5, int i11) {
        throw new IllegalArgumentException(c1.n(i5, "Can't represent a width of ", " and height of ", i11, " in Constraints"));
    }

    @NotNull
    public static final Void l(int i5) {
        throw new IllegalArgumentException(c0.i(i5, "Can't represent a size of ", " in Constraints"));
    }
}
