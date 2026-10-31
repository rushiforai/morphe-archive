package androidx.recyclerview.widget;

import android.view.animation.Interpolator;

/* loaded from: classes2.dex */
public final class m0 implements Interpolator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15055a;

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        switch (this.f15055a) {
            case 0:
                return f11 * f11 * f11 * f11 * f11;
            default:
                float f12 = f11 - 1.0f;
                return (f12 * f12 * f12 * f12 * f12) + 1.0f;
        }
    }
}
