package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class XB extends IOException {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 95);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-101, -127, 39, 64, 55, 74, 66, 55, 53, 70, 55, 54, -14};
    }

    public XB(Throwable th2) {
        super(A00(2, 11, 115) + th2.getClass().getSimpleName() + A00(0, 2, 2) + th2.getMessage(), th2);
    }
}
