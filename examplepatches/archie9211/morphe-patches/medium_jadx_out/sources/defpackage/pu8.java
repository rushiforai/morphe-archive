package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pu8 extends zl4 {
    public static final pu8 d = new pu8(0, 3, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        gg5 gg5Var;
        fgc fgcVar = (fgc) ym0Var.i(1);
        k65 k65Var = (k65) ym0Var.i(0);
        ll4 ll4Var = (ll4) ym0Var.i(2);
        igc igcVarP = fgcVar.p();
        if (kv8Var != null) {
            try {
                gg5Var = new gg5(kv8Var, 22, igcVar);
            } catch (Throwable th) {
                igcVarP.e(false);
                throw th;
            }
        } else {
            gg5Var = null;
        }
        if (!ll4Var.e.H()) {
            b22.a("FixupList has pending fixup operations that were not realized. Were there mismatched insertNode() and endNodeInsert() calls?");
        }
        ll4Var.d.G(x60Var, igcVarP, l3bVar, gg5Var);
        igcVarP.e(true);
        igcVar.d();
        k65Var.getClass();
        igcVar.z(fgcVar, fgcVar.d(k65Var));
        igcVar.j();
    }
}
