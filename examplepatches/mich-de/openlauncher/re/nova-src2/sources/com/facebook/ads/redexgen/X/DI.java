package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class DI extends AbstractRunnableC2319oq {
    public static byte[] A02;
    public final /* synthetic */ C06805y A00;
    public final /* synthetic */ C5V A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 76);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{38, 17, 2, 2, 1, 22, 13, 10, 3, 68, 13, 10, 0, 1, 2, 13, 10, 13, 16, 1, 8, 29};
    }

    public DI(C06805y c06805y, C5V c5v) {
        this.A00 = c06805y;
        this.A01 = c5v;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (this.A00.A0r.getState() == EnumC1549cC.A02 && this.A00.A0r.getCurrentPositionInMillis() == A00()) {
            this.A00.A13(A00(0, 22, 40));
        }
    }
}
