package defpackage;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ts6 extends fv7 {
    public static final /* synthetic */ fj6[] m;
    public final n0c b;
    public final ts6 c;
    public final p67 d;
    public final u67 e;
    public final r67 f;
    public final v67 g;
    public final r67 h;
    public final u67 i;
    public final u67 j;
    public final u67 k;
    public final r67 l;

    static {
        u4a u4aVar = new u4a(ts6.class, "functionNamesLazy", "getFunctionNamesLazy()Ljava/util/Set;", 0);
        s1b s1bVar = n1b.a;
        m = new fj6[]{s1bVar.g(u4aVar), km4.t(ts6.class, "propertyNamesLazy", "getPropertyNamesLazy()Ljava/util/Set;", 0, s1bVar), km4.t(ts6.class, "classNamesLazy", "getClassNamesLazy()Ljava/util/Set;", 0, s1bVar)};
    }

    public ts6(n0c n0cVar, gs6 gs6Var) {
        n0cVar.getClass();
        this.b = n0cVar;
        this.c = gs6Var;
        x67 x67Var = ((k96) n0cVar.b).a;
        int i = 0;
        this.d = new p67(x67Var, new qs6(this, i));
        int i2 = 1;
        this.e = new u67(x67Var, new qs6(this, i2));
        this.f = x67Var.b(new rs6(this, i));
        this.g = x67Var.c(new rs6(this, i2));
        int i3 = 2;
        this.h = x67Var.b(new rs6(this, i3));
        this.i = new u67(x67Var, new qs6(this, i3));
        int i4 = 3;
        this.j = new u67(x67Var, new qs6(this, i4));
        this.k = new u67(x67Var, new qs6(this, 4));
        this.l = x67Var.b(new rs6(this, i4));
    }

    public static mn6 l(z0b z0bVar, n0c n0cVar) {
        z0bVar.getClass();
        Class<?> declaringClass = ((Method) z0bVar.b()).getDeclaringClass();
        declaringClass.getClass();
        return ((ku3) n0cVar.e).K(z0bVar.f(), gx1.e0(lxd.COMMON, declaringClass.isAnnotation(), null, 6));
    }

    public static sv0 u(n0c n0cVar, u55 u55Var, List list) throws Throwable {
        f09 f09Var;
        mn6 mn6Var;
        n98 n98Var;
        n98 n98VarE;
        ku3 ku3Var = (ku3) n0cVar.e;
        c38 c38Var = ((k96) n0cVar.b).h;
        i80 i80VarS1 = bu1.s1(list);
        ArrayList arrayList = new ArrayList(cu1.k0(i80VarS1, 10));
        Iterator it2 = i80VarS1.iterator();
        boolean z = false;
        while (true) {
            zm3 zm3Var = (zm3) it2;
            if (!zm3Var.b.hasNext()) {
                return new sv0(bu1.m1(arrayList), z, 2);
            }
            r06 r06Var = (r06) zm3Var.next();
            int i = r06Var.a;
            f1b f1bVar = (f1b) r06Var.b;
            as6 as6VarH0 = k50.h0(n0cVar, f1bVar);
            v96 v96VarE0 = gx1.e0(lxd.COMMON, false, null, 7);
            boolean z2 = f1bVar.d;
            d1b d1bVar = f1bVar.a;
            if (z2) {
                j0b j0bVar = d1bVar instanceof j0b ? (j0b) d1bVar : null;
                if (j0bVar == null) {
                    rd6.u("Vararg parameter should be an array: ", f1bVar);
                    return null;
                }
                o3e o3eVarJ = ku3Var.J(j0bVar, v96VarE0, true);
                f09Var = new f09(o3eVarJ, c38Var.e.f(o3eVarJ));
            } else {
                f09Var = new f09(ku3Var.K(d1bVar, v96VarE0), null);
            }
            mn6 mn6Var2 = (mn6) f09Var.a;
            mn6 mn6Var3 = (mn6) f09Var.b;
            if (g76.L(u55Var.getName().b(), "equals") && list.size() == 1 && c38Var.e.o().equals(mn6Var2)) {
                n98VarE = n98.e("other");
            } else {
                String str = f1bVar.c;
                n98 n98VarD = str != null ? n98.d(str) : null;
                if (n98VarD == null) {
                    z = true;
                }
                if (n98VarD == null) {
                    n98VarE = n98.e("p" + i);
                } else {
                    mn6Var = mn6Var2;
                    n98Var = n98VarD;
                    arrayList.add(new lqe(u55Var, null, i, as6VarH0, n98Var, mn6Var, false, false, false, mn6Var3, rz5.I(f1bVar)));
                }
            }
            mn6Var = mn6Var2;
            n98Var = n98VarE;
            arrayList.add(new lqe(u55Var, null, i, as6VarH0, n98Var, mn6Var, false, false, false, mn6Var3, rz5.I(f1bVar)));
        }
    }

    @Override // defpackage.fv7, defpackage.ev7
    public Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return !b().contains(n98Var) ? ey3.a : (Collection) this.h.invoke(n98Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set b() {
        return (Set) mk7.z(this.i, m[0]);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set c() {
        return (Set) mk7.z(this.k, m[2]);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return (Collection) this.d.invoke();
    }

    @Override // defpackage.fv7, defpackage.ev7
    public Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return !g().contains(n98Var) ? ey3.a : (Collection) this.l.invoke(n98Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set g() {
        return (Set) mk7.z(this.j, m[1]);
    }

    public abstract Set h(p83 p83Var, x45 x45Var);

    public abstract Set i(p83 p83Var, x45 x45Var);

    public abstract fw2 k();

    public abstract void m(LinkedHashSet linkedHashSet, n98 n98Var);

    public abstract void n(n98 n98Var, ArrayList arrayList);

    public abstract Set o(p83 p83Var);

    public abstract yq6 p();

    public abstract yv2 q();

    public boolean r(g96 g96Var) {
        return true;
    }

    public abstract ss6 s(z0b z0bVar, ArrayList arrayList, mn6 mn6Var, List list);

    public final g96 t(z0b z0bVar) throws Throwable {
        z0bVar.getClass();
        n0c n0cVar = this.b;
        g96 g96VarM0 = g96.M0(q(), k50.h0(n0cVar, z0bVar), z0bVar.c(), rz5.I(z0bVar), ((fw2) this.e.invoke()).b(z0bVar.c()) != null && ((ArrayList) z0bVar.g()).isEmpty());
        n0cVar.getClass();
        n0c n0cVar2 = new n0c((k96) n0cVar.b, new jl1(n0cVar, g96VarM0, z0bVar, 0), (vq6) n0cVar.d);
        ArrayList typeParameters = z0bVar.getTypeParameters();
        ArrayList arrayList = new ArrayList(cu1.k0(typeParameters, 10));
        Iterator it2 = typeParameters.iterator();
        while (it2.hasNext()) {
            swd swdVarB = ((vwd) n0cVar2.c).b((e1b) it2.next());
            swdVarB.getClass();
            arrayList.add(swdVarB);
        }
        sv0 sv0VarU = u(n0cVar2, g96VarM0, z0bVar.g());
        ss6 ss6VarS = s(z0bVar, arrayList, l(z0bVar, n0cVar2), (List) sv0VarU.c);
        List list = ss6VarS.d;
        yq6 yq6VarP = p();
        ArrayList arrayList2 = ss6VarS.c;
        List list2 = ss6VarS.b;
        mn6 mn6Var = ss6VarS.a;
        a28 a28Var = c28.Companion;
        boolean zIsAbstract = Modifier.isAbstract(((Method) z0bVar.b()).getModifiers());
        boolean zIsFinal = Modifier.isFinal(((Method) z0bVar.b()).getModifiers());
        a28Var.getClass();
        g96VarM0.L0(null, yq6VarP, ey3.a, arrayList2, list2, mn6Var, zIsAbstract ? c28.ABSTRACT : !zIsFinal ? c28.OPEN : c28.FINAL, pr7.p(z0bVar.e()), fy3.a);
        g96VarM0.E = f96.get(false, sv0VarU.b);
        if (list.isEmpty()) {
            return g96VarM0;
        }
        ik4.k("Should not be called");
        return null;
    }

    public String toString() {
        return "Lazy scope for " + q();
    }

    public void j(n98 n98Var, ArrayList arrayList) {
    }
}
