package q4;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: k, reason: collision with root package name */
    public static final l f83641k;

    /* renamed from: a, reason: collision with root package name */
    public final float f83642a;

    /* renamed from: b, reason: collision with root package name */
    public final float f83643b;

    /* renamed from: c, reason: collision with root package name */
    public final float f83644c;

    /* renamed from: d, reason: collision with root package name */
    public final float f83645d;

    /* renamed from: e, reason: collision with root package name */
    public final float f83646e;

    /* renamed from: f, reason: collision with root package name */
    public final float f83647f;

    /* renamed from: g, reason: collision with root package name */
    public final float[] f83648g;

    /* renamed from: h, reason: collision with root package name */
    public final float f83649h;

    /* renamed from: i, reason: collision with root package name */
    public final float f83650i;

    /* renamed from: j, reason: collision with root package name */
    public final float f83651j;

    static {
        float[] fArr = b.f83615c;
        float fK = (float) ((b.k() * 63.66197723675813d) / 100.0d);
        float[][] fArr2 = b.f83613a;
        float f11 = fArr[0];
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
        float fExp = (1.0f - (((float) Math.exp(((-fK) - 42.0f) / 92.0f)) * 0.2777778f)) * 1.0f;
        double d5 = fExp;
        if (d5 > 1.0d) {
            fExp = 1.0f;
        } else if (d5 < 0.0d) {
            fExp = 0.0f;
        }
        float f21 = 1.0f / ((5.0f * fK) + 1.0f);
        float f22 = f21 * f21 * f21 * f21;
        float f23 = 1.0f - f22;
        float fCbrt = (0.1f * f23 * f23 * ((float) Math.cbrt(fK * 5.0d))) + (f22 * fK);
        float fK2 = b.k() / fArr[1];
        double d11 = fK2;
        float fSqrt = ((float) Math.sqrt(d11)) + 1.48f;
        float fPow = 0.725f / ((float) Math.pow(d11, 0.2d));
        float[] fArr6 = {(float) Math.pow(((r2[0] * fCbrt) * f16) / 100.0d, 0.42d), (float) Math.pow(((r2[1] * fCbrt) * f17) / 100.0d, 0.42d), (float) Math.pow(((r2[2] * fCbrt) * f18) / 100.0d, 0.42d)};
        float f24 = fArr6[0];
        float f25 = (f24 * 400.0f) / (f24 + 27.13f);
        float f26 = fArr6[1];
        float f27 = (f26 * 400.0f) / (f26 + 27.13f);
        float f28 = fArr6[2];
        float[] fArr7 = {f25, f27, (400.0f * f28) / (f28 + 27.13f)};
        f83641k = new l(fK2, ((fArr7[2] * 0.05f) + (fArr7[0] * 2.0f) + fArr7[1]) * fPow, fPow, fPow, f19, 1.0f, new float[]{(((100.0f / f16) * fExp) + 1.0f) - fExp, (((100.0f / f17) * fExp) + 1.0f) - fExp, (((100.0f / f18) * fExp) + 1.0f) - fExp}, fCbrt, (float) Math.pow(fCbrt, 0.25d), fSqrt);
    }

    public l(float f11, float f12, float f13, float f14, float f15, float f16, float[] fArr, float f17, float f18, float f19) {
        this.f83647f = f11;
        this.f83642a = f12;
        this.f83643b = f13;
        this.f83644c = f14;
        this.f83645d = f15;
        this.f83646e = f16;
        this.f83648g = fArr;
        this.f83649h = f17;
        this.f83650i = f18;
        this.f83651j = f19;
    }
}
