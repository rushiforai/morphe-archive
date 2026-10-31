package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Dl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0858Dl implements InterfaceC2140lt {
    public final /* synthetic */ C6M A00;

    public C0858Dl(C6M c6m) {
        this.A00 = c6m;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2140lt
    public final void AEy() {
        if (this.A00.A07) {
            C1814gV c1814gV = this.A00.A05;
            if (c1814gV != null) {
                c1814gV.A06();
            }
            FG fg2 = this.A00.A00;
            if (fg2 != null) {
                this.A00.A0D.A5C(fg2.A7L());
            }
        }
        if (((AbstractC0861Do) this.A00).A08.A2H()) {
            this.A00.A0A.setToolbarActionMode(1);
        } else {
            this.A00.A0A.setToolbarActionMode(0);
        }
    }
}
