package q4;

import android.graphics.Color;
import h6.c1;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final float f83607a;

    /* renamed from: b, reason: collision with root package name */
    public final float f83608b;

    /* renamed from: c, reason: collision with root package name */
    public final float f83609c;

    /* renamed from: d, reason: collision with root package name */
    public final float f83610d;

    /* renamed from: e, reason: collision with root package name */
    public final float f83611e;

    /* renamed from: f, reason: collision with root package name */
    public final float f83612f;

    public a(float f11, float f12, float f13, float f14, float f15, float f16) {
        this.f83607a = f11;
        this.f83608b = f12;
        this.f83609c = f13;
        this.f83610d = f14;
        this.f83611e = f15;
        this.f83612f = f16;
    }

    public static a a(int i5) {
        l lVar = l.f83641k;
        float fE = b.e(Color.red(i5));
        float fE2 = b.e(Color.green(i5));
        float fE3 = b.e(Color.blue(i5));
        float[][] fArr = b.f83616d;
        float[] fArr2 = fArr[0];
        float f11 = (fArr2[2] * fE3) + (fArr2[1] * fE2) + (fArr2[0] * fE);
        float[] fArr3 = fArr[1];
        float f12 = (fArr3[2] * fE3) + (fArr3[1] * fE2) + (fArr3[0] * fE);
        float[] fArr4 = fArr[2];
        float f13 = (fE3 * fArr4[2]) + (fE2 * fArr4[1]) + (fE * fArr4[0]);
        float[][] fArr5 = b.f83613a;
        float[] fArr6 = fArr5[0];
        float f14 = (fArr6[2] * f13) + (fArr6[1] * f12) + (fArr6[0] * f11);
        float[] fArr7 = fArr5[1];
        float f15 = (fArr7[2] * f13) + (fArr7[1] * f12) + (fArr7[0] * f11);
        float[] fArr8 = fArr5[2];
        float f16 = (f13 * fArr8[2]) + (f12 * fArr8[1]) + (f11 * fArr8[0]);
        float[] fArr9 = lVar.f83648g;
        float f17 = lVar.f83650i;
        float f18 = lVar.f83645d;
        float f19 = lVar.f83642a;
        float f21 = fArr9[0] * f14;
        float f22 = fArr9[1] * f15;
        float f23 = fArr9[2] * f16;
        float f24 = lVar.f83649h;
        float fPow = (float) Math.pow((Math.abs(f21) * f24) / 100.0d, 0.42d);
        float fPow2 = (float) Math.pow((Math.abs(f22) * f24) / 100.0d, 0.42d);
        float fPow3 = (float) Math.pow((Math.abs(f23) * f24) / 100.0d, 0.42d);
        float fSignum = ((Math.signum(f21) * 400.0f) * fPow) / (fPow + 27.13f);
        float fSignum2 = ((Math.signum(f22) * 400.0f) * fPow2) / (fPow2 + 27.13f);
        float fSignum3 = ((Math.signum(f23) * 400.0f) * fPow3) / (fPow3 + 27.13f);
        double d5 = fSignum3;
        float f25 = ((float) (((fSignum2 * (-12.0d)) + (fSignum * 11.0d)) + d5)) / 11.0f;
        float f26 = ((float) ((fSignum + fSignum2) - (d5 * 2.0d))) / 9.0f;
        float f27 = fSignum2 * 20.0f;
        float f28 = ((21.0f * fSignum3) + ((fSignum * 20.0f) + f27)) / 20.0f;
        float f29 = (((fSignum * 40.0f) + f27) + fSignum3) / 20.0f;
        float fAtan2 = (((float) Math.atan2(f26, f25)) * 180.0f) / 3.1415927f;
        if (fAtan2 < 0.0f) {
            fAtan2 += 360.0f;
        } else if (fAtan2 >= 360.0f) {
            fAtan2 -= 360.0f;
        }
        float f31 = (3.1415927f * fAtan2) / 180.0f;
        float fPow4 = ((float) Math.pow((f29 * lVar.f83643b) / f19, f18 * lVar.f83651j)) * 100.0f;
        float fPow5 = ((float) Math.pow(1.64d - Math.pow(0.29d, lVar.f83647f), 0.73d)) * ((float) Math.pow((((((((float) (Math.cos((((((double) fAtan2) < 20.14d ? 360.0f + fAtan2 : fAtan2) * 3.141592653589793d) / 180.0d) + 2.0d) + 3.8d)) * 0.25f) * 3846.1538f) * lVar.f83646e) * lVar.f83644c) * ((float) Math.sqrt((f26 * f26) + (f25 * f25)))) / (f28 + 0.305f), 0.9d)) * ((float) Math.sqrt(fPow4 / 100.0d));
        float f32 = (1.7f * fPow4) / ((0.007f * fPow4) + 1.0f);
        float fLog = ((float) Math.log((f17 * fPow5 * 0.0228f) + 1.0f)) * 43.85965f;
        double d11 = f31;
        return new a(fAtan2, fPow5, fPow4, f32, fLog * ((float) Math.cos(d11)), fLog * ((float) Math.sin(d11)));
    }

    public static a b(float f11, float f12, float f13) {
        float f14 = l.f83641k.f83645d;
        float f15 = (1.7f * f11) / ((0.007f * f11) + 1.0f);
        float fLog = ((float) Math.log((r0.f83650i * f12 * 0.0228d) + 1.0d)) * 43.85965f;
        double d5 = (3.1415927f * f13) / 180.0f;
        return new a(f13, f12, f11, f15, fLog * ((float) Math.cos(d5)), fLog * ((float) Math.sin(d5)));
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int c(l lVar) {
        float fSqrt;
        float f11 = this.f83608b;
        double d5 = f11;
        float f12 = this.f83609c;
        if (d5 != 0.0d) {
            double d11 = f12;
            fSqrt = d11 == 0.0d ? 0.0f : f11 / ((float) Math.sqrt(d11 / 100.0d));
        }
        float f13 = lVar.f83647f;
        float f14 = lVar.f83649h;
        float fPow = (float) Math.pow(fSqrt / Math.pow(1.64d - Math.pow(0.29d, f13), 0.73d), 1.1111111111111112d);
        double d12 = (this.f83607a * 3.1415927f) / 180.0f;
        float fCos = ((float) (Math.cos(2.0d + d12) + 3.8d)) * 0.25f;
        float fPow2 = lVar.f83642a * ((float) Math.pow(f12 / 100.0d, (1.0d / lVar.f83645d) / lVar.f83651j));
        float f15 = fCos * 3846.1538f * lVar.f83646e * lVar.f83644c;
        float f16 = fPow2 / lVar.f83643b;
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
        float[] fArr = lVar.f83648g;
        float f26 = fSignum / fArr[0];
        float f27 = fSignum2 / fArr[1];
        float f28 = fSignum3 / fArr[2];
        float[][] fArr2 = b.f83614b;
        float[] fArr3 = fArr2[0];
        float f29 = (fArr3[2] * f28) + (fArr3[1] * f27) + (fArr3[0] * f26);
        float[] fArr4 = fArr2[1];
        float f31 = (fArr4[2] * f28) + (fArr4[1] * f27) + (fArr4[0] * f26);
        float[] fArr5 = fArr2[2];
        return r4.a.e(f29, f31, (f28 * fArr5[2]) + (f27 * fArr5[1]) + (f26 * fArr5[0]));
    }
}
