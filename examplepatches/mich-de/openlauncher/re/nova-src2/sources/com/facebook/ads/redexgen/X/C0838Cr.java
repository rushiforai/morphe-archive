package com.facebook.ads.redexgen.X;

import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;

/* renamed from: com.facebook.ads.redexgen.X.Cr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0838Cr extends AbstractRunnableC2319oq {
    public final /* synthetic */ InterfaceC2500ro A00;
    public final /* synthetic */ C2499rn A01;

    public C0838Cr(C2499rn c2499rn, InterfaceC2500ro interfaceC2500ro) {
        this.A01 = c2499rn;
        this.A00 = interfaceC2500ro;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        alphaAnimation.setDuration(300L);
        alphaAnimation.setInterpolator(new AccelerateInterpolator());
        alphaAnimation.setAnimationListener(new C0839Cs(this));
        this.A01.startAnimation(alphaAnimation);
    }
}
