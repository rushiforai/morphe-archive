package defpackage;

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sj1 implements ev7 {
    public final String b;
    public final ev7[] c;

    public sj1(String str, ev7[] ev7VarArr) {
        this.b = str;
        this.c = ev7VarArr;
    }

    @Override // defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        ev7[] ev7VarArr = this.c;
        int length = ev7VarArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return ev7VarArr[0].a(n98Var, ng8Var);
        }
        Collection collectionU = null;
        for (ev7 ev7Var : ev7VarArr) {
            collectionU = vp7.u(collectionU, ev7Var.a(n98Var, ng8Var));
        }
        return collectionU == null ? ny3.a : collectionU;
    }

    @Override // defpackage.ev7
    public final Set b() {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (ev7 ev7Var : this.c) {
            bu1.n0(ev7Var.b(), linkedHashSet);
        }
        return linkedHashSet;
    }

    @Override // defpackage.ev7
    public final Set c() {
        ev7[] ev7VarArr = this.c;
        ev7VarArr.getClass();
        return il7.v(ev7VarArr.length == 0 ? ey3.a : new i80(0, ev7VarArr));
    }

    @Override // defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        co1 co1Var = null;
        for (ev7 ev7Var : this.c) {
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
        ev7[] ev7VarArr = this.c;
        int length = ev7VarArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return ev7VarArr[0].e(p83Var, x45Var);
        }
        Collection collectionU = null;
        for (ev7 ev7Var : ev7VarArr) {
            collectionU = vp7.u(collectionU, ev7Var.e(p83Var, x45Var));
        }
        return collectionU == null ? ny3.a : collectionU;
    }

    @Override // defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        ev7[] ev7VarArr = this.c;
        int length = ev7VarArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return ev7VarArr[0].f(n98Var, ng8Var);
        }
        Collection collectionU = null;
        for (ev7 ev7Var : ev7VarArr) {
            collectionU = vp7.u(collectionU, ev7Var.f(n98Var, ng8Var));
        }
        return collectionU == null ? ny3.a : collectionU;
    }

    @Override // defpackage.ev7
    public final Set g() {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (ev7 ev7Var : this.c) {
            bu1.n0(ev7Var.g(), linkedHashSet);
        }
        return linkedHashSet;
    }

    public final String toString() {
        return this.b;
    }
}
