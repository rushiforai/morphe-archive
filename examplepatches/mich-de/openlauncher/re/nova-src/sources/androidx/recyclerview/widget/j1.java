package androidx.recyclerview.widget;

import android.view.animation.Interpolator;

/* loaded from: classes.dex */
public final class j1 implements Interpolator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15007a;

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        float f12;
        float f13;
        float f14;
        switch (this.f15007a) {
            case 0:
            case 2:
                f12 = 1.0f;
                f13 = f11 - 1.0f;
                f14 = f13 * f13 * f13 * f13;
                break;
            case 1:
                return (1.0f - (0.35f / (f11 + 0.35f))) / 0.7407408f;
            default:
                f12 = 1.0f;
                f13 = f11 - 1.0f;
                f14 = f13 * f13;
                break;
        }
        return (f14 * f13) + f12;
    }
}
