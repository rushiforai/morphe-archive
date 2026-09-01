package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class vm6 {
    public static final n98 e = n98.g("<built-ins module>");
    public c38 a;
    public final u67 b;
    public final r67 c;
    public final x67 d;

    public vm6(x67 x67Var) {
        this.d = x67Var;
        x67Var.a(new tm6(this, 0));
        int i = 1;
        this.b = new u67(x67Var, new tm6(this, i));
        this.c = x67Var.b(new hy(this, i));
    }

    public static boolean A(mn6 mn6Var, z05 z05Var) {
        if (mn6Var == null) {
            a(97);
            throw null;
        }
        if (z05Var != null) {
            return H(mn6Var.j0(), z05Var);
        }
        a(98);
        throw null;
    }

    public static boolean B(mn6 mn6Var, z05 z05Var) {
        if (z05Var != null) {
            return A(mn6Var, z05Var) && !mn6Var.k0();
        }
        a(NikonType2MakernoteDirectory.TAG_FLASH_USED);
        throw null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static boolean C(bw2 bw2Var) {
        if (bw2Var.x0().getAnnotations().g(lnc.m)) {
            return true;
        }
        if (!(bw2Var instanceof q4a)) {
            return false;
        }
        q4a q4aVar = (q4a) bw2Var;
        boolean zO = q4aVar.O();
        s4a s4aVarB = q4aVar.b();
        x4a x4aVarC = q4aVar.c();
        if (s4aVarB == null || !C(s4aVarB)) {
            return false;
        }
        if (zO) {
            return x4aVarC != null && C(x4aVarC);
        }
        return true;
    }

    public static boolean D(mn6 mn6Var, z05 z05Var) {
        if (mn6Var == null) {
            a(PanasonicMakernoteDirectory.TAG_COUNTRY);
            throw null;
        }
        if (z05Var != null) {
            return !mn6Var.k0() && A(mn6Var, z05Var);
        }
        a(106);
        throw null;
    }

    public static boolean E(mn6 mn6Var) {
        if (mn6Var != null) {
            return A(mn6Var, lnc.b) && !nxd.e(mn6Var);
        }
        a(136);
        throw null;
    }

    public static boolean F(mn6 mn6Var) {
        if (mn6Var.k0()) {
            return false;
        }
        co1 co1VarA = mn6Var.j0().a();
        return (co1VarA instanceof y28) && t((y28) co1VarA) != null;
    }

    public static boolean G(mn6 mn6Var) {
        return D(mn6Var, lnc.f);
    }

    public static boolean H(zvd zvdVar, z05 z05Var) {
        if (zvdVar == null) {
            a(101);
            throw null;
        }
        if (z05Var != null) {
            co1 co1VarA = zvdVar.a();
            return (co1VarA instanceof y28) && b((y28) co1VarA, z05Var);
        }
        a(102);
        throw null;
    }

    public static boolean I(yv2 yv2Var) {
        while (yv2Var != null) {
            if (yv2Var instanceof wx8) {
                y05 y05Var = ((xx8) ((wx8) yv2Var)).f;
                n98 n98Var = mnc.j;
                y05Var.getClass();
                n98Var.getClass();
                return y05Var.a.h(n98Var);
            }
            yv2Var = yv2Var.h();
        }
        return false;
    }

    public static boolean b(y28 y28Var, z05 z05Var) {
        if (y28Var == null) {
            a(103);
            throw null;
        }
        if (z05Var != null) {
            return y28Var.getName().equals(z05Var.g()) && z05Var.equals(d93.g(y28Var));
        }
        a(104);
        throw null;
    }

    public static x0a r(co1 co1Var) {
        if (lnc.e0.contains(co1Var.getName())) {
            return (x0a) lnc.g0.get(d93.g(co1Var));
        }
        return null;
    }

    public static x0a t(y28 y28Var) {
        if (lnc.d0.contains(y28Var.getName())) {
            return (x0a) lnc.f0.get(d93.g(y28Var));
        }
        return null;
    }

    public static boolean x(mn6 mn6Var) {
        if (mn6Var != null) {
            return A(mn6Var, lnc.a);
        }
        a(NikonType2MakernoteDirectory.TAG_LENS_STOPS);
        throw null;
    }

    public static boolean y(mn6 mn6Var) {
        if (mn6Var != null) {
            return A(mn6Var, lnc.g);
        }
        a(88);
        throw null;
    }

    public static boolean z(yv2 yv2Var) {
        if (yv2Var != null) {
            return d93.i(yv2Var, w01.class, false) != null;
        }
        a(9);
        throw null;
    }

    public final void c() {
        n98 n98Var = e;
        n98Var.getClass();
        x67 x67Var = this.d;
        c38 c38Var = new c38(n98Var, x67Var, this, 48);
        this.a = c38Var;
        u01.a.getClass();
        u01 u01Var = (u01) t01.b.getValue();
        c38 c38Var2 = this.a;
        Iterable iterableM = m();
        fa9 fa9VarP = p();
        bb bbVarD = d();
        v01 v01Var = (v01) u01Var;
        v01Var.getClass();
        c38Var2.getClass();
        iterableM.getClass();
        fa9VarP.getClass();
        bbVarD.getClass();
        Set<y05> set = mnc.q;
        k0 k0Var = new k0(1, v01Var.b, y01.class, "loadResource", "loadResource(Ljava/lang/String;)Ljava/io/InputStream;", 0, 3);
        set.getClass();
        ArrayList arrayList = new ArrayList();
        for (y05 y05Var : set) {
            r01.m.getClass();
            InputStream inputStream = (InputStream) k0Var.invoke(r01.a(y05Var));
            w01 w01VarN = inputStream != null ? s42.N(y05Var, x67Var, c38Var2, inputStream) : null;
            if (w01VarN != null) {
                arrayList.add(w01VarN);
            }
        }
        yx8 yx8Var = new yx8(arrayList);
        n0c n0cVar = new n0c(x67Var, c38Var2);
        pkf pkfVar = new pkf(yx8Var);
        r01 r01Var = r01.m;
        i93 i93Var = new i93(x67Var, c38Var2, pkfVar, new s26(c38Var2, n0cVar, r01Var), yx8Var, iterableM, n0cVar, bbVarD, fa9VarP, r01Var.a, null, new hpe(x67Var), 851968);
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((w01) it2.next()).z0(i93Var);
        }
        c38Var.i = yx8Var;
        c38 c38Var3 = this.a;
        c38Var3.getClass();
        c38Var3.h = new a38(k80.Q0(new c38[]{c38Var3}));
    }

    public bb d() {
        return rz5.c;
    }

    public final hec e() {
        hec hecVarT = k("Any").T();
        if (hecVarT != null) {
            return hecVarT;
        }
        a(51);
        throw null;
    }

    public final mn6 f(mn6 mn6Var) {
        if (mn6Var == null) {
            a(68);
            throw null;
        }
        mn6 mn6VarG = g(mn6Var);
        if (mn6VarG != null) {
            return mn6VarG;
        }
        ik4.o("not array: ", mn6Var);
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x008e A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.mn6 g(defpackage.mn6 r4) {
        /*
            r3 = this;
            r0 = 0
            if (r4 == 0) goto L90
            boolean r1 = y(r4)
            r2 = 0
            if (r1 == 0) goto L26
            java.util.List r3 = r4.h0()
            int r3 = r3.size()
            r1 = 1
            if (r3 == r1) goto L17
            goto L8f
        L17:
            java.util.List r3 = r4.h0()
            java.lang.Object r3 = r3.get(r2)
            xwd r3 = (defpackage.xwd) r3
            mn6 r3 = r3.b()
            return r3
        L26:
            o3e r4 = defpackage.nxd.h(r4, r2)
            u67 r3 = r3.b
            java.lang.Object r3 = r3.invoke()
            um6 r3 = (defpackage.um6) r3
            java.util.HashMap r3 = r3.b
            java.lang.Object r3 = r3.get(r4)
            mn6 r3 = (defpackage.mn6) r3
            if (r3 == 0) goto L3d
            return r3
        L3d:
            int r3 = defpackage.d93.a
            zvd r3 = r4.j0()
            co1 r3 = r3.a()
            if (r3 != 0) goto L4b
            r3 = r0
            goto L4f
        L4b:
            b38 r3 = defpackage.d93.e(r3)
        L4f:
            if (r3 == 0) goto L8f
            zvd r4 = r4.j0()
            co1 r4 = r4.a()
            if (r4 != 0) goto L5d
        L5b:
            r3 = r0
            goto L8c
        L5d:
            java.util.Set r1 = defpackage.v2e.a
            n98 r1 = r4.getName()
            r1.getClass()
            java.util.LinkedHashSet r2 = defpackage.v2e.d
            boolean r1 = r2.contains(r1)
            if (r1 != 0) goto L6f
            goto L5b
        L6f:
            mn1 r4 = defpackage.f93.f(r4)
            if (r4 != 0) goto L76
            goto L5b
        L76:
            java.util.HashMap r1 = defpackage.v2e.b
            java.lang.Object r4 = r1.get(r4)
            mn1 r4 = (defpackage.mn1) r4
            if (r4 != 0) goto L81
            goto L5b
        L81:
            y28 r3 = defpackage.d46.F(r3, r4)
            if (r3 != 0) goto L88
            goto L5b
        L88:
            hec r3 = r3.T()
        L8c:
            if (r3 == 0) goto L8f
            return r3
        L8f:
            return r0
        L90:
            r3 = 70
            a(r3)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vm6.g(mn6):mn6");
    }

    public final hec h(mn6 mn6Var, pqe pqeVar) {
        if (pqeVar == null) {
            a(82);
            throw null;
        }
        if (mn6Var != null) {
            return i(pqeVar, mn6Var, cd7.e);
        }
        a(83);
        throw null;
    }

    public final hec i(pqe pqeVar, mn6 mn6Var, ly lyVar) {
        if (pqeVar == null) {
            a(78);
            throw null;
        }
        if (mn6Var != null) {
            return pwd.X(pr7.o(lyVar), k("Array"), Collections.singletonList(new onc(mn6Var, pqeVar)));
        }
        a(79);
        throw null;
    }

    public final y28 j(y05 y05Var) {
        if (y05Var == null) {
            a(12);
            throw null;
        }
        y28 y28VarC0 = bo.c0(l(), y05Var, ng8.FROM_BUILTINS);
        if (y28VarC0 != null) {
            return y28VarC0;
        }
        a(13);
        throw null;
    }

    public final y28 k(String str) {
        if (str != null) {
            return (y28) this.c.invoke(n98.e(str));
        }
        a(14);
        throw null;
    }

    public final c38 l() {
        this.a.getClass();
        c38 c38Var = this.a;
        if (c38Var != null) {
            return c38Var;
        }
        a(7);
        throw null;
    }

    public Iterable m() {
        List listSingletonList = Collections.singletonList(new q01(this.d, l()));
        if (listSingletonList != null) {
            return listSingletonList;
        }
        a(5);
        throw null;
    }

    public final hec n() {
        hec hecVarT = k("Nothing").T();
        if (hecVarT != null) {
            return hecVarT;
        }
        a(49);
        throw null;
    }

    public final hec o() {
        hec hecVarQ0 = e().n0(true);
        if (hecVarQ0 != null) {
            return hecVarQ0;
        }
        a(52);
        throw null;
    }

    public fa9 p() {
        return u3b.h;
    }

    public final hec q(x0a x0aVar) {
        if (x0aVar == null) {
            a(73);
            throw null;
        }
        hec hecVar = (hec) ((um6) this.b.invoke()).a.get(x0aVar);
        if (hecVar != null) {
            return hecVar;
        }
        a(74);
        throw null;
    }

    public final hec s(x0a x0aVar) {
        if (x0aVar == null) {
            a(54);
            throw null;
        }
        hec hecVarT = k(x0aVar.getTypeName().b()).T();
        if (hecVarT != null) {
            return hecVarT;
        }
        a(55);
        throw null;
    }

    public final hec u() {
        hec hecVarT = k("String").T();
        if (hecVarT != null) {
            return hecVarT;
        }
        a(66);
        throw null;
    }

    public final y28 v(int i) {
        y28 y28VarJ = j(mnc.f.a(n98.e(b65.c.b + i)));
        if (y28VarJ != null) {
            return y28VarJ;
        }
        a(18);
        throw null;
    }

    public final hec w() {
        hec hecVarT = k("Unit").T();
        if (hecVarT != null) {
            return hecVarT;
        }
        a(65);
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0035 A[FALL_THROUGH] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void a(int r23) {
        /*
            Method dump skipped, instruction units count: 2226
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vm6.a(int):void");
    }
}
