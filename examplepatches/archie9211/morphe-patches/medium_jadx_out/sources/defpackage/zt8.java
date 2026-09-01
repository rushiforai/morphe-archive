package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zt8 extends zl4 {
    public static final zt8 d = new zt8(0, 2, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        k65 k65Var = (k65) ym0Var.i(0);
        Object objI = ym0Var.i(1);
        if (objI instanceof t65) {
            t65 t65Var = (t65) objI;
            ((o78) l3bVar.d).b(t65Var);
            ((g78) l3bVar.g).a(t65Var);
        }
        if (igcVar.n != 0) {
            b22.a("Can only append a slot if not current inserting");
        }
        int i = igcVar.i;
        int i2 = igcVar.j;
        int iC = igcVar.c(k65Var);
        int iF = igcVar.f(igcVar.q(iC + 1), igcVar.b);
        igcVar.i = iF;
        igcVar.j = iF;
        igcVar.w(1, iC);
        if (i >= iF) {
            i++;
            i2++;
        }
        igcVar.c[iF] = objI;
        igcVar.i = i;
        igcVar.j = i2;
    }
}
