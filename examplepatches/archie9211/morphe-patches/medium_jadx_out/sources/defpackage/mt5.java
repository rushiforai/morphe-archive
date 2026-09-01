package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mt5 extends ot5 {
    public final /* synthetic */ int d;
    public final x31 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mt5(ybb ybbVar, u31 u31Var, y92 y92Var, x31 x31Var, int i) {
        super(ybbVar, u31Var, y92Var);
        this.d = i;
        this.e = x31Var;
    }

    @Override // defpackage.ot5
    public final Object a(sp8 sp8Var, Object[] objArr) {
        int i = this.d;
        x31 x31Var = this.e;
        switch (i) {
            case 0:
                return x31Var.u(sp8Var);
            default:
                v31 v31Var = (v31) x31Var.u(sp8Var);
                n92 n92Var = (n92) objArr[objArr.length - 1];
                try {
                    x51 x51Var = new x51(1, pwd.Q(n92Var));
                    x51Var.s();
                    x51Var.v(new zm6(v31Var, 2));
                    v31Var.f(new yg2(x51Var));
                    return x51Var.q();
                } catch (Exception e) {
                    return guc.W(e, n92Var);
                }
        }
    }
}
