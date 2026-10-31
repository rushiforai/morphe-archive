package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.sy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2572sy {
    A03,
    A02,
    A04;

    public static byte[] A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 76);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{8, 13, 22, 10, 1, 6, 0, 10, 12, 107, 122, 109, 108, 97, 124, 119, 100, 97, 102, 109, 119, 126, 25, 89, 72, 95, 94, 83, 78, 69, 86, 83, 84, 95, 69, 76, 40, 69, 91, 84, 83, 87, 91, 78, 83, 85, 84};
    }

    static {
        A01();
    }
}
