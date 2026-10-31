package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class CG implements InterfaceC2748vo {
    public final /* synthetic */ C2190mi A00;

    public CG(C2190mi c2190mi) {
        this.A00 = c2190mi;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2748vo
    public final void ALu(int i5) {
        if (this.A00.A0D != null) {
            this.A00.A0D.setCurrentPosition(i5);
        }
        if (this.A00.A0F == null || !this.A00.A0M) {
            return;
        }
        this.A00.A0F.A05(i5);
    }
}
