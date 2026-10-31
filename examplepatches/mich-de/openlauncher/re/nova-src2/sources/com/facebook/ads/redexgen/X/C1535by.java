package com.facebook.ads.redexgen.X;

import android.graphics.Color;
import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.by, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1535by {
    public static byte[] A0A;
    public static String[] A0B = {"rFPevkwTuZ0W6hNnnJOVKiBDeaH9oyQa", "1lLJC7xzDA", "pYm2FnuT90skV59", "8Jipc19VElkOYP4Jv1R1tbykTtjf9wfV", "AAI36Et5hktrHm6zGrKJcbfPeZXIVfDt", "2NFnsj8BUU3DYCZ5nnWhiq", "6oEMeAUdfm4SSZpj8CBvNYZOVOOgIiwL", "9UGUqZP3TW"};
    public final float A00;
    public final int A01;
    public final int A02;
    public final Integer A03;
    public final Integer A04;
    public final String A05;
    public final boolean A06;
    public final boolean A07;
    public final boolean A08;
    public final boolean A09;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 22);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A0A = new byte[]{-122, -88, -125, 95, -106, -79, -71, -68, -75, -76, 112, -60, -65, 112, -64, -79, -62, -61, -75, 112, -78, -65, -65, -68, -75, -79, -66, 112, -58, -79, -68, -59, -75, -118, 112, 119, -87, -60, -52, -49, -56, -57, -125, -41, -46, -125, -45, -60, -43, -42, -56, -125, -58, -46, -49, -46, -43, -125, -56, -37, -45, -43, -56, -42, -42, -52, -46, -47, -99, -125, -118, -53, -26, -18, -15, -22, -23, -91, -7, -12, -91, -11, -26, -9, -8, -22, -91, -21, -12, -13, -7, -91, -8, -18, -1, -22, -65, -91, -84, -75, -45, -38, -37, -34, -43, -38, -45, -116, -31, -38, -41, -38, -37, -29, -38, -116, -82, -37, -34, -48, -47, -34, -65, -32, -27, -40, -47, -90, -116, -44, -14, -7, -6, -3, -12, -7, -14, -85, 0, -7, -10, -7, -6, 2, -7, -85, -20, -9, -12, -14, -7, -8, -16, -7, -1, -59, -85, -113, -89, -91, -84, -84, -91, -86, -93, 92, -87, -99, -88, -94, -85, -82, -87, -95, -96, 92, 99, -113, -80, -75, -88, -95, 118, 99, 92, -88, -91, -86, -95, 92, 100, -95, -76, -84, -95, -97, -80, -95, -96, 92, 97, -81, 92, -78, -99, -88, -79, -95, -81, 104, 92, -94, -85, -79, -86, -96, 92, 97, -81, 101, 118, 92, 99, 97, -81, 99, -90, -66, -68, -61, -61, -68, -63, -70, 115, -64, -76, -65, -71, -62, -59, -64, -72, -73, 115, 122, -90, -57, -52, -65, -72, -115, 122, 115, -65, -68, -63, -72, -115, 115, 122, -112, -80, -98, -112, -79, -74, -87, -94, -128, -95, -90, -103, -110, 103};
    }

    static {
        A07();
    }

    public C1535by(String str, int i5, Integer num, Integer num2, float f11, boolean z11, boolean z12, boolean z13, boolean z14, int i11) {
        this.A05 = str;
        this.A01 = i5;
        this.A04 = num;
        this.A03 = num2;
        this.A00 = f11;
        this.A06 = z11;
        this.A07 = z12;
        this.A09 = z13;
        this.A08 = z14;
        this.A02 = i11;
    }

    public static float A00(String str) {
        try {
            return Float.parseFloat(str);
        } catch (NumberFormatException e3) {
            MV.A0A(A06(261, 8, 39), A06(71, 28, 111) + str + A06(2, 1, 70), e3);
            return -3.4028235E38f;
        }
    }

    public static int A01(String str) throws NumberFormatException {
        try {
            int i5 = Integer.parseInt(str.trim());
            if (A08(i5)) {
                return i5;
            }
        } catch (NumberFormatException unused) {
        }
        MV.A07(A06(261, 8, 39), A06(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 28, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) + str);
        return -1;
    }

    public static int A02(String str) throws NumberFormatException {
        try {
            int i5 = Integer.parseInt(str.trim());
            if (A09(i5)) {
                return i5;
            }
        } catch (NumberFormatException unused) {
        }
        MV.A07(A06(261, 8, 39), A06(99, 30, 86) + str);
        return -1;
    }

    public static C1535by A04(String str, C1531bu c1531bu) {
        int iA01;
        Integer numA05;
        Integer numA052;
        float fA00;
        String strA06 = A06(269, 6, 23);
        AbstractC1062Ln.A07(str.startsWith(strA06));
        String[] strArrSplit = TextUtils.split(str.substring(strA06.length()), A06(3, 1, 29));
        int length = strArrSplit.length;
        int i5 = c1531bu.A05;
        String strA062 = A06(261, 8, 39);
        if (length != i5) {
            Integer numValueOf = Integer.valueOf(c1531bu.A05);
            Integer numValueOf2 = Integer.valueOf(strArrSplit.length);
            String[] strArr = A0B;
            if (strArr[0].charAt(21) == strArr[4].charAt(21)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0B;
            strArr2[0] = "VidcKNq39x86Bjo0oiNCcmxKxZFHFTKu";
            strArr2[4] = "FWpgL70kHanP5rDXgWfpR1R1Bb15FL2y";
            MV.A07(strA062, N1.A0n(A06(157, 69, 38), numValueOf, numValueOf2, str));
            return null;
        }
        try {
            String strTrim = strArrSplit[c1531bu.A06].trim();
            if (c1531bu.A00 != -1) {
                iA01 = A01(strArrSplit[c1531bu.A00].trim());
            } else {
                iA01 = -1;
            }
            if (c1531bu.A08 != -1) {
                numA05 = A05(strArrSplit[c1531bu.A08].trim());
            } else {
                numA05 = null;
            }
            if (c1531bu.A07 != -1) {
                numA052 = A05(strArrSplit[c1531bu.A07].trim());
            } else {
                numA052 = null;
            }
            if (c1531bu.A03 != -1) {
                fA00 = A00(strArrSplit[c1531bu.A03].trim());
            } else {
                fA00 = -3.4028235E38f;
            }
            return new C1535by(strTrim, iA01, numA05, numA052, fA00, c1531bu.A01 != -1 && A0A(strArrSplit[c1531bu.A01].trim()), c1531bu.A04 != -1 && A0A(strArrSplit[c1531bu.A04].trim()), c1531bu.A0A != -1 && A0A(strArrSplit[c1531bu.A0A].trim()), c1531bu.A09 != -1 && A0A(strArrSplit[c1531bu.A09].trim()), c1531bu.A02 != -1 ? A02(strArrSplit[c1531bu.A02].trim()) : -1);
        } catch (RuntimeException e3) {
            MV.A0A(strA062, A06(Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 35, 61) + str + A06(2, 1, 70), e3);
            return null;
        }
    }

    public static Integer A05(String str) throws NumberFormatException {
        long j11;
        try {
            if (str.startsWith(A06(0, 2, 74))) {
                j11 = Long.parseLong(str.substring(2), 16);
            } else {
                j11 = Long.parseLong(str);
            }
            AbstractC1062Ln.A07(j11 <= 4294967295L);
            int iA02 = AnonymousClass19.A02(((j11 >> 24) & 255) ^ 255);
            int iA022 = AnonymousClass19.A02((j11 >> 16) & 255);
            int b11 = AnonymousClass19.A02((j11 >> 8) & 255);
            int a11 = AnonymousClass19.A02(j11 & 255);
            return Integer.valueOf(Color.argb(iA02, a11, b11, iA022));
        } catch (IllegalArgumentException e3) {
            MV.A0A(A06(261, 8, 39), A06(36, 35, 77) + str + A06(2, 1, 70), e3);
            return null;
        }
    }

    public static boolean A08(int i5) {
        switch (i5) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
                return true;
            default:
                return false;
        }
    }

    public static boolean A09(int i5) {
        switch (i5) {
            case 1:
            case 3:
                return true;
            case 2:
            default:
                return false;
        }
    }

    public static boolean A0A(String str) throws NumberFormatException {
        try {
            int value = Integer.parseInt(str);
            return value == 1 || value == -1;
        } catch (NumberFormatException e3) {
            MV.A0A(A06(261, 8, 39), A06(4, 32, 58) + str + A06(2, 1, 70), e3);
            return false;
        }
    }
}
