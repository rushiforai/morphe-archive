package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.r7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2457r7 {
    A07(C0922Fy.A0D, -1, -15986668, 858468406, true),
    A08(C0922Fy.A0E, Integer.MIN_VALUE, -1, 452984831, false);

    public static byte[] A05;
    public final int A00;
    public final int A01;
    public final int A02;
    public final Integer A03;
    public final boolean A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 106);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{35, 44, 61, 32, 33, 108, 102, 101, 107, 126};
    }

    static {
        A01();
    }

    EnumC2457r7(Integer num, int i5, int i11, int i12, boolean z11) {
        this.A03 = num;
        this.A00 = i5;
        this.A01 = i11;
        this.A02 = i12;
        this.A04 = z11;
    }
}
