package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Zt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1407Zt {
    A09(A00(145, 13, 65), EnumC1401Zn.A02, true),
    A08(A00(128, 17, 7), EnumC1401Zn.A03, true),
    A07(A00(114, 14, 69), EnumC1401Zn.A03, false),
    A0A(A00(171, 23, 11), EnumC1401Zn.A03, false),
    A0B(A00(158, 13, 70), EnumC1401Zn.A03, true),
    A06(A00(97, 17, 110), EnumC1401Zn.A03, false);

    public static byte[] A03;
    public static String[] A04 = {"5nlxAwyA", "XE2Zsycz8fD7h8FgdoKIBt2o6qMFmPIY", "ofhaw7uVp81FR8wRHHXoQVmraV", "Aw6MVAVF6astqfly", "IHvRq", "3UILp2hbsByEPqyl", "Bb0lGURQLUOEhbLX0rukWyrGFqKWpMNP", "bqLym"};
    public EnumC1401Zn A00;
    public String A01;
    public boolean A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A04[0].length() == 21) {
                throw new RuntimeException();
            }
            A04[6] = "L2okF1EslEaalsNeHTyc5h4gzS7LeSXc";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 64);
            i13++;
        }
    }

    public static void A01() {
        A03 = new byte[]{-84, -77, -82, -82, -81, -68, -55, -66, -71, -75, -81, -72, -55, -77, -72, -80, -71, -24, -25, -29, -10, -9, -12, -25, 1, -27, -15, -16, -24, -21, -23, -102, -106, -117, -115, -113, -105, -113, -104, -98, -87, -112, -103, -100, -105, -117, -98, -99, -57, -61, -72, -70, -68, -60, -68, -59, -53, -42, -64, -69, -54, -6, -4, -17, -16, -17, -2, -19, -14, -17, -18, 9, -21, -18, 9, -4, -17, -3, -6, -7, -8, -3, -17, -3, -71, -69, -82, -81, -82, -67, -84, -79, -56, -66, -69, -75, -68, 16, 23, 18, 18, 19, 32, 13, 34, 29, 25, 19, 28, 13, 23, 28, 20, 29, -21, -22, -26, -7, -6, -9, -22, -28, -24, -12, -13, -21, -18, -20, -73, -77, -88, -86, -84, -76, -84, -75, -69, 116, -83, -74, -71, -76, -88, -69, -70, -15, -19, -30, -28, -26, -18, -26, -17, -11, -82, -22, -27, -12, -10, -8, -21, -20, -21, -6, -23, -18, -27, -5, -8, -14, -7, -69, -67, -80, -79, -80, -65, -82, -77, -80, -81, 120, -84, -81, 120, -67, -80, -66, -69, -70, -71, -66, -80, -66};
    }

    static {
        A01();
    }

    EnumC1407Zt(String str, EnumC1401Zn enumC1401Zn, boolean z11) {
        this.A01 = str;
        this.A00 = enumC1401Zn;
        this.A02 = z11;
    }

    public final EnumC1401Zn A03() {
        return this.A00;
    }

    public final String A04() {
        return this.A01;
    }

    public final boolean A05() {
        return this.A02;
    }
}
