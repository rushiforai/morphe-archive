package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Ek, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0883Ek extends AbstractRunnableC2319oq {
    public final /* synthetic */ AbstractC2652uG A00;

    public C0883Ek(AbstractC2652uG abstractC2652uG) {
        this.A00 = abstractC2652uG;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.isPressed()) {
            this.A00.setPressed(true);
            this.A00.postOnAnimationDelayed(this.A00.A09, 250L);
        } else {
            this.A00.postDelayed(this, this.A00.A07);
        }
    }
}
