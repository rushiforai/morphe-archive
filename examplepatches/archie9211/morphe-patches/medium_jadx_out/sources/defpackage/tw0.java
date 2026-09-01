package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tw0 implements b55 {
    public final /* synthetic */ mx0 a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ mz1 c;
    public final /* synthetic */ float d;
    public final /* synthetic */ float e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ m3c g;
    public final /* synthetic */ long h;
    public final /* synthetic */ long i;
    public final /* synthetic */ float j;
    public final /* synthetic */ b55 k;
    public final /* synthetic */ mz1 l;
    public final /* synthetic */ c55 m;

    public tw0(mx0 mx0Var, b55 b55Var, mz1 mz1Var, float f, float f2, boolean z, m3c m3cVar, long j, long j2, float f3, b55 b55Var2, mz1 mz1Var2, c55 c55Var) {
        this.a = mx0Var;
        this.b = b55Var;
        this.c = mz1Var;
        this.d = f;
        this.e = f2;
        this.f = z;
        this.g = m3cVar;
        this.h = j;
        this.i = j2;
        this.j = f3;
        this.k = b55Var2;
        this.l = mz1Var2;
        this.m = c55Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            mx0 mx0Var = this.a;
            v7c v7cVar = mx0Var.a;
            mz1 mz1VarE = pxf.E(-519581786, new rw0(this.c, this.d), p65Var);
            mz1 mz1VarE2 = pxf.E(-815624571, new sw0(this.a, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l), p65Var);
            mz1 mz1VarE3 = pxf.E(-1111667356, new kd(this.m, 2, mx0Var), p65Var);
            boolean zF = p65Var.f(mx0Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new l8(18, mx0Var);
                p65Var.j0(objM);
            }
            o7f.b(this.b, mz1VarE, mz1VarE2, mz1VarE3, (m45) objM, v7cVar, p65Var, 3504);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
