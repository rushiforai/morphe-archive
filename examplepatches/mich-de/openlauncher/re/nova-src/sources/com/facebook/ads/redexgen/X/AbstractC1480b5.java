package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.b5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1480b5 {
    public static byte[] A05;
    public C1501bQ A00;
    public EnumC1481b6 A01;
    public String A02;
    public String A03;
    public byte[] A04;

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 21);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A05 = new byte[]{119};
    }

    public AbstractC1480b5(String str, C1474az c1474az, C1501bQ c1501bQ) {
        this.A03 = A02(0, 0, 77);
        if (str != null) {
            this.A03 = str;
        }
        if (c1474az != null && !c1474az.A06().isEmpty()) {
            this.A03 += A02(0, 1, 35) + c1474az.A06();
        }
        this.A00 = c1501bQ;
    }

    public final C1501bQ A04() {
        return this.A00;
    }

    public final EnumC1481b6 A05() {
        return this.A01;
    }

    public final String A06() {
        return this.A02;
    }

    public final String A07() {
        return this.A03;
    }

    public final byte[] A08() {
        return this.A04;
    }
}
