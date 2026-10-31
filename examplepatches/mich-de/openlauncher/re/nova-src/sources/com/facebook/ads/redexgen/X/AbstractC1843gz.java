package com.facebook.ads.redexgen.X;

import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.gz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1843gz {
    public static final int[] A00 = new int[0];
    public static final long[] A01 = new long[0];
    public static final Object[] A02 = new Object[0];

    public static int A00(int i5) {
        return A01(i5 * 8) / 8;
    }

    public static int A01(int i5) {
        for (int i11 = 4; i11 < 32; i11++) {
            int i12 = 1 << i11;
            if (i5 <= i12 - 12) {
                int i13 = (1 << i11) - 12;
                return i13;
            }
        }
        return i5;
    }

    public static int A02(int[] iArr, int i5, int i11) {
        int midVal = 0;
        int mid = i5 - 1;
        while (midVal <= mid) {
            int lo2 = midVal + mid;
            int hi2 = lo2 >>> 1;
            int lo3 = iArr[hi2];
            if (lo3 < i11) {
                midVal = hi2 + 1;
            } else if (lo3 > i11) {
                mid = hi2 - 1;
            } else {
                return hi2;
            }
        }
        int lo4 = ~midVal;
        return lo4;
    }

    public static int A03(long[] jArr, int i5, long j11) {
        int i11 = 0;
        int i12 = i5 - 1;
        while (i11 <= i12) {
            int lo2 = i11 + i12;
            int i13 = lo2 >>> 1;
            long j12 = jArr[i13];
            if (j12 < j11) {
                i11 = i13 + 1;
            } else if (j12 > j11) {
                i12 = i13 - 1;
            } else {
                return i13;
            }
        }
        int lo3 = ~i11;
        return lo3;
    }

    public static boolean A04(@Nullable Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }
}
