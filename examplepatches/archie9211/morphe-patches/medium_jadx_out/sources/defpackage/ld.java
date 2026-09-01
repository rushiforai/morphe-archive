package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ld implements b55 {
    public final /* synthetic */ b55 a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ b55 c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ long f;
    public final /* synthetic */ long g;
    public final /* synthetic */ mz1 h;

    public ld(b55 b55Var, b55 b55Var2, b55 b55Var3, long j, long j2, long j3, long j4, mz1 mz1Var) {
        this.a = b55Var;
        this.b = b55Var2;
        this.c = b55Var3;
        this.d = j;
        this.e = j2;
        this.f = j3;
        this.g = j4;
        this.h = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        int i = 1;
        int i2 = 0;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            jy8 jy8Var = qd.a;
            o28 o28Var = o28.b;
            r28 r28VarB = w2g.B(o28Var, jy8Var);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            b55 b55Var = this.a;
            if (b55Var == null) {
                p65Var.Y(346092326);
            } else {
                p65Var.Y(346092327);
                k40.c(b09.q(this.d, c82.a), pxf.E(-1128150638, new jd(i2, b55Var), p65Var), p65Var, 56);
            }
            p65Var.p(false);
            b55 b55Var2 = this.b;
            if (b55Var2 == null) {
                p65Var.Y(346396529);
            } else {
                p65Var.Y(346396530);
                fo7.v(this.e, pyd.a(ub3.f, p65Var), pxf.E(71284337, new kd(b55Var, i2, b55Var2), p65Var), p65Var, 384);
            }
            p65Var.p(false);
            b55 b55Var3 = this.c;
            if (b55Var3 == null) {
                p65Var.Y(347174009);
            } else {
                p65Var.Y(347174010);
                fo7.v(this.f, pyd.a(ub3.h, p65Var), pxf.E(705583346, new jd(i, b55Var3), p65Var), p65Var, 384);
            }
            p65Var.p(false);
            r28 r28VarA = xv1.a(z46.r, o28Var);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarA);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var, iS2, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR2);
            fo7.v(this.g, pyd.a(ub3.b, p65Var), this.h, p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
