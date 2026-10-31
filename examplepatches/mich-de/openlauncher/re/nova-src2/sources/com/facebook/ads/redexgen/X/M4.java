package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class M4 extends AbstractRunnableC2319oq {
    public final /* synthetic */ M0 A00;
    public final /* synthetic */ C6T A01;

    public M4(M0 m02, C6T c6t) {
        this.A00 = m02;
        this.A01 = c6t;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A00.A00.A0A();
        if (this.A00.A00.A0B != null) {
            this.A01.setAdViewabilityChecker(this.A00.A00.A0B);
            this.A00.A00.A0B.A0U();
        }
    }
}
