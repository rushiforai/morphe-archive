package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oe6 implements bb, fa9 {
    public static final /* synthetic */ fj6[] h;
    public final c38 a;
    public final u67 b;
    public final hec c;
    public final u67 d;
    public final r67 e;
    public final u67 f;
    public final r67 g;

    static {
        u4a u4aVar = new u4a(oe6.class, "settings", "getSettings()Lorg/jetbrains/kotlin/builtins/jvm/JvmBuiltIns$Settings;", 0);
        s1b s1bVar = n1b.a;
        h = new fj6[]{s1bVar.g(u4aVar), km4.t(oe6.class, "cloneableType", "getCloneableType()Lorg/jetbrains/kotlin/types/SimpleType;", 0, s1bVar), km4.t(oe6.class, "notConsideredDeprecation", "getNotConsideredDeprecation()Lorg/jetbrains/kotlin/descriptors/annotations/Annotations;", 0, s1bVar)};
    }

    public oe6(c38 c38Var, x67 x67Var, v2 v2Var) {
        this.a = c38Var;
        this.b = new u67(x67Var, v2Var);
        fn1 fn1Var = new fn1(new gy3(c38Var, new y05("java.io"), 1), n98.e("Serializable"), c28.ABSTRACT, qn1.INTERFACE, d46.Q(new cx6(x67Var, new le6(this, 1))), x67Var);
        fn1Var.w0(dv7.b, ny3.a, null);
        this.c = fn1Var.T();
        this.d = new u67(x67Var, new a3(this, 13, x67Var));
        this.e = new r67(x67Var, new ConcurrentHashMap(3, 1.0f, 2), new zkc(26), 0);
        this.f = new u67(x67Var, new le6(this, 0));
        this.g = x67Var.b(new z(17, this));
    }

    public final cs6 a(y28 y28Var) {
        y05 y05VarA;
        if (y28Var == null) {
            vm6.a(108);
            throw null;
        }
        if (!vm6.b(y28Var, lnc.a) && vm6.I(y28Var)) {
            int i = f93.a;
            z05 z05VarG = d93.g(y28Var);
            z05VarG.getClass();
            if (z05VarG.d()) {
                String str = s96.a;
                mn1 mn1VarG = s96.g(z05VarG);
                if (mn1VarG != null && (y05VarA = mn1VarG.a()) != null) {
                    y28 y28VarC0 = bo.c0(b().a, y05VarA, ng8.FROM_BUILTINS);
                    if (y28VarC0 instanceof cs6) {
                        return (cs6) y28VarC0;
                    }
                }
            }
        }
        return null;
    }

    public final ie6 b() {
        return (ie6) mk7.z(this.b, h[0]);
    }

    @Override // defpackage.fa9
    public final boolean e(y28 y28Var, ga3 ga3Var) {
        y28Var.getClass();
        cs6 cs6VarA = a(y28Var);
        if (cs6VarA == null || !ga3Var.getAnnotations().g(ga9.a)) {
            return true;
        }
        b().getClass();
        String strS = vp7.s(ga3Var, 3);
        gs6 gs6VarW0 = cs6VarA.w0();
        n98 name = ga3Var.getName();
        name.getClass();
        Collection collectionA = gs6VarW0.a(name, ng8.FROM_BUILTINS);
        if ((collectionA instanceof Collection) && collectionA.isEmpty()) {
            return false;
        }
        Iterator it2 = collectionA.iterator();
        while (it2.hasNext()) {
            if (vp7.s((bec) it2.next(), 3).equals(strS)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.bb
    public final Collection g(y28 y28Var) throws gxd {
        z05 z05VarG;
        wz7 wz7Var = wz7.i;
        if (y28Var.b0() == qn1.CLASS) {
            b().getClass();
            cs6 cs6VarA = a(y28Var);
            if (cs6VarA != null) {
                y05 y05VarG = f93.g(cs6VarA);
                p94 p94Var = p94.f;
                p94Var.getClass();
                String str = s96.a;
                mn1 mn1VarF = s96.f(y05VarG);
                y28 y28VarJ = mn1VarF != null ? p94Var.j(mn1VarF.a()) : null;
                if (y28VarJ != null) {
                    ixd ixdVar = new ixd(kyd.O(y28VarJ, cs6VarA));
                    List list = (List) cs6VarA.q.q.invoke();
                    ArrayList<zm1> arrayList = new ArrayList();
                    for (Object obj : list) {
                        zm1 zm1Var = (zm1) obj;
                        if (zm1Var.getVisibility().a.b) {
                            Collection collectionW = y28VarJ.w();
                            collectionW.getClass();
                            Collection<zm1> collection = collectionW;
                            if (!(collection instanceof Collection) || !collection.isEmpty()) {
                                for (zm1 zm1Var2 : collection) {
                                    zm1Var2.getClass();
                                    if (cx8.j(zm1Var2, zm1Var.f(ixdVar)) == ax8.OVERRIDABLE) {
                                        break;
                                    }
                                }
                            }
                            if (zm1Var.I().size() == 1) {
                                List listI = zm1Var.I();
                                listI.getClass();
                                co1 co1VarA = ((lqe) bu1.a1(listI)).getType().j0().a();
                                if (co1VarA != null) {
                                    int i = f93.a;
                                    z05VarG = d93.g(co1VarA);
                                    z05VarG.getClass();
                                } else {
                                    z05VarG = null;
                                }
                                z05 z05VarG2 = d93.g(y28Var);
                                z05VarG2.getClass();
                                if (g76.L(z05VarG, z05VarG2)) {
                                }
                            }
                            if (!vm6.C(zm1Var)) {
                                LinkedHashSet linkedHashSet = re6.f;
                                String strS = vp7.s(zm1Var, 3);
                                String str2 = s96.a;
                                mn1 mn1VarG = s96.g(f93.g(cs6VarA).a);
                                if (!linkedHashSet.contains((mn1VarG != null ? te6.e(mn1VarG) : hlg.t(cs6VarA, wz7Var)) + '.' + strS)) {
                                    arrayList.add(obj);
                                }
                            }
                        }
                    }
                    ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
                    for (zm1 zm1Var3 : arrayList) {
                        zm1Var3.getClass();
                        t55 t55VarE0 = zm1Var3.E0(ixd.b);
                        t55VarE0.b = y28Var;
                        t55VarE0.z(y28Var.T());
                        t55VarE0.o = true;
                        t55VarE0.a = ixdVar.a;
                        LinkedHashSet linkedHashSet2 = re6.g;
                        String strS2 = vp7.s(zm1Var3, 3);
                        String str3 = s96.a;
                        mn1 mn1VarG2 = s96.g(f93.g(cs6VarA).a);
                        if (!linkedHashSet2.contains((mn1VarG2 != null ? te6.e(mn1VarG2) : hlg.t(cs6VarA, wz7Var)) + '.' + strS2)) {
                            t55VarE0.r((ly) mk7.z(this.f, h[2]));
                        }
                        u55 u55VarB0 = t55VarE0.x.B0(t55VarE0);
                        u55VarB0.getClass();
                        arrayList2.add((zm1) u55VarB0);
                    }
                    return arrayList2;
                }
            }
        }
        return ey3.a;
    }

    @Override // defpackage.bb
    public final Collection h(y28 y28Var) {
        Set setB;
        y28Var.getClass();
        b().getClass();
        cs6 cs6VarA = a(y28Var);
        if (cs6VarA == null || (setB = cs6VarA.w0().b()) == null) {
            setB = ny3.a;
        }
        return setB;
    }

    @Override // defpackage.bb
    public final Collection j(y28 y28Var) {
        int i = f93.a;
        z05 z05VarG = d93.g(y28Var);
        z05VarG.getClass();
        LinkedHashSet linkedHashSet = re6.a;
        z05 z05Var = lnc.g;
        boolean zEquals = z05VarG.equals(z05Var);
        boolean zIsAssignableFrom = false;
        hec hecVar = this.c;
        if (!zEquals) {
            HashMap map = lnc.g0;
            if (map.get(z05VarG) == null) {
                if (z05VarG.equals(z05Var) || map.get(z05VarG) != null) {
                    zIsAssignableFrom = true;
                } else {
                    String str = s96.a;
                    mn1 mn1VarG = s96.g(z05VarG);
                    if (mn1VarG != null) {
                        try {
                            zIsAssignableFrom = Serializable.class.isAssignableFrom(Class.forName(mn1VarG.a().a.a));
                        } catch (ClassNotFoundException unused) {
                        }
                    }
                }
                return zIsAssignableFrom ? d46.Q(hecVar) : ey3.a;
            }
        }
        return d46.R((hec) mk7.z(this.d, h[1]), hecVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x013a  */
    @Override // defpackage.bb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.Collection n(defpackage.n98 r18, defpackage.y28 r19) {
        /*
            Method dump skipped, instruction units count: 896
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.oe6.n(n98, y28):java.util.Collection");
    }
}
