package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class SG implements InterfaceC1176Qk {
    public static byte[] A01;
    public final /* synthetic */ C3Z A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 55);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{71, 115, 98, 111, 105, 38, 117, 111, 104, 109, 38, 99, 116, 116, 105, 116, 41, 1, 0, 13, 5, 39, 11, 0, 1, 7, 37, 17, 0, 13, 11, 54, 1, 10, 0, 1, 22, 1, 22, 110, 111, 82, 109, 100, 100, 113, 108, 109, 84, 98, 104, 102, 118, 115};
    }

    public SG(C3Z c3z) {
        this.A00 = c3z;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AE2(Exception exc) {
        MV.A08(A00(16, 23, 83), A00(0, 16, 49), exc);
        this.A00.A0F.A0D(exc);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AE3(C1172Qg c1172Qg) {
        this.A00.A0F.A0B(c1172Qg);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AE4(C1172Qg c1172Qg) {
        this.A00.A0F.A0C(c1172Qg);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AG7() {
        C3Z.A05(this.A00);
        if (0 != 0) {
            C3Z.A05(this.A00);
            throw new NullPointerException(A00(46, 8, 52));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AG8() {
        C3Z.A05(this.A00);
        if (0 != 0) {
            C3Z.A05(this.A00);
            throw new NullPointerException(A00(39, 7, 54));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AGS(long j11) {
        this.A00.A0F.A03(j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AGT() {
        this.A00.A26();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AH5(boolean z11) {
        this.A00.A0F.A0I(z11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1176Qk
    public final void AHS(int i5, long j11, long j12) {
        this.A00.A0F.A01(i5, j11, j12);
    }
}
