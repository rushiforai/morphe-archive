package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class it7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ zo7 c;
    public final /* synthetic */ mz1 d;

    public /* synthetic */ it7(boolean z, zo7 zo7Var, mz1 mz1Var, int i) {
        this.a = i;
        this.b = z;
        this.c = zo7Var;
        this.d = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        fv1 fv1VarE;
        c1e c1eVar;
        sv1 sv1Var;
        int i = this.a;
        c1e c1eVar2 = c1e.a;
        zo7 zo7Var = this.c;
        boolean z = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    if (z) {
                        p65Var.Y(560352880);
                        long j = zo7Var.d;
                        long j2 = zo7Var.a;
                        long j3 = zo7Var.b;
                        long j4 = zo7Var.e;
                        long j5 = zo7Var.c;
                        long j6 = zo7Var.k;
                        long j7 = zo7Var.n;
                        long j8 = zo7Var.q;
                        sn3 sn3Var = iv1.a;
                        fv1VarE = new fv1(j, j7, xu1.r, xu1.e, j2, j3, j8, xu1.v, xu1.h, j4, xu1.l, xu1.G, xu1.m, j2, j7, j5, j7, xu1.F, xu1.k, j, xu1.c, xu1.b, j6, j8, xu1.a, xu1.d, xu1.p, xu1.q, xu1.u, xu1.y, xu1.E, xu1.z, xu1.A, xu1.B, xu1.C, xu1.D, xu1.s, xu1.t, xu1.f, xu1.g, xu1.w, xu1.x, xu1.i, xu1.j, xu1.H, xu1.I, xu1.n, xu1.o);
                        p65Var = p65Var;
                    } else {
                        p65Var.Y(560354608);
                        long j9 = zo7Var.d;
                        long j10 = zo7Var.a;
                        long j11 = zo7Var.b;
                        long j12 = zo7Var.e;
                        long j13 = zo7Var.c;
                        long j14 = zo7Var.k;
                        long j15 = zo7Var.n;
                        fv1VarE = iv1.e(j9, j15, j10, j11, zo7Var.o, j12, zo7Var.p, j10, j15, j13, j15, j14, zo7Var.q, -12707444);
                    }
                    p65Var.p(false);
                    jk7.b(fv1VarE, jt7.b, jt7.a, this.d, p65Var, 432);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    if (z) {
                        p65Var2.Y(-38448369);
                        zo7 zo7Var2 = ap7.a;
                        long j16 = zo7Var.d;
                        long j17 = zo7Var.b;
                        long j18 = zo7Var.e;
                        long j19 = zo7Var.h;
                        c1eVar = c1eVar2;
                        long j20 = zo7Var.a;
                        long j21 = zo7Var.c;
                        long j22 = zo7Var.k;
                        long j23 = zo7Var.n;
                        long j24 = zo7Var.q;
                        sn3 sn3Var2 = tv1.a;
                        sv1Var = new sv1(j16, j17, j18, j19, j20, j21, j22, j23, j24, j23, j23, j24, false);
                    } else {
                        c1eVar = c1eVar2;
                        p65Var2.Y(-38446673);
                        zo7 zo7Var3 = ap7.a;
                        long j25 = zo7Var.d;
                        long j26 = zo7Var.b;
                        long j27 = zo7Var.e;
                        long j28 = zo7Var.h;
                        long j29 = zo7Var.a;
                        long j30 = zo7Var.c;
                        long j31 = zo7Var.k;
                        long j32 = zo7Var.n;
                        long j33 = zo7Var.q;
                        sn3 sn3Var3 = tv1.a;
                        sv1Var = new sv1(j25, j26, j27, j28, j29, j30, j31, j32, j33, j32, j32, j33, true);
                    }
                    p65Var2.p(false);
                    kk7.d(sv1Var, fu7.b, wr7.a, this.d, p65Var2, 432);
                }
                break;
        }
        return c1eVar2;
    }
}
