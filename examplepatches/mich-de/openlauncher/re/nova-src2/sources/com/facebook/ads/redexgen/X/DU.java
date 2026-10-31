package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class DU implements InterfaceC2599tP {
    public static byte[] A01;
    public final /* synthetic */ AnonymousClass65 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 6);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-36, -38, -52, -39, -58, -43, -56, -35, -48, -50, -56, -37, -48, -42, -43, -58, -48, -56, -55};
    }

    public DU(AnonymousClass65 anonymousClass65) {
        this.A00 = anonymousClass65;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGC(String str) {
        this.A00.A0S = false;
        if (this.A00.A0F != null) {
            this.A00.A0F.setProgress(100);
            AbstractC2426qc.A0P(this.A00.A0F, 8);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGE(String str) throws SecurityException {
        this.A00.A0S = true;
        if (this.A00.A0F != null) {
            AbstractC2426qc.A0P(this.A00.A0F, 0);
        }
        if (this.A00.A0E != null) {
            this.A00.A0E.setUrl(str);
        }
        if (!this.A00.A0Q && this.A00.A02 > 1) {
            this.A00.A0Q = true;
            this.A00.A0l(A00(0, 19, 97));
        }
        AnonymousClass65.A05(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGf(int i5) {
        if (this.A00.A0S && this.A00.A0F != null) {
            this.A00.A0F.setProgress(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGi(String str) {
        if (this.A00.A0E != null) {
            this.A00.A0E.setTitle(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGl() {
        ((AbstractC0861Do) this.A00).A0D.AEH(14);
    }
}
