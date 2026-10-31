package o9;

import android.animation.TimeInterpolator;

/* loaded from: classes2.dex */
public final class o2 implements TimeInterpolator {

    /* renamed from: a, reason: collision with root package name */
    public final float f80042a = 1.0f / ((0 * 1.0f) + (((float) (-Math.pow(60, -1.0f))) + 1.0f));

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        if (Float.compare(f11, 1.0f) == 0) {
            return 1.0f;
        }
        return ((0 * f11) + ((float) (-Math.pow(60, -f11))) + 1.0f) * this.f80042a;
    }
}
