package com.facebook.ads.redexgen.X;

import android.view.Surface;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Mp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1089Mp {
    public static byte[] A04;
    public static String[] A05 = {"8Drr5WLvQGx8oFvXaNe23nlg0Kt", "Z9ORLkUQ41ja2LRe53CMFiFK9ShXK0gI", "UrF1BwZm0HEl6dfjvHQX6icCF4Zr9uQT", "bDSGCJXLT05FSy6ySCKVWKMH7MZz", "ND9XA4mApKBLic6nviKaBY3E5dScltWM", "eTPOGPqPo6TJ", "9Pp12", "PksKtj07FDic680KNPQ0CB3EI3hQ6y6y"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final Surface A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 93);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{42, 45, 36, 32, 41, 47, 28, 47, 36, 42, 41, -1, 32, 34, 45, 32, 32, 46, -37, 40, 48, 46, 47, -37, 29, 32, -37, -21, -25, -37, -12, -21, -25, -37, -20, -13, -21, -25, -37, 42, 45, -37, -19, -14, -21};
    }

    static {
        A01();
    }

    public C1089Mp(Surface surface, int i5, int i11) {
        this(surface, i5, i11, 0);
    }

    public C1089Mp(Surface surface, int i5, int i11, int i12) {
        AbstractC1062Ln.A09(i12 == 0 || i12 == 90 || i12 == 180 || i12 == 270, A00(0, 45, 94));
        this.A03 = surface;
        this.A02 = i5;
        this.A00 = i11;
        this.A01 = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        boolean z11 = obj instanceof C1089Mp;
        String[] strArr = A05;
        if (strArr[6].length() == strArr[3].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A05;
        strArr2[6] = "6PP9d";
        strArr2[3] = "u4tCD9pwtLBKy34p2pkoM93Q11Uz";
        if (!z11) {
            return false;
        }
        C1089Mp c1089Mp = (C1089Mp) obj;
        if (this.A02 == c1089Mp.A02 && this.A00 == c1089Mp.A00 && this.A01 == c1089Mp.A01 && this.A03.equals(c1089Mp.A03)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A03.hashCode();
        int i5 = result * 31;
        int result2 = this.A02;
        int result3 = (((i5 + result2) * 31) + this.A00) * 31;
        int result4 = this.A01;
        return result3 + result4;
    }
}
