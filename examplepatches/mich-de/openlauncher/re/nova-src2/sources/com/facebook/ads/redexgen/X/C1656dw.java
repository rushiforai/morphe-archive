package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* renamed from: com.facebook.ads.redexgen.X.dw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1656dw extends AnimatorListenerAdapter {
    public final /* synthetic */ C5I A00;

    public C1656dw(C5I c5i) {
        this.A00 = c5i;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.A00.A00.A04.postDelayed(new C0789Au(this), 2000L);
    }
}
