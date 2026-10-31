package com.facebook.ads.redexgen.X;

import android.animation.ValueAnimator;

/* renamed from: com.facebook.ads.redexgen.X.vZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2733vZ implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ C06805y A00;

    public C2733vZ(C06805y c06805y) {
        this.A00 = c06805y;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        Integer num = (Integer) valueAnimator.getAnimatedValue();
        this.A00.A0r.getLayoutParams().height = num.intValue();
        this.A00.A0r.requestLayout();
    }
}
