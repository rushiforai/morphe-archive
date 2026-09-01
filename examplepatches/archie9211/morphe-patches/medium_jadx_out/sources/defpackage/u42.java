package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u42 extends v42 {
    public final dkb e;
    public final dkb f;
    public final float[] g;

    public u42(dkb dkbVar, dkb dkbVar2) {
        float[] fArrR;
        super(dkbVar2, dkbVar, dkbVar2, null);
        this.e = dkbVar;
        this.f = dkbVar2;
        float[] fArr = (float[]) zm7.d.b;
        u2f u2fVar = dkbVar.d;
        float[] fArr2 = dkbVar.i;
        u2f u2fVar2 = dkbVar2.d;
        float[] fArr3 = dkbVar2.j;
        if (f49.x(u2fVar, u2fVar2)) {
            fArrR = f49.R(fArr3, fArr2);
        } else {
            float[] fArrA = u2fVar.a();
            float[] fArrA2 = u2fVar2.a();
            u2f u2fVar3 = gsa.h;
            fArrR = f49.R(f49.x(u2fVar2, u2fVar3) ? fArr3 : f49.I(f49.R(f49.v(fArr, fArrA2, new float[]{0.964212f, 1.0f, 0.825188f}), dkbVar2.i)), f49.x(u2fVar, u2fVar3) ? fArr2 : f49.R(f49.v(fArr, fArrA, new float[]{0.964212f, 1.0f, 0.825188f}), fArr2));
        }
        this.g = fArrR;
    }

    @Override // defpackage.v42
    public final long a(long j) {
        float fG = uu1.g(j);
        float f = uu1.f(j);
        float fD = uu1.d(j);
        float fC = uu1.c(j);
        zjb zjbVar = this.e.p;
        float fA = (float) zjbVar.a(fG);
        float fA2 = (float) zjbVar.a(f);
        float fA3 = (float) zjbVar.a(fD);
        float[] fArr = this.g;
        float f2 = (fArr[6] * fA3) + (fArr[3] * fA2) + (fArr[0] * fA);
        float f3 = (fArr[7] * fA3) + (fArr[4] * fA2) + (fArr[1] * fA);
        float f4 = (fArr[8] * fA3) + (fArr[5] * fA2) + (fArr[2] * fA);
        dkb dkbVar = this.f;
        zjb zjbVar2 = dkbVar.m;
        return op8.i((float) zjbVar2.a(f2), (float) zjbVar2.a(f3), (float) zjbVar2.a(f4), fC, dkbVar);
    }
}
