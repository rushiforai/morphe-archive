package com.facebook.ads.redexgen.X;

import android.view.animation.Interpolator;

/* renamed from: com.facebook.ads.redexgen.X.pL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class InterpolatorC2348pL implements Interpolator {
    public final float A00;

    public InterpolatorC2348pL(float f11) {
        this.A00 = f11;
    }

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        return (float) Math.pow(f11, this.A00);
    }
}
