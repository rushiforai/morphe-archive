package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* renamed from: com.facebook.ads.redexgen.X.dv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1655dv extends AnimatorListenerAdapter {
    public final /* synthetic */ C0788At A00;

    public C1655dv(C0788At c0788At) {
        this.A00 = c0788At;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.A00.A00.setVisibility(8);
    }
}
