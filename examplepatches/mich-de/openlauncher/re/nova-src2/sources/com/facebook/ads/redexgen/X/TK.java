package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class TK extends Exception {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 49);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{40, 15, 7, 2, 11, 10, 78, 26, 1, 78, 31, 27, 11, 28, 23, 78, 27, 0, 10, 11, 28, 2, 23, 7, 0, 9, 78, 3, 11, 10, 7, 15, 78, 13, 1, 10, 11, 13, 29};
    }

    public TK(Throwable th2) {
        super(A00(0, 39, 95), th2);
    }
}
