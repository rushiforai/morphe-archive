package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ka8 {
    public final db8 a;
    public final fa8 b;
    public ya8 c;
    public Bundle d;
    public Bundle[] e;
    public final m70 f = new m70();
    public final xpc g;
    public final xpc h;
    public final wua i;
    public final LinkedHashMap j;
    public final LinkedHashMap k;
    public final LinkedHashMap l;
    public final LinkedHashMap m;
    public iy6 n;
    public la8 o;
    public final ArrayList p;
    public vx6 q;
    public final di4 r;
    public final tc8 s;
    public final LinkedHashMap t;
    public x45 u;
    public xx7 v;
    public final LinkedHashMap w;
    public int x;
    public final ArrayList y;
    public final r6c z;

    public ka8(db8 db8Var, fa8 fa8Var) {
        this.a = db8Var;
        this.b = fa8Var;
        ey3 ey3Var = ey3.a;
        this.g = vv2.j(ey3Var);
        xpc xpcVarJ = vv2.j(ey3Var);
        this.h = xpcVarJ;
        this.i = bo.A(xpcVarJ);
        this.j = new LinkedHashMap();
        this.k = new LinkedHashMap();
        this.l = new LinkedHashMap();
        this.m = new LinkedHashMap();
        this.p = new ArrayList();
        this.q = vx6.INITIALIZED;
        this.r = new di4(3, this);
        this.s = new tc8();
        this.t = new LinkedHashMap();
        this.w = new LinkedHashMap();
        this.y = new ArrayList();
        this.z = k40.x(0, 2, nz0.DROP_OLDEST);
    }

    public static va8 d(int i, va8 va8Var, va8 va8Var2, boolean z) {
        if (va8Var.b.c == i && (va8Var2 == null || (va8Var.equals(va8Var2) && g76.L(va8Var.c, va8Var2.c)))) {
            return va8Var;
        }
        ya8 ya8Var = va8Var instanceof ya8 ? (ya8) va8Var : null;
        if (ya8Var == null) {
            ya8Var = va8Var.c;
            ya8Var.getClass();
        }
        return ya8Var.g.u(i, ya8Var, va8Var2, z);
    }

    public static /* synthetic */ void p(ka8 ka8Var, ba8 ba8Var) {
        ka8Var.o(ba8Var, false, new m70());
    }

    public final void a(va8 va8Var, Bundle bundle, ba8 ba8Var, List list) {
        Object objPrevious;
        Object objPrevious2;
        mp mpVar = this.a.c;
        va8 va8Var2 = ba8Var.b;
        boolean z = va8Var2 instanceof zn4;
        m70 m70Var = this.f;
        if (!z) {
            while (!m70Var.isEmpty() && (((ba8) m70Var.last()).b instanceof zn4) && n(((ba8) m70Var.last()).b.b.c, true, false)) {
            }
        }
        m70<ba8> m70Var2 = new m70();
        Object obj = null;
        if (va8Var instanceof ya8) {
            va8 va8Var3 = va8Var2;
            do {
                va8Var3.getClass();
                va8Var3 = va8Var3.c;
                if (va8Var3 != null) {
                    ListIterator listIterator = list.listIterator(list.size());
                    while (true) {
                        if (listIterator.hasPrevious()) {
                            objPrevious2 = listIterator.previous();
                            if (g76.L(((ba8) objPrevious2).b, va8Var3)) {
                                break;
                            }
                        } else {
                            objPrevious2 = null;
                            break;
                        }
                    }
                    ba8 ba8VarE = (ba8) objPrevious2;
                    if (ba8VarE == null) {
                        ba8VarE = zi5.e(mpVar, va8Var3, bundle, i(), this.o);
                    }
                    m70Var2.addFirst(ba8VarE);
                    if (!m70Var.isEmpty() && ((ba8) m70Var.last()).b == va8Var3) {
                        p(this, (ba8) m70Var.last());
                    }
                }
                if (va8Var3 == null) {
                    break;
                }
            } while (va8Var3 != va8Var);
        }
        va8 va8Var4 = m70Var2.isEmpty() ? va8Var2 : ((ba8) m70Var2.first()).b;
        while (va8Var4 != null && c(va8Var4.b.c, va8Var4) != va8Var4) {
            va8Var4 = va8Var4.c;
            if (va8Var4 != null) {
                Bundle bundle2 = (bundle == null || !bundle.isEmpty()) ? bundle : null;
                ListIterator listIterator2 = list.listIterator(list.size());
                while (true) {
                    if (listIterator2.hasPrevious()) {
                        objPrevious = listIterator2.previous();
                        if (g76.L(((ba8) objPrevious).b, va8Var4)) {
                            break;
                        }
                    } else {
                        objPrevious = null;
                        break;
                    }
                }
                ba8 ba8VarE2 = (ba8) objPrevious;
                if (ba8VarE2 == null) {
                    ba8VarE2 = zi5.e(mpVar, va8Var4, va8Var4.f(bundle2), i(), this.o);
                }
                m70Var2.addFirst(ba8VarE2);
            }
        }
        if (!m70Var2.isEmpty()) {
            va8Var2 = ((ba8) m70Var2.first()).b;
        }
        while (!m70Var.isEmpty() && (((ba8) m70Var.last()).b instanceof ya8)) {
            va8 va8Var5 = ((ba8) m70Var.last()).b;
            va8Var5.getClass();
            if (s42.L((xkc) ((ya8) va8Var5).g.e, va8Var2.b.c) != null) {
                break;
            } else {
                p(this, (ba8) m70Var.last());
            }
        }
        ba8 ba8Var2 = (ba8) m70Var.m();
        if (ba8Var2 == null) {
            ba8Var2 = (ba8) m70Var2.m();
        }
        if (!g76.L(ba8Var2 != null ? ba8Var2.b : null, this.c)) {
            ListIterator listIterator3 = list.listIterator(list.size());
            while (true) {
                if (!listIterator3.hasPrevious()) {
                    break;
                }
                Object objPrevious3 = listIterator3.previous();
                va8 va8Var6 = ((ba8) objPrevious3).b;
                ya8 ya8Var = this.c;
                ya8Var.getClass();
                if (g76.L(va8Var6, ya8Var)) {
                    obj = objPrevious3;
                    break;
                }
            }
            ba8 ba8VarE3 = (ba8) obj;
            if (ba8VarE3 == null) {
                ya8 ya8Var2 = this.c;
                ya8Var2.getClass();
                ya8 ya8Var3 = this.c;
                ya8Var3.getClass();
                ba8VarE3 = zi5.e(mpVar, ya8Var2, ya8Var3.f(bundle), i(), this.o);
            }
            m70Var2.addFirst(ba8VarE3);
        }
        for (ba8 ba8Var3 : m70Var2) {
            Object obj2 = this.t.get(this.s.b(ba8Var3.b.a));
            if (obj2 == null) {
                lg8.i(ka1.v(new StringBuilder("NavigatorBackStack for "), va8Var.a, " should already be created"));
                return;
            }
            ((ga8) obj2).a(ba8Var3);
        }
        m70Var.addAll(m70Var2);
        m70Var.addLast(ba8Var);
        for (ba8 ba8Var4 : bu1.R0(m70Var2, ba8Var)) {
            ya8 ya8Var4 = ba8Var4.b.c;
            if (ya8Var4 != null) {
                k(ba8Var4, e(ya8Var4.b.c));
            }
        }
    }

    public final boolean b() {
        m70 m70Var;
        while (true) {
            m70Var = this.f;
            if (m70Var.isEmpty() || !(((ba8) m70Var.last()).b instanceof ya8)) {
                break;
            }
            p(this, (ba8) m70Var.last());
        }
        ba8 ba8Var = (ba8) m70Var.q();
        ArrayList arrayList = this.y;
        if (ba8Var != null) {
            arrayList.add(ba8Var);
        }
        this.x++;
        u();
        int i = this.x - 1;
        this.x = i;
        if (i == 0) {
            ArrayList<ba8> arrayListN1 = bu1.n1(arrayList);
            arrayList.clear();
            for (ba8 ba8Var2 : arrayListN1) {
                Iterator it2 = bu1.m1(this.p).iterator();
                while (it2.hasNext()) {
                    ((ue7) it2.next()).a(this.a, ba8Var2.b, ba8Var2.h.a());
                }
                this.z.h(ba8Var2);
            }
            ArrayList arrayList2 = new ArrayList(m70Var);
            xpc xpcVar = this.g;
            xpcVar.getClass();
            xpcVar.m(null, arrayList2);
            ArrayList arrayListQ = q();
            xpc xpcVar2 = this.h;
            xpcVar2.getClass();
            xpcVar2.m(null, arrayListQ);
        }
        return ba8Var != null;
    }

    public final va8 c(int i, va8 va8Var) {
        va8 va8Var2;
        ya8 ya8Var = this.c;
        if (ya8Var == null) {
            return null;
        }
        if (ya8Var.b.c == i) {
            if (va8Var == null) {
                return ya8Var;
            }
            if (g76.L(ya8Var, va8Var) && va8Var.c == null) {
                return this.c;
            }
        }
        ba8 ba8Var = (ba8) this.f.q();
        if (ba8Var == null || (va8Var2 = ba8Var.b) == null) {
            va8Var2 = this.c;
            va8Var2.getClass();
        }
        return d(i, va8Var2, va8Var, false);
    }

    public final ba8 e(int i) {
        Object objPrevious;
        m70 m70Var = this.f;
        ListIterator<E> listIterator = m70Var.listIterator(m70Var.size());
        while (true) {
            if (!listIterator.hasPrevious()) {
                objPrevious = null;
                break;
            }
            objPrevious = listIterator.previous();
            if (((ba8) objPrevious).b.b.c == i) {
                break;
            }
        }
        ba8 ba8Var = (ba8) objPrevious;
        if (ba8Var != null) {
            return ba8Var;
        }
        StringBuilder sbC = ev6.C("No destination with ID ", i, " is on the NavController's back stack. The current destination is ");
        sbC.append(g());
        throw new IllegalArgumentException(sbC.toString().toString());
    }

    public final ba8 f() {
        return (ba8) this.f.q();
    }

    public final va8 g() {
        ba8 ba8VarF = f();
        if (ba8VarF != null) {
            return ba8VarF.b;
        }
        return null;
    }

    public final ya8 h() {
        ya8 ya8Var = this.c;
        if (ya8Var != null) {
            ya8Var.getClass();
            return ya8Var;
        }
        ygf.f("You must call setGraph() before calling getGraph()");
        return null;
    }

    public final vx6 i() {
        return this.n == null ? vx6.CREATED : this.q;
    }

    public final ya8 j() {
        va8 va8Var;
        ba8 ba8Var = (ba8) this.f.q();
        if (ba8Var == null || (va8Var = ba8Var.b) == null) {
            va8Var = this.c;
            va8Var.getClass();
        }
        ya8 ya8Var = va8Var instanceof ya8 ? (ya8) va8Var : null;
        if (ya8Var != null) {
            return ya8Var;
        }
        ya8 ya8Var2 = va8Var.c;
        ya8Var2.getClass();
        return ya8Var2;
    }

    public final void k(ba8 ba8Var, ba8 ba8Var2) {
        this.j.put(ba8Var, ba8Var2);
        LinkedHashMap linkedHashMap = this.k;
        if (linkedHashMap.get(ba8Var2) == null) {
            linkedHashMap.put(ba8Var2, new w90());
        }
        Object obj = linkedHashMap.get(ba8Var2);
        obj.getClass();
        ((w90) obj).a.incrementAndGet();
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01b9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void l(defpackage.va8 r28, android.os.Bundle r29, defpackage.ob8 r30, defpackage.w6 r31) {
        /*
            Method dump skipped, instruction units count: 526
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ka8.l(va8, android.os.Bundle, ob8, w6):void");
    }

    public final boolean m(int i, boolean z) {
        return n(i, z, false) && b();
    }

    public final boolean n(int i, boolean z, boolean z2) {
        va8 va8Var;
        final ka8 ka8Var;
        boolean z3;
        m70 m70Var = this.f;
        final int i2 = 0;
        if (m70Var.isEmpty()) {
            return false;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it2 = bu1.Y0(m70Var).iterator();
        while (true) {
            if (!it2.hasNext()) {
                va8Var = null;
                break;
            }
            va8Var = ((ba8) it2.next()).b;
            String str = va8Var.a;
            ym6 ym6Var = va8Var.b;
            sc8 sc8VarB = this.s.b(str);
            if (z || ym6Var.c != i) {
                arrayList.add(sc8VarB);
            }
            if (ym6Var.c == i) {
                break;
            }
        }
        if (va8Var == null) {
            int i3 = va8.f;
            Log.i("NavController", "Ignoring popBackStack to destination " + vo7.w(this.a.c, i) + " as it was not found on the current back stack");
            return false;
        }
        nya nyaVar = new nya();
        m70 m70Var2 = new m70();
        Iterator it3 = arrayList.iterator();
        while (true) {
            if (!it3.hasNext()) {
                ka8Var = this;
                z3 = z2;
                break;
            }
            sc8 sc8Var = (sc8) it3.next();
            nya nyaVar2 = new nya();
            ba8 ba8Var = (ba8) m70Var.last();
            ka8Var = this;
            z3 = z2;
            xx7 xx7Var = new xx7(nyaVar2, nyaVar, ka8Var, z3, m70Var2);
            sc8Var.getClass();
            ba8Var.getClass();
            ka8Var.v = xx7Var;
            sc8Var.i(ba8Var, z3);
            ka8Var.v = null;
            if (!nyaVar2.a) {
                break;
            }
            this = ka8Var;
            z2 = z3;
        }
        if (z3) {
            LinkedHashMap linkedHashMap = ka8Var.l;
            if (!z) {
                yh4 yh4Var = new yh4(new hi3(szb.K0(va8Var, new ss7(20)), new x45(ka8Var) { // from class: ja8
                    public final /* synthetic */ ka8 b;

                    {
                        this.b = ka8Var;
                    }

                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        boolean zContainsKey;
                        int i4 = i2;
                        ka8 ka8Var2 = this.b;
                        va8 va8Var2 = (va8) obj;
                        switch (i4) {
                            case 0:
                                va8Var2.getClass();
                                zContainsKey = ka8Var2.l.containsKey(Integer.valueOf(va8Var2.b.c));
                                break;
                            default:
                                va8Var2.getClass();
                                zContainsKey = ka8Var2.l.containsKey(Integer.valueOf(va8Var2.b.c));
                                break;
                        }
                        return Boolean.valueOf(!zContainsKey);
                    }
                }));
                while (yh4Var.hasNext()) {
                    Integer numValueOf = Integer.valueOf(((va8) yh4Var.next()).b.c);
                    ea8 ea8Var = (ea8) m70Var2.m();
                    linkedHashMap.put(numValueOf, ea8Var != null ? (String) ea8Var.a.b : null);
                }
            }
            if (!m70Var2.isEmpty()) {
                opg opgVar = ((ea8) m70Var2.first()).a;
                String str2 = (String) opgVar.b;
                final int i4 = 1;
                yh4 yh4Var2 = new yh4(new hi3(szb.K0(ka8Var.c(opgVar.a, null), new ss7(21)), new x45(ka8Var) { // from class: ja8
                    public final /* synthetic */ ka8 b;

                    {
                        this.b = ka8Var;
                    }

                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        boolean zContainsKey;
                        int i42 = i4;
                        ka8 ka8Var2 = this.b;
                        va8 va8Var2 = (va8) obj;
                        switch (i42) {
                            case 0:
                                va8Var2.getClass();
                                zContainsKey = ka8Var2.l.containsKey(Integer.valueOf(va8Var2.b.c));
                                break;
                            default:
                                va8Var2.getClass();
                                zContainsKey = ka8Var2.l.containsKey(Integer.valueOf(va8Var2.b.c));
                                break;
                        }
                        return Boolean.valueOf(!zContainsKey);
                    }
                }));
                while (yh4Var2.hasNext()) {
                    linkedHashMap.put(Integer.valueOf(((va8) yh4Var2.next()).b.c), str2);
                }
                if (linkedHashMap.values().contains(str2)) {
                    ka8Var.m.put(str2, m70Var2);
                }
            }
        }
        ka8Var.b.invoke();
        return nyaVar.a;
    }

    public final void o(ba8 ba8Var, boolean z, m70 m70Var) {
        la8 la8Var;
        Set set;
        ba8Var.getClass();
        m70 m70Var2 = this.f;
        ba8 ba8Var2 = (ba8) m70Var2.last();
        if (!g76.L(ba8Var2, ba8Var)) {
            StringBuilder sb = new StringBuilder("Attempted to pop ");
            sb.append(ba8Var.b);
            va8 va8Var = ba8Var2.b;
            sb.append(", which is not the top of the back stack (");
            sb.append(va8Var);
            sb.append(')');
            throw new IllegalStateException(sb.toString().toString());
        }
        bu1.U0(m70Var2);
        ga8 ga8Var = (ga8) this.t.get(this.s.b(ba8Var2.b.a));
        boolean z2 = true;
        if ((ga8Var == null || (set = (Set) ga8Var.f.a.getValue()) == null || !set.contains(ba8Var2)) && !this.k.containsKey(ba8Var2)) {
            z2 = false;
        }
        vx6 vx6Var = ba8Var2.h.j.d;
        vx6 vx6Var2 = vx6.CREATED;
        if (vx6Var.isAtLeast(vx6Var2)) {
            if (z) {
                ba8Var2.b(vx6Var2);
                m70Var.addFirst(new ea8(ba8Var2));
            }
            if (z2) {
                ba8Var2.b(vx6Var2);
            } else {
                ba8Var2.b(vx6.DESTROYED);
                t(ba8Var2);
            }
        }
        if (z || z2 || (la8Var = this.o) == null) {
            return;
        }
        vue vueVar = (vue) la8Var.b.remove(ba8Var2.f);
        if (vueVar != null) {
            vueVar.a();
        }
    }

    public final ArrayList q() {
        ArrayList arrayList = new ArrayList();
        Iterator it2 = this.t.values().iterator();
        while (it2.hasNext()) {
            Iterable iterable = (Iterable) ((ga8) it2.next()).f.a.getValue();
            ArrayList arrayList2 = new ArrayList();
            for (Object obj : iterable) {
                ba8 ba8Var = (ba8) obj;
                if (!arrayList.contains(ba8Var) && !ba8Var.h.k.isAtLeast(vx6.STARTED)) {
                    arrayList2.add(obj);
                }
            }
            bu1.n0(arrayList2, arrayList);
        }
        ArrayList arrayList3 = new ArrayList();
        for (Object obj2 : this.f) {
            ba8 ba8Var2 = (ba8) obj2;
            if (!arrayList.contains(ba8Var2) && ba8Var2.h.k.isAtLeast(vx6.STARTED)) {
                arrayList3.add(obj2);
            }
        }
        bu1.n0(arrayList3, arrayList);
        ArrayList arrayList4 = new ArrayList();
        for (Object obj3 : arrayList) {
            if (!(((ba8) obj3).b instanceof ya8)) {
                arrayList4.add(obj3);
            }
        }
        return arrayList4;
    }

    public final boolean r(int i, Bundle bundle, ob8 ob8Var, w6 w6Var) {
        va8 va8VarH;
        ba8 ba8Var;
        va8 va8Var;
        Bundle bundle2;
        Integer numValueOf = Integer.valueOf(i);
        LinkedHashMap linkedHashMap = this.l;
        if (!linkedHashMap.containsKey(numValueOf)) {
            return false;
        }
        String str = (String) linkedHashMap.get(Integer.valueOf(i));
        Collection collectionValues = linkedHashMap.values();
        collectionValues.getClass();
        Iterator it2 = collectionValues.iterator();
        while (it2.hasNext()) {
            if (g76.L((String) it2.next(), str)) {
                it2.remove();
            }
        }
        m70<ea8> m70Var = (m70) pwd.y(this.m).remove(str);
        mp mpVar = this.a.c;
        ArrayList arrayList = new ArrayList();
        ba8 ba8Var2 = (ba8) this.f.q();
        if (ba8Var2 == null || (va8VarH = ba8Var2.b) == null) {
            va8VarH = h();
        }
        if (m70Var != null) {
            for (ea8 ea8Var : m70Var) {
                opg opgVar = ea8Var.a;
                opg opgVar2 = ea8Var.a;
                va8 va8VarD = d(opgVar.a, va8VarH, null, true);
                if (va8VarD == null) {
                    int i2 = va8.f;
                    mm.g("Restore State failed: destination ", vo7.w(mpVar, opgVar2.a), " cannot be found from the current destination ", va8VarH);
                    return false;
                }
                vx6 vx6VarI = i();
                la8 la8Var = this.o;
                mpVar.getClass();
                vx6VarI.getClass();
                Bundle bundle3 = (Bundle) opgVar2.c;
                if (bundle3 != null) {
                    Context context = mpVar.a;
                    bundle3.setClassLoader(context != null ? context.getClassLoader() : null);
                    bundle2 = bundle3;
                } else {
                    bundle2 = null;
                }
                arrayList.add(new ba8(mpVar, va8VarD, bundle2, vx6VarI, la8Var, (String) opgVar2.b, (Bundle) opgVar2.d));
                va8VarH = va8VarD;
            }
        }
        ArrayList<List> arrayList2 = new ArrayList();
        ArrayList<ba8> arrayList3 = new ArrayList();
        for (Object obj : arrayList) {
            if (!(((ba8) obj).b instanceof ya8)) {
                arrayList3.add(obj);
            }
        }
        for (ba8 ba8Var3 : arrayList3) {
            List list = (List) bu1.I0(arrayList2);
            if (g76.L((list == null || (ba8Var = (ba8) bu1.H0(list)) == null || (va8Var = ba8Var.b) == null) ? null : va8Var.a, ba8Var3.b.a)) {
                list.add(ba8Var3);
            } else {
                arrayList2.add(d46.T(ba8Var3));
            }
        }
        nya nyaVar = new nya();
        for (List list2 : arrayList2) {
            sc8 sc8VarB = this.s.b(((ba8) bu1.x0(list2)).b.a);
            ArrayList arrayList4 = arrayList;
            this.u = new s7(nyaVar, arrayList4, new pya(), this, bundle, 7);
            sc8VarB.d(list2, ob8Var, w6Var);
            this.u = null;
            arrayList = arrayList4;
        }
        return nyaVar.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0290  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0298  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02af  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x02b2  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x02be  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x02dd  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x02f6  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0305  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x035a  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0375  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x0357 A[SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r10v23, types: [android.os.Bundle] */
    /* JADX WARN: Type inference failed for: r12v25, types: [android.os.Bundle, w6] */
    /* JADX WARN: Type inference failed for: r20v0, types: [android.os.Bundle[]] */
    /* JADX WARN: Type inference failed for: r20v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r20v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r20v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r20v5 */
    /* JADX WARN: Type inference failed for: r24v0, types: [ka8] */
    /* JADX WARN: Type inference failed for: r4v17 */
    /* JADX WARN: Type inference failed for: r4v18, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r4v27, types: [va8] */
    /* JADX WARN: Type inference failed for: r4v30 */
    /* JADX WARN: Type inference failed for: r4v31 */
    /* JADX WARN: Type inference failed for: r4v35 */
    /* JADX WARN: Type inference failed for: r5v35 */
    /* JADX WARN: Type inference failed for: r5v39 */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r6v21 */
    /* JADX WARN: Type inference failed for: r6v22, types: [java.lang.ClassLoader] */
    /* JADX WARN: Type inference failed for: r6v27 */
    /* JADX WARN: Type inference failed for: r8v7, types: [va8, ya8] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void s(defpackage.ya8 r25, android.os.Bundle r26) {
        /*
            Method dump skipped, instruction units count: 1477
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ka8.s(ya8, android.os.Bundle):void");
    }

    public final void t(ba8 ba8Var) {
        ba8Var.getClass();
        ba8 ba8Var2 = (ba8) this.j.remove(ba8Var);
        if (ba8Var2 == null) {
            return;
        }
        LinkedHashMap linkedHashMap = this.k;
        w90 w90Var = (w90) linkedHashMap.get(ba8Var2);
        Integer numValueOf = w90Var != null ? Integer.valueOf(w90Var.a.decrementAndGet()) : null;
        if (numValueOf != null && numValueOf.intValue() == 0) {
            ga8 ga8Var = (ga8) this.t.get(this.s.b(ba8Var2.b.a));
            if (ga8Var != null) {
                ga8Var.c(ba8Var2);
            }
            linkedHashMap.remove(ba8Var2);
        }
    }

    public final void u() {
        w90 w90Var;
        Set set;
        ArrayList<ba8> arrayListN1 = bu1.n1(this.f);
        if (arrayListN1.isEmpty()) {
            return;
        }
        ArrayList arrayListT = d46.T(((ba8) bu1.H0(arrayListN1)).b);
        ArrayList arrayList = new ArrayList();
        if (bu1.H0(arrayListT) instanceof zn4) {
            Iterator it2 = bu1.Y0(arrayListN1).iterator();
            while (it2.hasNext()) {
                va8 va8Var = ((ba8) it2.next()).b;
                arrayList.add(va8Var);
                if (!(va8Var instanceof zn4) && !(va8Var instanceof ya8)) {
                    break;
                }
            }
        }
        HashMap map = new HashMap();
        for (ba8 ba8Var : bu1.Y0(arrayListN1)) {
            vx6 vx6Var = ba8Var.h.k;
            va8 va8Var2 = ba8Var.b;
            va8 va8Var3 = (va8) bu1.z0(arrayListT);
            if (va8Var3 != null && va8Var3.b.c == va8Var2.b.c) {
                vx6 vx6Var2 = vx6.RESUMED;
                if (vx6Var != vx6Var2) {
                    ga8 ga8Var = (ga8) this.t.get(this.s.b(ba8Var.b.a));
                    if (g76.L((ga8Var == null || (set = (Set) ga8Var.f.a.getValue()) == null) ? null : Boolean.valueOf(set.contains(ba8Var)), Boolean.TRUE) || ((w90Var = (w90) this.k.get(ba8Var)) != null && w90Var.a.get() == 0)) {
                        map.put(ba8Var, vx6.STARTED);
                    } else {
                        map.put(ba8Var, vx6Var2);
                    }
                }
                va8 va8Var4 = (va8) bu1.z0(arrayList);
                if (va8Var4 != null && va8Var4.b.c == va8Var2.b.c) {
                    bu1.T0(arrayList);
                }
                bu1.T0(arrayListT);
                ya8 ya8Var = va8Var2.c;
                if (ya8Var != null) {
                    arrayListT.add(ya8Var);
                }
            } else if (arrayList.isEmpty() || va8Var2.b.c != ((va8) bu1.x0(arrayList)).b.c) {
                ba8Var.b(vx6.CREATED);
            } else {
                va8 va8Var5 = (va8) bu1.T0(arrayList);
                if (vx6Var == vx6.RESUMED) {
                    ba8Var.b(vx6.STARTED);
                } else {
                    vx6 vx6Var3 = vx6.STARTED;
                    if (vx6Var != vx6Var3) {
                        map.put(ba8Var, vx6Var3);
                    }
                }
                ya8 ya8Var2 = va8Var5.c;
                if (ya8Var2 != null && !arrayList.contains(ya8Var2)) {
                    arrayList.add(ya8Var2);
                }
            }
        }
        for (ba8 ba8Var2 : arrayListN1) {
            vx6 vx6Var4 = (vx6) map.get(ba8Var2);
            if (vx6Var4 != null) {
                ba8Var2.b(vx6Var4);
            } else {
                ba8Var2.h.b();
            }
        }
    }
}
