package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Jf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1006Jf extends AbstractRunnableC2319oq {
    public final /* synthetic */ HandlerC1801gI A00;

    public C1006Jf(HandlerC1801gI handlerC1801gI) {
        this.A00 = handlerC1801gI;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A00.A09.AJZ(this.A00.A00);
        if (AbstractC2206my.A0I(this.A00.A0A)) {
            this.A00.A0J();
        }
        boolean retryScheduled = this.A00.A0I(AbstractC2206my.A0C(this.A00.A0A));
        if (retryScheduled) {
            return;
        }
        boolean retryScheduled2 = AbstractC2206my.A0E(this.A00.A0A);
        if (retryScheduled2) {
            return;
        }
        AbstractC2153m7.A05(this.A00.A0A);
    }
}
