package com.facebook.ads.redexgen.X;

import android.text.Layout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.cY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1571cY {
    public static byte[] A0B;
    public static String[] A0C = {"KNc2hdRQInPkvAdwvsVpsb99LufFiSRR", "dZDEfuxfUqYPvIq", "gHZhwAF9WaVK0LTtLC65p1", "DJJP", "YK8MlXejr35lC06DePh64YZonpwrHbW6", "J26EBe1f9Yh4Wqq1LsnGLaZnDVdqLaCD", "IvKViWGbLRbd8GYaH6BKwEyxqHOw5", "sRSoLOyVtLtjPIC"};
    public CharSequence A0A;
    public long A09 = 0;
    public long A08 = 0;
    public int A06 = 2;
    public float A00 = -3.4028235E38f;
    public int A04 = 1;
    public int A03 = 0;
    public float A01 = -3.4028235E38f;
    public int A05 = Integer.MIN_VALUE;
    public float A02 = 1.0f;
    public int A07 = Integer.MIN_VALUE;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 93);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A0B = new byte[]{-16, 9, 6, 9, 10, 18, 9, -69, 15, 0, 19, 15, -36, 7, 4, 2, 9, 8, 0, 9, 15, -43, -69, 38, 52, 49, 69, 67, 67, 18, 68, 52, 31, 48, 65, 66, 52, 65};
    }

    static {
        A06();
    }

    public static float A00(float f11, int i5) {
        if (f11 != -3.4028235E38f && i5 == 0 && (f11 < 0.0f || f11 > 1.0f)) {
            return 1.0f;
        }
        if (f11 != -3.4028235E38f) {
            return f11;
        }
        return i5 == 0 ? 1.0f : -3.4028235E38f;
    }

    public static float A01(int i5) {
        switch (i5) {
            case 4:
                return 0.0f;
            case 5:
                return 1.0f;
            default:
                return 0.5f;
        }
    }

    public static float A02(int i5, float f11) {
        switch (i5) {
            case 0:
                return 1.0f - f11;
            case 1:
                if (f11 <= 0.5f) {
                    return 2.0f * f11;
                }
                float f12 = 1.0f - f11;
                if (A0C[5].charAt(26) == 'j') {
                    throw new RuntimeException();
                }
                A0C[2] = "QaaknMwN1rjCGrnOaZLPGx";
                return f12 * 2.0f;
            case 2:
                return f11;
            default:
                throw new IllegalStateException(String.valueOf(i5));
        }
    }

    public static int A03(int i5) {
        switch (i5) {
            case 1:
            case 4:
                return 0;
            case 2:
            default:
                return 1;
            case 3:
            case 5:
                return 2;
        }
    }

    public static Layout.Alignment A04(int i5) {
        switch (i5) {
            case 1:
            case 4:
                return Layout.Alignment.ALIGN_NORMAL;
            case 2:
                return Layout.Alignment.ALIGN_CENTER;
            case 3:
            case 5:
                return Layout.Alignment.ALIGN_OPPOSITE;
            default:
                MV.A07(A05(23, 15, 114), A05(0, 23, 62) + i5);
                return null;
        }
    }

    public final C1052Ld A07() {
        int iA03;
        float fA01 = this.A01 != -3.4028235E38f ? this.A01 : A01(this.A06);
        if (this.A05 != Integer.MIN_VALUE) {
            iA03 = this.A05;
        } else {
            iA03 = A03(this.A06);
        }
        C1052Ld c1052LdA0A = new C1052Ld().A0F(A04(this.A06)).A07(A00(this.A00, this.A04), this.A04).A09(this.A03).A04(fA01).A0A(iA03);
        float f11 = this.A02;
        float position = A02(iA03, fA01);
        C1052Ld c1052LdA0B = c1052LdA0A.A06(Math.min(f11, position)).A0B(this.A07);
        if (this.A0A != null) {
            c1052LdA0B.A0G(this.A0A);
        }
        return c1052LdA0B;
    }

    public final C1564cR A08() {
        return new C1564cR(A07().A0H(), this.A09, this.A08);
    }
}
