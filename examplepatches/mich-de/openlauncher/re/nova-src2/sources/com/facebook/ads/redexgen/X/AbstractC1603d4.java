package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.d4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1603d4 {
    public static String[] A00 = {"q", b.f42142b, "cPr4W3", "kHXWkKmkRb2eUHnaHguQys1Si10FXsIA", "uZFKxIG3z3l5tcvE1Z6QufsEmHWnbqe6", "qN4HGXOIb", "YM48h", "AHYaa4vORgLBjrBGzfRTL0sqCQyhHS18"};

    public static int A00(byte[] bArr, int i5, int i11) {
        while (i5 < i11) {
            byte b11 = bArr[i5];
            String[] strArr = A00;
            String str = strArr[3];
            String str2 = strArr[7];
            int iCharAt = str.charAt(6);
            int position = str2.charAt(6);
            if (iCharAt == position) {
                throw new RuntimeException();
            }
            String[] strArr2 = A00;
            strArr2[0] = "U";
            strArr2[6] = "9vOO0";
            if (b11 == 71) {
                break;
            }
            i5++;
        }
        return i5;
    }

    public static long A01(C1084Mk c1084Mk, int i5, int i11) {
        c1084Mk.A0f(i5);
        if (c1084Mk.A07() < 5) {
            return -9223372036854775807L;
        }
        int pid = c1084Mk.A0C();
        int tsPacketHeader = 8388608 & pid;
        if (tsPacketHeader != 0) {
            return -9223372036854775807L;
        }
        int tsPacketHeader2 = 2096896 & pid;
        if ((tsPacketHeader2 >> 8) != i11) {
            return -9223372036854775807L;
        }
        int tsPacketHeader3 = pid & 32;
        int tsPacketHeader4 = tsPacketHeader3 != 0 ? 1 : 0;
        if (tsPacketHeader4 == 0) {
            return -9223372036854775807L;
        }
        int tsPacketHeader5 = c1084Mk.A0I();
        if (tsPacketHeader5 >= 7) {
            int iA07 = c1084Mk.A07();
            if (A00[4].charAt(29) == 90) {
                throw new RuntimeException();
            }
            A00[5] = "kSPQfSkaSYbD7hJ";
            if (iA07 >= 7) {
                int tsPacketHeader6 = c1084Mk.A0I();
                if ((tsPacketHeader6 & 16) == 16) {
                    String[] strArr = A00;
                    String str = strArr[3];
                    String str2 = strArr[7];
                    int pid2 = str.charAt(6);
                    int tsPacketHeader7 = str2.charAt(6);
                    if (pid2 != tsPacketHeader7) {
                        String[] strArr2 = A00;
                        strArr2[2] = "1UwvFb";
                        strArr2[1] = b.f42142b;
                        byte[] bArr = new byte[6];
                        int tsPacketHeader8 = bArr.length;
                        c1084Mk.A0k(bArr, 0, tsPacketHeader8);
                        return A02(bArr);
                    }
                    byte[] bArr2 = new byte[6];
                    int tsPacketHeader9 = bArr2.length;
                    c1084Mk.A0k(bArr2, 0, tsPacketHeader9);
                    return A02(bArr2);
                }
            }
        }
        return -9223372036854775807L;
    }

    public static long A02(byte[] bArr) {
        return ((bArr[0] & 255) << 25) | ((bArr[1] & 255) << 17) | ((bArr[2] & 255) << 9) | ((bArr[3] & 255) << 1) | ((255 & bArr[4]) >> 7);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A03(byte[] bArr, int i5, int i11, int i12) {
        int i13 = 0;
        for (int i14 = -4; i14 <= 4; i14++) {
            int i15 = (i14 * 188) + i12;
            String[] strArr = A00;
            String str = strArr[3];
            String str2 = strArr[7];
            int i16 = str.charAt(6);
            int consecutiveSyncByteCount = str2.charAt(6);
            if (i16 != consecutiveSyncByteCount) {
                A00[5] = "yLEdlsl7C97OfRYEy8LQZix7JYsmYm";
                if (i15 < i5 || i15 >= i11) {
                    i13 = 0;
                } else {
                    int i17 = bArr[i15];
                    if (i17 == 71) {
                        i13++;
                        if (i13 == 5) {
                            int i18 = A00[5].length();
                            if (i18 != 29) {
                                String[] strArr2 = A00;
                                strArr2[0] = "8";
                                strArr2[6] = "tDl2F";
                                return true;
                            }
                        }
                    }
                }
            }
            throw new RuntimeException();
        }
        return false;
    }
}
