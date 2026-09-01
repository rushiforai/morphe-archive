package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j26 extends fv7 {
    public final ev7 b;

    public j26(ev7 ev7Var) {
        ev7Var.getClass();
        this.b = ev7Var;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set b() {
        return this.b.b();
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set c() {
        return this.b.c();
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        co1 co1VarD = this.b.d(n98Var, ng8Var);
        if (co1VarD != null) {
            y28 y28Var = co1VarD instanceof y28 ? (y28) co1VarD : null;
            if (y28Var != null) {
                return y28Var;
            }
            if (co1VarD instanceof ha3) {
                return (ha3) co1VarD;
            }
        }
        return null;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        int i = p83.l & p83Var.b;
        p83 p83Var2 = i == 0 ? null : new p83(i, p83Var.a);
        if (p83Var2 == null) {
            return ey3.a;
        }
        Collection collectionE = this.b.e(p83Var2, x45Var);
        ArrayList arrayList = new ArrayList();
        for (Object obj : collectionE) {
            if (obj instanceof do1) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set g() {
        return this.b.g();
    }

    public final String toString() {
        return "Classes from " + this.b;
    }
}
