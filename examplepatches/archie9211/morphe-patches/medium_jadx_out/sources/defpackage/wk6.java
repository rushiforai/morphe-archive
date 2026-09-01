package defpackage;

import android.graphics.Matrix;
import android.graphics.PointF;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.PathInterpolator;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wk6 {
    public static xkc b;
    public static final LinearInterpolator a = new LinearInterpolator();
    public static final hx4 c = hx4.d1("t", "s", "e", "o", "i", "h", "to", "ti");
    public static final hx4 d = hx4.d1("x", "y");

    public static Interpolator a(PointF pointF, PointF pointF2) {
        WeakReference weakReference;
        Interpolator pathInterpolator;
        pointF.x = a18.b(pointF.x, -1.0f, 1.0f);
        pointF.y = a18.b(pointF.y, -100.0f, 100.0f);
        pointF2.x = a18.b(pointF2.x, -1.0f, 1.0f);
        float fB = a18.b(pointF2.y, -100.0f, 100.0f);
        pointF2.y = fB;
        float f = pointF.x;
        float f2 = pointF.y;
        float f3 = pointF2.x;
        Matrix matrix = gpe.a;
        int i = f != 0.0f ? (int) (527.0f * f) : 17;
        if (f2 != 0.0f) {
            i = (int) (i * 31 * f2);
        }
        if (f3 != 0.0f) {
            i = (int) (i * 31 * f3);
        }
        if (fB != 0.0f) {
            i = (int) (i * 31 * fB);
        }
        t90 t90Var = xn6.a;
        synchronized (wk6.class) {
            xkc xkcVar = b;
            if (xkcVar == null) {
                xkcVar = new xkc(0);
                b = xkcVar;
            }
            weakReference = (WeakReference) s42.L(xkcVar, i);
        }
        Interpolator interpolator = weakReference != null ? (Interpolator) weakReference.get() : null;
        if (weakReference != null && interpolator != null) {
            return interpolator;
        }
        try {
            pathInterpolator = new PathInterpolator(pointF.x, pointF.y, pointF2.x, pointF2.y);
        } catch (IllegalArgumentException e) {
            pathInterpolator = "The Path cannot loop back on itself.".equals(e.getMessage()) ? new PathInterpolator(Math.min(pointF.x, 1.0f), pointF.y, Math.max(pointF2.x, 0.0f), pointF2.y) : new LinearInterpolator();
        }
        t90 t90Var2 = xn6.a;
        try {
            c(i, new WeakReference(pathInterpolator));
        } catch (ArrayIndexOutOfBoundsException unused) {
        }
        return pathInterpolator;
    }

    /* JADX WARN: Removed duplicated region for block: B:96:0x0227  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.uk6 b(defpackage.id6 r24, defpackage.bc7 r25, float r26, defpackage.mqe r27, boolean r28, boolean r29) {
        /*
            Method dump skipped, instruction units count: 760
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wk6.b(id6, bc7, float, mqe, boolean, boolean):uk6");
    }

    public static void c(int i, WeakReference weakReference) {
        synchronized (wk6.class) {
            b.d(i, weakReference);
        }
    }
}
