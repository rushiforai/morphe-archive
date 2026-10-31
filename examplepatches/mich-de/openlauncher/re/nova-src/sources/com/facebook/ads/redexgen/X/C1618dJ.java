package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.dJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1618dJ {
    public static byte[] A0B;
    public int A00;
    public int A01;
    public Integer A02;
    public String A03;
    public String A04;
    public boolean A05;
    public final String A06;
    public final String A07;
    public final String A08;
    public final String A09;
    public final boolean A0A;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 111);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0B = new byte[]{4, -3, -6, -3, -2, 6, -3};
    }

    public C1618dJ(C1618dJ c1618dJ) {
        this.A04 = A00(0, 0, 45);
        this.A01 = -1;
        this.A00 = -1;
        this.A09 = c1618dJ.A09;
        this.A08 = c1618dJ.A08;
        this.A06 = c1618dJ.A06;
        this.A07 = c1618dJ.A07;
        this.A02 = c1618dJ.A02;
        this.A03 = c1618dJ.A03;
        this.A0A = c1618dJ.A0A;
    }

    public C1618dJ(String str) {
        this.A04 = A00(0, 0, 45);
        this.A01 = -1;
        this.A00 = -1;
        this.A09 = str;
        String strA00 = A00(0, 7, 32);
        this.A08 = strA00;
        this.A06 = strA00;
        this.A07 = strA00;
        this.A02 = null;
        this.A03 = strA00;
        this.A0A = false;
    }

    public C1618dJ(String str, String str2, String str3, String str4, String str5, boolean z11) {
        this.A04 = A00(0, 0, 45);
        this.A01 = -1;
        this.A00 = -1;
        this.A09 = str;
        this.A08 = str2;
        this.A06 = str3;
        this.A07 = str4;
        this.A02 = null;
        this.A03 = str5;
        this.A0A = z11;
    }
}
