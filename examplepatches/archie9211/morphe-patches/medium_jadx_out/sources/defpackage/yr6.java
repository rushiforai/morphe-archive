package defpackage;

import java.util.ArrayList;

/* JADX INFO: loaded from: classes5.dex */
public final class yr6 implements m45 {
    public final /* synthetic */ int a;
    public final zr6 b;

    public /* synthetic */ yr6(zr6 zr6Var, int i) {
        this.a = i;
        this.b = zr6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() throws Throwable {
        int i = this.a;
        zr6 zr6Var = this.b;
        switch (i) {
            case 0:
                return e0b.a(vx0.T(vx0.P(zr6Var.b.a))).a();
            case 1:
                y05 y05VarE = zr6Var.e();
                f0b f0bVar = zr6Var.b;
                n0c n0cVar = zr6Var.a;
                if (y05VarE == null) {
                    return l24.c(k24.NOT_FOUND_FQNAME_FOR_JAVA_ANNOTATION, f0bVar.toString());
                }
                k96 k96Var = (k96) n0cVar.b;
                vm6 vm6Var = k96Var.h.e;
                vm6Var.getClass();
                String str = s96.a;
                mn1 mn1VarF = s96.f(y05VarE);
                y28 y28VarJ = mn1VarF != null ? vm6Var.j(mn1VarF.a()) : null;
                if (y28VarJ == null) {
                    q0b q0bVar = new q0b(vx0.T(vx0.P(f0bVar.a)));
                    zm7 zm7Var = (zm7) k96Var.f.b;
                    if (zm7Var == null) {
                        g76.g0("resolver");
                        throw null;
                    }
                    y28VarJ = zm7Var.F(q0bVar);
                    if (y28VarJ == null) {
                        y28VarJ = d46.H(k96Var.h, new mn1(y05VarE.b(), y05VarE.a.g()), k96Var.d.c().l);
                    }
                }
                return y28VarJ.T();
            default:
                ArrayList<g0b> arrayListB = zr6Var.b.b();
                ArrayList arrayList = new ArrayList();
                for (g0b g0bVar : arrayListB) {
                    n98 n98Var = g0bVar.a;
                    if (n98Var == null) {
                        n98Var = de6.b;
                    }
                    f52 f52VarA = zr6Var.a(g0bVar);
                    f09 f09Var = f52VarA != null ? new f09(n98Var, f52VarA) : null;
                    if (f09Var != null) {
                        arrayList.add(f09Var);
                    }
                }
                return ei7.V(arrayList);
        }
    }
}
