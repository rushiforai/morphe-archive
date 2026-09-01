package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class pl3 {
    public static final ol3 a;
    public static final ol3 b;

    static {
        int i = 3;
        n92 n92Var = null;
        a = new ol3(i, 0, n92Var);
        b = new ol3(i, 1, n92Var);
    }

    public static r28 a(r28 r28Var, sl3 sl3Var, hw8 hw8Var, boolean z, m68 m68Var, boolean z2, c55 c55Var, boolean z3, int i) {
        if ((i & 4) != 0) {
            z = true;
        }
        boolean z4 = z;
        if ((i & 8) != 0) {
            m68Var = null;
        }
        return r28Var.b(new nl3(sl3Var, hw8Var, z4, m68Var, (i & 16) != 0 ? false : z2, a, c55Var, (i & 128) != 0 ? false : z3));
    }

    public static final sl3 b(x12 x12Var, x45 x45Var) {
        l78 l78VarY = qo7.y(x45Var, x12Var);
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (objM == w12.a) {
            sy2 sy2Var = new sy2(new ws(l78VarY, 6));
            p65Var.j0(sy2Var);
            objM = sy2Var;
        }
        return (sl3) objM;
    }

    public static final long c(long j) {
        return ok7.u(Float.isNaN(qre.b(j)) ? 0.0f : qre.b(j), Float.isNaN(qre.c(j)) ? 0.0f : qre.c(j));
    }
}
