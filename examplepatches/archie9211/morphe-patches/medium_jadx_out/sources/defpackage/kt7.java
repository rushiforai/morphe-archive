package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kt7 {
    public static final sn3 a = new sn3(1, new oo7(10));
    public static final sn3 b = new sn3(1, new oo7(11));
    public static final sn3 c = new sn3(1, new oo7(12));

    public static final void a(boolean z, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        boolean zN;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-57531391);
        int i3 = i | 2;
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                zN = yi2.N(p65Var);
            } else {
                p65Var.S();
                zN = z;
            }
            p65Var.q();
            zo7 zo7Var = zN ? ap7.b : ap7.a;
            eu7 eu7VarE = fu7.e(zo7Var);
            f8c f8cVar = g8c.a;
            k16 k16VarG = f76.G(new cud(700, 400, ao3.d), v4b.Restart, 0L, 4);
            long j = uu1.h;
            i2 = 2;
            k40.d(new o10[]{b.a(zo7Var), c.a(eu7VarE), g8c.b.a(f8c.a(f8cVar, k16VarG, d46.R(new uu1(uu1.b(0.5f, j)), new uu1(uu1.b(1.0f, j)), new uu1(uu1.b(0.5f, j))))), a.a(jp7.a)}, pxf.E(-1126295743, new it7(zN, zo7Var, mz1Var, i4), p65Var), p65Var, 56);
        } else {
            i2 = 2;
            p65Var.S();
            zN = z;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pv0(zN, mz1Var, i, i2);
        }
    }
}
