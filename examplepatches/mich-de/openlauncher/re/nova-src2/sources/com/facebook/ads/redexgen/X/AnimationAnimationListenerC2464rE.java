package com.facebook.ads.redexgen.X;

import android.view.animation.Animation;

/* renamed from: com.facebook.ads.redexgen.X.rE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class AnimationAnimationListenerC2464rE implements Animation.AnimationListener {
    public final /* synthetic */ AnonymousClass78 A00;

    public AnimationAnimationListenerC2464rE(AnonymousClass78 anonymousClass78) {
        this.A00 = anonymousClass78;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        this.A00.A0A.finish(16);
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
    }
}
