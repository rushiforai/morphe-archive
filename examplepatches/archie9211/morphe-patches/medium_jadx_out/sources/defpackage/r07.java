package defpackage;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r07 extends u0 {
    public final pj6 a;
    public final q07 b;

    public r07(pj6 pj6Var) {
        juc jucVar = juc.a;
        this.a = pj6Var;
        this.b = new q07(juc.b, pj6Var.a());
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return this.b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        h(obj);
        q07 q07Var = this.b;
        xtc xtcVarA = xtcVar.a(q07Var);
        Iterator itG = g(obj);
        int i = 0;
        while (itG.hasNext()) {
            Map.Entry entry = (Map.Entry) itG.next();
            Object key = entry.getKey();
            Object value = entry.getValue();
            int i2 = i + 1;
            xtcVarA.o(q07Var, i, juc.a, key);
            i += 2;
            xtcVarA.o(q07Var, i2, this.a, value);
        }
        xtcVarA.s(q07Var);
    }

    @Override // defpackage.u0
    public final Object e() {
        return new LinkedHashMap();
    }

    @Override // defpackage.u0
    public final int f(Object obj) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) obj;
        linkedHashMap.getClass();
        return linkedHashMap.size() * 2;
    }

    @Override // defpackage.u0
    public final Iterator g(Object obj) {
        Map map = (Map) obj;
        map.getClass();
        return map.entrySet().iterator();
    }

    @Override // defpackage.u0
    public final int h(Object obj) {
        Map map = (Map) obj;
        map.getClass();
        return map.size();
    }

    @Override // defpackage.u0
    public final void j(f22 f22Var, int i, Object obj) {
        Map map = (Map) obj;
        map.getClass();
        juc jucVar = juc.a;
        q07 q07Var = this.b;
        Object objP = f22Var.p(q07Var, i, jucVar, null);
        int iE = f22Var.e(q07Var);
        if (iE != i + 1) {
            ywb.g(ev6.v("Value must follow key in a map, index for key: ", i, iE, ", returned index for value: "));
            return;
        }
        boolean zContainsKey = map.containsKey(objP);
        pj6 pj6Var = this.a;
        map.put(objP, (!zContainsKey || (pj6Var.a().j() instanceof r0a)) ? f22Var.p(q07Var, iE, pj6Var, null) : f22Var.p(q07Var, iE, pj6Var, ei7.N(objP, map)));
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        throw null;
    }

    @Override // defpackage.u0
    public final Object l(Object obj) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) obj;
        linkedHashMap.getClass();
        return linkedHashMap;
    }
}
