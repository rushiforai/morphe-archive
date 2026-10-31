package com.facebook.ads.redexgen.X;

import android.animation.ValueAnimator;

/* renamed from: com.facebook.ads.redexgen.X.v6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2704v6 implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ ET A00;

    public C2704v6(ET et2) {
        this.A00 = et2;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        Integer num = (Integer) valueAnimator.getAnimatedValue();
        if (this.A00.A09 != null) {
            this.A00.A09.getLayoutParams().height = num.intValue();
            this.A00.A09.requestLayout();
        }
    }
}
