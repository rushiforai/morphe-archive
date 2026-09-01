package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cn1 implements fw2 {
    public final q0b a;
    public final x45 b;
    public final z c;
    public final LinkedHashMap d;
    public final LinkedHashMap e;
    public final LinkedHashMap f;

    public cn1(q0b q0bVar, x45 x45Var) {
        q0bVar.getClass();
        this.a = q0bVar;
        this.b = x45Var;
        z zVar = new z(11, this);
        this.c = zVar;
        zh4 zh4Var = new zh4(new j80(1, q0bVar.d()), true, zVar);
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        yh4 yh4Var = new yh4(zh4Var);
        while (yh4Var.hasNext()) {
            Object next = yh4Var.next();
            n98 n98VarC = ((z0b) next).c();
            Object arrayList = linkedHashMap.get(n98VarC);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(n98VarC, arrayList);
            }
            ((List) arrayList).add(next);
        }
        this.d = linkedHashMap;
        zh4 zh4Var2 = new zh4(new j80(1, this.a.b()), true, this.b);
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        yh4 yh4Var2 = new yh4(zh4Var2);
        while (yh4Var2.hasNext()) {
            Object next2 = yh4Var2.next();
            linkedHashMap2.put(((w0b) next2).c(), next2);
        }
        this.e = linkedHashMap2;
        ArrayList arrayListF = this.a.f();
        x45 x45Var2 = this.b;
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : arrayListF) {
            if (((Boolean) x45Var2.invoke(obj)).booleanValue()) {
                arrayList2.add(obj);
            }
        }
        int iP = ei7.P(cu1.k0(arrayList2, 10));
        LinkedHashMap linkedHashMap3 = new LinkedHashMap(iP < 16 ? 16 : iP);
        for (Object obj2 : arrayList2) {
            linkedHashMap3.put(((c1b) obj2).c(), obj2);
        }
        this.f = linkedHashMap3;
    }

    @Override // defpackage.fw2
    public final Set a() {
        zh4 zh4Var = new zh4(new j80(1, this.a.d()), true, this.c);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        yh4 yh4Var = new yh4(zh4Var);
        while (yh4Var.hasNext()) {
            linkedHashSet.add(((z0b) yh4Var.next()).c());
        }
        return linkedHashSet;
    }

    @Override // defpackage.fw2
    public final c1b b(n98 n98Var) {
        n98Var.getClass();
        return (c1b) this.f.get(n98Var);
    }

    @Override // defpackage.fw2
    public final Collection c(n98 n98Var) {
        List list = (List) this.d.get(n98Var);
        return list != null ? list : ey3.a;
    }

    @Override // defpackage.fw2
    public final w0b d(n98 n98Var) {
        return (w0b) this.e.get(n98Var);
    }

    @Override // defpackage.fw2
    public final Set e() {
        return this.f.keySet();
    }

    @Override // defpackage.fw2
    public final Set f() {
        zh4 zh4Var = new zh4(new j80(1, this.a.b()), true, this.b);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        yh4 yh4Var = new yh4(zh4Var);
        while (yh4Var.hasNext()) {
            linkedHashSet.add(((w0b) yh4Var.next()).c());
        }
        return linkedHashSet;
    }
}
