package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class I7 extends AbstractRunnableC2306od {
    public final /* synthetic */ I6 A00;

    public I7(I6 i62) {
        this.A00 = i62;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2306od
    public final void A01() {
        if (this.A00.A01.A01.A00() != null) {
            this.A00.A01.A01.A00().onAdsLoaded();
        }
    }
}
