package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wi3 extends q0a {
    public static final wi3 c = new wi3(bj3.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        double[] dArr = (double[]) obj;
        dArr.getClass();
        return dArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        ui3 ui3Var = (ui3) obj;
        ui3Var.getClass();
        double dF = f22Var.f(this.b, i);
        ui3Var.b(ui3Var.d() + 1);
        double[] dArr = ui3Var.a;
        int i2 = ui3Var.b;
        ui3Var.b = i2 + 1;
        dArr[i2] = dF;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        double[] dArr = (double[]) obj;
        dArr.getClass();
        ui3 ui3Var = new ui3();
        ui3Var.a = dArr;
        ui3Var.b = dArr.length;
        ui3Var.b(10);
        return ui3Var;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new double[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        double[] dArr = (double[]) obj;
        xtcVar.getClass();
        dArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            double d = dArr[i2];
            xtcVar.f(this.b, i2);
            xtcVar.e(d);
        }
    }
}
