package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ns, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1118Ns extends IllegalStateException {
    public static byte[] A02;
    public final int A00;
    public final int A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{72, 84, 72, 86, 44, 27, 8, 8, 11, 28, 78, 26, 1, 1, 78, 29, 3, 15, 2, 2, 78, 70};
    }

    public C1118Ns(int i5, int i11) {
        super(A00(4, 18, 37) + i5 + A00(0, 3, 35) + i11 + A00(3, 1, 52));
        this.A00 = i5;
        this.A01 = i11;
    }
}
