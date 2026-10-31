package e0;

import android.content.Context;
import android.widget.EdgeEffect;

/* loaded from: classes2.dex */
public abstract class n {
    public static EdgeEffect a(Context context) {
        try {
            return new EdgeEffect(context, null);
        } catch (Throwable unused) {
            return new EdgeEffect(context);
        }
    }

    public static float b(EdgeEffect edgeEffect) {
        try {
            return edgeEffect.getDistance();
        } catch (Throwable unused) {
            return 0.0f;
        }
    }

    public static float c(EdgeEffect edgeEffect, float f11, float f12) {
        try {
            return edgeEffect.onPullDistance(f11, f12);
        } catch (Throwable unused) {
            edgeEffect.onPull(f11, f12);
            return 0.0f;
        }
    }
}
