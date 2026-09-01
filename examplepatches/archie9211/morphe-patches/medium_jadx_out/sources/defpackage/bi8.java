package defpackage;

import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class bi8 implements x45 {
    public final /* synthetic */ int a;
    public final n0c b;

    public /* synthetic */ bi8(n0c n0cVar, int i) {
        this.a = i;
        this.b = n0cVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        n0c n0cVar = this.b;
        switch (i) {
            case 0:
                y05 y05Var = (y05) obj;
                y05Var.getClass();
                return new gy3((b38) n0cVar.c, y05Var, 0);
            default:
                ci8 ci8Var = (ci8) obj;
                ci8Var.getClass();
                mn1 mn1Var = ci8Var.a;
                List list = ci8Var.b;
                if (mn1Var.c) {
                    ywb.i("Unresolved local class: ", mn1Var);
                    return null;
                }
                mn1 mn1VarE = mn1Var.e();
                tn1 tn1VarL = mn1VarE != null ? n0cVar.L(mn1VarE, bu1.s0(list, 1)) : (tn1) ((r67) n0cVar.d).invoke(mn1Var.a);
                boolean zG = mn1Var.g();
                x67 x67Var = (x67) n0cVar.b;
                n98 n98VarF = mn1Var.f();
                Integer num = (Integer) bu1.z0(list);
                return new di8(x67Var, tn1VarL, n98VarF, zG, num != null ? num.intValue() : 0);
        }
    }
}
