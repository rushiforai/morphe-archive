package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Cn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0834Cn extends AbstractRunnableC2319oq {
    public static byte[] A01;
    public final /* synthetic */ C06715p A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 73);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{53, 10, 7, 6, 12, 67, 13, 6, 21, 6, 17, 67, 16, 23, 2, 17, 23, 6, 7, 67, 19, 15, 2, 26, 10, 13, 4};
    }

    public C0834Cn(C06715p c06715p) {
        this.A00 = c06715p;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A0J) {
            this.A00.A0S(A00(0, 27, 42));
        }
    }
}
