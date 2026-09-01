package defpackage;

import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sz implements g00, n00 {
    public final zw2 a;

    public sz(zw2 zw2Var) {
        this.a = zw2Var;
    }

    @Override // defpackage.g00
    public final bo4 a(h00 h00Var, ad adVar) {
        h00Var.getClass();
        s44 s44Var = h00Var.c;
        hv8 hv8Var = h00Var.a;
        if (hv8Var instanceof v78) {
            q44 q44VarD = s44Var.d(yl2.d);
            q44VarD.getClass();
            return new u50(12, new nz(h00Var, this, (yl2) q44VarD, adVar, (n92) null));
        }
        if (!(hv8Var instanceof uqa)) {
            ik4.m("Unknown operation ", hv8Var);
            return null;
        }
        q44 q44VarD2 = s44Var.d(yl2.d);
        q44VarD2.getClass();
        return new u50(12, new oz(((pd4) s44Var.d(pd4.a)) != null, this, h00Var, (yl2) q44VarD2, adVar, null, 0));
    }

    public final Object b(h00 h00Var, j00 j00Var, yl2 yl2Var, Set set, p92 p92Var) {
        h00Var.getClass();
        s44 s44Var = h00Var.c;
        if (s44Var.d(g31.c) != null) {
            rd6.m();
            return null;
        }
        du8 du8Var = j00Var.c;
        c1e c1eVar = c1e.a;
        if (du8Var != null) {
            List list = j00Var.d;
            if (list == null || list.isEmpty()) {
                pz pzVar = new pz(j00Var, h00Var, this, yl2Var, set, (n92) null);
                Object objInvoke = pzVar.invoke(p92Var);
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                if (objInvoke != tb2Var) {
                    objInvoke = c1eVar;
                }
                if (objInvoke == tb2Var) {
                    return objInvoke;
                }
            } else if (s44Var.d(g31.e) != null) {
                rd6.m();
                return null;
            }
        }
        return c1eVar;
    }
}
