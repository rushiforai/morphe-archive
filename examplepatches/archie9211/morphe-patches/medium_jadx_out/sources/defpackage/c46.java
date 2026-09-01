package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c46 extends q0a {
    public static final c46 c = new c46(q46.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        int[] iArr = (int[]) obj;
        iArr.getClass();
        return iArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        a46 a46Var = (a46) obj;
        a46Var.getClass();
        int iQ = f22Var.q(this.b, i);
        a46Var.b(a46Var.d() + 1);
        int[] iArr = a46Var.a;
        int i2 = a46Var.b;
        a46Var.b = i2 + 1;
        iArr[i2] = iQ;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        int[] iArr = (int[]) obj;
        iArr.getClass();
        a46 a46Var = new a46();
        a46Var.a = iArr;
        a46Var.b = iArr.length;
        a46Var.b(10);
        return a46Var;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new int[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        int[] iArr = (int[]) obj;
        xtcVar.getClass();
        iArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            xtcVar.f(this.b, i2);
            xtcVar.j(i3);
        }
    }
}
