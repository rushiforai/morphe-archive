package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class ID implements InterfaceC2369ph {
    public final /* synthetic */ int A00;
    public final /* synthetic */ IC A01;

    public ID(IC ic2, int i5) {
        this.A01 = ic2;
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() {
        this.A01.A0C.A0F().ACO();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        float f12 = 1.0f - (f11 / this.A00);
        if (this.A01.A0G != null) {
            this.A01.A0G.setProgressWithAnimation(100.0f * f12);
        }
    }
}
