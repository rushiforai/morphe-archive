package defpackage;

import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class of6 implements ev7 {
    public static final /* synthetic */ fj6[] f = {n1b.a.g(new u4a(of6.class, "kotlinScopes", "getKotlinScopes()[Lorg/jetbrains/kotlin/resolve/scopes/MemberScope;", 0))};
    public final n0c b;
    public final js6 c;
    public final ps6 d;
    public final u67 e;

    public of6(n0c n0cVar, a1b a1bVar, js6 js6Var) {
        this.b = n0cVar;
        this.c = js6Var;
        this.d = new ps6(n0cVar, a1bVar, js6Var);
        this.e = new u67(((k96) n0cVar.b).a, new v2(21, this));
    }

    @Override // defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        i(n98Var, ng8Var);
        ev7[] ev7VarArrH = h();
        Collection collectionA = this.d.a(n98Var, ng8Var);
        for (ev7 ev7Var : ev7VarArrH) {
            collectionA = vp7.u(collectionA, ev7Var.a(n98Var, ng8Var));
        }
        return collectionA == null ? ny3.a : collectionA;
    }

    @Override // defpackage.ev7
    public final Set b() {
        ev7[] ev7VarArrH = h();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (ev7 ev7Var : ev7VarArrH) {
            bu1.n0(ev7Var.b(), linkedHashSet);
        }
        linkedHashSet.addAll(this.d.b());
        return linkedHashSet;
    }

    @Override // defpackage.ev7
    public final Set c() {
        ev7[] ev7VarArrH = h();
        ev7VarArrH.getClass();
        HashSet hashSetV = il7.v(ev7VarArrH.length == 0 ? ey3.a : new i80(0, ev7VarArrH));
        if (hashSetV == null) {
            return null;
        }
        hashSetV.addAll(this.d.c());
        return hashSetV;
    }

    @Override // defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        i(n98Var, ng8Var);
        ps6 ps6Var = this.d;
        ps6Var.getClass();
        co1 co1Var = null;
        y28 y28VarV = ps6Var.v(n98Var, null);
        if (y28VarV != null) {
            return y28VarV;
        }
        for (ev7 ev7Var : h()) {
            co1 co1VarD = ev7Var.d(n98Var, ng8Var);
            if (co1VarD != null) {
                if (!(co1VarD instanceof do1) || !((tu7) co1VarD).y()) {
                    return co1VarD;
                }
                if (co1Var == null) {
                    co1Var = co1VarD;
                }
            }
        }
        return co1Var;
    }

    @Override // defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        ev7[] ev7VarArrH = h();
        Collection collectionE = this.d.e(p83Var, x45Var);
        for (ev7 ev7Var : ev7VarArrH) {
            collectionE = vp7.u(collectionE, ev7Var.e(p83Var, x45Var));
        }
        return collectionE == null ? ny3.a : collectionE;
    }

    @Override // defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        i(n98Var, ng8Var);
        ev7[] ev7VarArrH = h();
        this.d.getClass();
        Collection collectionU = ey3.a;
        for (ev7 ev7Var : ev7VarArrH) {
            collectionU = vp7.u(collectionU, ev7Var.f(n98Var, ng8Var));
        }
        return collectionU == null ? ny3.a : collectionU;
    }

    @Override // defpackage.ev7
    public final Set g() {
        ev7[] ev7VarArrH = h();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (ev7 ev7Var : ev7VarArrH) {
            bu1.n0(ev7Var.g(), linkedHashSet);
        }
        linkedHashSet.addAll(this.d.g());
        return linkedHashSet;
    }

    public final ev7[] h() {
        return (ev7[]) mk7.z(this.e, f[0]);
    }

    public final void i(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        gr7.w(fa4.m, ng8Var, this.c, n98Var);
    }

    public final String toString() {
        return "scope for " + this.c;
    }
}
