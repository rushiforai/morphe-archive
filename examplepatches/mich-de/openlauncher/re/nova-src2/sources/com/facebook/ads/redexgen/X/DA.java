package com.facebook.ads.redexgen.X;

import android.widget.FrameLayout;

/* loaded from: assets/audience_network/classes.dex */
public class DA implements InterfaceC2456r6 {
    public final /* synthetic */ D8 A00;

    public DA(D8 d82) {
        this.A00 = d82;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2456r6
    public final void AFc(int i5) {
        this.A00.A0m();
        if (this.A00.A01 != null) {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
            layoutParams.topMargin = i5;
            this.A00.A01.setLayoutParams(layoutParams);
        }
    }
}
