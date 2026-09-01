package defpackage;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t0d implements ev7 {
    public final ev7 b;
    public final ixd c;
    public HashMap d;
    public final w5d e;

    public t0d(ev7 ev7Var, ixd ixdVar) {
        ev7Var.getClass();
        ixdVar.getClass();
        this.b = ev7Var;
        new w5d(new bx6(11, ixdVar));
        this.c = new ixd(kng.Q(ixdVar.a));
        this.e = new w5d(new bx6(12, this));
    }

    @Override // defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return i(this.b.a(n98Var, ng8Var));
    }

    @Override // defpackage.ev7
    public final Set b() {
        return this.b.b();
    }

    @Override // defpackage.ev7
    public final Set c() {
        return this.b.c();
    }

    @Override // defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        co1 co1VarD = this.b.d(n98Var, ng8Var);
        if (co1VarD != null) {
            return (co1) h(co1VarD);
        }
        return null;
    }

    @Override // defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return (Collection) this.e.getValue();
    }

    @Override // defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return i(this.b.f(n98Var, ng8Var));
    }

    @Override // defpackage.ev7
    public final Set g() {
        return this.b.g();
    }

    public final yv2 h(yv2 yv2Var) {
        ixd ixdVar = this.c;
        if (ixdVar.a.e()) {
            return yv2Var;
        }
        HashMap map = this.d;
        if (map == null) {
            map = new HashMap();
            this.d = map;
        }
        Object objF = map.get(yv2Var);
        if (objF == null) {
            if (!(yv2Var instanceof s0d)) {
                ik4.m("Unknown descriptor in scope: ", yv2Var);
                return null;
            }
            objF = ((s0d) yv2Var).f(ixdVar);
            if (objF == null) {
                rd6.h("We expect that no conflict should happen while substitution is guaranteed to generate invariant projection, but ", yv2Var, " substitution fails");
                return null;
            }
            map.put(yv2Var, objF);
        }
        return (yv2) objF;
    }

    public final Collection i(Collection collection) {
        if (this.c.a.e() || collection.isEmpty()) {
            return collection;
        }
        int size = collection.size();
        LinkedHashSet linkedHashSet = new LinkedHashSet(size >= 3 ? (size / 3) + size + 1 : 3);
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            linkedHashSet.add(h((yv2) it2.next()));
        }
        return linkedHashSet;
    }
}
