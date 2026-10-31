package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public abstract /* synthetic */ class PX {
    public static int A00(int i5) {
        return A06(i5, 0, 0);
    }

    public static int A01(int i5) {
        return i5 & 24;
    }

    public static int A02(int i5) {
        return i5 & 384;
    }

    public static int A03(int i5) {
        return i5 & 7;
    }

    public static int A04(int i5) {
        return i5 & 64;
    }

    public static int A05(int i5) {
        return i5 & 32;
    }

    public static int A06(int i5, int i11, int i12) {
        return A07(i5, i11, i12, 0, 128);
    }

    public static int A07(int i5, int i11, int i12, int i13, int i14) {
        return i5 | i11 | i12 | i13 | i14;
    }
}
