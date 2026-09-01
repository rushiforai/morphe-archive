package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d7d implements b55 {
    public final /* synthetic */ r28 a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ w06 c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ m45 e;
    public final /* synthetic */ mz1 f;

    public d7d(r28 r28Var, boolean z, skb skbVar, boolean z2, m45 m45Var, mz1 mz1Var) {
        this.a = r28Var;
        this.b = z;
        this.c = skbVar;
        this.d = z2;
        this.e = m45Var;
        this.f = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            r28 r28VarD = jfc.d(hlg.P(this.a, this.b, null, this.c, this.d, new vkb(4), this.e), 1.0f);
            wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var, 54);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            this.f.f(xv1.a, p65Var, 6);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
