package com.bytedance.adsdk.zb.lt;

import a2.c;
import android.graphics.Path;
import android.graphics.PointF;
import com.bytedance.adsdk.zb.sya.zb.xkz;

/* loaded from: classes2.dex */
public class lud {
    private static final PointF ycx = new PointF();

    public static boolean sya(float f11, float f12, float f13) {
        return f11 >= f12 && f11 <= f13;
    }

    public static int ycx(int i5, int i11, float f11) {
        return (int) ((f11 * (i11 - i5)) + i5);
    }

    private static int zb(int i5, int i11) {
        int i12 = i5 / i11;
        return (((i5 ^ i11) >= 0) || i5 % i11 == 0) ? i12 : i12 - 1;
    }

    public static PointF ycx(PointF pointF, PointF pointF2) {
        return new PointF(pointF.x + pointF2.x, pointF.y + pointF2.y);
    }

    public static void ycx(xkz xkzVar, Path path) {
        Path path2;
        path.reset();
        PointF pointFYcx = xkzVar.ycx();
        path.moveTo(pointFYcx.x, pointFYcx.y);
        ycx.set(pointFYcx.x, pointFYcx.y);
        int i5 = 0;
        while (i5 < xkzVar.sya().size()) {
            com.bytedance.adsdk.zb.sya.ycx ycxVar = xkzVar.sya().get(i5);
            PointF pointFYcx2 = ycxVar.ycx();
            PointF pointFZb = ycxVar.zb();
            PointF pointFSya = ycxVar.sya();
            PointF pointF = ycx;
            if (pointFYcx2.equals(pointF) && pointFZb.equals(pointFSya)) {
                path.lineTo(pointFSya.x, pointFSya.y);
                path2 = path;
            } else {
                path2 = path;
                path2.cubicTo(pointFYcx2.x, pointFYcx2.y, pointFZb.x, pointFZb.y, pointFSya.x, pointFSya.y);
            }
            pointF.set(pointFSya.x, pointFSya.y);
            i5++;
            path = path2;
        }
        Path path3 = path;
        if (xkzVar.zb()) {
            path3.close();
        }
    }

    public static float zb(float f11, float f12, float f13) {
        return Math.max(f12, Math.min(f13, f11));
    }

    public static float ycx(float f11, float f12, float f13) {
        return c.a(f12, f11, f13, f11);
    }

    public static int ycx(float f11, float f12) {
        return ycx((int) f11, (int) f12);
    }

    private static int ycx(int i5, int i11) {
        return i5 - (i11 * zb(i5, i11));
    }

    public static int ycx(int i5, int i11, int i12) {
        return Math.max(i11, Math.min(i12, i5));
    }
}
