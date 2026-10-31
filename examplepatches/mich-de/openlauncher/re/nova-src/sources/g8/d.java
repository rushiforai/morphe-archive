package g8;

import android.view.animation.AccelerateDecelerateInterpolator;

/* loaded from: classes2.dex */
public final class d extends AccelerateDecelerateInterpolator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57204a;

    @Override // android.view.animation.AccelerateDecelerateInterpolator, android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        switch (this.f57204a) {
            case 0:
                return super.getInterpolation(Math.max(0.0f, (f11 - 0.5f) * 2.0f));
            default:
                return super.getInterpolation(Math.min(1.0f, f11 * 2.0f));
        }
    }
}
