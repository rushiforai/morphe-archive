package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rn6 {
    public static final rn6 a = new rn6();

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [u66] */
    /* JADX WARN: Type inference failed for: r0v2, types: [u66] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r4v0, types: [swd] */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v3 */
    public static hec b(hec hecVar) {
        mn6 mn6VarB;
        zvd zvdVarJ0 = hecVar.j0();
        ?? r4 = 0;
        o3e o3eVarG = null;
        if (zvdVarJ0 instanceof n61) {
            n61 n61Var = (n61) zvdVarJ0;
            xwd xwdVar = n61Var.a;
            xwd xwdVar2 = xwdVar.a() == pqe.IN_VARIANCE ? xwdVar : null;
            o3e o3eVarM0 = (xwdVar2 == null || (mn6VarB = xwdVar2.b()) == null) ? null : mn6VarB.m0();
            we8 we8Var = n61Var.b;
            if (we8Var == null) {
                Collection collectionB = n61Var.b();
                ArrayList arrayList = new ArrayList(cu1.k0(collectionB, 10));
                Iterator it2 = collectionB.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((mn6) it2.next()).m0());
                }
                we8Var = new we8(xwdVar, new n93(1, arrayList), (swd) r4, 8);
                n61Var.b = we8Var;
            }
            return new ve8(i61.FOR_SUBTYPING, we8Var, o3eVarM0, hecVar.i0(), hecVar.k0(), 32);
        }
        if (!(zvdVarJ0 instanceof u66) || !hecVar.k0()) {
            return hecVar;
        }
        ?? r0 = (u66) zvdVarJ0;
        LinkedHashSet<mn6> linkedHashSet = r0.b;
        ArrayList arrayList2 = new ArrayList(cu1.k0(linkedHashSet, 10));
        boolean z = false;
        for (mn6 mn6Var : linkedHashSet) {
            mn6Var.getClass();
            o3e o3eVarG2 = nxd.g(mn6Var);
            o3eVarG2.getClass();
            arrayList2.add(o3eVarG2);
            z = true;
        }
        if (z) {
            mn6 mn6Var2 = r0.a;
            if (mn6Var2 != null) {
                o3eVarG = nxd.g(mn6Var2);
                o3eVarG.getClass();
            }
            arrayList2.isEmpty();
            LinkedHashSet linkedHashSet2 = new LinkedHashSet(arrayList2);
            linkedHashSet2.hashCode();
            u66 u66Var = new u66(linkedHashSet2);
            u66Var.a = o3eVarG;
            r4 = u66Var;
        }
        if (r4 != 0) {
            r0 = r4;
        }
        return r0.f();
    }

    public final o3e a(qn6 qn6Var) {
        o3e o3eVarK;
        qn6Var.getClass();
        if (!(qn6Var instanceof mn6)) {
            ay0.e("Failed requirement.");
            return null;
        }
        o3e o3eVarM0 = ((mn6) qn6Var).m0();
        if (o3eVarM0 instanceof hec) {
            o3eVarK = b((hec) o3eVarM0);
        } else {
            if (!(o3eVarM0 instanceof zm4)) {
                ygf.a();
                return null;
            }
            zm4 zm4Var = (zm4) o3eVarM0;
            hec hecVar = zm4Var.c;
            hec hecVar2 = zm4Var.b;
            hec hecVarB = b(hecVar2);
            hec hecVarB2 = b(hecVar);
            o3eVarK = (hecVarB == hecVar2 && hecVarB2 == hecVar) ? o3eVarM0 : pwd.K(hecVarB, hecVarB2);
        }
        k0 k0Var = new k0(1, this, rn6.class, "prepareType", "prepareType(Lorg/jetbrains/kotlin/types/model/KotlinTypeMarker;)Lorg/jetbrains/kotlin/types/UnwrappedType;", 0, 22);
        mn6 mn6VarR = qk7.r(o3eVarM0);
        return qk7.B(o3eVarK, mn6VarR != null ? (mn6) k0Var.invoke(mn6VarR) : null);
    }
}
