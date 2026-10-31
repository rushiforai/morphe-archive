package c0;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final float f18958a;

    /* renamed from: b, reason: collision with root package name */
    public final float f18959b;

    /* renamed from: c, reason: collision with root package name */
    public final float f18960c;

    /* renamed from: d, reason: collision with root package name */
    public final float f18961d;

    /* renamed from: e, reason: collision with root package name */
    public final float f18962e;

    /* renamed from: f, reason: collision with root package name */
    public final float f18963f;

    /* renamed from: g, reason: collision with root package name */
    public final float f18964g;

    /* renamed from: h, reason: collision with root package name */
    public float f18965h;

    /* renamed from: i, reason: collision with root package name */
    public float f18966i;

    /* renamed from: j, reason: collision with root package name */
    public final float[] f18967j;

    /* renamed from: k, reason: collision with root package name */
    public final float f18968k;

    /* renamed from: l, reason: collision with root package name */
    public final float f18969l;

    /* renamed from: m, reason: collision with root package name */
    public final float f18970m;
    public final float n;
    public final float o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f18971p;

    /* renamed from: q, reason: collision with root package name */
    public final float f18972q;

    /* renamed from: r, reason: collision with root package name */
    public final float f18973r;

    public u(int i5, float f11, float f12, float f13, float f14, float f15, float f16) {
        boolean z11;
        int i11;
        float f17;
        float[] fArr;
        this.f18958a = f11;
        this.f18959b = f12;
        this.f18960c = f13;
        this.f18961d = f14;
        this.f18962e = f15;
        this.f18963f = f16;
        float f18 = f15 - f13;
        float f19 = f16 - f14;
        float f21 = 0.0f;
        int i12 = 1;
        boolean z12 = i5 == 1 || (i5 == 4 ? f19 > 0.0f : !(i5 != 5 || f19 >= 0.0f));
        float f22 = z12 ? -1.0f : 1.0f;
        this.f18970m = f22;
        float f23 = 1 / (f12 - f11);
        this.f18968k = f23;
        float[] fArr2 = new float[101];
        this.f18967j = fArr2;
        boolean z13 = i5 == 3;
        if (z13 || Math.abs(f18) < 0.001f || Math.abs(f19) < 0.001f) {
            float fHypot = (float) Math.hypot(f19, f18);
            this.f18964g = fHypot;
            this.f18969l = fHypot * f23;
            this.f18972q = f18 * f23;
            this.f18973r = f19 * f23;
            this.n = Float.NaN;
            this.o = Float.NaN;
            z11 = true;
        } else {
            this.n = f18 * f22;
            this.o = f19 * (-f22);
            this.f18972q = z12 ? f15 : f13;
            this.f18973r = z12 ? f14 : f16;
            float f24 = f15 - f13;
            float f25 = f14 - f16;
            float f26 = 90;
            float f27 = f25;
            float fHypot2 = 0.0f;
            float f28 = 0.0f;
            int i13 = 1;
            while (true) {
                i11 = i12;
                float f29 = f27;
                double radians = (float) Math.toRadians((i13 * 90.0d) / 90);
                float fSin = ((float) Math.sin(radians)) * f24;
                float fCos = ((float) Math.cos(radians)) * f25;
                f17 = f21;
                fHypot2 += (float) Math.hypot(fSin - f28, fCos - f29);
                fArr = v.f18985a;
                fArr[i13] = fHypot2;
                if (i13 == 90) {
                    break;
                }
                i13++;
                f28 = fSin;
                f21 = f17;
                f27 = fCos;
                i12 = i11;
            }
            this.f18964g = fHypot2;
            int i14 = i11;
            while (true) {
                fArr[i14] = fArr[i14] / fHypot2;
                if (i14 == 90) {
                    break;
                } else {
                    i14++;
                }
            }
            int length = fArr2.length;
            for (int i15 = 0; i15 < length; i15++) {
                float f31 = i15 / 100.0f;
                int iBinarySearch = Arrays.binarySearch(fArr, 0, 91, f31);
                if (iBinarySearch >= 0) {
                    fArr2[i15] = iBinarySearch / f26;
                } else if (iBinarySearch == -1) {
                    fArr2[i15] = f17;
                } else {
                    int i16 = -iBinarySearch;
                    int i17 = i16 - 2;
                    float f32 = i17;
                    float f33 = fArr[i17];
                    fArr2[i15] = (((f31 - f33) / (fArr[i16 - 1] - f33)) + f32) / f26;
                }
            }
            this.f18969l = this.f18964g * this.f18968k;
            z11 = z13;
        }
        this.f18971p = z11;
    }

    public final float a() {
        float f11 = this.n * this.f18966i;
        return f11 * this.f18970m * (this.f18969l / ((float) Math.hypot(f11, (-this.o) * this.f18965h)));
    }

    public final float b() {
        float f11 = this.n * this.f18966i;
        float f12 = (-this.o) * this.f18965h;
        return f12 * this.f18970m * (this.f18969l / ((float) Math.hypot(f11, f12)));
    }

    public final void c(float f11) {
        float f12 = (this.f18970m == -1.0f ? this.f18959b - f11 : f11 - this.f18958a) * this.f18968k;
        float fA = 0.0f;
        if (f12 > 0.0f) {
            fA = 1.0f;
            if (f12 < 1.0f) {
                float f13 = f12 * 100;
                int i5 = (int) f13;
                float[] fArr = this.f18967j;
                float f14 = fArr[i5];
                fA = a2.c.a(fArr[i5 + 1], f14, f13 - i5, f14);
            }
        }
        double d5 = fA * 1.5707964f;
        this.f18965h = (float) Math.sin(d5);
        this.f18966i = (float) Math.cos(d5);
    }
}
