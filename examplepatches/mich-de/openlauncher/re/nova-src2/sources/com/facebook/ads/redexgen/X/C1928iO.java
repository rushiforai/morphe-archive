package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;

/* renamed from: com.facebook.ads.redexgen.X.iO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1928iO extends AnimatorListenerAdapter {
    public final /* synthetic */ View A00;
    public final /* synthetic */ ViewPropertyAnimator A01;
    public final /* synthetic */ C7S A02;
    public final /* synthetic */ AbstractC1978jE A03;

    public C1928iO(C7S c7s, AbstractC1978jE abstractC1978jE, ViewPropertyAnimator viewPropertyAnimator, View view) {
        this.A02 = c7s;
        this.A03 = abstractC1978jE;
        this.A01 = viewPropertyAnimator;
        this.A00 = view;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.A01.setListener(null);
        this.A00.setAlpha(1.0f);
        this.A02.A0V(this.A03);
        this.A02.A06.remove(this.A03);
        this.A02.A0b();
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }
}
