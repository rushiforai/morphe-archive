package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u3 {
    public final vr7 a;
    public final qn7 b;
    public final fh5 c;
    public final ReentrantLock d;
    public String e;

    public u3(vr7 vr7Var, qn7 qn7Var, fh5 fh5Var) {
        vr7Var.getClass();
        qn7Var.getClass();
        this.a = vr7Var;
        this.b = qn7Var;
        this.c = fh5Var;
        this.d = new ReentrantLock();
    }

    public final aa2 a(String str) {
        str.getClass();
        t3 t3Var = (t3) this.c.a.c(t3.class, str);
        z92 z92Var = new z92();
        z92Var.d(t3Var.getName());
        z92Var.f(t3Var.getValue());
        z92Var.c(t3Var.getExpiresAt());
        z92Var.b(t3Var.getDomain());
        z92Var.e(t3Var.getPath());
        if (t3Var.getSecure()) {
            z92Var.f = true;
        }
        if (t3Var.getHttpOnly()) {
            z92Var.g = true;
        }
        return z92Var.a();
    }

    public final ArrayList b() {
        ReentrantLock reentrantLock = this.d;
        reentrantLock.lock();
        try {
            return c();
        } finally {
            reentrantLock.unlock();
        }
    }

    public final ArrayList c() {
        vr7 vr7Var = this.a;
        vr7Var.getClass();
        Set<String> setQ = vr7Var.q(ek6.COOKIE_JAR);
        ArrayList<aa2> arrayList = new ArrayList(cu1.k0(setQ, 10));
        Iterator<T> it2 = setQ.iterator();
        while (it2.hasNext()) {
            arrayList.add(a((String) it2.next()));
        }
        qn7 qn7Var = this.b;
        qn7Var.getClass();
        aa2 aa2Var = null;
        String strN = qn7Var.n(ek6.RID_COOKIE, null);
        if (strN != null) {
            aa2 aa2VarA = a(strN);
            if (aa2VarA.c >= System.currentTimeMillis()) {
                aa2Var = aa2VarA;
            }
        }
        ArrayList arrayList2 = new ArrayList();
        boolean z = false;
        for (aa2 aa2Var2 : arrayList) {
            if (aa2Var2.c < System.currentTimeMillis()) {
                z = true;
            } else {
                arrayList2.add(aa2Var2);
            }
        }
        if (aa2Var != null) {
            arrayList2.add(aa2Var);
        }
        if (z) {
            e(arrayList2);
        }
        return arrayList2;
    }

    public final String d() {
        Object next;
        Iterator it2 = b().iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (g76.L(((aa2) next).a, "uid")) {
                break;
            }
        }
        aa2 aa2Var = (aa2) next;
        if (aa2Var != null) {
            return aa2Var.b;
        }
        return null;
    }

    public final void e(List list) {
        String strF;
        Object next;
        Iterator it2 = list.iterator();
        while (true) {
            strF = null;
            if (it2.hasNext()) {
                next = it2.next();
                if (g76.L(((aa2) next).a, "rid")) {
                    break;
                }
            } else {
                next = null;
                break;
            }
        }
        aa2 aa2Var = (aa2) next;
        if (aa2Var != null && aa2Var.c >= System.currentTimeMillis()) {
            strF = f(aa2Var);
        }
        qn7 qn7Var = this.b;
        if (strF != null) {
            qn7Var.C(ek6.RID_COOKIE, strF);
        } else {
            qn7Var.e(ek6.RID_COOKIE);
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (!g76.L(((aa2) obj).a, "rid")) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList2.add(f((aa2) it3.next()));
        }
        Set setQ1 = bu1.q1(arrayList2);
        vr7 vr7Var = this.a;
        vr7Var.getClass();
        p2.F(vr7Var, ek6.COOKIE_JAR, setQ1, false, 4, null);
    }

    public final String f(aa2 aa2Var) {
        return this.c.a.h(new t3(aa2Var.a, aa2Var.b, aa2Var.c, aa2Var.d, aa2Var.e, aa2Var.f, aa2Var.g));
    }

    public final void g(List list) {
        Object next;
        String str;
        Iterator it2 = list.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            } else {
                next = it2.next();
                if (g76.L(((aa2) next).a, "uid")) {
                    break;
                }
            }
        }
        aa2 aa2Var = (aa2) next;
        if (aa2Var != null && (str = aa2Var.b) != null) {
            if (muc.b0(str)) {
                str = null;
            }
            if (str != null) {
                String str2 = tj2.b(str) ? str : null;
                if (str2 != null) {
                    this.e = str2;
                }
            }
        }
        ReentrantLock reentrantLock = this.d;
        reentrantLock.lock();
        try {
            h(list);
        } finally {
            reentrantLock.unlock();
        }
    }

    public final void h(List list) {
        ArrayList arrayListC = c();
        int iP = ei7.P(cu1.k0(arrayListC, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        for (Object obj : arrayListC) {
            aa2 aa2Var = (aa2) obj;
            linkedHashMap.put(new ca2(aa2Var.d, aa2Var.e, aa2Var.a), obj);
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(linkedHashMap);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            aa2 aa2Var2 = (aa2) it2.next();
            linkedHashMap2.put(new ca2(aa2Var2.d, aa2Var2.e, aa2Var2.a), aa2Var2);
        }
        e(bu1.m1(linkedHashMap2.values()));
    }
}
