package com.facebook.ads.redexgen.X;

import android.view.animation.Interpolator;

/* loaded from: assets/audience_network/classes.dex */
public final class pM implements Interpolator {
    public final float A00;

    public pM(float f11) {
        this.A00 = f11;
    }

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        return (float) (1.0d - Math.pow(1.0f - f11, this.A00));
    }
}
