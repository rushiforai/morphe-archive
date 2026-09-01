package defpackage;

import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class vu7 implements m45 {
    public final /* synthetic */ int a;
    public final yu7 b;
    public final q1 c;
    public final hx d;

    public /* synthetic */ vu7(yu7 yu7Var, q1 q1Var, hx hxVar, int i) {
        this.a = i;
        this.b = yu7Var;
        this.c = q1Var;
        this.d = hxVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        List listM1;
        int i = this.a;
        ey3 ey3Var = ey3.a;
        hx hxVar = this.d;
        q1 q1Var = this.c;
        yu7 yu7Var = this.b;
        switch (i) {
            case 0:
                sj0 sj0Var = yu7Var.a;
                j7a j7aVarA = yu7Var.a((yv2) sj0Var.c);
                listM1 = j7aVarA != null ? bu1.m1(((i93) sj0Var.a).e.J(j7aVarA, q1Var, hxVar)) : null;
                if (listM1 != null) {
                    break;
                }
                break;
            default:
                sj0 sj0Var2 = yu7Var.a;
                j7a j7aVarA2 = yu7Var.a((yv2) sj0Var2.c);
                listM1 = j7aVarA2 != null ? ((i93) sj0Var2.a).e.C(j7aVarA2, q1Var, hxVar) : null;
                if (listM1 != null) {
                    break;
                }
                break;
        }
        return listM1;
    }
}
