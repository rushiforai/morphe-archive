package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.LayoutTransition;

/* renamed from: com.facebook.ads.redexgen.X.tu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2630tu extends AnimatorListenerAdapter {
    public final /* synthetic */ RunnableC2631tv A00;

    public C2630tu(RunnableC2631tv runnableC2631tv) {
        this.A00 = runnableC2631tv;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        LayoutTransition layoutTransition = new LayoutTransition();
        layoutTransition.setDuration(250L);
        layoutTransition.setDuration(3, 0L);
        layoutTransition.addTransitionListener(new C2629tt(this));
        this.A00.A00.A0N.setLayoutTransition(layoutTransition);
        ((AbstractC2624to) this.A00.A00).A09.setVisibility(8);
        this.A00.A00.A0R.setVisibility(8);
        this.A00.A00.A0Q.setVisibility(8);
    }
}
