package uz;

import android.graphics.Color;
import h6.c1;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final float f91790a;

    /* renamed from: b, reason: collision with root package name */
    public final float f91791b;

    /* renamed from: c, reason: collision with root package name */
    public final float f91792c;

    /* renamed from: d, reason: collision with root package name */
    public final float f91793d;

    /* renamed from: e, reason: collision with root package name */
    public final float f91794e;

    /* renamed from: f, reason: collision with root package name */
    public final float f91795f;

    public a(float f11, float f12, float f13, float f14, float f15, float f16) {
        this.f91790a = f11;
        this.f91791b = f12;
        this.f91792c = f13;
        this.f91793d = f14;
        this.f91794e = f15;
        this.f91795f = f16;
    }

    public static a a(int i5) {
        c cVar = c.f91800k;
        float fB = b.b(Color.red(i5));
        float fB2 = b.b(Color.green(i5));
        float fB3 = b.b(Color.blue(i5));
        float[][] fArr = b.f91799d;
        float[] fArr2 = fArr[0];
        float f11 = (fArr2[2] * fB3) + (fArr2[1] * fB2) + (fArr2[0] * fB);
        float[] fArr3 = fArr[1];
        float f12 = (fArr3[2] * fB3) + (fArr3[1] * fB2) + (fArr3[0] * fB);
        float[] fArr4 = fArr[2];
        float[] fArr5 = {f11, f12, (fB3 * fArr4[2]) + (fB2 * fArr4[1]) + (fB * fArr4[0])};
        float f13 = fArr5[0];
        float[][] fArr6 = b.f91796a;
        float[] fArr7 = fArr6[0];
        float f14 = fArr7[0] * f13;
        float f15 = fArr5[1];
        float f16 = (fArr7[1] * f15) + f14;
        float f17 = fArr5[2];
        float f18 = (fArr7[2] * f17) + f16;
        float[] fArr8 = fArr6[1];
        float f19 = (fArr8[2] * f17) + (fArr8[1] * f15) + (fArr8[0] * f13);
        float[] fArr9 = fArr6[2];
        float f21 = (f17 * fArr9[2]) + (f15 * fArr9[1]) + (f13 * fArr9[0]);
        float[] fArr10 = cVar.f91807g;
        float f22 = cVar.f91809i;
        float f23 = cVar.f91804d;
        float f24 = cVar.f91801a;
        float f25 = fArr10[0] * f18;
        float f26 = fArr10[1] * f19;
        float f27 = fArr10[2] * f21;
        float f28 = cVar.f91808h;
        float fPow = (float) Math.pow((Math.abs(f25) * f28) / 100.0d, 0.42d);
        float fPow2 = (float) Math.pow((Math.abs(f26) * f28) / 100.0d, 0.42d);
        float fPow3 = (float) Math.pow((Math.abs(f27) * f28) / 100.0d, 0.42d);
        float fSignum = ((Math.signum(f25) * 400.0f) * fPow) / (fPow + 27.13f);
        float fSignum2 = ((Math.signum(f26) * 400.0f) * fPow2) / (fPow2 + 27.13f);
        float fSignum3 = ((Math.signum(f27) * 400.0f) * fPow3) / (fPow3 + 27.13f);
        double d5 = fSignum3;
        float f29 = ((float) (((fSignum2 * (-12.0d)) + (fSignum * 11.0d)) + d5)) / 11.0f;
        float f31 = ((float) ((fSignum + fSignum2) - (d5 * 2.0d))) / 9.0f;
        float f32 = fSignum2 * 20.0f;
        float f33 = ((21.0f * fSignum3) + ((fSignum * 20.0f) + f32)) / 20.0f;
        float f34 = (((fSignum * 40.0f) + f32) + fSignum3) / 20.0f;
        float fAtan2 = (((float) Math.atan2(f31, f29)) * 180.0f) / 3.1415927f;
        if (fAtan2 < 0.0f) {
            fAtan2 += 360.0f;
        } else if (fAtan2 >= 360.0f) {
            fAtan2 -= 360.0f;
        }
        float f35 = (3.1415927f * fAtan2) / 180.0f;
        float fPow4 = ((float) Math.pow((f34 * cVar.f91802b) / f24, f23 * cVar.f91810j)) * 100.0f;
        float fPow5 = ((float) Math.pow((((((((float) (Math.cos((((((double) fAtan2) < 20.14d ? 360.0f + fAtan2 : fAtan2) * 3.141592653589793d) / 180.0d) + 2.0d) + 3.8d)) * 0.25f) * 3846.1538f) * cVar.f91805e) * cVar.f91803c) * ((float) Math.sqrt((f31 * f31) + (f29 * f29)))) / (f33 + 0.305f), 0.9d)) * ((float) Math.pow(1.64d - Math.pow(0.29d, cVar.f91806f), 0.73d)) * ((float) Math.sqrt(fPow4 / 100.0d));
        float f36 = (1.7f * fPow4) / ((0.007f * fPow4) + 1.0f);
        float fLog = ((float) Math.log((f22 * fPow5 * 0.0228f) + 1.0f)) * 43.85965f;
        double d11 = f35;
        return new a(fAtan2, fPow5, fPow4, f36, fLog * ((float) Math.cos(d11)), fLog * ((float) Math.sin(d11)));
    }

    public static a b(float f11, float f12, float f13) {
        float f14 = c.f91800k.f91804d;
        float f15 = (1.7f * f11) / ((0.007f * f11) + 1.0f);
        float fLog = ((float) Math.log((r0.f91809i * f12 * 0.0228d) + 1.0d)) * 43.85965f;
        double d5 = (3.1415927f * f13) / 180.0f;
        return new a(f13, f12, f11, f15, fLog * ((float) Math.cos(d5)), fLog * ((float) Math.sin(d5)));
    }

    public static int c(float f11, float f12, float f13) {
        float f14;
        float f15;
        float f16;
        boolean z11;
        float f17;
        c cVar = c.f91800k;
        float f18 = f12;
        if (f18 < 1.0d || Math.round(f13) <= 0.0d || Math.round(f13) >= 100.0d) {
            return b.a(f13);
        }
        float f19 = 0.0f;
        float fMin = f11 < 0.0f ? 0.0f : Math.min(360.0f, f11);
        float f21 = 0.0f;
        boolean z12 = true;
        a aVar = null;
        float fZ = f18;
        while (Math.abs(f21 - f18) >= 0.4f) {
            float f22 = 100.0f;
            float f23 = 1000.0f;
            float f24 = f19;
            float f25 = 1000.0f;
            a aVar2 = null;
            while (true) {
                if (Math.abs(f24 - f22) <= 0.01f) {
                    f14 = fMin;
                    f15 = f19;
                    f16 = fZ;
                    z11 = z12;
                    break;
                }
                float fZ2 = a2.c.z(f22, f24, 2.0f, f24);
                f15 = f19;
                int iD = b(fZ2, fZ, fMin).d(c.f91800k);
                float fC = b.c(iD);
                float fAbs = Math.abs(f13 - fC);
                if (fAbs < 0.2f) {
                    a aVarA = a(iD);
                    f17 = fC;
                    a aVarB = b(aVarA.f91792c, aVarA.f91791b, fMin);
                    f14 = fMin;
                    float f26 = aVarA.f91793d - aVarB.f91793d;
                    float f27 = aVarA.f91794e - aVarB.f91794e;
                    float f28 = aVarA.f91795f - aVarB.f91795f;
                    double dSqrt = Math.sqrt((f28 * f28) + (f27 * f27) + (f26 * f26));
                    f16 = fZ;
                    z11 = z12;
                    float fPow = (float) (Math.pow(dSqrt, 0.63d) * 1.41d);
                    if (fPow <= 1.0f) {
                        f25 = fPow;
                        aVar2 = aVarA;
                        f23 = fAbs;
                    }
                } else {
                    f14 = fMin;
                    f17 = fC;
                    f16 = fZ;
                    z11 = z12;
                }
                if (f23 == f15 && f25 == f15) {
                    break;
                }
                if (f17 < f13) {
                    f24 = fZ2;
                } else {
                    f22 = fZ2;
                }
                fZ = f16;
                f19 = f15;
                fMin = f14;
                z12 = z11;
            }
            if (!z11) {
                if (aVar2 == null) {
                    f18 = f16;
                } else {
                    f21 = f16;
                    aVar = aVar2;
                }
                fZ = a2.c.z(f18, f21, 2.0f, f21);
                f19 = f15;
                fMin = f14;
                z12 = z11;
            } else {
                if (aVar2 != null) {
                    return aVar2.d(cVar);
                }
                fZ = a2.c.z(f18, f21, 2.0f, f21);
                z12 = false;
                f19 = f15;
                fMin = f14;
            }
        }
        return aVar == null ? b.a(f13) : aVar.d(cVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int d(c cVar) {
        float fSqrt;
        float f11 = this.f91791b;
        double d5 = f11;
        float f12 = this.f91792c;
        if (d5 != 0.0d) {
            double d11 = f12;
            fSqrt = d11 == 0.0d ? 0.0f : f11 / ((float) Math.sqrt(d11 / 100.0d));
        }
        float f13 = cVar.f91806f;
        float f14 = cVar.f91808h;
        float fPow = (float) Math.pow(fSqrt / Math.pow(1.64d - Math.pow(0.29d, f13), 0.73d), 1.1111111111111112d);
        double d12 = (this.f91790a * 3.1415927f) / 180.0f;
        float fCos = ((float) (Math.cos(2.0d + d12) + 3.8d)) * 0.25f;
        float fPow2 = cVar.f91801a * ((float) Math.pow(f12 / 100.0d, (1.0d / cVar.f91804d) / cVar.f91810j));
        float f15 = fCos * 3846.1538f * cVar.f91805e * cVar.f91803c;
        float f16 = fPow2 / cVar.f91802b;
        float fSin = (float) Math.sin(d12);
        float fCos2 = (float) Math.cos(d12);
        float f17 = (((0.305f + f16) * 23.0f) * fPow) / (((fPow * 108.0f) * fSin) + (((11.0f * fPow) * fCos2) + (f15 * 23.0f)));
        float f18 = fCos2 * f17;
        float f19 = f17 * fSin;
        float f21 = f16 * 460.0f;
        float f22 = ((288.0f * f19) + ((451.0f * f18) + f21)) / 1403.0f;
        float f23 = c1.f(f19, 261.0f, f21 - (891.0f * f18), 1403.0f);
        float f24 = c1.f(f19, 6300.0f, f21 - (f18 * 220.0f), 1403.0f);
        float f25 = 100.0f / f14;
        float fSignum = Math.signum(f22) * f25 * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f22) * 27.13d) / (400.0d - Math.abs(f22))), 2.380952380952381d));
        float fSignum2 = Math.signum(f23) * f25 * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f23) * 27.13d) / (400.0d - Math.abs(f23))), 2.380952380952381d));
        float fSignum3 = Math.signum(f24) * f25 * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f24) * 27.13d) / (400.0d - Math.abs(f24))), 2.380952380952381d));
        float[] fArr = cVar.f91807g;
        float f26 = fSignum / fArr[0];
        float f27 = fSignum2 / fArr[1];
        float f28 = fSignum3 / fArr[2];
        float[][] fArr2 = b.f91797b;
        float[] fArr3 = fArr2[0];
        float f29 = (fArr3[2] * f28) + (fArr3[1] * f27) + (fArr3[0] * f26);
        float[] fArr4 = fArr2[1];
        float f31 = (fArr4[2] * f28) + (fArr4[1] * f27) + (fArr4[0] * f26);
        float[] fArr5 = fArr2[2];
        return r4.a.e(f29, f31, (f28 * fArr5[2]) + (f27 * fArr5[1]) + (f26 * fArr5[0]));
    }
}
