package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Cm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0833Cm extends AbstractRunnableC2319oq {
    public static byte[] A01;
    public final /* synthetic */ C06715p A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 76);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-50, -31, -36, -35, -25, -104, -17, -39, -21, -104, -26, -35, -18, -35, -22, -104, -24, -22, -35, -24, -39, -22, -35, -36};
    }

    public C0833Cm(C06715p c06715p) {
        this.A00 = c06715p;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A0I) {
            this.A00.A0S(A00(0, 24, 44));
        }
    }
}
