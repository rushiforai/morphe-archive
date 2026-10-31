package com.facebook.ads.redexgen.X;

import android.animation.ValueAnimator;

/* renamed from: com.facebook.ads.redexgen.X.uB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2647uB implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ C2648uC A00;

    public C2647uB(C2648uC c2648uC) {
        this.A00 = c2648uC;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        this.A00.A00 = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        this.A00.invalidate();
    }
}
