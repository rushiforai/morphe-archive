package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.kY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2060kY {
    A09,
    A05,
    A03,
    A07,
    A08,
    A06,
    A04,
    A0A;

    public static byte[] A00;
    public static String[] A01 = {"BGUY0sC2OmxA2doDHn0327", "P6odxXFdazI3wRxxaautCDOJnE5IXOEL", "YpgtdpkYY", "Rp0aJS5Umkn5PDWDdKEfRtTObnscQr7T", "72Qmn9vtGlfGU4IOG4pO1VGPznnZLp8H", "vlDJQFOxj", "KU9ywI5o6izvQy", "g1Go6XqGfOZw81oZCaqZo9FmGWFOGKat"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 127);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-32, -27, -18, -31, -33, -16, 33, 14, 33, 59, 48, 33, 47, 48, 38, 34, 20, 33, -40, -39, -23, -47, -41, -35, 51, 38, 39, 45, 38, 36, 53, 42, 48, 47, 17, 3, 16, 20, 7, 1, 3, -45, -56, -63, -46, -59, -60, -33, -48, -46, -59, -58, -45, -20, -35, -21, -20};
        if (A01[2].length() == 8) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[0] = "DvjmlCDZrG7ugg1eBxWx0Q";
        strArr[5] = "Ich4sOWHv";
    }

    static {
        A01();
    }
}
