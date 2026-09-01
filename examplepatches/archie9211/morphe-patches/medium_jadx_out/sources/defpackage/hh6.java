package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hh6 extends f52 {
    public hh6(mn1 mn1Var, int i) {
        super(new fh6(new rn1(mn1Var, i)));
    }

    @Override // defpackage.f52
    public final mn6 a(b38 b38Var) {
        mn6 mn6VarC;
        b38Var.getClass();
        uvd.b.getClass();
        uvd uvdVar = uvd.c;
        vm6 vm6VarE = b38Var.e();
        vm6VarE.getClass();
        y28 y28VarJ = vm6VarE.j(lnc.Q.i());
        if (y28VarJ == null) {
            vm6.a(21);
            throw null;
        }
        Object obj = this.a;
        gh6 gh6Var = (gh6) obj;
        if (gh6Var instanceof eh6) {
            mn6VarC = ((eh6) obj).a;
        } else {
            if (!(gh6Var instanceof fh6)) {
                ygf.a();
                return null;
            }
            rn1 rn1Var = ((fh6) obj).a;
            mn1 mn1Var = rn1Var.a;
            int i = rn1Var.b;
            y28 y28VarF = d46.F(b38Var, mn1Var);
            if (y28VarF == null) {
                mn6VarC = l24.c(k24.UNRESOLVED_KCLASS_CONSTANT_VALUE, mn1Var.toString(), String.valueOf(i));
            } else {
                hec hecVarT = y28VarF.T();
                hecVarT.getClass();
                mn6 mn6VarJ = ok7.J(hecVarT);
                for (int i2 = 0; i2 < i; i2++) {
                    mn6VarJ = b38Var.e().h(mn6VarJ, pqe.INVARIANT);
                }
                mn6VarC = mn6VarJ;
            }
        }
        return pwd.X(uvdVar, y28VarJ, d46.Q(new onc(mn6VarC)));
    }
}
