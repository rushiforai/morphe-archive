package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class t83 implements x45 {
    public final /* synthetic */ int a;
    public final w83 b;

    public /* synthetic */ t83(w83 w83Var, int i) {
        this.a = i;
        this.b = w83Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        w83 w83Var = this.b;
        switch (i) {
            case 0:
                xwd xwdVar = (xwd) obj;
                xwdVar.getClass();
                if (xwdVar.c()) {
                    return "*";
                }
                mn6 mn6VarB = xwdVar.b();
                mn6VarB.getClass();
                String strW = w83Var.W(mn6VarB);
                if (xwdVar.a() == pqe.INVARIANT) {
                    return strW;
                }
                return xwdVar.a() + ' ' + strW;
            default:
                mn6 mn6Var = (mn6) obj;
                mn6Var.getClass();
                return w83Var.W(mn6Var);
        }
    }
}
