package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class IR extends AbstractRunnableC2306od {
    public final /* synthetic */ IM A00;
    public final /* synthetic */ C2262nt A01;

    public IR(IM im2, C2262nt c2262nt) {
        this.A00 = im2;
        this.A01 = c2262nt;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2306od
    public final void A01() {
        if (this.A00.A01.A06() != null) {
            this.A00.A01.A06().onError(this.A00.A01.A07(), AbstractC2354pS.A00(this.A01));
        }
    }
}
