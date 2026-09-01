package defpackage;

import java.util.ArrayList;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class su {
    public static final hx4 a = hx4.d1("k", "x", eoLmc.mGGLcgnyDaK);

    public static ru a(td6 td6Var, bc7 bc7Var) {
        ArrayList arrayList = new ArrayList();
        if (td6Var.I() == ed6.BEGIN_ARRAY) {
            td6Var.f();
            while (td6Var.hasNext()) {
                td6 td6Var2 = td6Var;
                bc7 bc7Var2 = bc7Var;
                arrayList.add(new m59(bc7Var2, wk6.b(td6Var2, bc7Var2, gpe.c(), tz7.k, td6Var.I() == ed6.BEGIN_OBJECT, false)));
                td6Var = td6Var2;
                bc7Var = bc7Var2;
            }
            td6Var.p();
            xk6.b(arrayList);
        } else {
            arrayList.add(new uk6(wd6.b(td6Var, gpe.c())));
        }
        return new ru(arrayList);
    }

    public static xu b(td6 td6Var, bc7 bc7Var) {
        td6Var.m();
        ru ruVarA = null;
        qu quVarL0 = null;
        boolean z = false;
        qu quVarL02 = null;
        while (td6Var.I() != ed6.END_OBJECT) {
            int iN = td6Var.N(a);
            if (iN == 0) {
                ruVarA = a(td6Var, bc7Var);
            } else if (iN != 1) {
                if (iN != 2) {
                    td6Var.Q();
                    td6Var.v();
                } else if (td6Var.I() == ed6.STRING) {
                    td6Var.v();
                    z = true;
                } else {
                    quVarL0 = xz5.l0(td6Var, bc7Var, true);
                }
            } else if (td6Var.I() == ed6.STRING) {
                td6Var.v();
                z = true;
            } else {
                quVarL02 = xz5.l0(td6Var, bc7Var, true);
            }
        }
        td6Var.B();
        if (z) {
            bc7Var.a("Lottie doesn't support expressions.");
        }
        return ruVarA != null ? ruVarA : new tu(quVarL02, quVarL0);
    }
}
