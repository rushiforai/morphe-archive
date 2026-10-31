package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class F9 implements InterfaceC2600tQ {
    public final /* synthetic */ F8 A00;

    public F9(F8 f82) {
        this.A00 = f82;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2600tQ
    public final void AE7(boolean z11) {
        this.A00.A0D(z11);
        if (this.A00.A0A && this.A00.A00 != null) {
            this.A00.A00.setEnabled(z11);
            this.A00.A00.setAlpha(z11 ? 1.0f : 0.3f);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2600tQ
    public final void AF0(boolean z11) {
        this.A00.A0D(z11);
        if (this.A00.A0A && this.A00.A02 != null) {
            this.A00.A02.setEnabled(z11);
            this.A00.A02.setAlpha(z11 ? 1.0f : 0.3f);
        }
    }
}
