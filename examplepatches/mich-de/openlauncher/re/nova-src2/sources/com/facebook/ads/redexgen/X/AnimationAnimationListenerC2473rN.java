package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.view.animation.Animation;

/* renamed from: com.facebook.ads.redexgen.X.rN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class AnimationAnimationListenerC2473rN implements Animation.AnimationListener {
    public final /* synthetic */ C1998jY A00;
    public final /* synthetic */ AbstractC0905Fg A01;
    public final /* synthetic */ AbstractC0905Fg A02;

    public AnimationAnimationListenerC2473rN(AbstractC0905Fg abstractC0905Fg, AbstractC0905Fg abstractC0905Fg2, C1998jY c1998jY) {
        this.A01 = abstractC0905Fg;
        this.A02 = abstractC0905Fg2;
        this.A00 = c1998jY;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        this.A01.A06 = false;
        AbstractC2426qc.A0I(this.A02);
        new Handler().postDelayed(new C0908Fj(this), 200L);
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
    }
}
