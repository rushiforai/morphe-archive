package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q01 implements en1 {
    public final x67 a;
    public final b38 b;

    public q01(x67 x67Var, c38 c38Var) {
        c38Var.getClass();
        this.a = x67Var;
        this.b = c38Var;
    }

    @Override // defpackage.en1
    public final y28 a(mn1 mn1Var) {
        y05 y05Var;
        d65 d65VarA;
        mn1Var.getClass();
        if (!mn1Var.c && !mn1Var.g()) {
            String str = mn1Var.b.a.a;
            if (muc.Q(str, "Function", false) && (d65VarA = e65.b.a((y05Var = mn1Var.a), str)) != null) {
                c65 c65Var = d65VarA.a;
                int i = d65VarA.b;
                List list = (List) mk7.z(this.b.X(y05Var).f, rv6.i[0]);
                ArrayList arrayList = new ArrayList();
                for (Object obj : list) {
                    if (obj instanceof w01) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    it2.next();
                }
                if (bu1.z0(arrayList2) == null) {
                    return new n55(this.a, (w01) bu1.x0(arrayList), c65Var, i);
                }
                rd6.m();
            }
        }
        return null;
    }

    @Override // defpackage.en1
    public final Collection b(y05 y05Var) {
        y05Var.getClass();
        return ny3.a;
    }

    @Override // defpackage.en1
    public final boolean c(y05 y05Var, n98 n98Var) {
        y05Var.getClass();
        n98Var.getClass();
        String strB = n98Var.b();
        strB.getClass();
        return (tuc.N(strB, "Function", false) || tuc.N(strB, "KFunction", false) || tuc.N(strB, "SuspendFunction", false) || tuc.N(strB, "KSuspendFunction", false)) && e65.b.a(y05Var, strB) != null;
    }
}
