package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class la7 extends q0a {
    public static final la7 c = new la7(ya7.a);

    @Override // defpackage.u0
    public final int h(Object obj) {
        long[] jArr = (long[]) obj;
        jArr.getClass();
        return jArr.length;
    }

    @Override // defpackage.bs1, defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        ja7 ja7Var = (ja7) obj;
        ja7Var.getClass();
        long jA = f22Var.A(this.b, i);
        ja7Var.b(ja7Var.d() + 1);
        long[] jArr = ja7Var.a;
        int i2 = ja7Var.b;
        ja7Var.b = i2 + 1;
        jArr[i2] = jA;
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        long[] jArr = (long[]) obj;
        jArr.getClass();
        ja7 ja7Var = new ja7();
        ja7Var.a = jArr;
        ja7Var.b = jArr.length;
        ja7Var.b(10);
        return ja7Var;
    }

    @Override // defpackage.q0a
    public final Object n() {
        return new long[0];
    }

    @Override // defpackage.q0a
    public final void o(xtc xtcVar, Object obj, int i) {
        long[] jArr = (long[]) obj;
        xtcVar.getClass();
        jArr.getClass();
        for (int i2 = 0; i2 < i; i2++) {
            xtcVar.l(this.b, i2, jArr[i2]);
        }
    }
}
