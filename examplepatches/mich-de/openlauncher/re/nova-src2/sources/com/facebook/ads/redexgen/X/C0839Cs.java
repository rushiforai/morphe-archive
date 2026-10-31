package com.facebook.ads.redexgen.X;

import android.view.animation.Animation;

/* renamed from: com.facebook.ads.redexgen.X.Cs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0839Cs extends AnimationAnimationListenerC2425qb {
    public final /* synthetic */ C0838Cr A00;

    public C0839Cs(C0838Cr c0838Cr) {
        this.A00 = c0838Cr;
    }

    @Override // com.facebook.ads.redexgen.X.AnimationAnimationListenerC2425qb, android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        AbstractC2426qc.A0I(this.A00.A01);
        this.A00.A00.AFO();
    }
}
