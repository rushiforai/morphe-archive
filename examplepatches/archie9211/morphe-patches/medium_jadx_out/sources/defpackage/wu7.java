package defpackage;

import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class wu7 implements m45 {
    public final yu7 a;
    public final boolean b;
    public final i6a c;

    public wu7(yu7 yu7Var, boolean z, i6a i6aVar) {
        this.a = yu7Var;
        this.b = z;
        this.c = i6aVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        List listM1;
        yu7 yu7Var = this.a;
        sj0 sj0Var = yu7Var.a;
        j7a j7aVarA = yu7Var.a((yv2) sj0Var.c);
        if (j7aVarA != null) {
            i93 i93Var = (i93) sj0Var.a;
            boolean z = this.b;
            i6a i6aVar = this.c;
            listM1 = z ? bu1.m1(i93Var.e.f(j7aVarA, i6aVar)) : bu1.m1(i93Var.e.F(j7aVarA, i6aVar));
        } else {
            listM1 = null;
        }
        return listM1 == null ? ey3.a : listM1;
    }
}
