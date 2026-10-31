package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.fC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1733fC {
    A06(0),
    A08(1),
    A09(2),
    A03(3),
    A05(4),
    A07(5),
    A04(6),
    A0A(7),
    A0B(10);

    public static byte[] A01;
    public final int A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 11);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-85, -80, -95, 113, 121, 120, 105, -47, -62, -42, -44, -58, -46, -50, -61, -37, 119, 106, 120, 122, 114, 106, -82, -90, -92, -85, -63, -74, -70, -78, -93, -100, -101, -93, -94, -109, -63, -76, -80, -62, -84, -83, -73, -80, -54, -76, -72, -69, -67, -80, -66, -66, -76, -70, -71};
    }

    static {
        A01();
    }

    EnumC1733fC(int i5) {
        this.A00 = i5;
    }
}
