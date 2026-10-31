package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class I8 extends AbstractRunnableC2306od {
    public final /* synthetic */ I5 A00;
    public final /* synthetic */ C2262nt A01;

    public I8(I5 i5, C2262nt c2262nt) {
        this.A00 = i5;
        this.A01 = c2262nt;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2306od
    public final void A01() {
        if (this.A00.A01.A00() != null) {
            this.A00.A01.A00().onAdError(AbstractC2354pS.A00(this.A01));
        }
    }
}
