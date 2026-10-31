package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class E5 implements InterfaceC2500ro {
    public static byte[] A01;
    public final /* synthetic */ C6U A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 11);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{80, 79, 67, 81, 121, 84, 67, 71, 66, 95, 121, 82, 73, 121, 85, 78, 73, 81};
    }

    public E5(C6U c6u) {
        this.A00 = c6u;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2500ro
    public final void AFO() {
        this.A00.A0B.A04(EnumC2231nN.A0M, null);
        this.A00.A09.A0F().A6h();
        this.A00.A0H.A0n(A00(0, 18, 45));
        this.A00.A0H.A0d();
    }
}
