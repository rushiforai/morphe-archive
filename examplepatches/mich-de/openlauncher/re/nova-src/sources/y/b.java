package y;

import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public abstract class b extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public static final double f96498a = Math.cos(Math.toRadians(45.0d));

    public static float a(float f11, float f12, boolean z11) {
        if (!z11) {
            return f11;
        }
        return (float) (((1.0d - f96498a) * f12) + f11);
    }

    public static float b(float f11, float f12, boolean z11) {
        if (!z11) {
            return f11 * 1.5f;
        }
        return (float) (((1.0d - f96498a) * f12) + (f11 * 1.5f));
    }
}
