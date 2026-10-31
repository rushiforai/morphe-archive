package com.facebook.ads.redexgen.X;

import android.view.animation.Interpolator;

/* renamed from: com.facebook.ads.redexgen.X.he, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class InterpolatorC1883he implements Interpolator {
    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        float f12 = f11 - 1.0f;
        return (f12 * f12 * f12 * f12 * f12) + 1.0f;
    }
}
