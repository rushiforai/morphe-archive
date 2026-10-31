package com.facebook.ads.redexgen.X;

import android.animation.Animator;

/* renamed from: com.facebook.ads.redexgen.X.sn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2561sn implements Animator.AnimatorListener {
    public final /* synthetic */ C2566ss A00;

    public C2561sn(C2566ss c2566ss) {
        this.A00 = c2566ss;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.A00.A08();
        this.A00.A0B();
    }
}
