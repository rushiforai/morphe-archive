package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ea3 extends da3 {
    public final wx8 g;
    public final String h;
    public final y05 i;

    public ea3(wx8 wx8Var, e6a e6aVar, p98 p98Var, mr0 mr0Var, nf6 nf6Var, i93 i93Var, String str, m45 m45Var) {
        e6aVar.getClass();
        p98Var.getClass();
        mr0Var.getClass();
        i93Var.getClass();
        y6a y6aVar = e6aVar.g;
        y6aVar.getClass();
        wjc wjcVar = new wjc(y6aVar);
        kse kseVar = kse.b;
        f7a f7aVar = e6aVar.h;
        f7aVar.getClass();
        sj0 sj0Var = new sj0(i93Var, p98Var, wx8Var, wjcVar, il7.p(f7aVar), mr0Var, nf6Var, null, ey3.a);
        List list = e6aVar.d;
        list.getClass();
        List list2 = e6aVar.e;
        list2.getClass();
        List list3 = e6aVar.f;
        list3.getClass();
        super(sj0Var, list, list2, list3, m45Var);
        this.g = wx8Var;
        this.h = str;
        this.i = ((xx8) wx8Var).f;
    }

    @Override // defpackage.da3, defpackage.fv7, defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        gr7.w(((i93) this.b.a).i, ng8Var, this.g, n98Var);
        return super.d(n98Var, ng8Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        List listI = i(p83Var, x45Var, ng8.WHEN_GET_ALL_DESCRIPTORS);
        Iterable iterable = ((i93) this.b.a).k;
        ArrayList arrayList = new ArrayList();
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            bu1.n0(((en1) it2.next()).b(this.i), arrayList);
        }
        return bu1.Q0(arrayList, listI);
    }

    @Override // defpackage.da3
    public final mn1 l(n98 n98Var) {
        n98Var.getClass();
        return new mn1(this.i, n98Var);
    }

    @Override // defpackage.da3
    public final Set n() {
        return ny3.a;
    }

    @Override // defpackage.da3
    public final Set o() {
        return ny3.a;
    }

    @Override // defpackage.da3
    public final Set p() {
        return ny3.a;
    }

    @Override // defpackage.da3
    public final boolean q(n98 n98Var) {
        n98Var.getClass();
        if (m().contains(n98Var)) {
            return true;
        }
        Iterable iterable = ((i93) this.b.a).k;
        if ((iterable instanceof Collection) && ((Collection) iterable).isEmpty()) {
            return false;
        }
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            if (((en1) it2.next()).c(this.i, n98Var)) {
                return true;
            }
        }
        return false;
    }

    public final String toString() {
        return this.h;
    }

    @Override // defpackage.da3
    public final void h(ArrayList arrayList, x45 x45Var) {
    }
}
