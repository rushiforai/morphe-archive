package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* renamed from: com.facebook.ads.redexgen.X.vY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2732vY extends AnimatorListenerAdapter {
    public final /* synthetic */ C06805y A00;
    public final /* synthetic */ boolean A01;

    public C2732vY(C06805y c06805y, boolean z11) {
        this.A00 = c06805y;
        this.A01 = z11;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        super.onAnimationEnd(animator);
        this.A00.A17(this.A00.A0J, true);
        if (!this.A01 && this.A00.A09 != null) {
            this.A00.A09.destroy();
        }
    }
}
