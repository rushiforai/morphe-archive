package r5;

import android.view.animation.Interpolator;

/* loaded from: classes2.dex */
public final class c implements Interpolator {
    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        float f12 = f11 - 1.0f;
        return (f12 * f12 * f12 * f12 * f12) + 1.0f;
    }
}
