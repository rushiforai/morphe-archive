package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;

/* renamed from: com.facebook.ads.redexgen.X.Lg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1055Lg implements InterfaceC2078kr {
    public final /* synthetic */ C07207m A00;

    public C1055Lg(C07207m c07207m) {
        this.A00 = c07207m;
    }

    private void A00(boolean z11) {
        if (!z11) {
            this.A00.A01.AGw(this.A00, AdError.CACHE_ERROR);
        } else {
            this.A00.A0C.set(true);
            this.A00.A01.AGt(this.A00);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEJ() {
        A00(false);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEU() {
        A00(true);
    }
}
