package defpackage;

import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yw {
    public static final LinearInterpolator a = new LinearInterpolator();
    public static final u94 b = new u94(1);
    public static final u94 c = new u94(0);
    public static final u94 d = new u94(u94.e);

    static {
        new DecelerateInterpolator();
    }

    public static float a(float f, float f2, float f3) {
        return lv8.e(f2, f, f3, f);
    }

    public static float b(float f, float f2, float f3, float f4, float f5) {
        return f5 <= f3 ? f : f5 >= f4 ? f2 : a(f, f2, (f5 - f3) / (f4 - f3));
    }

    public static int c(float f, int i, int i2) {
        return Math.round(f * (i2 - i)) + i;
    }
}
