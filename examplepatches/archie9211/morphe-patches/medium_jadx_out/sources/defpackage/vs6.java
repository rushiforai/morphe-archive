package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vs6 extends ws6 {
    public static final /* synthetic */ int p = 0;
    public final q0b n;
    public final cs6 o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vs6(n0c n0cVar, q0b q0bVar, cs6 cs6Var) {
        super(n0cVar, null);
        q0bVar.getClass();
        this.n = q0bVar;
        this.o = cs6Var;
    }

    public static q4a v(q4a q4aVar) {
        if (q4aVar.j().isReal()) {
            return q4aVar;
        }
        Collection collectionI = q4aVar.i();
        collectionI.getClass();
        Collection<q4a> collection = collectionI;
        ArrayList arrayList = new ArrayList(cu1.k0(collection, 10));
        for (q4a q4aVar2 : collection) {
            q4aVar2.getClass();
            arrayList.add(v(q4aVar2));
        }
        return (q4a) bu1.a1(bu1.m1(bu1.p1(arrayList)));
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return null;
    }

    @Override // defpackage.ts6
    public final Set h(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return ny3.a;
    }

    @Override // defpackage.ts6
    public final Set i(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        Set setP1 = bu1.p1(((fw2) this.e.invoke()).a());
        cs6 cs6Var = this.o;
        vs6 vs6VarA = mq7.A(cs6Var);
        Set setB = vs6VarA != null ? vs6VarA.b() : null;
        if (setB == null) {
            setB = ny3.a;
        }
        setP1.addAll(setB);
        if (this.n.a.isEnum()) {
            setP1.addAll(d46.R(mnc.c, mnc.a));
        }
        n0c n0cVar = this.b;
        cs6Var.getClass();
        n0cVar.getClass();
        setP1.addAll(new ArrayList());
        return setP1;
    }

    @Override // defpackage.ts6
    public final void j(n98 n98Var, ArrayList arrayList) {
        n0c n0cVar = this.b;
        this.o.getClass();
        n0cVar.getClass();
    }

    @Override // defpackage.ts6
    public final fw2 k() {
        return new cn1(this.n, h06.n);
    }

    @Override // defpackage.ts6
    public final void m(LinkedHashSet linkedHashSet, n98 n98Var) {
        cs6 cs6Var = this.o;
        vs6 vs6VarA = mq7.A(cs6Var);
        linkedHashSet.addAll(gx1.Y(n98Var, vs6VarA == null ? ny3.a : bu1.q1(vs6VarA.a(n98Var, ng8.WHEN_GET_SUPER_MEMBERS)), linkedHashSet, cs6Var, ((df8) ((k96) this.b.b).l).d));
        if (this.n.a.isEnum()) {
            if (n98Var.equals(mnc.c)) {
                linkedHashSet.add(kng.q(cs6Var));
            } else if (n98Var.equals(mnc.a)) {
                linkedHashSet.add(kng.r(cs6Var));
            }
        }
    }

    @Override // defpackage.ws6, defpackage.ts6
    public final void n(n98 n98Var, ArrayList arrayList) {
        r4a r4aVarP;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        z zVar = new z(21, n98Var);
        cs6 cs6Var = this.o;
        vc2.F(d46.Q(cs6Var), no3.e, new us6(cs6Var, linkedHashSet, zVar));
        boolean zIsEmpty = arrayList.isEmpty();
        n0c n0cVar = this.b;
        if (zIsEmpty) {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (Object obj : linkedHashSet) {
                q4a q4aVarV = v((q4a) obj);
                Object arrayList2 = linkedHashMap.get(q4aVarV);
                if (arrayList2 == null) {
                    arrayList2 = new ArrayList();
                    linkedHashMap.put(q4aVarV, arrayList2);
                }
                ((List) arrayList2).add(obj);
            }
            ArrayList arrayList3 = new ArrayList();
            Iterator it2 = linkedHashMap.entrySet().iterator();
            while (it2.hasNext()) {
                bu1.n0(gx1.Y(n98Var, (Collection) ((Map.Entry) it2.next()).getValue(), arrayList, cs6Var, ((df8) ((k96) n0cVar.b).l).d), arrayList3);
            }
            arrayList.addAll(arrayList3);
        } else {
            arrayList.addAll(gx1.Y(n98Var, linkedHashSet, arrayList, cs6Var, ((df8) ((k96) n0cVar.b).l).d));
        }
        if (this.n.a.isEnum() && n98Var.equals(mnc.b) && (r4aVarP = kng.p(cs6Var)) != null) {
            arrayList.add(r4aVarP);
        }
    }

    @Override // defpackage.ts6
    public final Set o(p83 p83Var) {
        p83Var.getClass();
        Set setP1 = bu1.p1(((fw2) this.e.invoke()).f());
        h06 h06Var = h06.o;
        cs6 cs6Var = this.o;
        vc2.F(d46.Q(cs6Var), no3.e, new us6(cs6Var, setP1, h06Var));
        if (this.n.a.isEnum()) {
            setP1.add(mnc.b);
        }
        return setP1;
    }

    @Override // defpackage.ts6
    public final yv2 q() {
        return this.o;
    }
}
