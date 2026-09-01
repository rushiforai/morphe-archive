package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ps6 extends ws6 {
    public final a1b n;
    public final js6 o;
    public final t67 p;
    public final v67 q;

    public ps6(n0c n0cVar, a1b a1bVar, js6 js6Var) {
        super(n0cVar, null);
        this.n = a1bVar;
        this.o = js6Var;
        x67 x67Var = ((k96) n0cVar.b).a;
        this.p = new t67(x67Var, new v2(n0cVar, this));
        this.q = x67Var.c(new dy4(this, 10, n0cVar));
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return v(n98Var, null);
    }

    @Override // defpackage.ts6, defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        if (!p83Var.a(p83.l | p83.e)) {
            return ey3.a;
        }
        Iterable iterable = (Iterable) this.d.invoke();
        ArrayList arrayList = new ArrayList();
        for (Object obj : iterable) {
            yv2 yv2Var = (yv2) obj;
            if (yv2Var instanceof y28) {
                n98 name = ((y28) yv2Var).getName();
                name.getClass();
                if (((Boolean) x45Var.invoke(name)).booleanValue()) {
                    arrayList.add(obj);
                }
            }
        }
        return arrayList;
    }

    @Override // defpackage.ts6, defpackage.fv7, defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ts6
    public final Set h(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        if (!p83Var.a(p83.e)) {
            return ny3.a;
        }
        Set set = (Set) this.p.invoke();
        if (set == null) {
            this.n.getClass();
            return new LinkedHashSet();
        }
        HashSet hashSet = new HashSet();
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            hashSet.add(n98.e((String) it2.next()));
        }
        return hashSet;
    }

    @Override // defpackage.ts6
    public final Set i(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return ny3.a;
    }

    @Override // defpackage.ts6
    public final fw2 k() {
        return ew2.a;
    }

    @Override // defpackage.ts6
    public final Set o(p83 p83Var) {
        p83Var.getClass();
        return ny3.a;
    }

    @Override // defpackage.ts6
    public final yv2 q() {
        return this.o;
    }

    public final y28 v(n98 n98Var, q0b q0bVar) {
        n98 n98Var2 = olc.a;
        n98Var.getClass();
        String strB = n98Var.b();
        strB.getClass();
        if (strB.length() <= 0 || n98Var.b) {
            return null;
        }
        Set set = (Set) this.p.invoke();
        if (q0bVar == null && set != null && !set.contains(n98Var.b())) {
            return null;
        }
        return (y28) this.q.invoke(new ls6(n98Var, q0bVar));
    }

    public final zz7 w() {
        ((k96) this.b.b).d.c().c.getClass();
        return zz7.g;
    }

    @Override // defpackage.ts6
    public final void m(LinkedHashSet linkedHashSet, n98 n98Var) {
    }
}
