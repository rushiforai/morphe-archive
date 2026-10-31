package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.fd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1760fd {
    public static byte[] A05;
    public static String[] A06 = {"WwEcR3foVF3js5OXi966KpoMNMHGvjSS", "ge7oMN1QO2mRMl0JRtTl1XSjQjwoqYKQ", "YIR3bGiCxH5f33jIoUexVYgz4NrVh5Xf", "BCyQzpjG8WPrfI0IHDaxEdL7xHet3Qxf", "PYzT2RZAF6XfBXLCuiPxaN2JPy1l2W3", "CR22Lw3h6LYZLAvi8hVx6jgsxvd765Kh", "y4tdfXpdl7xlTAqkRxRINNgRPv0ZWJJ5", "gSSRcUzOmzaPmPK4y5QvxMUe0Q2"};
    public final String A00;
    public final String A01;
    public final String A02;
    public final String A03;
    public final String A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            String[] strArr = A06;
            if (strArr[0].charAt(12) == strArr[6].charAt(12)) {
                throw new RuntimeException();
            }
            A06[4] = "2BwOjGeAIaA5UB4Iq2CqRfmCfiRplru";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 106);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{9, 5, 14, 15};
    }

    static {
        A01();
    }

    public C1760fd(String str, String str2, String str3, String str4, String str5) {
        C1h.A09(str, A00(0, 4, 0));
        this.A02 = str;
        this.A04 = str2;
        this.A03 = str3;
        this.A01 = str4;
        this.A00 = str5;
    }
}
