package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;
import android.widget.ImageView;

/* loaded from: assets/audience_network/classes.dex */
public class I4 implements InterfaceC2034k8 {
    public final /* synthetic */ ImageView A00;
    public final /* synthetic */ C2036kA A01;
    public final /* synthetic */ GT A02;

    public I4(C2036kA c2036kA, ImageView imageView, GT gt2) {
        this.A01 = c2036kA;
        this.A00 = imageView;
        this.A02 = gt2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2034k8
    public final void AFB(Drawable drawable) {
        GT.A0f(drawable, this.A00);
        this.A02.A1P(drawable);
    }
}
