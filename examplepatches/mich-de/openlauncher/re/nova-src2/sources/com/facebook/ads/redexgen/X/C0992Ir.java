package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Ir, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0992Ir extends AbstractC1950im {
    public final /* synthetic */ C7O A00;

    public C0992Ir(C7O c7o) {
        this.A00 = c7o;
    }

    private final void A00() {
        if (C7O.A1D && this.A00.A0E && this.A00.A0F) {
            AbstractC1880hb.A0D(this.A00, this.A00.A0u);
        } else {
            this.A00.A0A = true;
            this.A00.requestLayout();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1950im
    public final void A01() {
        this.A00.A1u(null);
        this.A00.A0s.A0D = true;
        this.A00.A1T();
        if (!this.A00.A00.A0J()) {
            this.A00.requestLayout();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1950im
    public final void A02(int i5, int i11, Object obj) {
        this.A00.A1u(null);
        if (this.A00.A00.A0M(i5, i11, obj)) {
            A00();
        }
    }
}
