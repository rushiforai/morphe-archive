package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Ed, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0876Ed implements InterfaceC2369ph {
    public final /* synthetic */ C06896h A00;

    public C0876Ed(C06896h c06896h) {
        this.A00 = c06896h;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() {
        this.A00.A04 = false;
        if (this.A00.A09 != null) {
            this.A00.A09.setToolbarActionMode(this.A00.getCloseButtonStyle());
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        if (this.A00.A09 != null) {
            this.A00.A09.setProgressImmediate(100.0f * (1.0f - (f11 / this.A00.getAdInfo().A0L().A00())));
        }
    }
}
