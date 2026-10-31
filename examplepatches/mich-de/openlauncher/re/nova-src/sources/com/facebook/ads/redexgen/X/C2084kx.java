package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.kx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2084kx {
    public static byte[] A09;
    public static String[] A0A = {"XfFEJYzZGPN2q5HAGj6MgKNVfzLwmSZX", "IEOpES1QDH9OfLZ6kJp7GuGkL18XBoIG", "WALKiAt1LYWQmYrQVF547JQW7ZyvBxoS", "camCesiVcQ", "gegEJgEL8kfxybdRvZS3nVx2Pjrjbaxz", "VPdzUQ79XvyfUeAOXKMfgbC8CxalnODj", "j10tNg164Uuijv40qzFG2IFbsKPXtge5", "FPgW5aqA35oZNLthCad5U5lgXJ4OAu7U"};
    public l5 A01;
    public final int A04;
    public final int A05;
    public final String A06;
    public final String A07;
    public final String A08;
    public float A00 = -1.0f;
    public String A02 = A00(0, 4, 69);
    public boolean A03 = false;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 34);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        String[] strArr = A0A;
        if (strArr[1].charAt(7) == strArr[2].charAt(7)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0A;
        strArr2[0] = "MYUg0L4zDuLwpF69sKnSAkLFZGAyisTY";
        strArr2[3] = "z6mwSfGh97";
        A09 = new byte[]{11, 8, 6, 3};
    }

    static {
        A01();
    }

    public C2084kx(String str, int i5, int i11, String str2, String str3) {
        this.A08 = str;
        this.A04 = i5;
        this.A05 = i11;
        this.A07 = str2;
        this.A06 = str3;
    }
}
