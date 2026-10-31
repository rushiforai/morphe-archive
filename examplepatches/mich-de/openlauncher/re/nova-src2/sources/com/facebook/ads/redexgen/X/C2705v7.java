package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* renamed from: com.facebook.ads.redexgen.X.v7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2705v7 extends AnimatorListenerAdapter {
    public final /* synthetic */ ET A00;
    public final /* synthetic */ boolean A01;

    public C2705v7(ET et2, boolean z11) {
        this.A00 = et2;
        this.A01 = z11;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        super.onAnimationEnd(animator);
        this.A00.A0K.setTranslationY(0.0f);
        this.A00.A0T();
        if (!this.A01 && this.A00.A0I != null) {
            this.A00.A0I.destroy();
        }
        if (this.A00.A0h != null) {
            if (!this.A00.A0E.A2U()) {
                this.A00.A0h.setVisibility(this.A01 ? 8 : 0);
            } else {
                this.A00.A0h.setVisibility(8);
            }
        }
    }
}
