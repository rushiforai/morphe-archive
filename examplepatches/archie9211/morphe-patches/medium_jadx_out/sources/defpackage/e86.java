package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e86 implements zk1 {
    public static final e86 b = new e86(0);
    public static final e86 c = new e86(1);
    public final /* synthetic */ int a;

    public /* synthetic */ e86(int i) {
        this.a = i;
    }

    @Override // defpackage.zk1
    public final boolean a(g96 g96Var) {
        hec hecVarX;
        switch (this.a) {
            case 0:
                lqe lqeVar = (lqe) g96Var.I().get(1);
                y3b y3bVar = z1b.c;
                lqeVar.getClass();
                int i = f93.a;
                b38 b38VarD = d93.d(lqeVar);
                b38VarD.getClass();
                y3bVar.getClass();
                y28 y28VarF = d46.F(b38VarD, lnc.R);
                if (y28VarF == null) {
                    hecVarX = null;
                } else {
                    uvd.b.getClass();
                    uvd uvdVar = uvd.c;
                    List parameters = y28VarF.n().getParameters();
                    parameters.getClass();
                    Object objA1 = bu1.a1(parameters);
                    objA1.getClass();
                    hecVarX = pwd.X(uvdVar, y28VarF, d46.Q(new onc((swd) objA1)));
                }
                if (hecVarX == null) {
                    return false;
                }
                mn6 type = lqeVar.getType();
                type.getClass();
                return ok7.F(hecVarX, nxd.h(type, false));
            default:
                List<lqe> listI = g96Var.I();
                listI.getClass();
                if (!listI.isEmpty()) {
                    for (lqe lqeVar2 : listI) {
                        lqeVar2.getClass();
                        if (f93.a(lqeVar2) || lqeVar2.k != null) {
                            return false;
                        }
                    }
                }
                return true;
        }
    }

    @Override // defpackage.zk1
    public final /* bridge */ String b(g96 g96Var) {
        switch (this.a) {
        }
        return o7f.A(this, g96Var);
    }

    @Override // defpackage.zk1
    public final String getDescription() {
        switch (this.a) {
            case 0:
                return "second parameter must be of type KProperty<*> or its supertype";
            default:
                return "should not have varargs or parameters with default values";
        }
    }
}
