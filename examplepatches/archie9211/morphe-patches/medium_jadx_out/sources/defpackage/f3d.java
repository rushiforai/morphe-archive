package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f3d implements b55 {
    public final /* synthetic */ r28 a;
    public final /* synthetic */ m3c b;
    public final /* synthetic */ long c;
    public final /* synthetic */ float d;
    public final /* synthetic */ cu0 e;
    public final /* synthetic */ m68 f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ m45 h;
    public final /* synthetic */ float i;
    public final /* synthetic */ mz1 j;

    public f3d(float f, float f2, long j, cu0 cu0Var, mz1 mz1Var, m45 m45Var, r28 r28Var, m68 m68Var, m3c m3cVar, boolean z) {
        this.a = r28Var;
        this.b = m3cVar;
        this.c = j;
        this.d = f;
        this.e = cu0Var;
        this.f = m68Var;
        this.g = z;
        this.h = m45Var;
        this.i = f2;
        this.j = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            fr5 fr5Var = g56.a;
            r28 r28VarB = hlg.p(g3d.c(this.a.b(w08.b), this.b, g3d.d(this.c, this.d, p65Var), this.e, ((m73) p65Var.j(z22.h)).Z(this.i)), this.f, qkb.a(0.0f, 7, 0L, false), this.g, null, this.h, 24).b(new ml1(new nx(28)));
            zk7 zk7VarC = dy0.c(z46.d, true);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H(0, this.j, p65Var, true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
