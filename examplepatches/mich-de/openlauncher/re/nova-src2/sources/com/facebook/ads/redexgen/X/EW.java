package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class EW implements InterfaceC2643u7 {
    public final /* synthetic */ ET A00;

    public EW(ET et2) {
        this.A00 = et2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2643u7
    public final void AEZ() {
        this.A00.A0d.A04(EnumC2231nN.A0J, null);
        if (this.A00.A0c != null) {
            this.A00.A0f(((C07297v) this.A00.A0c).A0O().toString());
        }
        if (this.A00.getNtdHideCallback() != null) {
            this.A00.getNtdHideCallback().AEO(this.A00.A09);
        }
        this.A00.A0i(true);
    }
}
