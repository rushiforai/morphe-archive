package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class DP implements InterfaceC2734va {
    public static byte[] A01;
    public final /* synthetic */ AnonymousClass65 A00;

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
        A01 = new byte[]{34, 36, 50, 37, 8, 57, 54, 33, 62, 48, 54, 35, 62, 56, 57, 8, 62, 54, 53};
    }

    public DP(AnonymousClass65 anonymousClass65) {
        this.A00 = anonymousClass65;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AEL() {
        this.A00.A0e.A00(this.A00.A0h);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AEM() {
        this.A00.A0e.A01(this.A00.A0h);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AG5() {
        this.A00.A0S = false;
        if (this.A00.A0F != null) {
            this.A00.A0F.setProgress(100);
        }
        AbstractC2426qc.A0P(this.A00.A0F, 8);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AGE(String str) throws SecurityException {
        this.A00.A0S = true;
        AbstractC2426qc.A0P(this.A00.A0F, 0);
        if (this.A00.A0E != null) {
            this.A00.A0E.setUrl(str);
        }
        if (!this.A00.A0Q && this.A00.A02 > 1) {
            this.A00.A0Q = true;
            this.A00.A0l(A00(0, 19, 96));
        }
        AnonymousClass65.A05(this.A00);
    }
}
