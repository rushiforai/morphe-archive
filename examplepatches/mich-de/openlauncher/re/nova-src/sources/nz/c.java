package nz;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import y9.z;

/* loaded from: classes.dex */
public interface c {
    int a(int i5, int i11, int i12);

    int b();

    void c(int i5, float f11, boolean z11);

    default TimeInterpolator d(Context context, boolean z11, int i5, Interpolator interpolator) {
        if (i5 > b()) {
            return AnimationUtils.loadInterpolator(context, z11 ? 2131558413 : 2131558412);
        }
        return interpolator;
    }

    z e(int i5, int i11, z zVar, float f11);

    default int f(int i5, boolean z11) {
        return z11 ? i5 : i5 * 2;
    }

    float g();

    float h(int i5, int i11);

    default float i(int i5, int i11) {
        return 0.0f;
    }
}
