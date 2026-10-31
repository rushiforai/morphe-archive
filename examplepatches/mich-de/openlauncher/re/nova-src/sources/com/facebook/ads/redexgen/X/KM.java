package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public abstract class KM implements InterfaceC2078kr {
    public final boolean A00;

    public abstract void A00();

    public abstract void A01(boolean z11);

    public KM(boolean z11) {
        this.A00 = z11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEJ() {
        if (this.A00) {
            A00();
        } else {
            A01(false);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEU() {
        A01(true);
    }
}
