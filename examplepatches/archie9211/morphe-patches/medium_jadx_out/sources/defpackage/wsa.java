package defpackage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wsa extends zm4 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wsa(hec hecVar, hec hecVar2) {
        super(hecVar, hecVar2);
        hecVar.getClass();
        hecVar2.getClass();
        on6.a.b(hecVar, hecVar2);
    }

    public static final ArrayList s0(w83 w83Var, mn6 mn6Var) throws IOException {
        List<xwd> listH0 = mn6Var.h0();
        ArrayList arrayList = new ArrayList(cu1.k0(listH0, 10));
        for (xwd xwdVar : listH0) {
            xwdVar.getClass();
            StringBuilder sb = new StringBuilder();
            bu1.E0(d46.Q(xwdVar), sb, ", ", null, null, new t83(w83Var, 0), 60);
            arrayList.add(sb.toString());
        }
        return arrayList;
    }

    public static final String t0(String str, String str2) {
        if (!muc.R(str, '<')) {
            return str;
        }
        return muc.u0(str, '<') + '<' + str2 + '>' + muc.t0('>', str, str);
    }

    @Override // defpackage.zm4, defpackage.mn6
    public final ev7 H() {
        co1 co1VarA = j0().a();
        y28 y28Var = co1VarA instanceof y28 ? (y28) co1VarA : null;
        if (y28Var == null) {
            lg8.w("Incorrect classifier: ", j0().a());
            return null;
        }
        ev7 ev7VarF0 = y28Var.f0(new vsa());
        ev7VarF0.getClass();
        return ev7VarF0;
    }

    @Override // defpackage.mn6
    public final mn6 l0(sn6 sn6Var) {
        hec hecVar = this.b;
        hecVar.getClass();
        hec hecVar2 = this.c;
        hecVar2.getClass();
        return new wsa(hecVar, hecVar2);
    }

    @Override // defpackage.o3e
    public final o3e n0(boolean z) {
        return new wsa(this.b.n0(z), this.c.n0(z));
    }

    @Override // defpackage.o3e
    /* JADX INFO: renamed from: o0 */
    public final o3e l0(sn6 sn6Var) {
        hec hecVar = this.b;
        hecVar.getClass();
        hec hecVar2 = this.c;
        hecVar2.getClass();
        return new wsa(hecVar, hecVar2);
    }

    @Override // defpackage.o3e
    public final o3e p0(uvd uvdVar) {
        uvdVar.getClass();
        return new wsa(this.b.p0(uvdVar), this.c.p0(uvdVar));
    }

    @Override // defpackage.zm4
    public final hec q0() {
        return this.b;
    }

    @Override // defpackage.zm4
    public final String r0(w83 w83Var, w83 w83Var2) throws IOException {
        hec hecVar = this.b;
        String strW = w83Var.W(hecVar);
        hec hecVar2 = this.c;
        String strW2 = w83Var.W(hecVar2);
        if (w83Var2.a.o()) {
            return "raw (" + strW + ".." + strW2 + ')';
        }
        if (hecVar2.h0().isEmpty()) {
            return w83Var.E(strW, strW2, ok7.B(this));
        }
        ArrayList arrayListS0 = s0(w83Var, hecVar);
        ArrayList arrayListS02 = s0(w83Var, hecVar2);
        String strF0 = bu1.F0(arrayListS0, ", ", null, null, p79.f, 30);
        ArrayList<f09> arrayListT1 = bu1.t1(arrayListS02, arrayListS0);
        if (arrayListT1.isEmpty()) {
            strW2 = t0(strW2, strF0);
        } else {
            for (f09 f09Var : arrayListT1) {
                String str = (String) f09Var.a;
                String str2 = (String) f09Var.b;
                if (!g76.L(str, muc.j0("out ", str2)) && !str2.equals("*")) {
                    break;
                }
            }
            strW2 = t0(strW2, strF0);
        }
        String strT0 = t0(strW, strF0);
        return strT0.equals(strW2) ? strT0 : w83Var.E(strT0, strW2, ok7.B(this));
    }
}
