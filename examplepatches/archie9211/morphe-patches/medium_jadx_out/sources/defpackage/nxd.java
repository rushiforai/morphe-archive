package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class nxd {
    public static final i24 a = l24.c(k24.DONT_CARE, new String[0]);
    public static final i24 b = l24.c(k24.UNINFERRED_LAMBDA_PARAMETER_TYPE, new String[0]);
    public static final mxd c = new mxd("NO_EXPECTED_TYPE");
    public static final mxd d = new mxd("UNIT_EXPECTED_TYPE");

    public static boolean b(mn6 mn6Var) {
        if (mn6Var == null) {
            a(28);
            throw null;
        }
        if (mn6Var.k0()) {
            return true;
        }
        return (mn6Var.m0() instanceof zm4) && b(((zm4) mn6Var.m0()).c);
    }

    public static boolean c(mn6 mn6Var, x45 x45Var, zgc zgcVar) {
        if (mn6Var == null) {
            return false;
        }
        o3e o3eVarM0 = mn6Var.m0();
        if (m(mn6Var)) {
            return ((Boolean) x45Var.invoke(o3eVarM0)).booleanValue();
        }
        if (zgcVar != null && zgcVar.contains(mn6Var)) {
            return false;
        }
        if (((Boolean) x45Var.invoke(o3eVarM0)).booleanValue()) {
            return true;
        }
        if (zgcVar == null) {
            zgcVar = new zgc();
        }
        zgcVar.add(mn6Var);
        zm4 zm4Var = o3eVarM0 instanceof zm4 ? (zm4) o3eVarM0 : null;
        if (zm4Var != null && (c(zm4Var.b, x45Var, zgcVar) || c(zm4Var.c, x45Var, zgcVar))) {
            return true;
        }
        if ((o3eVarM0 instanceof v33) && c(((v33) o3eVarM0).b, x45Var, zgcVar)) {
            return true;
        }
        zvd zvdVarJ0 = mn6Var.j0();
        if (zvdVarJ0 instanceof u66) {
            Iterator it2 = ((u66) zvdVarJ0).b.iterator();
            while (it2.hasNext()) {
                if (c((mn6) it2.next(), x45Var, zgcVar)) {
                    return true;
                }
            }
            return false;
        }
        for (xwd xwdVar : mn6Var.h0()) {
            if (!xwdVar.c()) {
                if (c(xwdVar.b(), x45Var, zgcVar)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static List d(List list) {
        if (list == null) {
            a(16);
            throw null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(new onc(((swd) it2.next()).T()));
        }
        return bu1.m1(arrayList);
    }

    public static boolean e(mn6 mn6Var) throws gxd {
        if (mn6Var == null) {
            a(27);
            throw null;
        }
        if (!mn6Var.k0() && (!(mn6Var.m0() instanceof zm4) || !e(((zm4) mn6Var.m0()).c))) {
            if (!(mn6Var.m0() instanceof v33)) {
                if (f(mn6Var)) {
                    if (!(mn6Var.j0().a() instanceof y28)) {
                        ixd ixdVarD = ixd.d(mn6Var);
                        Collection<mn6> collectionB = mn6Var.j0().b();
                        ArrayList arrayList = new ArrayList(collectionB.size());
                        for (mn6 mn6Var2 : collectionB) {
                            if (mn6Var2 == null) {
                                a(21);
                                throw null;
                            }
                            mn6 mn6VarH = ixdVarD.h(mn6Var2, pqe.INVARIANT);
                            mn6 mn6VarI = mn6VarH != null ? i(mn6VarH, mn6Var.k0()) : null;
                            if (mn6VarI != null) {
                                arrayList.add(mn6VarI);
                            }
                        }
                        Iterator it2 = arrayList.iterator();
                        while (it2.hasNext()) {
                            if (e((mn6) it2.next())) {
                                return true;
                            }
                        }
                    }
                    return false;
                }
                zvd zvdVarJ0 = mn6Var.j0();
                if (zvdVarJ0 instanceof u66) {
                    Iterator it3 = ((u66) zvdVarJ0).b.iterator();
                    while (it3.hasNext()) {
                        if (e((mn6) it3.next())) {
                        }
                    }
                }
            }
            return false;
        }
        return true;
    }

    public static boolean f(mn6 mn6Var) {
        if (mn6Var == null) {
            a(60);
            throw null;
        }
        if ((mn6Var.j0().a() instanceof swd ? (swd) mn6Var.j0().a() : null) != null) {
            return true;
        }
        mn6Var.j0();
        return false;
    }

    public static o3e g(mn6 mn6Var) {
        if (mn6Var != null) {
            return h(mn6Var, true);
        }
        a(1);
        throw null;
    }

    public static o3e h(mn6 mn6Var, boolean z) {
        if (mn6Var == null) {
            a(3);
            throw null;
        }
        o3e o3eVarN0 = mn6Var.m0().n0(z);
        if (o3eVarN0 != null) {
            return o3eVarN0;
        }
        a(4);
        throw null;
    }

    public static mn6 i(mn6 mn6Var, boolean z) {
        if (mn6Var != null) {
            return z ? h(mn6Var, true) : mn6Var;
        }
        a(8);
        throw null;
    }

    public static hec j(hec hecVar, boolean z) {
        if (hecVar == null) {
            a(5);
            throw null;
        }
        if (!z) {
            return hecVar;
        }
        hec hecVarN0 = hecVar.n0(true);
        if (hecVarN0 != null) {
            return hecVarN0;
        }
        a(6);
        throw null;
    }

    public static onc k(swd swdVar) {
        if (swdVar != null) {
            return new onc(swdVar);
        }
        a(45);
        throw null;
    }

    public static xwd l(swd swdVar, v96 v96Var) {
        if (swdVar != null) {
            return v96Var.a == lxd.SUPERTYPE ? new onc(er7.H(swdVar)) : new onc(swdVar);
        }
        a(46);
        throw null;
    }

    public static boolean m(mn6 mn6Var) {
        if (mn6Var != null) {
            return mn6Var == c || mn6Var == d;
        }
        a(0);
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0122  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void a(int r27) {
        /*
            Method dump skipped, instruction units count: 778
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nxd.a(int):void");
    }
}
