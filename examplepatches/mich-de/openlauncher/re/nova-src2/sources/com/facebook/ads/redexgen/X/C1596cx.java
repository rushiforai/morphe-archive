package com.facebook.ads.redexgen.X;

import android.animation.Animator;

/* renamed from: com.facebook.ads.redexgen.X.cx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1596cx implements Animator.AnimatorListener {
    public final /* synthetic */ C0774Af A00;

    public C1596cx(C0774Af c0774Af) {
        this.A00 = c0774Af;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        this.A00.A09(false);
        this.A00.A04();
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.A00.A01 = EnumC1637dc.A05;
        AbstractC2426qc.A0I(this.A00.A05);
        this.A00.A04();
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }
}
