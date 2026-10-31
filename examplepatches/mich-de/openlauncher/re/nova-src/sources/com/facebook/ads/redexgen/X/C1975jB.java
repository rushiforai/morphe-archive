package com.facebook.ads.redexgen.X;

import android.util.SparseArray;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.jB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1975jB {
    public static byte[] A0H;
    public int A01;
    public int A02;
    public int A06;
    public int A07;
    public long A08;
    public SparseArray<Object> A0G;
    public int A0F = -1;
    public int A05 = 0;
    public int A00 = 0;
    public int A04 = 1;
    public int A03 = 0;
    public boolean A0D = false;
    public boolean A09 = false;
    public boolean A0E = false;
    public boolean A0A = false;
    public boolean A0C = false;
    public boolean A0B = false;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0H, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 97);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0H = new byte[]{-75, -9, 10, 9, -75, -2, 9, -75, -2, 8, -75, -38, -50, 27, -14, 15, 34, 15, -21, -10, -22, 55, 14, 47, 54, 47, 62, 47, 46, 19, 56, 64, 51, 61, 51, 44, 54, 47, 19, 62, 47, 55, 13, 57, 63, 56, 62, 29, 51, 56, 45, 47, 26, 60, 47, 64, 51, 57, 63, 61, 22, 43, 67, 57, 63, 62, 7, -2, -14, 63, 27, 64, 34, 68, 55, 30, 51, 75, 65, 71, 70, 15, -49, -61, 16, -20, 23, 8, 16, -26, 18, 24, 17, 23, -32, -27, -39, 38, 9, 43, 30, 47, 34, 40, 46, 44, 5, 26, 50, 40, 46, 45, 2, 45, 30, 38, -4, 40, 46, 39, 45, -10, -73, -85, -8, -35, 0, -7, -37, -3, -16, -17, -12, -18, -1, -12, 1, -16, -52, -7, -12, -8, -20, -1, -12, -6, -7, -2, -56, -111, -123, -46, -73, -38, -45, -72, -50, -46, -43, -47, -54, -90, -45, -50, -46, -58, -39, -50, -44, -45, -40, -94, -69, -81, -4, -30, 3, 1, 4, -14, 3, 4, 1, -12, -46, -9, -16, -3, -10, -12, -13, -52, -16, 5, 29, 19, 25, 24, -60, 23, 24, 5, 24, 9, -60, 23, 12, 19, 25, 16, 8, -60, 6, 9, -60, 19, 18, 9, -60, 19, 10, -60, -31, 2, -17, 2, -13, 9, -5, -30, -17, 0, -11, -13, 2, -34, -3, 1, -9, 2, -9, -3, -4, -53};
    }

    public final int A03() {
        if (this.A09) {
            return this.A05 - this.A00;
        }
        return this.A03;
    }

    public final void A04(int i5) {
        if ((this.A04 & i5) != 0) {
        } else {
            throw new IllegalStateException(A01(192, 30, 67) + Integer.toBinaryString(i5) + A01(0, 11, 52) + Integer.toBinaryString(this.A04));
        }
    }

    public final void A05(AbstractC1948ik abstractC1948ik) {
        this.A04 = 1;
        this.A03 = abstractC1948ik.A0B();
        this.A09 = false;
        this.A0E = false;
        this.A0A = false;
    }

    public final boolean A06() {
        return this.A0F != -1;
    }

    public final boolean A07() {
        return this.A09;
    }

    public final boolean A08() {
        return this.A0B;
    }

    public final String toString() {
        return A01(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 22, 45) + this.A0F + A01(11, 8, 77) + this.A0G + A01(82, 13, 66) + this.A03 + A01(95, 27, 88) + this.A05 + A01(19, 48, 105) + this.A00 + A01(172, 20, 46) + this.A0D + A01(67, 15, 113) + this.A09 + A01(149, 23, 4) + this.A0C + A01(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, 27, 42) + this.A0B + AbstractJsonLexerKt.END_OBJ;
    }
}
