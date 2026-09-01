package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.ServiceLoader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cx8 {
    public static final List b = bu1.m1(ServiceLoader.load(y74.class, y74.class.getClassLoader()));
    public static final cx8 c;
    public static final fa4 d;
    public final nn6 a;

    static {
        fa4 fa4Var = new fa4(21);
        d = fa4Var;
        c = new cx8(fa4Var);
    }

    public cx8(nn6 nn6Var) {
        if (nn6Var != null) {
            this.a = nn6Var;
        } else {
            a(5);
            throw null;
        }
    }

    public static boolean b(mn6 mn6Var, mn6 mn6Var2, xvd xvdVar) {
        if (mn6Var == null) {
            a(44);
            throw null;
        }
        if (mn6Var2 == null) {
            a(45);
            throw null;
        }
        if (kyd.a0(mn6Var) && kyd.a0(mn6Var2)) {
            return true;
        }
        return dq1.p(xvdVar, mn6Var.m0(), mn6Var2.m0());
    }

    public static void c(f41 f41Var, LinkedHashSet linkedHashSet) {
        if (f41Var == null) {
            a(17);
            throw null;
        }
        if (f41Var.j().isReal()) {
            linkedHashSet.add(f41Var);
        } else {
            if (f41Var.i().isEmpty()) {
                ik4.o("No overridden descriptors found for (fake override) ", f41Var);
                return;
            }
            Iterator it2 = f41Var.i().iterator();
            while (it2.hasNext()) {
                c((f41) it2.next(), linkedHashSet);
            }
        }
    }

    public static ArrayList d(c41 c41Var) {
        yq6 yq6VarP = c41Var.P();
        ArrayList arrayList = new ArrayList();
        if (yq6VarP != null) {
            arrayList.add(yq6VarP.getType());
        }
        Iterator it2 = c41Var.I().iterator();
        while (it2.hasNext()) {
            arrayList.add(((lqe) it2.next()).getType());
        }
        return arrayList;
    }

    /* JADX WARN: Code restructure failed: missing block: B:112:0x0188, code lost:
    
        if (r1 == false) goto L114;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x018a, code lost:
    
        r0 = defpackage.h93.h;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x018d, code lost:
    
        r0 = defpackage.h93.g;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x018f, code lost:
    
        r11 = ((defpackage.f41) s(r10, new defpackage.zkc(27))).A(r11, r2, r0, defpackage.e41.FAKE_OVERRIDE);
        r12.G(r11, r10);
        r12.u(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x01a8, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void e(java.util.Collection r10, defpackage.y28 r11, defpackage.er7 r12) {
        /*
            Method dump skipped, instruction units count: 449
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cx8.e(java.util.Collection, y28, er7):void");
    }

    public static ArrayList g(Object obj, LinkedList linkedList, x45 x45Var, x45 x45Var2) {
        if (obj == null) {
            a(97);
            throw null;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(obj);
        c41 c41Var = (c41) x45Var.invoke(obj);
        Iterator it2 = linkedList.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            c41 c41Var2 = (c41) x45Var.invoke(next);
            if (obj == next) {
                it2.remove();
            } else {
                ax8 ax8VarJ = j(c41Var, c41Var2);
                if (ax8VarJ == ax8.OVERRIDABLE) {
                    arrayList.add(next);
                    it2.remove();
                } else if (ax8VarJ == ax8.CONFLICT) {
                    x45Var2.invoke(next);
                    it2.remove();
                }
            }
        }
        return arrayList;
    }

    public static bx8 i(c41 c41Var, c41 c41Var2) {
        boolean z;
        if (c41Var == null) {
            a(38);
            throw null;
        }
        if (c41Var2 == null) {
            a(39);
            throw null;
        }
        boolean z2 = c41Var instanceof s55;
        if ((z2 && !(c41Var2 instanceof s55)) || (((z = c41Var instanceof q4a)) && !(c41Var2 instanceof q4a))) {
            return bx8.c("Member kind mismatch");
        }
        if (!z2 && !z) {
            ik4.h("This type of CallableDescriptor cannot be checked for overridability: ", c41Var);
            return null;
        }
        if (!c41Var.getName().equals(c41Var2.getName())) {
            return bx8.c("Name mismatch");
        }
        bx8 bx8VarC = (c41Var.P() == null) != (c41Var2.P() == null) ? bx8.c("Receiver presence mismatch") : c41Var.I().size() != c41Var2.I().size() ? bx8.c("Value parameter number mismatch") : null;
        if (bx8VarC != null) {
            return bx8VarC;
        }
        return null;
    }

    public static ax8 j(c41 c41Var, c41 c41Var2) {
        cx8 cx8Var = c;
        ax8 ax8VarB = cx8Var.l(c41Var2, c41Var, null).b();
        ax8 ax8VarB2 = cx8Var.m(c41Var, c41Var2, null, false).b();
        ax8 ax8Var = ax8.OVERRIDABLE;
        if (ax8VarB == ax8Var && ax8VarB2 == ax8Var) {
            return ax8Var;
        }
        ax8 ax8Var2 = ax8.CONFLICT;
        return (ax8VarB == ax8Var2 || ax8VarB2 == ax8Var2) ? ax8Var2 : ax8.INCOMPATIBLE;
    }

    public static boolean k(c41 c41Var, c41 c41Var2) {
        if (c41Var == null) {
            a(65);
            throw null;
        }
        if (c41Var2 == null) {
            a(66);
            throw null;
        }
        mn6 returnType = c41Var.getReturnType();
        mn6 returnType2 = c41Var2.getReturnType();
        if (p(c41Var, c41Var2)) {
            xvd xvdVarF = c.f(c41Var.getTypeParameters(), c41Var2.getTypeParameters());
            if (c41Var instanceof s55) {
                return o(c41Var, returnType, c41Var2, returnType2, xvdVarF);
            }
            if (!(c41Var instanceof q4a)) {
                z72.d("Unexpected callable: ", c41Var.getClass());
                return false;
            }
            q4a q4aVar = (q4a) c41Var;
            q4a q4aVar2 = (q4a) c41Var2;
            x4a x4aVarC = q4aVar.c();
            x4a x4aVarC2 = q4aVar2.c();
            if ((x4aVarC == null || x4aVarC2 == null) ? true : p(x4aVarC, x4aVarC2)) {
                if (q4aVar.O() && q4aVar2.O()) {
                    return dq1.p(xvdVarF, returnType.m0(), returnType2.m0());
                }
                if ((q4aVar.O() || !q4aVar2.O()) && o(c41Var, returnType, c41Var2, returnType2, xvdVarF)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean o(c41 c41Var, mn6 mn6Var, c41 c41Var2, mn6 mn6Var2, xvd xvdVar) {
        if (c41Var == null) {
            a(71);
            throw null;
        }
        if (mn6Var == null) {
            a(72);
            throw null;
        }
        if (c41Var2 == null) {
            a(73);
            throw null;
        }
        if (mn6Var2 == null) {
            a(74);
            throw null;
        }
        o3e o3eVarM0 = mn6Var.m0();
        o3e o3eVarM02 = mn6Var2.m0();
        if (o3eVarM0 == o3eVarM02) {
            return true;
        }
        if (!xvdVar.b(o3eVarM0, o3eVarM02)) {
            return false;
        }
        return dq1.c.l(xvdVar, xvdVar.c, o3eVarM0, o3eVarM02);
    }

    public static boolean p(c41 c41Var, c41 c41Var2) {
        Integer numB = h93.b(c41Var.getVisibility(), c41Var2.getVisibility());
        return numB == null || numB.intValue() >= 0;
    }

    public static boolean q(c41 c41Var, c41 c41Var2) {
        h1c h1cVar = h1c.e;
        if (c41Var == null) {
            a(13);
            throw null;
        }
        if (c41Var2 == null) {
            a(14);
            throw null;
        }
        if (!c41Var.equals(c41Var2) && h1cVar.O0(c41Var.x0(), c41Var2.x0(), false)) {
            return true;
        }
        c41 c41VarX0 = c41Var2.x0();
        int i = d93.a;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        d93.b(c41Var.x0(), linkedHashSet);
        Iterator it2 = linkedHashSet.iterator();
        while (it2.hasNext()) {
            if (h1cVar.O0(c41VarX0, (c41) it2.next(), false)) {
                return true;
            }
        }
        return false;
    }

    public static void r(f41 f41Var, x45 x45Var) {
        g93 g93Var;
        g93 g93VarF;
        g93 g93Var2;
        if (f41Var == null) {
            a(PanasonicMakernoteDirectory.TAG_COUNTRY);
            throw null;
        }
        for (f41 f41Var2 : f41Var.i()) {
            if (f41Var2.getVisibility() == h93.g) {
                r(f41Var2, x45Var);
            }
        }
        if (f41Var.getVisibility() != h93.g) {
            return;
        }
        Collection<f41> collectionI = f41Var.i();
        if (collectionI == null) {
            a(107);
            throw null;
        }
        if (collectionI.isEmpty()) {
            g93VarF = h93.j;
        } else {
            Iterator it2 = collectionI.iterator();
            loop3: while (true) {
                g93Var = null;
                while (it2.hasNext()) {
                    g93 visibility = ((f41) it2.next()).getVisibility();
                    if (g93Var != null) {
                        Integer numB = h93.b(visibility, g93Var);
                        if (numB == null) {
                            break;
                        } else if (numB.intValue() > 0) {
                        }
                    }
                    g93Var = visibility;
                }
            }
            if (g93Var == null) {
                g93VarF = null;
                break;
            }
            Iterator it3 = collectionI.iterator();
            while (it3.hasNext()) {
                Integer numB2 = h93.b(g93Var, ((f41) it3.next()).getVisibility());
                if (numB2 == null || numB2.intValue() < 0) {
                    g93VarF = null;
                    break;
                }
            }
            g93VarF = g93Var;
        }
        if (g93VarF == null) {
            g93VarF = null;
            break;
        }
        if (f41Var.j() == e41.FAKE_OVERRIDE) {
            for (f41 f41Var3 : collectionI) {
                if (f41Var3.o() != c28.ABSTRACT && !f41Var3.getVisibility().equals(g93VarF)) {
                    g93VarF = null;
                    break;
                }
            }
        } else {
            g93VarF = h93.f(g93VarF.a.l());
        }
        if (g93VarF == null) {
            if (x45Var != null) {
                x45Var.invoke(f41Var);
            }
            g93Var2 = h93.e;
        } else {
            g93Var2 = g93VarF;
        }
        if (f41Var instanceof r4a) {
            r4a r4aVar = (r4a) f41Var;
            if (g93Var2 == null) {
                r4a.f0(20);
                throw null;
            }
            r4aVar.k = g93Var2;
            Iterator it4 = ((q4a) f41Var).l().iterator();
            while (it4.hasNext()) {
                r((o4a) it4.next(), g93VarF == null ? null : x45Var);
            }
            return;
        }
        if (f41Var instanceof u55) {
            u55 u55Var = (u55) f41Var;
            if (g93Var2 != null) {
                u55Var.m = g93Var2;
                return;
            } else {
                u55.f0(10);
                throw null;
            }
        }
        o4a o4aVar = (o4a) f41Var;
        o4aVar.l = g93Var2;
        if (g93Var2 != o4aVar.i.getVisibility()) {
            o4aVar.f = false;
        }
    }

    public static Object s(Collection collection, x45 x45Var) {
        Object next;
        if (collection.size() == 1) {
            Object objW0 = bu1.w0(collection);
            if (objW0 != null) {
                return objW0;
            }
            a(78);
            throw null;
        }
        ArrayList arrayList = new ArrayList(2);
        ArrayList arrayList2 = new ArrayList(cu1.k0(collection, 10));
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            arrayList2.add(x45Var.invoke(it2.next()));
        }
        Object objW02 = bu1.w0(collection);
        c41 c41Var = (c41) x45Var.invoke(objW02);
        for (Object obj : collection) {
            c41 c41Var2 = (c41) x45Var.invoke(obj);
            if (c41Var2 == null) {
                a(69);
                throw null;
            }
            Iterator it3 = arrayList2.iterator();
            while (true) {
                if (!it3.hasNext()) {
                    arrayList.add(obj);
                    break;
                }
                if (!k(c41Var2, (c41) it3.next())) {
                    break;
                }
            }
            if (k(c41Var2, c41Var) && !k(c41Var, c41Var2)) {
                objW02 = obj;
            }
        }
        if (arrayList.isEmpty()) {
            if (objW02 != null) {
                return objW02;
            }
            a(79);
            throw null;
        }
        if (arrayList.size() == 1) {
            Object objW03 = bu1.w0(arrayList);
            if (objW03 != null) {
                return objW03;
            }
            a(80);
            throw null;
        }
        Iterator it4 = arrayList.iterator();
        while (true) {
            if (!it4.hasNext()) {
                next = null;
                break;
            }
            next = it4.next();
            mn6 returnType = ((c41) x45Var.invoke(next)).getReturnType();
            returnType.getClass();
            if (!(returnType.m0() instanceof zm4)) {
                break;
            }
        }
        if (next != null) {
            return next;
        }
        Object objW04 = bu1.w0(arrayList);
        if (objW04 != null) {
            return objW04;
        }
        a(82);
        throw null;
    }

    public final xvd f(List list, List list2) {
        if (list == null) {
            a(40);
            throw null;
        }
        if (list2 == null) {
            a(41);
            throw null;
        }
        boolean zIsEmpty = list.isEmpty();
        nn6 nn6Var = this.a;
        if (zIsEmpty) {
            return new hx4((HashMap) null, nn6Var).c1();
        }
        HashMap map = new HashMap();
        for (int i = 0; i < list.size(); i++) {
            map.put(((swd) list.get(i)).n(), ((swd) list2.get(i)).n());
        }
        return new hx4(map, nn6Var).c1();
    }

    public final void h(n98 n98Var, Collection collection, Collection collection2, y28 y28Var, er7 er7Var) {
        Integer numB;
        if (collection == null) {
            a(51);
            throw null;
        }
        if (collection2 == null) {
            a(52);
            throw null;
        }
        if (y28Var == null) {
            a(53);
            throw null;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet(collection);
        Iterator it2 = collection2.iterator();
        while (it2.hasNext()) {
            f41 f41Var = (f41) it2.next();
            if (f41Var == null) {
                a(57);
                throw null;
            }
            ArrayList arrayList = new ArrayList(collection.size());
            zgc zgcVar = new zgc();
            Iterator it3 = collection.iterator();
            while (it3.hasNext()) {
                f41 f41Var2 = (f41) it3.next();
                ax8 ax8VarB = l(f41Var2, f41Var, y28Var).b();
                boolean z = !h93.e(f41Var2.getVisibility()) && h93.c(h93.l, f41Var2, f41Var) == null;
                int i = zw8.b[ax8VarB.ordinal()];
                if (i == 1) {
                    if (z) {
                        zgcVar.add(f41Var2);
                    }
                    arrayList.add(f41Var2);
                } else if (i == 2) {
                    if (z) {
                        er7Var.v(f41Var2, f41Var);
                    }
                    arrayList.add(f41Var2);
                }
            }
            er7Var.G(f41Var, zgcVar);
            linkedHashSet.removeAll(arrayList);
        }
        if (linkedHashSet.size() >= 2) {
            yv2 yv2VarH = ((f41) linkedHashSet.iterator().next()).h();
            if (!linkedHashSet.isEmpty()) {
                Iterator it4 = linkedHashSet.iterator();
                while (it4.hasNext()) {
                    if (((f41) it4.next()).h() != yv2VarH) {
                        LinkedList<f41> linkedList = new LinkedList(linkedHashSet);
                        while (!linkedList.isEmpty()) {
                            linkedList.isEmpty();
                            f41 f41Var3 = null;
                            for (f41 f41Var4 : linkedList) {
                                if (f41Var3 == null || ((numB = h93.b(f41Var3.getVisibility(), f41Var4.getVisibility())) != null && numB.intValue() < 0)) {
                                    f41Var3 = f41Var4;
                                }
                            }
                            f41Var3.getClass();
                            e(g(f41Var3, linkedList, new zkc(28), new dy4(er7Var, 17, f41Var3)), y28Var, er7Var);
                        }
                        return;
                    }
                }
            }
        }
        Iterator it5 = linkedHashSet.iterator();
        while (it5.hasNext()) {
            e(Collections.singleton((f41) it5.next()), y28Var, er7Var);
        }
    }

    public final bx8 l(c41 c41Var, c41 c41Var2, y28 y28Var) {
        if (c41Var == null) {
            a(19);
            throw null;
        }
        if (c41Var2 != null) {
            return m(c41Var, c41Var2, y28Var, false);
        }
        a(20);
        throw null;
    }

    public final bx8 m(c41 c41Var, c41 c41Var2, y28 y28Var, boolean z) {
        if (c41Var == null) {
            a(22);
            throw null;
        }
        if (c41Var2 == null) {
            a(23);
            throw null;
        }
        bx8 bx8VarN = n(c41Var, c41Var2, z);
        boolean z2 = bx8VarN.b() == ax8.OVERRIDABLE;
        List<y74> list = b;
        for (y74 y74Var : list) {
            if (y74Var.a() != w74.CONFLICTS_ONLY && (!z2 || y74Var.a() != w74.SUCCESS_ONLY)) {
                int i = zw8.a[y74Var.b(c41Var, c41Var2, y28Var).ordinal()];
                if (i == 1) {
                    z2 = true;
                } else if (i == 2) {
                    return bx8.c("External condition");
                }
            }
        }
        if (!z2) {
            return bx8VarN;
        }
        for (y74 y74Var2 : list) {
            if (y74Var2.a() == w74.CONFLICTS_ONLY) {
                int i2 = zw8.a[y74Var2.b(c41Var, c41Var2, y28Var).ordinal()];
                if (i2 == 1) {
                    z10.j("Contract violation in ", y74Var2.getClass().getName(), " condition. It's not supposed to end with success");
                    return null;
                }
                if (i2 == 2) {
                    return bx8.c("External condition");
                }
            }
        }
        bx8 bx8Var = bx8.c;
        if (bx8Var != null) {
            return bx8Var;
        }
        bx8.a(0);
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00ac, code lost:
    
        r10.remove();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.bx8 n(defpackage.c41 r13, defpackage.c41 r14, boolean r15) {
        /*
            Method dump skipped, instruction units count: 347
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cx8.n(c41, c41, boolean):bx8");
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0035 A[FALL_THROUGH] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void a(int r25) {
        /*
            Method dump skipped, instruction units count: 1298
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cx8.a(int):void");
    }
}
