package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ok1 extends q0a {
    public static final ok1 c = new ok1(tk1.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        char[] cArr = (char[]) obj;
        cArr.getClass();
        return cArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        mk1 mk1Var = (mk1) obj;
        mk1Var.getClass();
        char cG = f22Var.g(this.b, i);
        mk1Var.b(mk1Var.d() + 1);
        char[] cArr = mk1Var.a;
        int i2 = mk1Var.b;
        mk1Var.b = i2 + 1;
        cArr[i2] = cG;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        char[] cArr = (char[]) obj;
        cArr.getClass();
        mk1 mk1Var = new mk1();
        mk1Var.a = cArr;
        mk1Var.b = cArr.length;
        mk1Var.b(10);
        return mk1Var;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new char[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        char[] cArr = (char[]) obj;
        xtcVar.getClass();
        cArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            char c2 = cArr[i2];
            xtcVar.f(this.b, i2);
            xtcVar.d(c2);
        }
    }
}
