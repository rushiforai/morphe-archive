package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public enum XO {
    A03;

    public static byte[] A00;
    public static final /* synthetic */ InterfaceC05640p A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 124);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-19, -14, -19, -8, -19, -27, -16, 3, -10, -23, -14, -24, -23, -10, -23, -10, 3, -12, -13, -9, -19, -8, -19, -13, -14, 3, -13, -22, -22, -9, -23, -8, 3, -7, -9};
    }

    static {
        A01();
        A01 = C1q.A01(A02);
    }
}
