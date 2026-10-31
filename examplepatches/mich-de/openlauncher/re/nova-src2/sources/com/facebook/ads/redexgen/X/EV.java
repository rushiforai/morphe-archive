package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class EV extends AbstractRunnableC2319oq {
    public final /* synthetic */ ET A00;

    public EV(ET et2) {
        this.A00 = et2;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A0Z) {
            AbstractC2426qc.A0G(1000, this.A00.A0K);
        }
        this.A00.postDelayed(this, 2000L);
    }
}
