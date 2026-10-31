package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.Is, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0993Is implements InterfaceC1981jH {
    public final /* synthetic */ AbstractC1960iw A00;

    public C0993Is(AbstractC1960iw abstractC1960iw) {
        this.A00 = abstractC1960iw;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1981jH
    public final View A7s(int i5) {
        return this.A00.A20(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1981jH
    public final int A7u(View view) {
        return this.A00.A1i(view) + ((C1961ix) view.getLayoutParams()).bottomMargin;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1981jH
    public final int A7v(View view) {
        return this.A00.A1n(view) - ((C1961ix) view.getLayoutParams()).topMargin;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1981jH
    public final int A9J() {
        return this.A00.A1U() - this.A00.A1a();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1981jH
    public final int A9K() {
        return this.A00.A1d();
    }
}
