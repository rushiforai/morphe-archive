package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ec, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1698ec {
    A08,
    A03,
    A04,
    A09,
    A02,
    A07,
    A06,
    A05;

    public static byte[] A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-27, -12, -12, 3, -9, -8, -13, -10, -23, -6, -8, 5, 5, 6, 11, 22, 6, 7, -4, 5, -7, -9, 4, 4, 5, 10, 21, 10, 8, -9, -7, 1, -60, -46, -49, -48, -48, -59, -60, 7, 26, 22, 7, 20, 16, 3, 14, 33, 4, 20, 17, 25, 21, 7, 20, 16, 8, 9, 5, 6, 5, -4, -56, -69, -70, -65, -56, -69, -71, -54, -43, -54, -59, -43, -73, -58, -58};
    }

    static {
        A01();
    }

    public static boolean A02(EnumC1698ec enumC1698ec) {
        return A03.equals(enumC1698ec) || A04.equals(enumC1698ec);
    }
}
