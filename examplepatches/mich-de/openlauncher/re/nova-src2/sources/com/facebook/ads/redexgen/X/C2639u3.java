package com.facebook.ads.redexgen.X;

import android.animation.Animator;

/* renamed from: com.facebook.ads.redexgen.X.u3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2639u3 implements Animator.AnimatorListener {
    public final /* synthetic */ C2640u4 A00;

    public C2639u3(C2640u4 c2640u4) {
        this.A00 = c2640u4;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.A00.A06();
        AbstractC2426qc.A0P(this.A00.A05, 8);
        this.A00.A07.A0F().AEC();
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.A00.A01 = true;
    }
}
