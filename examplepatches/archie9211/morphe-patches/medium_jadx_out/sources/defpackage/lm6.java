package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lm6 {
    public int a;
    public gsa b;
    public final ArrayList c = new ArrayList(0);
    public lm6 d;
    public lm6 e;
    public hm6 f;
    public final ArrayList g;

    public lm6(int i) {
        this.a = i;
        sz7.a.getClass();
        List listA = rz7.a();
        ArrayList arrayList = new ArrayList(cu1.k0(listA, 10));
        Iterator it2 = listA.iterator();
        while (it2.hasNext()) {
            ((kf6) ((sz7) it2.next())).getClass();
            arrayList.add(new ng6());
        }
        this.g = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!lm6.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        lm6 lm6Var = (lm6) obj;
        if (this.a != lm6Var.a) {
            return false;
        }
        gsa gsaVar = this.b;
        if (gsaVar == null) {
            g76.g0("classifier");
            throw null;
        }
        gsa gsaVar2 = lm6Var.b;
        if (gsaVar2 != null) {
            return gsaVar.equals(gsaVar2) && this.c.equals(lm6Var.c) && g76.L(this.e, lm6Var.e) && g76.L(this.d, lm6Var.d) && g76.L(this.f, lm6Var.f) && this.g.equals(lm6Var.g);
        }
        g76.g0("classifier");
        throw null;
    }

    public final int hashCode() {
        int i = this.a * 31;
        gsa gsaVar = this.b;
        if (gsaVar != null) {
            return this.c.hashCode() + ((gsaVar.hashCode() + i) * 31);
        }
        g76.g0("classifier");
        throw null;
    }
}
