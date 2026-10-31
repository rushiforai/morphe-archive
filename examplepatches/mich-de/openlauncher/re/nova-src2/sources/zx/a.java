package zx;

import android.animation.TimeInterpolator;

/* loaded from: classes4.dex */
public final class a implements TimeInterpolator {

    /* renamed from: a, reason: collision with root package name */
    public b f98800a;

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        return 1.0f - this.f98800a.getInterpolation(1.0f - f11);
    }
}
