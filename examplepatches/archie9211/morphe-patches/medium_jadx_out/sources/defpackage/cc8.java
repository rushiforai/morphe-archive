package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cc8 implements b55 {
    public final /* synthetic */ xb8 a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ wlc d;
    public final /* synthetic */ b55 e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ mz1 g;

    public cc8(xb8 xb8Var, boolean z, boolean z2, wlc wlcVar, b55 b55Var, boolean z3, mz1 mz1Var) {
        this.a = xb8Var;
        this.b = z;
        this.c = z2;
        this.d = wlcVar;
        this.e = b55Var;
        this.f = z3;
        this.g = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        r28 go1Var;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            boolean z = this.c;
            boolean z2 = this.b;
            xb8 xb8Var = this.a;
            upc upcVarA = wec.a(!z ? xb8Var.f : z2 ? xb8Var.a : xb8Var.d, this.d, null, p65Var, 0, 12);
            if (this.e == null || !(this.f || z2)) {
                p65Var.Y(-634793532);
                p65Var.p(false);
                go1Var = o28.b;
            } else {
                p65Var.Y(-634794445);
                Object objM = p65Var.M();
                if (objM == w12.a) {
                    objM = new hb8(4);
                    p65Var.j0(objM);
                }
                go1Var = new go1((x45) objM);
                p65Var.p(false);
            }
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, go1Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            sn3 sn3Var = c82.a;
            uu1 uu1Var = (uu1) upcVarA.getValue();
            long j = uu1Var.a;
            k40.c(sn3Var.a(uu1Var), this.g, p65Var, 8);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
