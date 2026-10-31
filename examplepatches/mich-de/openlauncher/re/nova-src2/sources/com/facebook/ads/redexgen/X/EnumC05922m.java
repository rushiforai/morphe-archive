package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.2m, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC05922m {
    A02,
    A03,
    A04;

    public static byte[] A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 5);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-77, -86, -69, -86, -73, -60, -73, -86, -84, -82, -72, -71, -86, -73, -86, -87, 123, 110, 112, 114, 124, 125, 110, 123, 110, 109, 105, 98, 102, 89, 91, 93, 103, 104, 89, 102, 89, 88};
    }

    static {
        A01();
    }
}
