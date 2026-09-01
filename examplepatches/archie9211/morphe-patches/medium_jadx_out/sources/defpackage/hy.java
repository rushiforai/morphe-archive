package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class hy implements x45 {
    public final /* synthetic */ int a;
    public final vm6 b;

    public /* synthetic */ hy(vm6 vm6Var, int i) {
        this.a = i;
        this.b = vm6Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        vm6 vm6Var = this.b;
        switch (i) {
            case 0:
                b38 b38Var = (b38) obj;
                b38Var.getClass();
                return b38Var.e().h(vm6Var.u(), pqe.INVARIANT);
            default:
                n98 n98Var = (n98) obj;
                c38 c38VarL = vm6Var.l();
                y05 y05Var = mnc.k;
                tv6 tv6Var = c38VarL.X(y05Var).h;
                if (tv6Var == null) {
                    vm6.a(11);
                    throw null;
                }
                co1 co1VarD = tv6Var.d(n98Var, ng8.FROM_BUILTINS);
                if (co1VarD == null) {
                    rd6.h("Built-in class ", y05Var.a(n98Var), " is not found");
                    return null;
                }
                if (co1VarD instanceof y28) {
                    return (y28) co1VarD;
                }
                throw new AssertionError("Must be a class descriptor " + n98Var + ", but was " + co1VarD);
        }
    }
}
