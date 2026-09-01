package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rt0 extends q0a {
    public static final rt0 c = new rt0(ut0.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        boolean[] zArr = (boolean[]) obj;
        zArr.getClass();
        return zArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        pt0 pt0Var = (pt0) obj;
        pt0Var.getClass();
        boolean zW = f22Var.w(this.b, i);
        pt0Var.b(pt0Var.d() + 1);
        boolean[] zArr = pt0Var.a;
        int i2 = pt0Var.b;
        pt0Var.b = i2 + 1;
        zArr[i2] = zW;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        boolean[] zArr = (boolean[]) obj;
        zArr.getClass();
        pt0 pt0Var = new pt0();
        pt0Var.a = zArr;
        pt0Var.b = zArr.length;
        pt0Var.b(10);
        return pt0Var;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new boolean[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        boolean[] zArr = (boolean[]) obj;
        xtcVar.getClass();
        zArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            boolean z = zArr[i2];
            xtcVar.f(this.b, i2);
            xtcVar.b(z);
        }
    }
}
