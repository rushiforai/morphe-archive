package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class DR extends AbstractRunnableC2319oq {
    public static byte[] A01;
    public final /* synthetic */ AnonymousClass65 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 18);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-109, -90, -95, -94, -84, 93, -76, -98, -80, 93, -85, -94, -77, -94, -81, 93, -83, -81, -94, -83, -98, -81, -94, -95};
    }

    public DR(AnonymousClass65 anonymousClass65) {
        this.A00 = anonymousClass65;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A0Y) {
            this.A00.A0f.AHa(A00(0, 24, 43));
        }
    }
}
