package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vsa extends exd {
    public static final v96 c;
    public static final v96 d;
    public final mya b = new mya(new rz5(22));

    static {
        lxd lxdVar = lxd.COMMON;
        c = gx1.e0(lxdVar, false, null, 5).b(w96.FLEXIBLE_LOWER_BOUND);
        d = gx1.e0(lxdVar, false, null, 5).b(w96.FLEXIBLE_UPPER_BOUND);
    }

    @Override // defpackage.exd
    public final xwd d(mn6 mn6Var) {
        return new onc(h(mn6Var, new v96(lxd.COMMON, false, false, null, 62)));
    }

    public final f09 g(hec hecVar, y28 y28Var, v96 v96Var) {
        if (hecVar.j0().getParameters().isEmpty()) {
            return new f09(hecVar, Boolean.FALSE);
        }
        if (vm6.y(hecVar)) {
            xwd xwdVar = (xwd) hecVar.h0().get(0);
            pqe pqeVarA = xwdVar.a();
            mn6 mn6VarB = xwdVar.b();
            mn6VarB.getClass();
            return new f09(pwd.Y(hecVar.i0(), hecVar.j0(), d46.Q(new onc(h(mn6VarB, v96Var), pqeVarA)), hecVar.k0()), Boolean.FALSE);
        }
        if (kyd.a0(hecVar)) {
            return new f09(l24.c(k24.ERROR_RAW_TYPE, hecVar.j0().toString()), Boolean.FALSE);
        }
        ev7 ev7VarF0 = y28Var.f0(this);
        ev7VarF0.getClass();
        uvd uvdVarI0 = hecVar.i0();
        zvd zvdVarN = y28Var.n();
        zvdVarN.getClass();
        List<swd> parameters = y28Var.n().getParameters();
        parameters.getClass();
        ArrayList arrayList = new ArrayList(cu1.k0(parameters, 10));
        for (swd swdVar : parameters) {
            swdVar.getClass();
            mya myaVar = this.b;
            arrayList.add(rz5.w(swdVar, v96Var, myaVar, myaVar.t(swdVar, v96Var)));
        }
        return new f09(pwd.a0(uvdVarI0, zvdVarN, arrayList, hecVar.k0(), ev7VarF0, new z(y28Var, this, hecVar, v96Var)), Boolean.TRUE);
    }

    public final mn6 h(mn6 mn6Var, v96 v96Var) {
        co1 co1VarA = mn6Var.j0().a();
        if (co1VarA instanceof swd) {
            v96Var.getClass();
            return h(this.b.t((swd) co1VarA, v96.a(v96Var, null, true, null, null, 59)), v96Var);
        }
        if (!(co1VarA instanceof y28)) {
            ik4.m("Unexpected declaration kind: ", co1VarA);
            return null;
        }
        co1 co1VarA2 = f49.X(mn6Var).j0().a();
        if (co1VarA2 instanceof y28) {
            f09 f09VarG = g(f49.N(mn6Var), (y28) co1VarA, c);
            hec hecVar = (hec) f09VarG.a;
            boolean zBooleanValue = ((Boolean) f09VarG.b).booleanValue();
            f09 f09VarG2 = g(f49.X(mn6Var), (y28) co1VarA2, d);
            hec hecVar2 = (hec) f09VarG2.a;
            return (zBooleanValue || ((Boolean) f09VarG2.b).booleanValue()) ? new wsa(hecVar, hecVar2) : pwd.K(hecVar, hecVar2);
        }
        throw new IllegalStateException(("For some reason declaration for upper bound is not a class but \"" + co1VarA2 + "\" while for lower it's \"" + co1VarA + '\"').toString());
    }
}
