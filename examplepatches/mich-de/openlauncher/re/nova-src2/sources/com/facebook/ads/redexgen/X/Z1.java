package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public abstract class Z1 {
    public static String[] A00 = {"MPeNosSnUXJxAx6mI3JWI0h5U74FiCA7", "kjzKTQHhquf8JsGuO2HgzpcKI6DiQDEE", "m5I4zI5E0q02", "SUKBz8RDpD2tsivFt0mwvILmBo8c01wG", "r9xdFWGVNdOxwZSM6CeCqQnaWsJbT75e", "FmcAr6PO7GTJVn7ylBednreFezo6IsfE", "BJIPVQbelm0s0d58H", "dHAk0OM7BTkqb0E6xESH1QwrQZAQsbTX"};

    public static int A00(C1084Mk c1084Mk, int i5) {
        switch (i5) {
            case 1:
                return 192;
            case 2:
            case 3:
            case 4:
            case 5:
                return 576 << (i5 - 2);
            case 6:
                return c1084Mk.A0I() + 1;
            case 7:
                int iA0M = c1084Mk.A0M() + 1;
                String[] strArr = A00;
                if (strArr[6].length() == strArr[2].length()) {
                    throw new RuntimeException();
                }
                A00[5] = "yCmvVRHIiGzvLgjamsq686WyJ6KQL1S3";
                return iA0M;
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                return 256 << (i5 - 8);
            default:
                return -1;
        }
    }

    public static long A01(Q9 q92, Z5 z52) throws IOException {
        q92.AK3();
        boolean z11 = true;
        q92.A4X(1);
        byte[] bArr = new byte[1];
        q92.AI6(bArr, 0, 1);
        if ((bArr[0] & 1) != 1) {
            z11 = false;
        }
        q92.A4X(2);
        int i5 = z11 ? 7 : 6;
        C1084Mk c1084Mk = new C1084Mk(i5);
        c1084Mk.A0e(AbstractC1385Yx.A00(q92, c1084Mk.A0l(), 0, i5));
        q92.AK3();
        Z0 z02 = new Z0();
        boolean isBlockSizeVariable = A08(c1084Mk, z52, z11, z02);
        if (isBlockSizeVariable) {
            return z02.A00;
        }
        throw L9.A01(null, null);
    }

    public static boolean A02(int i5, Z5 z52) {
        return i5 == 0 || i5 == z52.A01;
    }

    public static boolean A03(int i5, Z5 z52) {
        return i5 <= 7 ? i5 == z52.A02 - 1 : i5 <= 10 && z52.A02 == 2;
    }

    public static boolean A04(C1084Mk c1084Mk, int i5) {
        int iA0I = c1084Mk.A0I();
        int crc = c1084Mk.A09();
        return iA0I == N1.A0J(c1084Mk.A0l(), i5, crc + (-1), 0);
    }

    public static boolean A05(C1084Mk c1084Mk, Z5 z52, int i5) {
        int iA00 = A00(c1084Mk, i5);
        if (iA00 != -1) {
            int blockSizeSamples = z52.A03;
            if (iA00 <= blockSizeSamples) {
                return true;
            }
        }
        return false;
    }

    public static boolean A06(C1084Mk c1084Mk, Z5 z52, int i5) {
        int i11 = z52.A07;
        if (i5 == 0) {
            return true;
        }
        if (i5 <= 11) {
            return i5 == z52.A08;
        }
        String[] strArr = A00;
        if (strArr[7].charAt(3) == strArr[4].charAt(3)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A00;
        strArr2[6] = "5G0c2mDttQsYlpS1b";
        strArr2[2] = "4Phf51yFeYUp";
        if (i5 == 12) {
            return c1084Mk.A0I() * 1000 == i11;
        }
        if (i5 > 14) {
            return false;
        }
        int expectedSampleRate = c1084Mk.A0M();
        if (i5 == 14) {
            expectedSampleRate *= 10;
        }
        return expectedSampleRate == i11;
    }

    public static boolean A07(C1084Mk c1084Mk, Z5 z52, int i5, Z0 z02) {
        int iA09 = c1084Mk.A09();
        long jA0Q = c1084Mk.A0Q();
        long frameHeaderBytes = jA0Q >>> 16;
        if (frameHeaderBytes != i5) {
            return false;
        }
        boolean z11 = ((jA0Q >>> 16) & 1) == 1;
        int i11 = (int) ((jA0Q >> 12) & 15);
        int blockSizeKey = (int) ((jA0Q >> 8) & 15);
        int i12 = (int) ((jA0Q >> 4) & 15);
        long frameHeaderBytes2 = jA0Q >> 1;
        int frameStartPosition = (int) (frameHeaderBytes2 & 7);
        boolean z12 = (jA0Q & 1) == 1;
        if (!A03(i12, z52) || !A02(frameStartPosition, z52) || z12 || !A08(c1084Mk, z52, z11, z02) || !A05(c1084Mk, z52, i11) || !A06(c1084Mk, z52, blockSizeKey)) {
            return false;
        }
        boolean zA04 = A04(c1084Mk, iA09);
        String[] strArr = A00;
        if (strArr[6].length() == strArr[2].length()) {
            throw new RuntimeException();
        }
        A00[5] = "ZQIN96dVqGvu4yOtVUW9aMiWArn7PKuc";
        return zA04;
    }

    public static boolean A08(C1084Mk c1084Mk, Z5 z52, boolean z11, Z0 z02) {
        long utf8Value;
        try {
            long jA0S = c1084Mk.A0S();
            if (z11) {
                utf8Value = jA0S;
            } else {
                long utf8Value2 = z52.A03;
                utf8Value = utf8Value2 * jA0S;
            }
            z02.A00 = utf8Value;
            if (A00[5].charAt(9) != 'G') {
                throw new RuntimeException();
            }
            String[] strArr = A00;
            strArr[6] = "O3SHgxsLwvy5FJDTB";
            strArr[2] = "742QlVi73sOs";
            return true;
        } catch (NumberFormatException unused) {
            return false;
        }
    }

    public static boolean A09(Q9 q92, Z5 z52, int i5, Z0 z02) throws IOException {
        long jA9L = q92.A9L();
        byte[] bArr = new byte[2];
        q92.AI6(bArr, 0, 2);
        if ((((bArr[0] & 255) << 8) | (bArr[1] & 255)) != i5) {
            q92.AK3();
            q92.A4X((int) (jA9L - q92.A9Q()));
            return false;
        }
        C1084Mk c1084Mk = new C1084Mk(16);
        System.arraycopy(bArr, 0, c1084Mk.A0l(), 0, 2);
        byte[] frameStartBytes = c1084Mk.A0l();
        c1084Mk.A0e(AbstractC1385Yx.A00(q92, frameStartBytes, 2, 14));
        q92.AK3();
        q92.A4X((int) (jA9L - q92.A9Q()));
        return A07(c1084Mk, z52, i5, z02);
    }
}
