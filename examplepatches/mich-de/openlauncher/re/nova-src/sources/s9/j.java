package s9;

import android.animation.TimeInterpolator;
import android.view.animation.Interpolator;

/* loaded from: classes.dex */
public final /* synthetic */ class j implements Interpolator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f86785a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f86786b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ TimeInterpolator f86787c;

    public /* synthetic */ j(float f11, float f12, TimeInterpolator timeInterpolator) {
        this.f86785a = f11;
        this.f86786b = f12;
        this.f86787c = timeInterpolator;
    }

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        float f12 = this.f86785a;
        float f13 = this.f86786b;
        if (f11 == f12 && f11 == f13) {
            if (f11 != 0.0f) {
                return 1.0f;
            }
        } else if (f11 >= f12) {
            if (f11 > f13) {
                return 1.0f;
            }
            return this.f86787c.getInterpolation((f11 - f12) / (f13 - f12));
        }
        return 0.0f;
    }
}
