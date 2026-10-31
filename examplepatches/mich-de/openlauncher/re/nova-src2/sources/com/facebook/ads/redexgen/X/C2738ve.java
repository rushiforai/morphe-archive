package com.facebook.ads.redexgen.X;

import android.animation.ValueAnimator;

/* renamed from: com.facebook.ads.redexgen.X.ve, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2738ve implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ EE A00;

    public C2738ve(EE ee2) {
        this.A00 = ee2;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        if (this.A00.A0g != null) {
            this.A00.A0g.getLayoutParams().height = ((Integer) valueAnimator.getAnimatedValue()).intValue();
            this.A00.A0g.requestLayout();
        }
    }
}
