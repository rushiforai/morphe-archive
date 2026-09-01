package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eo1 {
    public static final eo1 b = new eo1(0);
    public static final eo1 c = new eo1(1);
    public static final eo1 d = new eo1(2);
    public final /* synthetic */ int a;

    public /* synthetic */ eo1(int i) {
        this.a = i;
    }

    public static String a(co1 co1Var) {
        String strB;
        n98 name = co1Var.getName();
        name.getClass();
        String strZ = aq7.z(name);
        if (!(co1Var instanceof swd)) {
            yv2 yv2VarH = co1Var.h();
            yv2VarH.getClass();
            if (yv2VarH instanceof y28) {
                strB = a((co1) yv2VarH);
            } else if (yv2VarH instanceof wx8) {
                z05 z05Var = ((xx8) ((wx8) yv2VarH)).f.a;
                z05Var.getClass();
                strB = aq7.B(z05.f(z05Var));
            } else {
                strB = null;
            }
            if (strB != null && !strB.equals("")) {
                return ev6.r('.', strB, strZ);
            }
        }
        return strZ;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0, types: [co1, yv2] */
    /* JADX WARN: Type inference failed for: r2v2, types: [yv2] */
    /* JADX WARN: Type inference failed for: r2v3, types: [yv2] */
    public final String b(co1 co1Var, w83 w83Var) {
        switch (this.a) {
            case 0:
                if (co1Var instanceof swd) {
                    n98 name = ((swd) co1Var).getName();
                    name.getClass();
                    return w83Var.N(name, false);
                }
                z05 z05VarG = d93.g(co1Var);
                z05VarG.getClass();
                return w83Var.n(aq7.B(z05.f(z05VarG)));
            case 1:
                if (co1Var instanceof swd) {
                    n98 name2 = ((swd) co1Var).getName();
                    name2.getClass();
                    return w83Var.N(name2, false);
                }
                ArrayList arrayList = new ArrayList();
                do {
                    arrayList.add(co1Var.getName());
                    co1Var = co1Var.h();
                } while (co1Var instanceof y28);
                return aq7.B(new wjb(arrayList));
            default:
                return a(co1Var);
        }
    }
}
