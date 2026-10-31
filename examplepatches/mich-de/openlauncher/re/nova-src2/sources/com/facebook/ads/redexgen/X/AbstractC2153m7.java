package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.m7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2153m7 {
    public static byte[] A00;
    public static String[] A01 = {"y8PCDKtn8ucpWGHfqNdB7sz1AvxWDZl3", "5Uq5Tef01e5KR7nT6LwcHl3Vg4tg40ar", "x9FTdDf00FrCnddkCjcdWeA", "gJiYN9ifTBNONuuvPUf8ziVgoR00vK3d", "v3Miu0NURb4uLk241XhX4ihrJ8pIqCRx", "uSiAXhU6isZ", "cMhUI2Br8Brps1bGyIGx9oWkH3OZduaS", "WInOHqHvpegDLpa6TzR108vL1QbKC1c7"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] ^ i12) ^ 31;
            if (A01[0].charAt(17) == 'S') {
                throw new RuntimeException();
            }
            A01[0] = "5vWxIODTobtAshUzPXWGHOLgD2JZewLd";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{105, 105, 100, 120, 116, 117, 125, 114, 124, 100, 111, 104, 100, 118, 104, 46, 46, 35, 47, 57, 46, 42, 53, 63, 57, 35, 57, 36, 40, 46, 61, 47, 38, 38, 43, 39, 49, 38, 34, 61, 55, 49, 43, 39, 48, 63, 43, 34, 49, 38, 39, 61, 59, 58};
    }

    static {
        A04();
    }

    public static String A01(C0957Hh c0957Hh) {
        return AbstractC2297oU.A00(c0957Hh).getString(A00(0, 15, 36), null);
    }

    public static String A02(C0957Hh c0957Hh) {
        return AbstractC2297oU.A00(c0957Hh).getString(A00(15, 17, 99), null);
    }

    public static String A03(C0957Hh c0957Hh) {
        return AbstractC2297oU.A00(c0957Hh).getString(A00(32, 22, 107), null);
    }

    public static void A05(C0957Hh c0957Hh) {
        AbstractC2297oU.A00(c0957Hh).edit().remove(A00(32, 22, 107)).apply();
    }

    public static void A06(C0957Hh c0957Hh, String str, String str2) {
        AbstractC2297oU.A00(c0957Hh).edit().putString(A00(32, 22, 107), str).putString(A00(15, 17, 99), str2).putString(A00(0, 15, 36), C2416qS.A07(C2416qS.A00())).apply();
    }
}
