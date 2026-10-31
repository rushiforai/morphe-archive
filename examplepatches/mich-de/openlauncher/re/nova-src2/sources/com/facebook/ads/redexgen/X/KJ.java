package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class KJ extends AbstractRunnableC2319oq {
    public final /* synthetic */ KI A00;
    public final /* synthetic */ C2262nt A01;

    public KJ(KI ki, C2262nt c2262nt) {
        this.A00 = ki;
        this.A01 = c2262nt;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A00.A0B.A0F().A6F(this.A01.A03().getErrorCode(), this.A01.A04());
        if (this.A00.A07 != null) {
            this.A00.A07.A0G(this.A01);
        }
    }
}
