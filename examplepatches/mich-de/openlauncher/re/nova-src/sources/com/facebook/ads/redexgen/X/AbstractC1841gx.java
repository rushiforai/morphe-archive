package com.facebook.ads.redexgen.X;

import android.graphics.Color;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.gx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1841gx {
    public static byte[] A00;
    public static String[] A01 = {"5xFyhJyAmXwpndJ9EoKqTFqqLI0O0t2g", "XKBE22ujheeLcTYagdBtfv4d5l35c1GL", "dLXeMiu6Rni", "1iBW7", "i8dAz", "3kaHypJVzQjnFbgNDhrnWnyYOdOCg92b", "E8vO87QQkuay4qK7aMyGFQLc0ZjeOzJS", "6MpCOYCclTS"};
    public static final ThreadLocal<double[]> A02;

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 52);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A00 = new byte[]{-104, -93, -89, -97, -104, 87, -92, -84, -86, -85, 87, -103, -100, 87, -103, -100, -85, -82, -100, -100, -91, 87, 103, 87, -104, -91, -101, 87, 105, 108, 108, 101, -72, -73, -71, -63, -67, -56, -59, -53, -60, -70, 118, -71, -73, -60, 118, -60, -59, -54, 118, -72, -69, 118, -54, -56, -73, -60, -55, -62, -53, -71, -69, -60, -54, -112, 118, 121, -11, -5, -6, -34, -1, 0, -90, -13, -5, -7, -6, -90, -18, -25, -4, -21, -90, -25, -90, -14, -21, -12, -19, -6, -18, -90, -11, -20, -90, -71, -76};
    }

    static {
        A08();
        A02 = new ThreadLocal<>();
    }

    public static double A00(int i5) {
        double[] dArrA0B = A0B();
        A0A(i5, dArrA0B);
        return dArrA0B[1] / 100.0d;
    }

    public static double A01(int i5, int i11) {
        if (Color.alpha(i11) == 255) {
            if (Color.alpha(i5) < 255) {
                i5 = A04(i5, i11);
            }
            double luminance2 = A00(i5) + 0.05d;
            double luminance1 = A00(i11) + 0.05d;
            return Math.max(luminance2, luminance1) / Math.min(luminance2, luminance1);
        }
        throw new IllegalArgumentException(A07(32, 36, 34) + Integer.toHexString(i11));
    }

    public static int A02(int i5, int i11) {
        if (i11 >= 0) {
            String[] strArr = A01;
            if (strArr[7].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[4] = "QbRpT";
            strArr2[3] = "VTwjf";
            if (i11 <= 255) {
                return (16777215 & i5) | (i11 << 24);
            }
        }
        throw new IllegalArgumentException(A07(0, 32, 3));
    }

    public static int A03(int i5, int i11) {
        return 255 - (((255 - i11) * (255 - i5)) / 255);
    }

    public static int A04(int i5, int i11) {
        int iAlpha = Color.alpha(i11);
        int iAlpha2 = Color.alpha(i5);
        int g11 = A03(iAlpha2, iAlpha);
        int fgAlpha = Color.red(i5);
        int bgAlpha = Color.red(i11);
        int r11 = A06(fgAlpha, iAlpha2, bgAlpha, iAlpha, g11);
        int fgAlpha2 = Color.green(i5);
        int bgAlpha2 = Color.green(i11);
        int a11 = A06(fgAlpha2, iAlpha2, bgAlpha2, iAlpha, g11);
        int fgAlpha3 = Color.blue(i5);
        int bgAlpha3 = Color.blue(i11);
        return Color.argb(g11, r11, a11, A06(fgAlpha3, iAlpha2, bgAlpha3, iAlpha, g11));
    }

    public static int A05(int i5, int i11, float f11) {
        float f12 = 1.0f - f11;
        float inverseRatio = Color.alpha(i11);
        float g11 = (Color.alpha(i5) * f12) + (inverseRatio * f11);
        float inverseRatio2 = Color.red(i11);
        float r11 = (Color.red(i5) * f12) + (inverseRatio2 * f11);
        float a11 = Color.green(i5);
        float inverseRatio3 = Color.green(i11);
        float a12 = (a11 * f12) + (inverseRatio3 * f11);
        float inverseRatio4 = Color.blue(i11);
        float b11 = (Color.blue(i5) * f12) + (inverseRatio4 * f11);
        return Color.argb((int) g11, (int) r11, (int) a12, (int) b11);
    }

    public static int A06(int i5, int i11, int i12, int i13, int i14) {
        if (i14 == 0) {
            return 0;
        }
        int i15 = i5 * 255 * i11;
        if (A01[5].charAt(28) != 'g') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[6] = "EiJ3SZauLYptPcqesCwpBNypQb2YWqb9";
        strArr[0] = "xFHbgEBZ8DdXBDb1YuxLeCnMJFT4PyYq";
        return (i15 + ((i12 * i13) * (255 - i11))) / (i14 * 255);
    }

    public static void A09(int i5, int i11, int i12, double[] dArr) {
        double sb2;
        double sr2;
        double sb3;
        if (dArr.length == 3) {
            double sb4 = i5 / 255.0d;
            if (sb4 < 0.04045d) {
                sb2 = sb4 / 12.92d;
            } else {
                sb2 = Math.pow((sb4 + 0.055d) / 1.055d, 2.4d);
            }
            double sr3 = i11 / 255.0d;
            if (sr3 < 0.04045d) {
                sr2 = sr3 / 12.92d;
            } else {
                sr2 = Math.pow((sr3 + 0.055d) / 1.055d, 2.4d);
            }
            double sb5 = i12 / 255.0d;
            if (sb5 < 0.04045d) {
                sb3 = sb5 / 12.92d;
            } else {
                double sg2 = 0.055d + sb5;
                sb3 = Math.pow(sg2 / 1.055d, 2.4d);
            }
            double sg3 = 0.4124d * sb2;
            dArr[0] = (sg3 + (0.3576d * sr2) + (0.1805d * sb3)) * 100.0d;
            double sg4 = 0.2126d * sb2;
            dArr[1] = (sg4 + (0.7152d * sr2) + (0.0722d * sb3)) * 100.0d;
            double sg5 = 0.0193d * sb2;
            dArr[2] = (sg5 + (0.1192d * sr2) + (0.9505d * sb3)) * 100.0d;
            return;
        }
        throw new IllegalArgumentException(A07(68, 31, 82));
    }

    public static void A0A(int i5, double[] dArr) {
        A09(Color.red(i5), Color.green(i5), Color.blue(i5), dArr);
    }

    public static double[] A0B() {
        double[] dArr = A02.get();
        if (dArr == null) {
            double[] dArr2 = new double[3];
            A02.set(dArr2);
            return dArr2;
        }
        return dArr;
    }
}
