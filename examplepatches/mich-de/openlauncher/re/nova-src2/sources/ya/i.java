package ya;

import android.widget.EdgeEffect;
import o9.g3;

/* loaded from: classes.dex */
public class i extends EdgeEffect {
    @Override // android.widget.EdgeEffect
    public float getDistance() {
        if (g3.f79853h) {
            return super.getDistance();
        }
        return 0.0f;
    }

    @Override // android.widget.EdgeEffect
    public float onPullDistance(float f11, float f12) {
        if (g3.f79853h) {
            return super.onPullDistance(f11, f12);
        }
        onPull(f11, f12);
        return f11;
    }
}
