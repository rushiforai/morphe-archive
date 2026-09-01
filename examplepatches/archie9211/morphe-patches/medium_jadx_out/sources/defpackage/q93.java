package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q93 extends da3 {
    public final sn6 g;
    public final u67 h;
    public final u67 i;
    public final /* synthetic */ s93 j;

    public q93(s93 s93Var, sn6 sn6Var) {
        this.j = s93Var;
        sj0 sj0Var = s93Var.l;
        k5a k5aVar = s93Var.e;
        List list = k5aVar.q;
        list.getClass();
        List list2 = k5aVar.r;
        list2.getClass();
        List list3 = k5aVar.s;
        list3.getClass();
        List list4 = k5aVar.k;
        list4.getClass();
        p98 p98Var = (p98) s93Var.l.b;
        ArrayList arrayList = new ArrayList(cu1.k0(list4, 10));
        Iterator it2 = list4.iterator();
        while (it2.hasNext()) {
            arrayList.add(vn7.C(p98Var, ((Number) it2.next()).intValue()));
        }
        super(sj0Var, list, list2, list3, new n93(0, arrayList));
        i93 i93Var = (i93) sj0Var.a;
        this.g = sn6Var;
        x67 x67Var = i93Var.a;
        o93 o93Var = new o93(this, 0);
        x67Var.getClass();
        this.h = new u67(x67Var, o93Var);
        x67 x67Var2 = i93Var.a;
        o93 o93Var2 = new o93(this, 1);
        x67Var2.getClass();
        this.i = new u67(x67Var2, o93Var2);
    }

    @Override // defpackage.da3, defpackage.fv7, defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        s(n98Var, ng8Var);
        return super.a(n98Var, ng8Var);
    }

    @Override // defpackage.da3, defpackage.fv7, defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        y28 y28Var;
        n98Var.getClass();
        ng8Var.getClass();
        s(n98Var, ng8Var);
        n0c n0cVar = this.j.p;
        return (n0cVar == null || (y28Var = (y28) ((v67) n0cVar.c).invoke(n98Var)) == null) ? super.d(n98Var, ng8Var) : y28Var;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return (Collection) this.h.invoke();
    }

    @Override // defpackage.da3, defpackage.fv7, defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        s(n98Var, ng8Var);
        return super.f(n98Var, ng8Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.Collection] */
    /* JADX WARN: Type inference failed for: r0v3, types: [ey3] */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.util.ArrayList] */
    @Override // defpackage.da3
    public final void h(ArrayList arrayList, x45 x45Var) {
        ?? arrayList2;
        n0c n0cVar = this.j.p;
        if (n0cVar != null) {
            Set<n98> setKeySet = ((LinkedHashMap) n0cVar.b).keySet();
            arrayList2 = new ArrayList();
            for (n98 n98Var : setKeySet) {
                n98Var.getClass();
                y28 y28Var = (y28) ((v67) n0cVar.c).invoke(n98Var);
                if (y28Var != null) {
                    arrayList2.add(y28Var);
                }
            }
        } else {
            arrayList2 = 0;
        }
        if (arrayList2 == 0) {
            arrayList2 = ey3.a;
        }
        arrayList.addAll(arrayList2);
    }

    @Override // defpackage.da3
    public final void j(n98 n98Var, ArrayList arrayList) {
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = ((Collection) this.i.invoke()).iterator();
        while (it2.hasNext()) {
            arrayList2.addAll(((mn6) it2.next()).H().a(n98Var, ng8.FOR_ALREADY_TRACKED));
        }
        sj0 sj0Var = this.b;
        arrayList.addAll(((i93) sj0Var.a).n.n(n98Var, this.j));
        ArrayList arrayList3 = new ArrayList(arrayList);
        ((df8) ((i93) sj0Var.a).q).d.h(n98Var, arrayList2, arrayList3, this.j, new p93(arrayList, 0));
    }

    @Override // defpackage.da3
    public final void k(n98 n98Var, ArrayList arrayList) {
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = ((Collection) this.i.invoke()).iterator();
        while (it2.hasNext()) {
            arrayList2.addAll(((mn6) it2.next()).H().f(n98Var, ng8.FOR_ALREADY_TRACKED));
        }
        ArrayList arrayList3 = new ArrayList(arrayList);
        ((df8) ((i93) this.b.a).q).d.h(n98Var, arrayList2, arrayList3, this.j, new p93(arrayList, 0));
    }

    @Override // defpackage.da3
    public final mn1 l(n98 n98Var) {
        n98Var.getClass();
        return this.j.h.d(n98Var);
    }

    @Override // defpackage.da3
    public final Set n() {
        List listB = this.j.n.b();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator it2 = listB.iterator();
        while (it2.hasNext()) {
            Set setC = ((mn6) it2.next()).H().c();
            if (setC == null) {
                return null;
            }
            bu1.n0(setC, linkedHashSet);
        }
        return linkedHashSet;
    }

    @Override // defpackage.da3
    public final Set o() {
        s93 s93Var = this.j;
        List listB = s93Var.n.b();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator it2 = listB.iterator();
        while (it2.hasNext()) {
            bu1.n0(((mn6) it2.next()).H().b(), linkedHashSet);
        }
        linkedHashSet.addAll(((i93) this.b.a).n.h(s93Var));
        return linkedHashSet;
    }

    @Override // defpackage.da3
    public final Set p() {
        List listB = this.j.n.b();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator it2 = listB.iterator();
        while (it2.hasNext()) {
            bu1.n0(((mn6) it2.next()).H().g(), linkedHashSet);
        }
        return linkedHashSet;
    }

    @Override // defpackage.da3
    public final boolean r(ga3 ga3Var) {
        return ((i93) this.b.a).o.e(this.j, ga3Var);
    }

    public final void s(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        fa4 fa4Var = ((i93) this.b.a).i;
        fa4Var.getClass();
        this.j.getClass();
        if (fa4Var == fa4.m) {
            return;
        }
        ng8Var.getLocation();
    }
}
