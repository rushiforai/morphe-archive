package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ex7 extends zh8 {
    public final u3b b = new u3b(13);
    public final jl1 c = new jl1(new wn7(24));

    @Override // defpackage.zh8
    public final twa a(String str, f31 f31Var) {
        twa twaVarE;
        str.getClass();
        f31Var.getClass();
        synchronized (this.b) {
            twaVarE = e(str, f31Var);
            if (twaVarE == null) {
                ex7 ex7Var = this.a;
                if (ex7Var == null || (twaVarE = ex7Var.a(str, f31Var)) == null) {
                    twaVarE = null;
                } else {
                    this.c.L(str, new bx7(twaVarE));
                }
            }
        }
        return twaVarE;
    }

    @Override // defpackage.zh8
    public final Set b(twa twaVar, f31 f31Var) {
        f31Var.getClass();
        boolean zContainsKey = f31Var.a.containsKey("do-not-store");
        Set set = ny3.a;
        if (zContainsKey) {
            return set;
        }
        Set setF = f(twaVar, f31Var);
        ex7 ex7Var = this.a;
        Set setB = ex7Var != null ? ex7Var.b(twaVar, f31Var) : null;
        if (setB != null) {
            set = setB;
        }
        return qo7.v(setF, set);
    }

    public final void c() {
        jl1 jl1Var = this.c;
        ((LinkedHashMap) jl1Var.e).clear();
        jl1Var.b = null;
        jl1Var.f = null;
        jl1Var.c = 0;
        ex7 ex7Var = this.a;
        if (ex7Var != null) {
            ex7Var.c();
        }
    }

    public final LinkedHashMap d() {
        wg6 wg6VarB = n1b.a.b(ex7.class);
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.c.e;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            linkedHashMap2.put(entry.getKey(), ((ad7) entry.getValue()).b);
        }
        LinkedHashMap linkedHashMap3 = new LinkedHashMap(ei7.P(linkedHashMap2.size()));
        for (Map.Entry entry2 : linkedHashMap2.entrySet()) {
            linkedHashMap3.put(entry2.getKey(), ((bx7) entry2.getValue()).a);
        }
        Map mapSingletonMap = Collections.singletonMap(wg6VarB, linkedHashMap3);
        mapSingletonMap.getClass();
        ex7 ex7Var = this.a;
        Map mapD = ex7Var != null ? ex7Var.d() : null;
        if (mapD == null) {
            mapD = fy3.a;
        }
        return ei7.S(mapSingletonMap, mapD);
    }

    public final twa e(String str, f31 f31Var) {
        ad7 ad7Var;
        jl1 jl1Var = this.c;
        LinkedHashMap linkedHashMap = (LinkedHashMap) jl1Var.e;
        ad7 ad7Var2 = (ad7) linkedHashMap.get(str);
        if (ad7Var2 != null) {
            jl1Var.G(ad7Var2);
        }
        bx7 bx7Var = ad7Var2 != null ? ad7Var2.b : null;
        if (bx7Var == null) {
            return null;
        }
        f31Var.getClass();
        if (f31Var.a.containsKey("evict-after-read") && (ad7Var = (ad7) linkedHashMap.remove(str)) != null) {
            jl1Var.T(ad7Var);
        }
        return bx7Var.a;
    }

    public final Set f(twa twaVar, f31 f31Var) {
        String str = twaVar.a;
        twa twaVarA = a(str, f31Var);
        jl1 jl1Var = this.c;
        if (twaVarA == null) {
            jl1Var.L(str, new bx7(twaVar));
            return twaVar.a();
        }
        f09 f09VarB = twaVarA.b(twaVar);
        twa twaVar2 = (twa) f09VarB.a;
        Set set = (Set) f09VarB.b;
        jl1Var.L(str, new bx7(twaVar2));
        return set;
    }

    public final Collection g(Collection collection, f31 f31Var) {
        Object objInvoke;
        collection.getClass();
        f31Var.getClass();
        u3b u3bVar = this.b;
        i16 i16Var = new i16(collection, this, f31Var, 4);
        synchronized (u3bVar) {
            objInvoke = i16Var.invoke();
        }
        return (Collection) objInvoke;
    }

    public final Set h(Collection collection, f31 f31Var) {
        collection.getClass();
        f31Var.getClass();
        boolean zContainsKey = f31Var.a.containsKey("do-not-store");
        Set set = ny3.a;
        if (zContainsKey) {
            return set;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            bu1.n0(f((twa) it2.next(), f31Var), arrayList);
        }
        Set setQ1 = bu1.q1(arrayList);
        ex7 ex7Var = this.a;
        Set setH = ex7Var != null ? ex7Var.h(collection, f31Var) : null;
        if (setH != null) {
            set = setH;
        }
        return qo7.v(setQ1, set);
    }

    public final boolean i(i31 i31Var) {
        String str = i31Var.a;
        jl1 jl1Var = this.c;
        ad7 ad7Var = (ad7) ((LinkedHashMap) jl1Var.e).remove(str);
        bx7 bx7Var = ad7Var != null ? ad7Var.b : null;
        if (ad7Var != null) {
            jl1Var.T(ad7Var);
        }
        if (bx7Var != null) {
            Iterator it2 = bx7Var.a.c().iterator();
            while (it2.hasNext()) {
                i(new i31(((i31) it2.next()).a));
            }
        }
        ex7 ex7Var = this.a;
        return bx7Var != null || (ex7Var != null ? ex7Var.i(i31Var) : false);
    }
}
