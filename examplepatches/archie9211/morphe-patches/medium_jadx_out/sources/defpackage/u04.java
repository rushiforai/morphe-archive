package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u04 implements y74 {
    @Override // defpackage.y74
    public final w74 a() {
        return w74.SUCCESS_ONLY;
    }

    @Override // defpackage.y74
    public final x74 b(c41 c41Var, c41 c41Var2, y28 y28Var) {
        c41Var.getClass();
        c41Var2.getClass();
        if (c41Var2 instanceof g96) {
            g96 g96Var = (g96) c41Var2;
            if (g96Var.getTypeParameters().isEmpty()) {
                bx8 bx8VarI = cx8.i(c41Var, c41Var2);
                if ((bx8VarI != null ? bx8VarI.b() : null) != null) {
                    return x74.UNKNOWN;
                }
                List listI = g96Var.I();
                listI.getClass();
                srd srdVar = new srd(new j80(1, listI), xx.B);
                mn6 mn6Var = g96Var.h;
                mn6Var.getClass();
                ym4 ym4VarI0 = szb.I0(k80.b0(new mzb[]{srdVar, new j80(4, mn6Var)}));
                yq6 yq6Var = g96Var.j;
                yh4 yh4Var = new yh4(szb.I0(k80.b0(new mzb[]{ym4VarI0, new j80(1, d46.S(yq6Var != null ? yq6Var.getType() : null))})));
                while (yh4Var.hasNext()) {
                    mn6 mn6Var2 = (mn6) yh4Var.next();
                    if (!mn6Var2.h0().isEmpty() && !(mn6Var2.m0() instanceof wsa)) {
                        return x74.UNKNOWN;
                    }
                }
                c41 c41VarBuild = (c41) c41Var.f(new ixd(new vsa()));
                if (c41VarBuild == null) {
                    return x74.UNKNOWN;
                }
                if (c41VarBuild instanceof bec) {
                    bec becVar = (bec) c41VarBuild;
                    if (!becVar.getTypeParameters().isEmpty()) {
                        c41VarBuild = becVar.d0().y().build();
                        c41VarBuild.getClass();
                    }
                }
                ax8 ax8VarB = cx8.c.n(c41VarBuild, c41Var2, false).b();
                ax8VarB.getClass();
                return t04.a[ax8VarB.ordinal()] == 1 ? x74.OVERRIDABLE : x74.UNKNOWN;
            }
        }
        return x74.UNKNOWN;
    }
}
