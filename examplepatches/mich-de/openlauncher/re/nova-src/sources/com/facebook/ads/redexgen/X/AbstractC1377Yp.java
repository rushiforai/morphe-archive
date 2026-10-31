package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Yp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1377Yp {
    public static byte[] A00;
    public static String[] A01 = {"JKm0JUAjQEUHOkcp6hO5rnWr8MwHHkDW", "TUTC0kMJz1fV", "ctliOTGP2wkkCylecXDLY", "7yUThtqIf", "AJVWBaJPAROkxsDLWVyTf9VXCdLa0S3R", "l9NKwaE5DphjYVOjujGINoU8XccIVo6S", "LcQIihvayP3Cbpd3FHlBSzSyBU3Sxvoc", "huNpIJsJ2h6PoPtozajWK"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 83);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{7, 33, 37, 17, 48, 45, 40, 20, 44, 46, 55, 55, 46, 41, 32, 103, 53, 34, 42, 38, 46, 41, 35, 34, 53, 103, 40, 33, 103, 42, 38, 43, 33, 40, 53, 42, 34, 35, 103, 20, 2, 14, 103, 9, 6, 11, 103, 50, 41, 46, 51, 105};
    }

    static {
        A02();
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A00(C1084Mk c1084Mk) {
        int i5 = 0;
        while (value != 0) {
            int b11 = c1084Mk.A0I();
            i5 += b11;
            if (b11 != 255) {
                return i5;
            }
        }
        return -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A03(long j11, C1084Mk c1084Mk, ZP[] zpArr) {
        while (true) {
            int iA07 = c1084Mk.A07();
            String[] strArr = A01;
            if (strArr[0].charAt(12) == strArr[6].charAt(12)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[0] = "QuwVt3McBrRQsTYg5HbYJlPhURdGltNk";
            strArr2[6] = "E2RIVQJLzAlCF03p6JKrmJJT1m8evFc3";
            if (iA07 > 1) {
                int iA00 = A00(c1084Mk);
                int iA002 = A00(c1084Mk);
                int iA09 = c1084Mk.A09() + iA002;
                if (iA002 != -1) {
                    int payloadType = c1084Mk.A07();
                    if (iA002 > payloadType) {
                        MV.A07(A01(0, 7, 23), A01(7, 45, 20));
                        iA09 = c1084Mk.A0A();
                    } else if (iA00 == 4 && iA002 >= 8) {
                        int iA0I = c1084Mk.A0I();
                        int userIdentifier = c1084Mk.A0M();
                        int providerCode = 0;
                        if (userIdentifier == 49) {
                            providerCode = c1084Mk.A0C();
                        }
                        int iA0I2 = c1084Mk.A0I();
                        if (userIdentifier == 47) {
                            c1084Mk.A0g(1);
                        }
                        boolean z11 = iA0I == 181 && (userIdentifier == 49 || userIdentifier == 47) && iA0I2 == 3;
                        if (userIdentifier == 49) {
                            z11 &= providerCode == 1195456820;
                        }
                        if (z11) {
                            A04(j11, c1084Mk, zpArr);
                        }
                    }
                }
                c1084Mk.A0f(iA09);
            } else {
                return;
            }
        }
    }

    public static void A04(long j11, C1084Mk c1084Mk, ZP[] zpArr) {
        int firstByte = c1084Mk.A0I();
        if (!((firstByte & 64) != 0)) {
            return;
        }
        c1084Mk.A0g(1);
        int i5 = (firstByte & 31) * 3;
        int iA09 = c1084Mk.A09();
        for (ZP zp2 : zpArr) {
            c1084Mk.A0f(iA09);
            zp2.AK9(c1084Mk, i5);
            if (j11 != -9223372036854775807L) {
                String[] strArr = A01;
                if (strArr[0].charAt(12) == strArr[6].charAt(12)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[0] = "lwAucefG6GoIk2MFZH0nph40fdR061wg";
                strArr2[6] = "Yi999lFOlA7299JVgsHEsxtW0HZbsSnk";
                zp2.AKC(j11, 1, i5, 0, null);
            }
        }
    }
}
