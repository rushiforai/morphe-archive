package com.facebook.ads.redexgen.X;

import android.util.AttributeSet;
import android.widget.RelativeLayout;

/* loaded from: assets/audience_network/classes.dex */
public abstract class BP extends RelativeLayout implements InterfaceC1663e3 {
    public C0799Be A00;

    public BP(C0958Hi c0958Hi) {
        super(c0958Hi);
    }

    public BP(C0958Hi c0958Hi, AttributeSet attributeSet, int i5) {
        super(c0958Hi, attributeSet, i5);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, -1);
        setLayoutParams(params);
    }

    public void A07() {
    }

    public void A08() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ABd(C0799Be c0799Be) {
        this.A00 = c0799Be;
        A07();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ALp(C0799Be c0799Be) {
        A08();
        this.A00 = null;
    }

    public C0799Be getVideoView() {
        return this.A00;
    }
}
