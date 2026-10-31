package com.facebook.ads.redexgen.X;

import android.view.View;

/* loaded from: assets/audience_network/classes.dex */
public class J3 extends AbstractC1944ig {
    public J3(AbstractC1960iw abstractC1960iw) {
        super(abstractC1960iw, null);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A06() {
        return this.A02.A1U();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A07() {
        return this.A02.A1U() - this.A02.A1a();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A08() {
        return this.A02.A1a();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A09() {
        return this.A02.A1V();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0A() {
        return this.A02.A1f();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0B() {
        return this.A02.A1d();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0C() {
        return (this.A02.A1U() - this.A02.A1d()) - this.A02.A1a();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0D(View view) {
        return this.A02.A1i(view) + ((C1961ix) view.getLayoutParams()).bottomMargin;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0E(View view) {
        C1961ix c1961ix = (C1961ix) view.getLayoutParams();
        return this.A02.A1k(view) + c1961ix.topMargin + c1961ix.bottomMargin;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0F(View view) {
        C1961ix c1961ix = (C1961ix) view.getLayoutParams();
        return this.A02.A1l(view) + c1961ix.leftMargin + c1961ix.rightMargin;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0G(View view) {
        return this.A02.A1n(view) - ((C1961ix) view.getLayoutParams()).topMargin;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0H(View view) {
        this.A02.A2T(view, true, this.A01);
        return this.A01.bottom;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final int A0I(View view) {
        this.A02.A2T(view, true, this.A01);
        return this.A01.top;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1944ig
    public final void A0K(int i5) {
        this.A02.A2A(i5);
    }
}
