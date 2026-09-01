package defpackage;

import java.util.Set;

/* JADX INFO: loaded from: classes5.dex */
public final class cwd implements x45 {
    public final /* synthetic */ int a;
    public final jz1 b;

    public /* synthetic */ cwd(jz1 jz1Var, int i) {
        this.a = i;
        this.b = jz1Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        jz1 jz1Var = this.b;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj).intValue();
                sj0 sj0Var = (sj0) jz1Var.b;
                mn1 mn1VarZ = vn7.z((p98) sj0Var.b, iIntValue);
                boolean z = mn1VarZ.c;
                i93 i93Var = (i93) sj0Var.a;
                if (!z) {
                    return d46.G(i93Var.b, mn1VarZ);
                }
                hn1 hn1Var = i93Var.t;
                Set set = hn1.c;
                return hn1Var.a(mn1VarZ, null);
            case 1:
                int iIntValue2 = ((Number) obj).intValue();
                sj0 sj0Var2 = (sj0) jz1Var.b;
                mn1 mn1VarZ2 = vn7.z((p98) sj0Var2.b, iIntValue2);
                if (mn1VarZ2.c) {
                    return null;
                }
                b38 b38Var = ((i93) sj0Var2.a).b;
                b38Var.getClass();
                co1 co1VarG = d46.G(b38Var, mn1VarZ2);
                if (co1VarG instanceof ha3) {
                    return (ha3) co1VarG;
                }
                return null;
            default:
                s6a s6aVar = (s6a) obj;
                s6aVar.getClass();
                return vn7.I(s6aVar, (wjc) ((sj0) jz1Var.b).d);
        }
    }
}
