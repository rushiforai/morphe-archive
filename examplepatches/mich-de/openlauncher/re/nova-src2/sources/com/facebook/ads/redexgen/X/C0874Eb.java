package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Eb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0874Eb implements InterfaceC2369ph {
    public final /* synthetic */ C06876f A00;

    public C0874Eb(C06876f c06876f) {
        this.A00 = c06876f;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() {
        this.A00.A0D = false;
        if (this.A00.A05 != null) {
            this.A00.A05.setToolbarActionMode(this.A00.getCloseButtonStyle());
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        if (this.A00.A05 != null) {
            this.A00.A05.setProgressImmediate(100.0f * (1.0f - (f11 / this.A00.getAdInfo().A0L().A00())));
        }
    }
}
