package j2;

import i2.r0;

/* loaded from: classes.dex */
public final class l extends c {

    /* renamed from: d, reason: collision with root package name */
    public static final float[] f68695d;

    /* renamed from: e, reason: collision with root package name */
    public static final float[] f68696e;

    /* renamed from: f, reason: collision with root package name */
    public static final float[] f68697f;

    /* renamed from: g, reason: collision with root package name */
    public static final float[] f68698g;

    static {
        float[] fArrG = j.g(new float[]{0.818933f, 0.032984544f, 0.0482003f, 0.36186674f, 0.9293119f, 0.26436627f, -0.12885971f, 0.03614564f, 0.6338517f}, j.c(a.f68648b.f68649a, new float[]{0.964212f, 1.0f, 0.8251883f}, new float[]{0.95042855f, 1.0f, 1.0889004f}));
        f68695d = fArrG;
        float[] fArr = {0.21045426f, 1.9779985f, 0.025904037f, 0.7936178f, -2.4285922f, 0.78277177f, -0.004072047f, 0.4505937f, -0.80867577f};
        f68696e = fArr;
        f68697f = j.f(fArrG);
        f68698g = j.f(fArr);
    }

    @Override // j2.c
    public final float a(int i5) {
        return i5 == 0 ? 1.0f : 0.5f;
    }

    @Override // j2.c
    public final float b(int i5) {
        return i5 == 0 ? 0.0f : -0.5f;
    }

    @Override // j2.c
    public final long d(float f11, float f12, float f13) {
        if (f11 < 0.0f) {
            f11 = 0.0f;
        }
        if (f11 > 1.0f) {
            f11 = 1.0f;
        }
        if (f12 < -0.5f) {
            f12 = -0.5f;
        }
        if (f12 > 0.5f) {
            f12 = 0.5f;
        }
        if (f13 < -0.5f) {
            f13 = -0.5f;
        }
        float f14 = f13 <= 0.5f ? f13 : 0.5f;
        float[] fArr = f68698g;
        float f15 = (fArr[6] * f14) + (fArr[3] * f12) + (fArr[0] * f11);
        float f16 = (fArr[7] * f14) + (fArr[4] * f12) + (fArr[1] * f11);
        float f17 = (fArr[8] * f14) + (fArr[5] * f12) + (fArr[2] * f11);
        float f18 = f16 * f16 * f16;
        float f19 = f17 * f17 * f17;
        float[] fArr2 = f68697f;
        float f21 = (fArr2[6] * f19) + (fArr2[3] * f18) + (fArr2[0] * f15 * f15 * f15);
        return (Float.floatToRawIntBits((fArr2[7] * f19) + (fArr2[4] * f18) + (fArr2[1] * r11)) & 4294967295L) | (Float.floatToRawIntBits(f21) << 32);
    }

    @Override // j2.c
    public final float e(float f11, float f12, float f13) {
        if (f11 < 0.0f) {
            f11 = 0.0f;
        }
        if (f11 > 1.0f) {
            f11 = 1.0f;
        }
        if (f12 < -0.5f) {
            f12 = -0.5f;
        }
        if (f12 > 0.5f) {
            f12 = 0.5f;
        }
        if (f13 < -0.5f) {
            f13 = -0.5f;
        }
        float f14 = f13 <= 0.5f ? f13 : 0.5f;
        float[] fArr = f68698g;
        float f15 = (fArr[6] * f14) + (fArr[3] * f12) + (fArr[0] * f11);
        float f16 = (fArr[7] * f14) + (fArr[4] * f12) + (fArr[1] * f11);
        float f17 = (fArr[8] * f14) + (fArr[5] * f12) + (fArr[2] * f11);
        float f18 = f15 * f15 * f15;
        float f19 = f16 * f16 * f16;
        float f21 = f17 * f17 * f17;
        float[] fArr2 = f68697f;
        return (fArr2[8] * f21) + (fArr2[5] * f19) + (fArr2[2] * f18);
    }

    @Override // j2.c
    public final long f(float f11, float f12, float f13, float f14, c cVar) {
        float[] fArr = f68695d;
        float f15 = (fArr[6] * f13) + (fArr[3] * f12) + (fArr[0] * f11);
        float f16 = (fArr[7] * f13) + (fArr[4] * f12) + (fArr[1] * f11);
        float f17 = (fArr[8] * f13) + (fArr[5] * f12) + (fArr[2] * f11);
        float fQ = bh.g.Q(f15);
        float fQ2 = bh.g.Q(f16);
        float fQ3 = bh.g.Q(f17);
        float[] fArr2 = f68696e;
        return r0.a((fArr2[6] * fQ3) + (fArr2[3] * fQ2) + (fArr2[0] * fQ), (fArr2[7] * fQ3) + (fArr2[4] * fQ2) + (fArr2[1] * fQ), (fArr2[8] * fQ3) + (fArr2[5] * fQ2) + (fArr2[2] * fQ), f14, cVar);
    }
}
