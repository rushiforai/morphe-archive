package j2;

import i2.r0;

/* loaded from: classes2.dex */
public final class f extends g {

    /* renamed from: e, reason: collision with root package name */
    public final q f68681e;

    /* renamed from: f, reason: collision with root package name */
    public final q f68682f;

    /* renamed from: g, reason: collision with root package name */
    public final float[] f68683g;

    public f(q qVar, q qVar2) {
        float[] fArrG;
        super(qVar2, qVar, qVar2, null);
        this.f68681e = qVar;
        this.f68682f = qVar2;
        float[] fArr = a.f68648b.f68649a;
        s sVar = qVar.f68708d;
        float[] fArr2 = qVar.f68713i;
        s sVar2 = qVar2.f68708d;
        float[] fArr3 = qVar2.f68714j;
        if (j.d(sVar, sVar2)) {
            fArrG = j.g(fArr3, fArr2);
        } else {
            float[] fArrA = sVar.a();
            float[] fArrA2 = sVar2.a();
            s sVar3 = j.f68690b;
            fArrG = j.g(j.d(sVar2, sVar3) ? fArr3 : j.f(j.g(j.c(fArr, fArrA2, new float[]{0.964212f, 1.0f, 0.825188f}), qVar2.f68713i)), j.d(sVar, sVar3) ? fArr2 : j.g(j.c(fArr, fArrA, new float[]{0.964212f, 1.0f, 0.825188f}), fArr2));
        }
        this.f68683g = fArrG;
    }

    @Override // j2.g
    public final long a(long j11) {
        float fG = i2.s.g(j11);
        float f11 = i2.s.f(j11);
        float fD = i2.s.d(j11);
        float fC = i2.s.c(j11);
        m mVar = this.f68681e.f68718p;
        float fB = (float) mVar.b(fG);
        float fB2 = (float) mVar.b(f11);
        float fB3 = (float) mVar.b(fD);
        float[] fArr = this.f68683g;
        float f12 = (fArr[6] * fB3) + (fArr[3] * fB2) + (fArr[0] * fB);
        float f13 = (fArr[7] * fB3) + (fArr[4] * fB2) + (fArr[1] * fB);
        float f14 = (fArr[8] * fB3) + (fArr[5] * fB2) + (fArr[2] * fB);
        q qVar = this.f68682f;
        float fB4 = (float) qVar.f68717m.b(f12);
        m mVar2 = qVar.f68717m;
        return r0.a(fB4, (float) mVar2.b(f13), (float) mVar2.b(f14), fC, qVar);
    }
}
