package defpackage;

import com.squareup.wire.sjIw.ezwlgQm;
import java.lang.annotation.Annotation;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gs6 extends ts6 {
    public static final /* synthetic */ int v = 0;
    public final y28 n;
    public final q0b o;
    public final boolean p;
    public final u67 q;
    public final u67 r;
    public final u67 s;
    public final u67 t;
    public final v67 u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gs6(n0c n0cVar, y28 y28Var, q0b q0bVar, boolean z, gs6 gs6Var) {
        super(n0cVar, gs6Var);
        n0cVar.getClass();
        q0bVar.getClass();
        this.n = y28Var;
        this.o = q0bVar;
        this.p = z;
        x67 x67Var = ((k96) n0cVar.b).a;
        this.q = new u67(x67Var, new ds6(this, n0cVar));
        this.r = new u67(x67Var, new es6(this, 0));
        this.s = new u67(x67Var, new ds6(n0cVar, this));
        this.t = new u67(x67Var, new es6(this, 1));
        this.u = x67Var.c(new dy4(this, 8, n0cVar));
    }

    public static bec A(bec becVar, s55 s55Var, AbstractCollection abstractCollection) {
        if (abstractCollection.isEmpty()) {
            return becVar;
        }
        Iterator it2 = abstractCollection.iterator();
        while (it2.hasNext()) {
            bec becVar2 = (bec) it2.next();
            if (!becVar.equals(becVar2) && becVar2.C == null && D(becVar2, s55Var)) {
                s55 s55VarBuild = becVar.d0().B().build();
                s55VarBuild.getClass();
                return (bec) s55VarBuild;
            }
        }
        return becVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0036  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.bec B(defpackage.bec r4) {
        /*
            java.util.List r0 = r4.I()
            r0.getClass()
            java.lang.Object r0 = defpackage.bu1.I0(r0)
            lqe r0 = (defpackage.lqe) r0
            r1 = 0
            if (r0 == 0) goto L7a
            mn6 r2 = r0.getType()
            zvd r2 = r2.j0()
            co1 r2 = r2.a()
            if (r2 == 0) goto L36
            int r3 = defpackage.f93.a
            z05 r2 = defpackage.d93.g(r2)
            r2.getClass()
            boolean r3 = r2.d()
            if (r3 == 0) goto L2e
            goto L2f
        L2e:
            r2 = r1
        L2f:
            if (r2 == 0) goto L36
            y05 r2 = r2.i()
            goto L37
        L36:
            r2 = r1
        L37:
            y05 r3 = defpackage.mnc.g
            boolean r2 = defpackage.g76.L(r2, r3)
            if (r2 == 0) goto L40
            goto L41
        L40:
            r0 = r1
        L41:
            if (r0 != 0) goto L44
            goto L7a
        L44:
            r55 r1 = r4.d0()
            java.util.List r4 = r4.I()
            r4.getClass()
            java.util.List r4 = defpackage.bu1.t0(r4)
            r55 r4 = r1.d(r4)
            mn6 r0 = r0.getType()
            java.util.List r0 = r0.h0()
            r1 = 0
            java.lang.Object r0 = r0.get(r1)
            xwd r0 = (defpackage.xwd) r0
            mn6 r0 = r0.b()
            r55 r4 = r4.z(r0)
            s55 r4 = r4.build()
            bec r4 = (defpackage.bec) r4
            if (r4 == 0) goto L79
            r0 = 1
            r4.v = r0
        L79:
            return r4
        L7a:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gs6.B(bec):bec");
    }

    public static boolean D(s55 s55Var, s55 s55Var2) {
        ax8 ax8VarB = cx8.c.n(s55Var2, s55Var, true).b();
        ax8VarB.getClass();
        return ax8VarB == ax8.OVERRIDABLE && !hlg.w(s55Var2, s55Var);
    }

    public static boolean E(bec becVar, bec becVar2) {
        int i = z01.l;
        becVar.getClass();
        if (g76.L(becVar.getName().b(), "removeAt") && g76.L(vp7.t(becVar), mlc.g.e)) {
            becVar2 = becVar2.a();
        }
        becVar2.getClass();
        return D(becVar2, becVar);
    }

    public static bec F(q4a q4aVar, String str, x45 x45Var) {
        bec becVar;
        Iterator it2 = ((Iterable) x45Var.invoke(n98.e(str))).iterator();
        do {
            becVar = null;
            if (!it2.hasNext()) {
                break;
            }
            bec becVar2 = (bec) it2.next();
            if (becVar2.I().size() == 0) {
                df8 df8Var = on6.a;
                mn6 mn6Var = becVar2.h;
                if (mn6Var == null ? false : df8Var.b(mn6Var, q4aVar.getType())) {
                    becVar = becVar2;
                }
            }
        } while (becVar == null);
        return becVar;
    }

    public static bec H(q4a q4aVar, x45 x45Var) {
        bec becVar;
        mn6 mn6Var;
        String strB = q4aVar.getName().b();
        strB.getClass();
        Iterator it2 = ((Iterable) x45Var.invoke(n98.e("set".concat(ce6.b(strB) ? strB.substring(2) : sgg.E(strB))))).iterator();
        do {
            becVar = null;
            if (!it2.hasNext()) {
                break;
            }
            bec becVar2 = (bec) it2.next();
            if (becVar2.I().size() == 1 && (mn6Var = becVar2.h) != null) {
                n98 n98Var = vm6.e;
                if (vm6.D(mn6Var, lnc.d)) {
                    df8 df8Var = on6.a;
                    List listI = becVar2.I();
                    listI.getClass();
                    if (df8Var.a(((lqe) bu1.a1(listI)).getType(), q4aVar.getType())) {
                        becVar = becVar2;
                    }
                }
            }
        } while (becVar == null);
        return becVar;
    }

    public static boolean K(bec becVar, s55 s55Var) {
        String strS = vp7.s(becVar, 2);
        s55 s55VarX0 = s55Var.x0();
        s55VarX0.getClass();
        return strS.equals(vp7.s(s55VarX0, 2)) && !D(becVar, s55Var);
    }

    public final boolean C(q4a q4aVar, x45 x45Var) {
        if (sgg.P(q4aVar)) {
            return false;
        }
        bec becVarG = G(q4aVar, x45Var);
        bec becVarH = H(q4aVar, x45Var);
        if (becVarG == null) {
            return false;
        }
        if (q4aVar.O()) {
            return becVarH != null && becVarH.o() == becVarG.o();
        }
        return true;
    }

    public final bec G(q4a q4aVar, x45 x45Var) {
        n98 n98Var;
        s4a s4aVarB = q4aVar.b();
        String strB = null;
        s4a s4aVar = s4aVarB != null ? (s4a) vp7.z(s4aVarB) : null;
        if (s4aVar != null) {
            vm6.z(s4aVar);
            f41 f41VarB = f93.b(f93.i(s4aVar), xx.s);
            if (f41VarB != null && (n98Var = (n98) b11.a.get(f93.g(f41VarB))) != null) {
                strB = n98Var.b();
            }
        }
        if (strB != null && !vp7.B(this.n, s4aVar)) {
            return F(q4aVar, strB, x45Var);
        }
        String strB2 = q4aVar.getName().b();
        strB2.getClass();
        return F(q4aVar, ce6.a(strB2), x45Var);
    }

    public final LinkedHashSet I(n98 n98Var) {
        Collection collectionZ = z();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator it2 = collectionZ.iterator();
        while (it2.hasNext()) {
            bu1.n0(((mn6) it2.next()).H().a(n98Var, ng8.WHEN_GET_SUPER_MEMBERS), linkedHashSet);
        }
        return linkedHashSet;
    }

    public final Set J(n98 n98Var) {
        Collection collectionZ = z();
        ArrayList arrayList = new ArrayList();
        Iterator it2 = collectionZ.iterator();
        while (it2.hasNext()) {
            Collection collectionF = ((mn6) it2.next()).H().f(n98Var, ng8.WHEN_GET_SUPER_MEMBERS);
            ArrayList arrayList2 = new ArrayList(cu1.k0(collectionF, 10));
            Iterator it3 = collectionF.iterator();
            while (it3.hasNext()) {
                arrayList2.add((q4a) it3.next());
            }
            bu1.n0(arrayList2, arrayList);
        }
        return bu1.q1(arrayList);
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0192  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0199  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean L(defpackage.bec r10) {
        /*
            Method dump skipped, instruction units count: 457
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gs6.L(bec):boolean");
    }

    public final void M(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        Object obj = this.b.b;
        this.n.getClass();
    }

    public final ArrayList N(n98 n98Var) {
        Collection collectionC = ((fw2) this.e.invoke()).c(n98Var);
        ArrayList arrayList = new ArrayList(cu1.k0(collectionC, 10));
        Iterator it2 = collectionC.iterator();
        while (it2.hasNext()) {
            arrayList.add(t((z0b) it2.next()));
        }
        return arrayList;
    }

    public final ArrayList O(n98 n98Var) {
        LinkedHashSet linkedHashSetI = I(n98Var);
        ArrayList arrayList = new ArrayList();
        for (Object obj : linkedHashSetI) {
            bec becVar = (bec) obj;
            becVar.getClass();
            if (vp7.z(becVar) == null && a11.a(becVar) == null) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    @Override // defpackage.ts6, defpackage.fv7, defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        M(n98Var, ng8Var);
        return super.a(n98Var, ng8Var);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        v67 v67Var;
        y28 y28Var;
        n98Var.getClass();
        ng8Var.getClass();
        M(n98Var, ng8Var);
        gs6 gs6Var = (gs6) this.c;
        return (gs6Var == null || (v67Var = gs6Var.u) == null || (y28Var = (y28) v67Var.invoke(n98Var)) == null) ? (co1) this.u.invoke(n98Var) : y28Var;
    }

    @Override // defpackage.ts6, defpackage.fv7, defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        M(n98Var, ng8Var);
        return super.f(n98Var, ng8Var);
    }

    @Override // defpackage.ts6
    public final Set h(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return qo7.v((Set) this.r.invoke(), ((Map) this.t.invoke()).keySet());
    }

    @Override // defpackage.ts6
    public final Set i(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        y28 y28Var = this.n;
        Collection collectionB = y28Var.n().b();
        collectionB.getClass();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator it2 = collectionB.iterator();
        while (it2.hasNext()) {
            bu1.n0(((mn6) it2.next()).H().b(), linkedHashSet);
        }
        u67 u67Var = this.e;
        linkedHashSet.addAll(((fw2) u67Var.invoke()).a());
        linkedHashSet.addAll(((fw2) u67Var.invoke()).e());
        linkedHashSet.addAll(h(p83Var, x45Var));
        n0c n0cVar = this.b;
        y28Var.getClass();
        n0cVar.getClass();
        linkedHashSet.addAll(new ArrayList());
        return linkedHashSet;
    }

    @Override // defpackage.ts6
    public final void j(n98 n98Var, ArrayList arrayList) throws Throwable {
        boolean zG = this.o.g();
        y28 y28Var = this.n;
        n0c n0cVar = this.b;
        if (zG) {
            u67 u67Var = this.e;
            if (((fw2) u67Var.invoke()).b(n98Var) != null) {
                if (arrayList.isEmpty()) {
                    c1b c1bVarB = ((fw2) u67Var.invoke()).b(n98Var);
                    c1bVarB.getClass();
                    g96 g96VarM0 = g96.M0(y28Var, k50.h0(n0cVar, c1bVarB), c1bVarB.c(), rz5.I(c1bVarB), true);
                    mn6 mn6VarK = ((ku3) n0cVar.e).K(c1bVarB.f(), gx1.e0(lxd.COMMON, false, null, 6));
                    yq6 yq6VarP = p();
                    c28.Companion.getClass();
                    c28 c28Var = c28.OPEN;
                    g93 g93Var = h93.e;
                    ey3 ey3Var = ey3.a;
                    g96VarM0.L0(null, yq6VarP, ey3Var, ey3Var, ey3Var, mn6VarK, c28Var, g93Var, null);
                    g96VarM0.E = f96.get(false, false);
                    arrayList.add(g96VarM0);
                } else {
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        if (((bec) it2.next()).I().isEmpty()) {
                            break;
                        }
                    }
                    c1b c1bVarB2 = ((fw2) u67Var.invoke()).b(n98Var);
                    c1bVarB2.getClass();
                    g96 g96VarM02 = g96.M0(y28Var, k50.h0(n0cVar, c1bVarB2), c1bVarB2.c(), rz5.I(c1bVarB2), true);
                    mn6 mn6VarK2 = ((ku3) n0cVar.e).K(c1bVarB2.f(), gx1.e0(lxd.COMMON, false, null, 6));
                    yq6 yq6VarP2 = p();
                    c28.Companion.getClass();
                    c28 c28Var2 = c28.OPEN;
                    g93 g93Var2 = h93.e;
                    ey3 ey3Var2 = ey3.a;
                    g96VarM02.L0(null, yq6VarP2, ey3Var2, ey3Var2, ey3Var2, mn6VarK2, c28Var2, g93Var2, null);
                    g96VarM02.E = f96.get(false, false);
                    arrayList.add(g96VarM02);
                }
            }
        }
        y28Var.getClass();
        n0cVar.getClass();
    }

    @Override // defpackage.ts6
    public final fw2 k() {
        return new cn1(this.o, h06.l);
    }

    @Override // defpackage.ts6
    public final void m(LinkedHashSet linkedHashSet, n98 n98Var) {
        LinkedHashSet linkedHashSetI = I(n98Var);
        if (!mlc.j.contains(n98Var)) {
            int i = a11.l;
            if (!mlc.e.contains(n98Var)) {
                if (!linkedHashSetI.isEmpty()) {
                    Iterator it2 = linkedHashSetI.iterator();
                    while (it2.hasNext()) {
                        if (((s55) it2.next()).isSuspend()) {
                        }
                    }
                }
                ArrayList arrayList = new ArrayList();
                for (Object obj : linkedHashSetI) {
                    if (L((bec) obj)) {
                        arrayList.add(obj);
                    }
                }
                w(linkedHashSet, n98Var, arrayList, false);
                return;
            }
        }
        zgc zgcVar = new zgc();
        LinkedHashSet linkedHashSetX = gx1.X(n98Var, linkedHashSetI, ey3.a, this.n, q14.d0, ((df8) ((k96) this.b.b).l).d);
        Class<gs6> cls = gs6.class;
        x(n98Var, linkedHashSet, linkedHashSetX, linkedHashSet, new k0(1, this, cls, "searchMethodsByNameWithoutBuiltinMagic", "searchMethodsByNameWithoutBuiltinMagic(Lorg/jetbrains/kotlin/name/Name;)Ljava/util/Collection;", 0, 23));
        x(n98Var, linkedHashSet, linkedHashSetX, zgcVar, new k0(1, this, cls, "searchMethodsInSupertypesWithoutBuiltinMagic", "searchMethodsInSupertypesWithoutBuiltinMagic(Lorg/jetbrains/kotlin/name/Name;)Ljava/util/Collection;", 0, 24));
        ArrayList arrayList2 = new ArrayList();
        for (Object obj2 : linkedHashSetI) {
            if (L((bec) obj2)) {
                arrayList2.add(obj2);
            }
        }
        w(linkedHashSet, n98Var, bu1.Q0(zgcVar, arrayList2), true);
    }

    @Override // defpackage.ts6
    public final void n(n98 n98Var, ArrayList arrayList) {
        n98 n98Var2;
        boolean zIsAnnotation = this.o.a.isAnnotation();
        n0c n0cVar = this.b;
        if (zIsAnnotation) {
            n98Var2 = n98Var;
            z0b z0bVar = (z0b) bu1.b1(((fw2) this.e.invoke()).c(n98Var2));
            if (z0bVar != null) {
                c28 c28Var = c28.FINAL;
                j96 j96VarG0 = j96.G0(this.n, k50.h0(n0cVar, z0bVar), c28Var, pr7.p(z0bVar.e()), false, z0bVar.c(), rz5.I(z0bVar), false);
                s4a s4aVarN = kng.n(j96VarG0, cd7.e);
                j96VarG0.C0(s4aVarN, null, null, null);
                n0cVar.getClass();
                mn6 mn6VarL = ts6.l(z0bVar, new n0c((k96) n0cVar.b, new jl1(n0cVar, j96VarG0, z0bVar, 0), (vq6) n0cVar.d));
                yq6 yq6VarP = p();
                ey3 ey3Var = ey3.a;
                j96VarG0.F0(mn6VarL, ey3Var, yq6VarP, null, ey3Var);
                s4aVarN.n = mn6VarL;
                arrayList.add(j96VarG0);
            }
        } else {
            n98Var2 = n98Var;
        }
        Set setJ = J(n98Var);
        if (setJ.isEmpty()) {
            return;
        }
        zgc zgcVar = new zgc();
        zgc zgcVar2 = new zgc();
        y(setJ, arrayList, zgcVar, new fs6(this, 0));
        y(qo7.t(setJ, zgcVar), zgcVar2, null, new fs6(this, 1));
        LinkedHashSet linkedHashSetV = qo7.v(setJ, zgcVar2);
        k96 k96Var = (k96) n0cVar.b;
        n98 n98Var3 = n98Var2;
        arrayList.addAll(gx1.X(n98Var3, linkedHashSetV, arrayList, this.n, fa4.o, ((df8) k96Var.l).d));
    }

    @Override // defpackage.ts6
    public final Set o(p83 p83Var) {
        p83Var.getClass();
        if (this.o.a.isAnnotation()) {
            return b();
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet(((fw2) this.e.invoke()).f());
        Collection collectionB = this.n.n().b();
        collectionB.getClass();
        Iterator it2 = collectionB.iterator();
        while (it2.hasNext()) {
            bu1.n0(((mn6) it2.next()).H().g(), linkedHashSet);
        }
        return linkedHashSet;
    }

    @Override // defpackage.ts6
    public final yq6 p() {
        y28 y28Var = this.n;
        if (y28Var != null) {
            int i = d93.a;
            return y28Var.k0();
        }
        d93.a(0);
        throw null;
    }

    @Override // defpackage.ts6
    public final yv2 q() {
        return this.n;
    }

    @Override // defpackage.ts6
    public final boolean r(g96 g96Var) {
        if (this.o.a.isAnnotation()) {
            return false;
        }
        return L(g96Var);
    }

    @Override // defpackage.ts6
    public final String toString() {
        return "Lazy Java member scope for " + this.o.c();
    }

    public final void v(ArrayList arrayList, r86 r86Var, int i, z0b z0bVar, mn6 mn6Var, mn6 mn6Var2) {
        g0b v0bVar;
        ky kyVar = cd7.e;
        n98 n98VarC = z0bVar.c();
        if (mn6Var == null) {
            nxd.a(2);
            throw null;
        }
        o3e o3eVarH = nxd.h(mn6Var, false);
        Object defaultValue = z0bVar.a.getDefaultValue();
        if (defaultValue != null) {
            Class<?> cls = defaultValue.getClass();
            List list = e0b.a;
            v0bVar = Enum.class.isAssignableFrom(cls) ? new v0b(null, (Enum) defaultValue) : defaultValue instanceof Annotation ? new h0b(null, (Annotation) defaultValue) : defaultValue instanceof Object[] ? new i0b(null, (Object[]) defaultValue) : defaultValue instanceof Class ? new r0b(null, (Class) defaultValue) : new x0b(null, defaultValue);
        } else {
            v0bVar = null;
        }
        boolean z = v0bVar != null;
        o3e o3eVarH2 = mn6Var2 != null ? nxd.h(mn6Var2, false) : null;
        Object obj = this.b.b;
        arrayList.add(new lqe(r86Var, null, i, kyVar, n98VarC, o3eVarH, z, false, false, o3eVarH2, rz5.I(z0bVar)));
    }

    public final void w(LinkedHashSet linkedHashSet, n98 n98Var, ArrayList arrayList, boolean z) {
        k96 k96Var = (k96) this.b.b;
        LinkedHashSet<bec> linkedHashSetX = gx1.X(n98Var, arrayList, linkedHashSet, this.n, fa4.o, ((df8) k96Var.l).d);
        if (!z) {
            linkedHashSet.addAll(linkedHashSetX);
            return;
        }
        ArrayList arrayListQ0 = bu1.Q0(linkedHashSetX, linkedHashSet);
        ArrayList arrayList2 = new ArrayList(cu1.k0(linkedHashSetX, 10));
        for (bec becVarA : linkedHashSetX) {
            bec becVar = (bec) vp7.A(becVarA);
            if (becVar != null) {
                becVarA = A(becVarA, becVar, arrayListQ0);
            }
            arrayList2.add(becVarA);
        }
        linkedHashSet.addAll(arrayList2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0067  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void x(defpackage.n98 r9, java.util.LinkedHashSet r10, java.util.LinkedHashSet r11, java.util.AbstractSet r12, defpackage.x45 r13) {
        /*
            Method dump skipped, instruction units count: 310
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gs6.x(n98, java.util.LinkedHashSet, java.util.LinkedHashSet, java.util.AbstractSet, x45):void");
    }

    public final void y(Set set, AbstractCollection abstractCollection, zgc zgcVar, x45 x45Var) {
        bec becVarH;
        x4a x4aVarV;
        d96 d96Var;
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            q4a q4aVar = (q4a) it2.next();
            if (C(q4aVar, x45Var)) {
                bec becVarG = G(q4aVar, x45Var);
                becVarG.getClass();
                if (q4aVar.O()) {
                    becVarH = H(q4aVar, x45Var);
                    becVarH.getClass();
                } else {
                    becVarH = null;
                }
                if (becVarH != null) {
                    becVarH.o();
                    becVarG.o();
                }
                y28 y28Var = this.n;
                y28Var.getClass();
                d96 d96Var2 = new d96(y28Var, cd7.e, becVarG.o(), becVarG.getVisibility(), becVarH != null, q4aVar.getName(), becVarG.d(), null, e41.DECLARATION, false, null);
                mn6 mn6Var = becVarG.h;
                mn6Var.getClass();
                yq6 yq6VarP = p();
                ey3 ey3Var = ey3.a;
                d96Var2.F0(mn6Var, ey3Var, yq6VarP, null, ey3Var);
                s4a s4aVarU = kng.u(d96Var2, becVarG.getAnnotations(), false, becVarG.d());
                s4aVarU.m = becVarG;
                s4aVarU.A0(d96Var2.getType());
                if (becVarH != null) {
                    List listI = becVarH.I();
                    listI.getClass();
                    lqe lqeVar = (lqe) bu1.z0(listI);
                    if (lqeVar == null) {
                        rd6.u("No parameter found for ", becVarH);
                        return;
                    } else {
                        x4aVarV = kng.v(d96Var2, becVarH.getAnnotations(), lqeVar.getAnnotations(), false, becVarH.getVisibility(), becVarH.d());
                        x4aVarV.m = becVarH;
                    }
                } else {
                    x4aVarV = null;
                }
                d96Var2.C0(s4aVarU, x4aVarV, null, null);
                d96Var = d96Var2;
            } else {
                d96Var = null;
            }
            if (d96Var != null) {
                abstractCollection.add(d96Var);
                if (zgcVar != null) {
                    zgcVar.add(q4aVar);
                    return;
                }
                return;
            }
        }
    }

    public final Collection z() {
        boolean z = this.p;
        y28 y28Var = this.n;
        if (z) {
            Collection collectionB = y28Var.n().b();
            collectionB.getClass();
            return collectionB;
        }
        Object obj = this.b.b;
        y28Var.getClass();
        Collection collectionB2 = y28Var.n().b();
        collectionB2.getClass();
        return collectionB2;
    }

    @Override // defpackage.ts6
    public final ss6 s(z0b z0bVar, ArrayList arrayList, mn6 mn6Var, List list) {
        z0bVar.getClass();
        Object obj = this.b.b;
        y28 y28Var = this.n;
        String str = ezwlgQm.fZTDXNU;
        if (y28Var != null) {
            List list2 = Collections.EMPTY_LIST;
            if (list2 != null) {
                return new ss6(mn6Var, list, arrayList, list2);
            }
            fm3.e("Argument for @NotNull parameter '%s' of %s.%s must not be null", new Object[]{str, "kotlin/reflect/jvm/internal/impl/load/java/components/SignaturePropagator$PropagatedSignature", "<init>"});
            return null;
        }
        Object[] objArr = new Object[3];
        switch (1) {
            case 1:
                objArr[0] = "owner";
                break;
            case 2:
                objArr[0] = "returnType";
                break;
            case 3:
                objArr[0] = "valueParameters";
                break;
            case 4:
                objArr[0] = "typeParameters";
                break;
            case 5:
                objArr[0] = "descriptor";
                break;
            case 6:
                objArr[0] = str;
                break;
            default:
                objArr[0] = "method";
                break;
        }
        objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/components/SignaturePropagator$1";
        objArr[2] = "resolvePropagatedSignature";
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
    }
}
