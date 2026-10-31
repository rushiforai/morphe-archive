package j2;

import h6.c1;

/* loaded from: classes.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final s f68689a = new s(0.31006f, 0.31616f);

    /* renamed from: b, reason: collision with root package name */
    public static final s f68690b = new s(0.34567f, 0.3585f);

    /* renamed from: c, reason: collision with root package name */
    public static final s f68691c = new s(0.32168f, 0.33767f);

    /* renamed from: d, reason: collision with root package name */
    public static final s f68692d = new s(0.31271f, 0.32902f);

    /* renamed from: e, reason: collision with root package name */
    public static final float[] f68693e = {0.964212f, 1.0f, 0.825188f};

    public static c a(c cVar) {
        if (b.a(cVar.f68656b, b.f68650a)) {
            q qVar = (q) cVar;
            s sVar = qVar.f68708d;
            s sVar2 = f68690b;
            if (!d(sVar, sVar2)) {
                return new q(qVar.f68655a, qVar.f68712h, sVar2, g(c(a.f68648b.f68649a, sVar.a(), sVar2.a()), qVar.f68713i), qVar.f68715k, qVar.n, qVar.f68709e, qVar.f68710f, qVar.f68711g, -1);
            }
        }
        return cVar;
    }

    public static float b(float[] fArr) {
        if (fArr.length < 6) {
            return 0.0f;
        }
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[2];
        float f14 = fArr[3];
        float f15 = fArr[4];
        float f16 = fArr[5];
        float f17 = (((((f13 * f16) + ((f12 * f15) + (f11 * f14))) - (f14 * f15)) - (f12 * f13)) - (f11 * f16)) * 0.5f;
        return f17 < 0.0f ? -f17 : f17;
    }

    public static final float[] c(float[] fArr, float[] fArr2, float[] fArr3) {
        h(fArr, fArr2);
        h(fArr, fArr3);
        float[] fArr4 = {fArr3[0] / fArr2[0], fArr3[1] / fArr2[1], fArr3[2] / fArr2[2]};
        float[] fArrF = f(fArr);
        float f11 = fArr4[0];
        float f12 = fArr[0] * f11;
        float f13 = fArr4[1];
        float f14 = fArr[1] * f13;
        float f15 = fArr4[2];
        return g(fArrF, new float[]{f12, f14, fArr[2] * f15, fArr[3] * f11, fArr[4] * f13, fArr[5] * f15, f11 * fArr[6], f13 * fArr[7], f15 * fArr[8]});
    }

    public static final boolean d(s sVar, s sVar2) {
        if (sVar == sVar2) {
            return true;
        }
        return Math.abs(sVar.f68727a - sVar2.f68727a) < 0.001f && Math.abs(sVar.f68728b - sVar2.f68728b) < 0.001f;
    }

    public static final g e(c cVar, c cVar2) {
        if (cVar == cVar2) {
            return new e(cVar, cVar, 1);
        }
        long j11 = cVar.f68656b;
        long j12 = b.f68650a;
        return (b.a(j11, j12) && b.a(cVar2.f68656b, j12)) ? new f((q) cVar, (q) cVar2) : new g(cVar, cVar2, 0);
    }

    public static final float[] f(float[] fArr) {
        float f11 = fArr[0];
        float f12 = fArr[3];
        float f13 = fArr[6];
        float f14 = fArr[1];
        float f15 = fArr[4];
        float f16 = fArr[7];
        float f17 = fArr[2];
        float f18 = fArr[5];
        float f19 = fArr[8];
        float f21 = (f15 * f19) - (f16 * f18);
        float f22 = (f16 * f17) - (f14 * f19);
        float f23 = (f14 * f18) - (f15 * f17);
        float f24 = (f13 * f23) + (f12 * f22) + (f11 * f21);
        float[] fArr2 = new float[fArr.length];
        fArr2[0] = f21 / f24;
        fArr2[1] = f22 / f24;
        fArr2[2] = f23 / f24;
        fArr2[3] = c1.f(f12, f19, f13 * f18, f24);
        fArr2[4] = c1.f(f13, f17, f19 * f11, f24);
        fArr2[5] = c1.f(f11, f18, f17 * f12, f24);
        fArr2[6] = c1.f(f13, f15, f12 * f16, f24);
        fArr2[7] = c1.f(f11, f16, f13 * f14, f24);
        fArr2[8] = c1.f(f12, f14, f11 * f15, f24);
        return fArr2;
    }

    public static final float[] g(float[] fArr, float[] fArr2) {
        float[] fArr3 = new float[9];
        if (fArr.length < 9 || fArr2.length < 9) {
            return fArr3;
        }
        float f11 = fArr[0] * fArr2[0];
        float f12 = fArr[3];
        float f13 = fArr2[1];
        float f14 = fArr[6];
        float f15 = fArr2[2];
        fArr3[0] = (f14 * f15) + (f12 * f13) + f11;
        float f16 = fArr[1];
        float f17 = fArr2[0];
        float f18 = fArr[4];
        float f19 = fArr[7];
        float f21 = f19 * f15;
        fArr3[1] = f21 + (f13 * f18) + (f16 * f17);
        float f22 = fArr[2] * f17;
        float f23 = fArr[5];
        float f24 = (fArr2[1] * f23) + f22;
        float f25 = fArr[8];
        fArr3[2] = (f15 * f25) + f24;
        float f26 = fArr[0];
        float f27 = fArr2[3] * f26;
        float f28 = fArr2[4];
        float f29 = (f12 * f28) + f27;
        float f31 = fArr2[5];
        fArr3[3] = (f14 * f31) + f29;
        float f32 = fArr[1];
        float f33 = fArr2[3];
        float f34 = f18 * f28;
        fArr3[4] = (f19 * f31) + f34 + (f32 * f33);
        float f35 = fArr[2];
        float f36 = f31 * f25;
        fArr3[5] = f36 + (f23 * fArr2[4]) + (f33 * f35);
        float f37 = f26 * fArr2[6];
        float f38 = fArr[3];
        float f39 = fArr2[7];
        float f40 = (f38 * f39) + f37;
        float f41 = fArr2[8];
        fArr3[6] = (f14 * f41) + f40;
        float f42 = fArr2[6];
        float f43 = f19 * f41;
        fArr3[7] = f43 + (fArr[4] * f39) + (f32 * f42);
        float f44 = f25 * f41;
        fArr3[8] = f44 + (fArr[5] * fArr2[7]) + (f35 * f42);
        return fArr3;
    }

    public static final float[] h(float[] fArr, float[] fArr2) {
        if (fArr.length < 9 || fArr2.length < 3) {
            return fArr2;
        }
        float f11 = fArr2[0];
        float f12 = fArr2[1];
        float f13 = fArr2[2];
        fArr2[0] = (fArr[6] * f13) + (fArr[3] * f12) + (fArr[0] * f11);
        fArr2[1] = (fArr[7] * f13) + (fArr[4] * f12) + (fArr[1] * f11);
        fArr2[2] = (fArr[8] * f13) + (fArr[5] * f12) + (fArr[2] * f11);
        return fArr2;
    }
}
