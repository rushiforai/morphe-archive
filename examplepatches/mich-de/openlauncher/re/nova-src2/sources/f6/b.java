package f6;

import a2.c;
import android.view.animation.Interpolator;
import h6.c1;

/* loaded from: classes2.dex */
public abstract class b implements Interpolator {

    /* renamed from: a, reason: collision with root package name */
    public final float[] f54336a;

    /* renamed from: b, reason: collision with root package name */
    public final float f54337b;

    public b(float[] fArr) {
        this.f54336a = fArr;
        this.f54337b = 1.0f / (fArr.length - 1);
    }

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        if (f11 >= 1.0f) {
            return 1.0f;
        }
        if (f11 <= 0.0f) {
            return 0.0f;
        }
        float[] fArr = this.f54336a;
        int iMin = Math.min((int) ((fArr.length - 1) * f11), fArr.length - 2);
        float f12 = this.f54337b;
        float f13 = c1.f(iMin, f12, f11, f12);
        float f14 = fArr[iMin];
        return c.a(fArr[iMin + 1], f14, f13, f14);
    }
}
