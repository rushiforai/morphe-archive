package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class GA extends AbstractRunnableC2319oq {
    public final /* synthetic */ C2370pi A00;

    public GA(C2370pi c2370pi) {
        this.A00 = c2370pi;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A05()) {
            return;
        }
        this.A00.A02();
        this.A00.A05.postDelayed(this, this.A00.A02);
    }
}
