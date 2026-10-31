package com.bytedance.adsdk.zb;

import a2.c;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.view.animation.Interpolator;

/* loaded from: classes2.dex */
class dy implements Interpolator {
    private final float[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final float[] f22834zb;

    public dy(Path path) {
        PathMeasure pathMeasure = new PathMeasure(path, false);
        float length = pathMeasure.getLength();
        int i5 = (int) (length / 0.002f);
        int i11 = i5 + 1;
        this.ycx = new float[i11];
        this.f22834zb = new float[i11];
        float[] fArr = new float[2];
        for (int i12 = 0; i12 < i11; i12++) {
            pathMeasure.getPosTan((i12 * length) / i5, fArr, null);
            this.ycx[i12] = fArr[0];
            this.f22834zb[i12] = fArr[1];
        }
    }

    private static Path ycx(float f11, float f12, float f13, float f14) {
        Path path = new Path();
        path.moveTo(0.0f, 0.0f);
        path.cubicTo(f11, f12, f13, f14, 1.0f, 1.0f);
        return path;
    }

    @Override // android.animation.TimeInterpolator
    public float getInterpolation(float f11) {
        if (f11 <= 0.0f) {
            return 0.0f;
        }
        if (f11 >= 1.0f) {
            return 1.0f;
        }
        int length = this.ycx.length - 1;
        int i5 = 0;
        while (length - i5 > 1) {
            int i11 = (i5 + length) / 2;
            if (f11 < this.ycx[i11]) {
                length = i11;
            } else {
                i5 = i11;
            }
        }
        float[] fArr = this.ycx;
        float f12 = fArr[length];
        float f13 = fArr[i5];
        float f14 = f12 - f13;
        if (f14 == 0.0f) {
            return this.f22834zb[i5];
        }
        float f15 = (f11 - f13) / f14;
        float[] fArr2 = this.f22834zb;
        float f16 = fArr2[i5];
        return c.a(fArr2[length], f16, f15, f16);
    }

    public dy(float f11, float f12, float f13, float f14) {
        this(ycx(f11, f12, f13, f14));
    }
}
