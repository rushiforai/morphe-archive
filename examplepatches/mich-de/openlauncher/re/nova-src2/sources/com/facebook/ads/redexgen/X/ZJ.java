package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class ZJ {
    public static byte[] A02;
    public static String[] A03 = {"RkyzMIX7dnWayp1aUiY64MAifapwPtFS", "fl7VGE8u07stMfeDiLZA7R0BMTMoHXF", "Qnxxlxr93lHkfrXBSlZByuOxsknIBb4", "GeXZgCrKduoDdAVrUgNSWFxpEmjIuEhu", "VUXA3c5X1C8VWu6XdnQ0d5iUroJRyIhh", "ZfRKTxAtrHC1kn5q6btIUiImK1U6qqdS", "S", "Y2coqyWxqontkjM9vg7"};
    public final ZL A00;
    public final ZL A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{37, 41, 95, 103};
    }

    static {
        A01();
    }

    public ZJ(ZL zl2) {
        this(zl2, zl2);
    }

    public ZJ(ZL zl2, ZL zl3) {
        this.A00 = (ZL) AbstractC1062Ln.A01(zl2);
        this.A01 = (ZL) AbstractC1062Ln.A01(zl3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ZJ zj2 = (ZJ) obj;
        if (this.A00.equals(zj2.A00)) {
            ZL zl2 = this.A01;
            ZL zl3 = zj2.A01;
            String[] strArr = A03;
            if (strArr[3].charAt(30) != strArr[4].charAt(30)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[5] = "AiPoSTC10DQnVaP09bL0aHPjxqzLUIoE";
            strArr2[0] = "cdXwAuXcDVGfJgfiGTnMOeBgOTaeQ70H";
            if (zl2.equals(zl3)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (this.A00.hashCode() * 31) + this.A01.hashCode();
    }

    public final String toString() {
        return A00(2, 1, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) + this.A00 + (this.A00.equals(this.A01) ? A00(0, 0, 38) : A00(0, 2, 115) + this.A01) + A00(3, 1, 64);
    }
}
