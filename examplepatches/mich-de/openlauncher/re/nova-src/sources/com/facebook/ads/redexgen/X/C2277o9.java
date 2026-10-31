package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.o9, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2277o9 implements Serializable {
    public static byte[] A03;
    public final String A00;
    public final String A01;
    public final String A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 89);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-78, -90, -17, -13, -25, -19, -21, -37, -8, -14, -61, -59, -71, 12, 14, -5, 13, 2, 13, 5, -2, -42, 7, 48, 38, 5, 35, 52, 38, 15, 39, 54, 35, 38, 35, 54, 35, 11, 54, 39, 47, -22, 54, 43, 54, 46, 39, -1};
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2277o9)) {
            return false;
        }
        C2277o9 c2277o9 = (C2277o9) obj;
        return C1h.A0C(this.A02, c2277o9.A02) && C1h.A0C(this.A01, c2277o9.A01) && C1h.A0C(this.A00, c2277o9.A00);
    }

    public final int hashCode() {
        return ((((this.A02 == null ? 0 : this.A02.hashCode()) * 31) + (this.A01 == null ? 0 : this.A01.hashCode())) * 31) + (this.A00 != null ? this.A00.hashCode() : 0);
    }

    public final String toString() {
        return A00(22, 26, 105) + this.A02 + A00(11, 11, 64) + this.A01 + A00(0, 11, 45) + this.A00 + ')';
    }

    public C2277o9(String str, String str2, String str3) {
        this.A02 = str;
        this.A01 = str2;
        this.A00 = str3;
    }

    public final String A02() {
        return this.A00;
    }

    public final String A03() {
        return this.A01;
    }

    public final String A04() {
        return this.A02;
    }
}
