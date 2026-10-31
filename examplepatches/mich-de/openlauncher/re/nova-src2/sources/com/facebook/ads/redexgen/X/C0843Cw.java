package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Cw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0843Cw extends AbstractRunnableC2319oq {
    public final /* synthetic */ int A00;
    public final /* synthetic */ C06785w A01;

    public C0843Cw(C06785w c06785w, int i5) {
        this.A01 = c06785w;
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (this.A01.A01 != null) {
            this.A01.A01.A1T();
        }
        if (!this.A01.A0F() || this.A01.A03) {
            ((D8) this.A01).A09.setToolbarActionMode(this.A01.getCloseButtonStyle());
            ((D8) this.A01).A09.A0A();
        } else {
            this.A01.A0B(this.A00);
        }
        this.A01.A08();
    }
}
