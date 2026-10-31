package b0;

/* loaded from: classes2.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final float[] f16051a;

    static {
        float f11;
        float fZ;
        float f12;
        float f13;
        float f14;
        float f15;
        float fZ2;
        float f16;
        float f17;
        float f18;
        float[] fArr = new float[101];
        f16051a = fArr;
        float[] fArr2 = new float[101];
        float f19 = 0.0f;
        int i5 = 0;
        float f21 = 0.0f;
        while (true) {
            float f22 = 1.0f;
            if (i5 >= 100) {
                fArr2[100] = 1.0f;
                fArr[100] = 1.0f;
                return;
            }
            float f23 = i5 / 100;
            float f24 = 1.0f;
            while (true) {
                f11 = 2.0f;
                fZ = a2.c.z(f24, f19, 2.0f, f19);
                f12 = f22 - fZ;
                f13 = fZ * 3.0f * f12;
                f14 = fZ * fZ * fZ;
                float f25 = (((fZ * 0.35000002f) + (f12 * 0.175f)) * f13) + f14;
                f15 = f22;
                if (Math.abs(f25 - f23) < 1.0E-5d) {
                    break;
                }
                if (f25 > f23) {
                    f24 = fZ;
                } else {
                    f19 = fZ;
                }
                f22 = f15;
            }
            float f26 = 0.5f;
            fArr[i5] = (((f12 * 0.5f) + fZ) * f13) + f14;
            float f27 = f15;
            while (true) {
                fZ2 = a2.c.z(f27, f21, f11, f21);
                f16 = f15 - fZ2;
                f17 = fZ2 * 3.0f * f16;
                f18 = fZ2 * fZ2 * fZ2;
                float f28 = (((f16 * f26) + fZ2) * f17) + f18;
                if (Math.abs(f28 - f23) >= 1.0E-5d) {
                    if (f28 > f23) {
                        f27 = fZ2;
                    } else {
                        f21 = fZ2;
                    }
                    f26 = 0.5f;
                    f11 = 2.0f;
                }
            }
            fArr2[i5] = (((fZ2 * 0.35000002f) + (f16 * 0.175f)) * f17) + f18;
            i5++;
        }
    }

    public static double a(float f11, float f12) {
        return Math.log((Math.abs(f11) * 0.35f) / f12);
    }

    public static a b(float f11) {
        float f12 = 0.0f;
        float f13 = 1.0f;
        float fD0 = kotlin.ranges.a.d0(f11, 0.0f, 1.0f);
        float f14 = 100;
        int i5 = (int) (f14 * fD0);
        if (i5 < 100) {
            float f15 = i5 / f14;
            int i11 = i5 + 1;
            float f16 = i11 / f14;
            float[] fArr = f16051a;
            float f17 = fArr[i5];
            float f18 = (fArr[i11] - f17) / (f16 - f15);
            float fA = a2.c.a(fD0, f15, f18, f17);
            f12 = f18;
            f13 = fA;
        }
        return new a(f13, f12);
    }
}
