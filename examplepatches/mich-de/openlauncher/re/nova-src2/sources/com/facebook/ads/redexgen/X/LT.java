package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;

/* loaded from: assets/audience_network/classes.dex */
public class LT implements InterfaceC2050kO {
    public final /* synthetic */ C07207m A00;

    public LT(C07207m c07207m) {
        this.A00 = c07207m;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADt() {
        this.A00.A0C.set(true);
        this.A00.A01.AGt(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADu() {
        this.A00.A01.AGw(this.A00, AdError.CACHE_ERROR);
    }
}
