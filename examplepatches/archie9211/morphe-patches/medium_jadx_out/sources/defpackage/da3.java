package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class da3 extends fv7 {
    public static final /* synthetic */ fj6[] f;
    public final sj0 b;
    public final ca3 c;
    public final u67 d;
    public final t67 e;

    static {
        u4a u4aVar = new u4a(da3.class, "classNames", "getClassNames$deserialization()Ljava/util/Set;", 0);
        s1b s1bVar = n1b.a;
        f = new fj6[]{s1bVar.g(u4aVar), km4.t(da3.class, "classifierNamesLazy", "getClassifierNamesLazy()Ljava/util/Set;", 0, s1bVar)};
    }

    public da3(sj0 sj0Var, List list, List list2, List list3, m45 m45Var) {
        sj0Var.getClass();
        list.getClass();
        list2.getClass();
        list3.getClass();
        this.b = sj0Var;
        i93 i93Var = (i93) sj0Var.a;
        i93Var.c.getClass();
        this.c = new ca3(this, list, list2, list3);
        x67 x67Var = i93Var.a;
        y93 y93Var = new y93(0, m45Var);
        x67Var.getClass();
        this.d = new u67(x67Var, y93Var);
        v2 v2Var = new v2(9, this);
        x67Var.getClass();
        this.e = new t67(x67Var, v2Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        ca3 ca3Var = this.c;
        ca3Var.getClass();
        return !((Set) mk7.z(ca3Var.g, ca3.j[0])).contains(n98Var) ? ey3.a : (Collection) ca3Var.d.invoke(n98Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set b() {
        return (Set) mk7.z(this.c.g, ca3.j[0]);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set c() {
        fj6 fj6Var = f[1];
        t67 t67Var = this.e;
        t67Var.getClass();
        fj6Var.getClass();
        return (Set) t67Var.invoke();
    }

    @Override // defpackage.fv7, defpackage.ev7
    public co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        if (q(n98Var)) {
            i93 i93Var = (i93) this.b.a;
            mn1 mn1VarL = l(n98Var);
            hn1 hn1Var = i93Var.t;
            Set set = hn1.c;
            return hn1Var.a(mn1VarL, null);
        }
        ca3 ca3Var = this.c;
        if (!ca3Var.c.keySet().contains(n98Var)) {
            return null;
        }
        ca3Var.getClass();
        return (ha3) ca3Var.f.invoke(n98Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        ca3 ca3Var = this.c;
        ca3Var.getClass();
        return !((Set) mk7.z(ca3Var.h, ca3.j[1])).contains(n98Var) ? ey3.a : (Collection) ca3Var.e.invoke(n98Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set g() {
        return (Set) mk7.z(this.c.h, ca3.j[1]);
    }

    public abstract void h(ArrayList arrayList, x45 x45Var);

    public final List i(p83 p83Var, x45 x45Var, ng8 ng8Var) {
        p83Var.getClass();
        ng8Var.getClass();
        ArrayList arrayList = new ArrayList(0);
        if (p83Var.a(p83.f)) {
            h(arrayList, x45Var);
        }
        ca3 ca3Var = this.c;
        ca3Var.getClass();
        u67 u67Var = ca3Var.g;
        u67 u67Var2 = ca3Var.h;
        js4 js4Var = js4.d;
        boolean zA = p83Var.a(p83.j);
        ey3 ey3Var = ey3.a;
        if (zA) {
            Set<n98> set = (Set) mk7.z(u67Var2, ca3.j[1]);
            ArrayList arrayList2 = new ArrayList();
            for (n98 n98Var : set) {
                if (((Boolean) x45Var.invoke(n98Var)).booleanValue()) {
                    n98Var.getClass();
                    arrayList2.addAll(!((Set) mk7.z(u67Var2, ca3.j[1])).contains(n98Var) ? ey3Var : (Collection) ca3Var.e.invoke(n98Var));
                }
            }
            eu1.m0(arrayList2, js4Var);
            arrayList.addAll(arrayList2);
        }
        if (p83Var.a(p83.i)) {
            Set<n98> set2 = (Set) mk7.z(u67Var, ca3.j[0]);
            ArrayList arrayList3 = new ArrayList();
            for (n98 n98Var2 : set2) {
                if (((Boolean) x45Var.invoke(n98Var2)).booleanValue()) {
                    n98Var2.getClass();
                    arrayList3.addAll(!((Set) mk7.z(u67Var, ca3.j[0])).contains(n98Var2) ? ey3Var : (Collection) ca3Var.d.invoke(n98Var2));
                }
            }
            eu1.m0(arrayList3, js4Var);
            arrayList.addAll(arrayList3);
        }
        if (p83Var.a(p83.l)) {
            for (n98 n98Var3 : m()) {
                if (((Boolean) x45Var.invoke(n98Var3)).booleanValue()) {
                    i93 i93Var = (i93) this.b.a;
                    mn1 mn1VarL = l(n98Var3);
                    hn1 hn1Var = i93Var.t;
                    Set set3 = hn1.c;
                    y28 y28VarA = hn1Var.a(mn1VarL, null);
                    if (y28VarA != null) {
                        arrayList.add(y28VarA);
                    }
                }
            }
        }
        if (p83Var.a(p83.g)) {
            for (n98 n98Var4 : ca3Var.c.keySet()) {
                if (((Boolean) x45Var.invoke(n98Var4)).booleanValue()) {
                    ca3Var.getClass();
                    n98Var4.getClass();
                    ha3 ha3Var = (ha3) ca3Var.f.invoke(n98Var4);
                    if (ha3Var != null) {
                        arrayList.add(ha3Var);
                    }
                }
            }
        }
        return xz5.G(arrayList);
    }

    public abstract mn1 l(n98 n98Var);

    public final Set m() {
        return (Set) mk7.z(this.d, f[0]);
    }

    public abstract Set n();

    public abstract Set o();

    public abstract Set p();

    public boolean q(n98 n98Var) {
        n98Var.getClass();
        return m().contains(n98Var);
    }

    public boolean r(ga3 ga3Var) {
        return true;
    }

    public void j(n98 n98Var, ArrayList arrayList) {
    }

    public void k(n98 n98Var, ArrayList arrayList) {
    }
}
