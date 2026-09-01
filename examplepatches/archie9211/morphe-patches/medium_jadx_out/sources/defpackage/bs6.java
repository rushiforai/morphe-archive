package defpackage;

import java.util.ArrayList;

/* JADX INFO: loaded from: classes5.dex */
public final class bs6 implements m45 {
    public final /* synthetic */ int a;
    public final cs6 b;

    public /* synthetic */ bs6(cs6 cs6Var, int i) {
        this.a = i;
        this.b = cs6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        cs6 cs6Var = this.b;
        switch (i) {
            case 0:
                if (f93.f(cs6Var) == null) {
                    return null;
                }
                Object obj = cs6Var.g.b;
                return null;
            case 1:
                q0b q0bVar = cs6Var.h;
                ArrayList<e1b> typeParameters = q0bVar.getTypeParameters();
                ArrayList arrayList = new ArrayList(cu1.k0(typeParameters, 10));
                for (e1b e1bVar : typeParameters) {
                    swd swdVarB = ((vwd) cs6Var.j.c).b(e1bVar);
                    if (swdVarB == null) {
                        throw new AssertionError("Parameter " + e1bVar + " surely belongs to class " + q0bVar + ", so it must be resolved");
                    }
                    arrayList.add(swdVarB);
                }
                return arrayList;
            default:
                return hk7.r(cs6Var);
        }
    }
}
