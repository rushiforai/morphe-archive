package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Cl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0832Cl extends AbstractRunnableC2319oq {
    public static byte[] A02;
    public final /* synthetic */ C06715p A00;
    public final /* synthetic */ C5V A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 85);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{10, 61, 46, 46, 45, 58, 33, 38, 47, 104, 33, 38, 44, 45, 46, 33, 38, 33, 60, 45, 36, 49};
    }

    public C0832Cl(C06715p c06715p, C5V c5v) {
        this.A00 = c06715p;
        this.A01 = c5v;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (this.A00.A0P.getState() == EnumC1549cC.A02 && this.A00.A0P.getCurrentPositionInMillis() == A00()) {
            this.A00.A0S(A00(0, 22, 29));
        }
    }
}
