package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class au8 extends zl4 {
    public static final au8 d = new au8(0, 2, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        p46 p46Var = (p46) ym0Var.i(1);
        int i = p46Var != null ? p46Var.a : 0;
        tj1 tj1Var = (tj1) ym0Var.i(0);
        if (i > 0) {
            x60Var = new u11(x60Var, i);
        }
        tj1Var.U(x60Var, igcVar, l3bVar, kv8Var != null ? new gg5(kv8Var, 22, igcVar) : null);
    }
}
