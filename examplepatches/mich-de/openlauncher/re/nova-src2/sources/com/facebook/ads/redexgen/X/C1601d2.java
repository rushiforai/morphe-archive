package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.d2, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1601d2 {
    public static byte[] A05;
    public int A00;
    public String A01;
    public final int A02;
    public final int A03;
    public final String A04;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 84);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A05 = new byte[]{98, 84, 86, 93, 86, 65, 82, 71, 86, 125, 86, 68, 122, 87, 27, 26, 19, 94, 70, 64, 71, 19, 81, 86, 19, 80, 82, 95, 95, 86, 87, 19, 81, 86, 85, 92, 65, 86, 19, 65, 86, 71, 65, 90, 86, 69, 90, 93, 84, 19, 90, 87, 64, 29};
    }

    public C1601d2(int i5, int i11) {
        this(Integer.MIN_VALUE, i5, i11);
    }

    public C1601d2(int i5, int i11, int i12) {
        String strA00 = A00(0, 0, 59);
        this.A04 = i5 != Integer.MIN_VALUE ? i5 + A00(0, 1, 25) : strA00;
        this.A02 = i11;
        this.A03 = i12;
        this.A00 = Integer.MIN_VALUE;
        this.A01 = strA00;
    }

    private void A01() {
        if (this.A00 != Integer.MIN_VALUE) {
        } else {
            throw new IllegalStateException(A00(1, 53, 103));
        }
    }

    public final int A03() {
        A01();
        return this.A00;
    }

    public final String A04() {
        A01();
        return this.A01;
    }

    public final void A05() {
        this.A00 = this.A00 == Integer.MIN_VALUE ? this.A02 : this.A00 + this.A03;
        this.A01 = this.A04 + this.A00;
    }
}
