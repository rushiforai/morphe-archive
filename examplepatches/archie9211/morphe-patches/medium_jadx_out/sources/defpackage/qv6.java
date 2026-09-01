package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class qv6 implements m45 {
    public final /* synthetic */ int a;
    public final rv6 b;

    public /* synthetic */ qv6(rv6 rv6Var, int i) {
        this.a = i;
        this.b = rv6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        rv6 rv6Var = this.b;
        switch (i) {
            case 0:
                c38 c38Var = rv6Var.d;
                c38Var.x0();
                j22 j22Var = (j22) c38Var.l.getValue();
                y05 y05Var = rv6Var.e;
                j22Var.getClass();
                y05Var.getClass();
                ArrayList arrayList = new ArrayList();
                j22Var.b(y05Var, arrayList);
                return arrayList;
            case 1:
                c38 c38Var2 = rv6Var.d;
                c38Var2.x0();
                return Boolean.valueOf(hk7.y((j22) c38Var2.l.getValue(), rv6Var.e));
            default:
                u67 u67Var = rv6Var.g;
                fj6[] fj6VarArr = rv6.i;
                boolean zBooleanValue = ((Boolean) mk7.z(u67Var, fj6VarArr[1])).booleanValue();
                y05 y05Var2 = rv6Var.e;
                c38 c38Var3 = rv6Var.d;
                if (zBooleanValue) {
                    return dv7.b;
                }
                List list = (List) mk7.z(rv6Var.f, fj6VarArr[0]);
                ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    arrayList2.add(((wx8) it2.next()).H());
                }
                return flb.e0("package view scope for " + y05Var2 + " in " + c38Var3.getName(), bu1.R0(arrayList2, new ewc(c38Var3, y05Var2)));
        }
    }
}
