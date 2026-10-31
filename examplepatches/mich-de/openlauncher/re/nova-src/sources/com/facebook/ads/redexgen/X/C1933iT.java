package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.iT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1933iT {
    public static byte[] A06;
    public static String[] A07 = {"xh4Y4QcmM1wa5ldyXwFix7", "nmU7", "oStcn17TrhEMCT80qINsWqFBzeEgJkSk", "ejnuP30nVsgr2lyZF", "TwVj4lrjiRaSjHpnKGXYnUPcFE6raeBX", "wQpR2en2jkfHgW4", "pxsGGNitIZPjAkQbFzIWarOMOhpj3cU0", "7"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public AbstractC1978jE A04;
    public AbstractC1978jE A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 94);
            if (A07[0].length() == 11) {
                throw new RuntimeException();
            }
            A07[4] = "AHVWCXL94tyjuu8jVJzYXjJpXDntUCwP";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A06 = new byte[]{-52, -64, 6, 18, 15, 13, -8, -35, -103, -115, -45, -33, -36, -38, -58, -86, -18, -30, 48, 39, 57, 10, 49, 46, 38, 39, 52, -1, -77, -89, -5, -10, -33, -60, -70, -82, 2, -3, -25, -53, -52, -15, -22, -9, -16, -18, -46, -9, -17, -8, 4, -8, -11, -19, -47, -8, -11, -19, -18, -5, -58};
    }

    static {
        A01();
    }

    public C1933iT(AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2) {
        this.A05 = abstractC1978jE;
        this.A04 = abstractC1978jE2;
    }

    public C1933iT(AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2, int i5, int i11, int i12, int i13) {
        this(abstractC1978jE, abstractC1978jE2);
        this.A00 = i5;
        this.A01 = i11;
        this.A02 = i12;
        this.A03 = i13;
    }

    public final String toString() {
        return A00(40, 21, 43) + this.A05 + A00(16, 12, 100) + this.A04 + A00(0, 8, 66) + this.A00 + A00(8, 8, 15) + this.A01 + A00(28, 6, 41) + this.A02 + A00(34, 6, 48) + this.A03 + AbstractJsonLexerKt.END_OBJ;
    }
}
