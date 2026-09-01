package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class v42 {
    public final jv1 a;
    public final jv1 b;
    public final jv1 c;
    public final float[] d;

    /* JADX WARN: Illegal instructions before constructor call */
    public v42(jv1 jv1Var, jv1 jv1Var2, int i) {
        jv1 jv1VarR = rv8.y(jv1Var.b, 12884901888L) ? f49.r(jv1Var) : jv1Var;
        jv1 jv1VarR2 = rv8.y(jv1Var2.b, 12884901888L) ? f49.r(jv1Var2) : jv1Var2;
        float[] fArrA = gsa.k;
        float[] fArr = null;
        if (i == 3) {
            boolean zY = rv8.y(jv1Var.b, 12884901888L);
            boolean zY2 = rv8.y(jv1Var2.b, 12884901888L);
            if ((!zY || !zY2) && (zY || zY2)) {
                u2f u2fVar = ((dkb) (zY ? jv1Var : jv1Var2)).d;
                float[] fArrA2 = zY ? u2fVar.a() : fArrA;
                fArrA = zY2 ? u2fVar.a() : fArrA;
                fArr = new float[]{fArrA2[0] / fArrA[0], fArrA2[1] / fArrA[1], fArrA2[2] / fArrA[2]};
            }
        }
        this(jv1Var2, jv1VarR, jv1VarR2, fArr);
    }

    public long a(long j) {
        float fG = uu1.g(j);
        float f = uu1.f(j);
        float fD = uu1.d(j);
        float fC = uu1.c(j);
        jv1 jv1Var = this.b;
        long jD = jv1Var.d(fG, f, fD);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jD >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jD & 4294967295L));
        float fE = jv1Var.e(fG, f, fD);
        float[] fArr = this.d;
        if (fArr != null) {
            fIntBitsToFloat *= fArr[0];
            fIntBitsToFloat2 *= fArr[1];
            fE *= fArr[2];
        }
        float f2 = fIntBitsToFloat;
        float f3 = fIntBitsToFloat2;
        return this.c.f(f2, f3, fE, fC, this.a);
    }

    public v42(jv1 jv1Var, jv1 jv1Var2, jv1 jv1Var3, float[] fArr) {
        this.a = jv1Var;
        this.b = jv1Var2;
        this.c = jv1Var3;
        this.d = fArr;
    }
}
