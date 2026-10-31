package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;

/* loaded from: assets/audience_network/classes.dex */
public class I3 extends AbstractRunnableC2319oq {
    public final /* synthetic */ Drawable A00;
    public final /* synthetic */ C2036kA A01;
    public final /* synthetic */ GT A02;

    public I3(C2036kA c2036kA, GT gt2, Drawable drawable) {
        this.A01 = c2036kA;
        this.A02 = gt2;
        this.A00 = drawable;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A02.A1P(this.A00);
    }
}
