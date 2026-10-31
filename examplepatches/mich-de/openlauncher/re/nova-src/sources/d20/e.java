package d20;

import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import com.teslacoilsw.launcher.launcher3.appprediction.PredictionRowView;

/* loaded from: classes.dex */
public final /* synthetic */ class e implements Interpolator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48897a;

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        switch (this.f48897a) {
            case 0:
                if (f11 < 0.8f) {
                    return 0.0f;
                }
                return (f11 - 0.8f) / 0.2f;
            case 1:
                lz.e eVar = PredictionRowView.B;
                if (f11 < 0.8f) {
                    return 0.0f;
                }
                return (f11 - 0.8f) / 0.2f;
            case 2:
                LinearInterpolator linearInterpolator = s9.k.f86788a;
                return 1.0f;
            default:
                return f11 < 1.0f ? 0.0f : 1.0f;
        }
    }
}
