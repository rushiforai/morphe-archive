package uz;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: k, reason: collision with root package name */
    public static final c f91800k;

    /* renamed from: a, reason: collision with root package name */
    public final float f91801a;

    /* renamed from: b, reason: collision with root package name */
    public final float f91802b;

    /* renamed from: c, reason: collision with root package name */
    public final float f91803c;

    /* renamed from: d, reason: collision with root package name */
    public final float f91804d;

    /* renamed from: e, reason: collision with root package name */
    public final float f91805e;

    /* renamed from: f, reason: collision with root package name */
    public final float f91806f;

    /* renamed from: g, reason: collision with root package name */
    public final float[] f91807g;

    /* renamed from: h, reason: collision with root package name */
    public final float f91808h;

    /* renamed from: i, reason: collision with root package name */
    public final float f91809i;

    /* renamed from: j, reason: collision with root package name */
    public final float f91810j;

    static {
        float fD = (float) ((b.d() * 63.66197723675813d) / 100.0d);
        float[] fArr = b.f91798c;
        float f11 = fArr[0];
        float[][] fArr2 = b.f91796a;
        float[] fArr3 = fArr2[0];
        float f12 = fArr3[0] * f11;
        float f13 = fArr[1];
        float f14 = (fArr3[1] * f13) + f12;
        float f15 = fArr[2];
        float f16 = (fArr3[2] * f15) + f14;
        float[] fArr4 = fArr2[1];
        float f17 = (fArr4[2] * f15) + (fArr4[1] * f13) + (fArr4[0] * f11);
        float[] fArr5 = fArr2[2];
        float f18 = (f15 * fArr5[2]) + (f13 * fArr5[1]) + (f11 * fArr5[0]);
        float f19 = ((double) 1.0f) >= 0.9d ? 0.69f : 0.655f;
        float fExp = (1.0f - (((float) Math.exp(((-fD) - 42.0f) / 92.0f)) * 0.2777778f)) * 1.0f;
        double d5 = fExp;
        if (d5 > 1.0d) {
            fExp = 1.0f;
        } else if (d5 < 0.0d) {
            fExp = 0.0f;
        }
        float f21 = 1.0f / ((5.0f * fD) + 1.0f);
        float f22 = f21 * f21 * f21 * f21;
        float f23 = 1.0f - f22;
        float fCbrt = (0.1f * f23 * f23 * ((float) Math.cbrt(fD * 5.0d))) + (f22 * fD);
        float fD2 = b.d() / fArr[1];
        double d11 = fD2;
        float fSqrt = ((float) Math.sqrt(d11)) + 1.48f;
        float fPow = 0.725f / ((float) Math.pow(d11, 0.2d));
        float[] fArr6 = {(float) Math.pow(((r2[0] * fCbrt) * f16) / 100.0d, 0.42d), (float) Math.pow(((r2[1] * fCbrt) * f17) / 100.0d, 0.42d), (float) Math.pow(((r2[2] * fCbrt) * f18) / 100.0d, 0.42d)};
        float f24 = fArr6[0];
        float f25 = (f24 * 400.0f) / (f24 + 27.13f);
        float f26 = fArr6[1];
        float f27 = (f26 * 400.0f) / (f26 + 27.13f);
        float f28 = fArr6[2];
        float[] fArr7 = {f25, f27, (400.0f * f28) / (f28 + 27.13f)};
        f91800k = new c(fD2, ((fArr7[2] * 0.05f) + (fArr7[0] * 2.0f) + fArr7[1]) * fPow, fPow, fPow, f19, 1.0f, new float[]{(((100.0f / f16) * fExp) + 1.0f) - fExp, (((100.0f / f17) * fExp) + 1.0f) - fExp, (((100.0f / f18) * fExp) + 1.0f) - fExp}, fCbrt, (float) Math.pow(fCbrt, 0.25d), fSqrt);
    }

    public c(float f11, float f12, float f13, float f14, float f15, float f16, float[] fArr, float f17, float f18, float f19) {
        this.f91806f = f11;
        this.f91801a = f12;
        this.f91802b = f13;
        this.f91803c = f14;
        this.f91804d = f15;
        this.f91805e = f16;
        this.f91807g = fArr;
        this.f91808h = f17;
        this.f91809i = f18;
        this.f91810j = f19;
    }
}
