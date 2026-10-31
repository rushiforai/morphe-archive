package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Da, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0847Da implements InterfaceC2369ph {
    public final /* synthetic */ C6C A00;

    public C0847Da(C6C c6c) {
        this.A00 = c6c;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() {
        this.A00.A0U.AEd(this.A00.A0K);
        this.A00.A0U.AE6();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        int i5;
        float totalForce = (this.A00.A0K - f11) + (this.A00.A0i ? 0 : this.A00.A0X.getDuration());
        if (this.A00.A0i) {
            i5 = this.A00.A0K;
        } else {
            i5 = this.A00.A0J;
        }
        float seenTime = i5;
        this.A00.A0U.ALx(totalForce / seenTime);
    }
}
