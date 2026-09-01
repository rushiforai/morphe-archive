package defpackage;

import java.util.Collection;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class us6 extends s42 {
    public final /* synthetic */ y28 o;
    public final /* synthetic */ Set p;
    public final /* synthetic */ x45 q;

    public us6(y28 y28Var, Set set, x45 x45Var) {
        this.o = y28Var;
        this.p = set;
        this.q = x45Var;
    }

    @Override // defpackage.s42
    public final boolean J(Object obj) {
        y28 y28Var = (y28) obj;
        y28Var.getClass();
        if (y28Var == this.o) {
            return true;
        }
        ev7 ev7VarJ0 = y28Var.j0();
        ev7VarJ0.getClass();
        if (!(ev7VarJ0 instanceof ws6)) {
            return true;
        }
        this.p.addAll((Collection) this.q.invoke(ev7VarJ0));
        return false;
    }

    @Override // defpackage.s42
    public final Object h0() {
        return c1e.a;
    }
}
