package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class owd {
    public static final owd a = new owd();

    public static ArrayList a(AbstractCollection abstractCollection, b55 b55Var) {
        ArrayList arrayList = new ArrayList(abstractCollection);
        Iterator it2 = arrayList.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            hec hecVar = (hec) it2.next();
            if (!arrayList.isEmpty()) {
                Iterator it3 = arrayList.iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        break;
                    }
                    hec hecVar2 = (hec) it3.next();
                    if (hecVar2 != hecVar) {
                        hecVar2.getClass();
                        hecVar.getClass();
                        if (((Boolean) b55Var.invoke(hecVar2, hecVar)).booleanValue()) {
                            it2.remove();
                            break;
                        }
                    }
                }
            }
        }
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v7, types: [java.util.Set] */
    /* JADX WARN: Type inference failed for: r1v10 */
    /* JADX WARN: Type inference failed for: r1v11, types: [uvd] */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v7 */
    /* JADX WARN: Type inference failed for: r1v9, types: [java.lang.Object, uvd] */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v17, types: [hec] */
    /* JADX WARN: Type inference failed for: r5v3, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5, types: [hec, java.lang.Object, mn6] */
    /* JADX WARN: Type inference failed for: r5v6 */
    /* JADX WARN: Type inference failed for: r5v7 */
    public final hec b(ArrayList arrayList) {
        hec hecVarF;
        Set setC0;
        arrayList.size();
        ArrayList<hec> arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            hec hecVar = (hec) it2.next();
            if (hecVar.j0() instanceof u66) {
                Collection collectionB = hecVar.j0().b();
                collectionB.getClass();
                Collection<mn6> collection = collectionB;
                ArrayList arrayList3 = new ArrayList(cu1.k0(collection, 10));
                for (mn6 mn6Var : collection) {
                    mn6Var.getClass();
                    hec hecVarX = f49.X(mn6Var);
                    if (hecVar.k0()) {
                        hecVarX = hecVarX.n0(true);
                    }
                    arrayList3.add(hecVarX);
                }
                arrayList2.addAll(arrayList3);
            } else {
                arrayList2.add(hecVar);
            }
        }
        nwd nwdVarCombine = nwd.START;
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            nwdVarCombine = nwdVarCombine.combine((o3e) it3.next());
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (hec hecVarN0 : arrayList2) {
            if (nwdVarCombine == nwd.NOT_NULL) {
                if (hecVarN0 instanceof ve8) {
                    ve8 ve8Var = (ve8) hecVarN0;
                    hecVarN0 = new ve8(ve8Var.b, ve8Var.c, ve8Var.d, ve8Var.e, ve8Var.f, true);
                }
                hecVarN0.getClass();
                hec hecVarT = hpe.t(hecVarN0, false);
                hecVarN0 = (hecVarT == null && (hecVarT = gq7.J(hecVarN0)) == null) ? hecVarN0.n0(false) : hecVarT;
            }
            linkedHashSet.add(hecVarN0);
        }
        ArrayList arrayList4 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it4 = arrayList.iterator();
        while (it4.hasNext()) {
            arrayList4.add(((hec) it4.next()).i0());
        }
        Iterator it5 = arrayList4.iterator();
        hec hecVar2 = null;
        if (!it5.hasNext()) {
            ik4.k("Empty collection can't be reduced.");
            return null;
        }
        ?? next = it5.next();
        while (it5.hasNext()) {
            uvd uvdVar = (uvd) it5.next();
            next = (uvd) next;
            next.getClass();
            a1a a1aVar = uvd.b;
            uvdVar.getClass();
            if (!next.isEmpty() || !uvdVar.isEmpty()) {
                ArrayList arrayList5 = new ArrayList();
                Collection collectionValues = ((ConcurrentHashMap) a1aVar.b).values();
                collectionValues.getClass();
                Iterator it6 = collectionValues.iterator();
                while (it6.hasNext()) {
                    int iIntValue = ((Number) it6.next()).intValue();
                    oy oyVar = (oy) next.a.get(iIntValue);
                    oy oyVar2 = (oy) uvdVar.a.get(iIntValue);
                    if (oyVar != null) {
                        if (!g76.L(oyVar2, oyVar)) {
                            oyVar = null;
                        }
                        oyVar2 = oyVar;
                    } else if (oyVar2 == null || !g76.L(oyVar, oyVar2)) {
                        oyVar2 = null;
                    }
                    if (oyVar2 != null) {
                        arrayList5.add(oyVar2);
                    }
                }
                next = a1a.i(arrayList5);
            }
        }
        uvd uvdVar2 = (uvd) next;
        if (linkedHashSet.size() == 1) {
            hecVarF = (hec) bu1.Z0(linkedHashSet);
        } else {
            ArrayList arrayListA = a(linkedHashSet, new xi1(2, this, owd.class, "isStrictSupertype", "isStrictSupertype(Lorg/jetbrains/kotlin/types/KotlinType;Lorg/jetbrains/kotlin/types/KotlinType;)Z", 0, 19));
            arrayListA.isEmpty();
            v46 v46Var = v46.INTERSECTION_TYPE;
            if (!arrayListA.isEmpty()) {
                Iterator it7 = arrayListA.iterator();
                if (!it7.hasNext()) {
                    ik4.k("Empty collection can't be reduced.");
                    return null;
                }
                ?? next2 = it7.next();
                while (it7.hasNext()) {
                    hec hecVar3 = (hec) it7.next();
                    next2 = (hec) next2;
                    if (next2 != 0 && hecVar3 != null) {
                        zvd zvdVarJ0 = next2.j0();
                        zvd zvdVarJ02 = hecVar3.j0();
                        boolean z = zvdVarJ0 instanceof x46;
                        if (z && (zvdVarJ02 instanceof x46)) {
                            Set set = ((x46) zvdVarJ0).a;
                            Set set2 = ((x46) zvdVarJ02).a;
                            int i = w46.a[v46Var.ordinal()];
                            if (i == 1) {
                                setC0 = bu1.C0(set, set2);
                            } else {
                                if (i != 2) {
                                    ygf.a();
                                    return null;
                                }
                                Set set3 = set;
                                Set set4 = set2;
                                set3.getClass();
                                set4.getClass();
                                setC0 = bu1.p1(set3);
                                bu1.n0(set4, setC0);
                            }
                            x46 x46Var = new x46(setC0);
                            uvd.b.getClass();
                            uvd uvdVar3 = uvd.c;
                            uvdVar3.getClass();
                            next2 = pwd.Z(l24.a(t14.INTEGER_LITERAL_TYPE_SCOPE, true, "unknown integer literal type"), uvdVar3, x46Var, ey3.a, false);
                        } else if (z) {
                            if (((x46) zvdVarJ0).a.contains(hecVar3)) {
                                next2 = hecVar3;
                            }
                        } else if (!(zvdVarJ02 instanceof x46) || !((x46) zvdVarJ02).a.contains(next2)) {
                        }
                    }
                    next2 = 0;
                }
                hecVar2 = (hec) next2;
            }
            if (hecVar2 != null) {
                hecVarF = hecVar2;
            } else {
                cf8.b.getClass();
                ArrayList arrayListA2 = a(arrayListA, new xi1(2, bf8.b, df8.class, "equalTypes", "equalTypes(Lorg/jetbrains/kotlin/types/KotlinType;Lorg/jetbrains/kotlin/types/KotlinType;)Z", 0, 20));
                arrayListA2.isEmpty();
                hecVarF = arrayListA2.size() < 2 ? (hec) bu1.Z0(arrayListA2) : new u66(linkedHashSet).f();
            }
        }
        return hecVarF.p0(uvdVar2);
    }
}
