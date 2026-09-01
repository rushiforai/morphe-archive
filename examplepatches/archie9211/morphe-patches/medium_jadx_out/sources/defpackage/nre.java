package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nre {
    public final ln4 a;
    public dx b;
    public dx c;
    public dx d;
    public final float e;

    public nre(ln4 ln4Var) {
        this.a = ln4Var;
        this.e = ln4Var.d();
    }

    public final dx a(long j, dx dxVar, dx dxVar2) {
        dx dxVarC = this.c;
        if (dxVarC == null) {
            dxVarC = dxVar.c();
            this.c = dxVarC;
        }
        int iB = dxVarC.b();
        int i = 0;
        while (true) {
            dx dxVar3 = this.c;
            if (i >= iB) {
                if (dxVar3 != null) {
                    return dxVar3;
                }
                g76.g0("velocityVector");
                throw null;
            }
            if (dxVar3 == null) {
                g76.g0("velocityVector");
                throw null;
            }
            dxVar.getClass();
            dxVar3.e(i, this.a.i(dxVar2.a(i), j));
            i++;
        }
    }
}
