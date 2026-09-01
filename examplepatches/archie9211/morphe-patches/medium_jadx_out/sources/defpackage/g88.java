package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class g88 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ q88 b;
    public final /* synthetic */ i88 c;

    public /* synthetic */ g88(q88 q88Var, i88 i88Var, int i) {
        this.a = i;
        this.b = q88Var;
        this.c = i88Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        q88 q88Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    rh4 rh4Var = jfc.c;
                    jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 40.0f, 7);
                    boolean zF = p65Var.f(q88Var);
                    i88 i88Var = this.c;
                    boolean zF2 = zF | p65Var.f(i88Var);
                    Object objM = p65Var.M();
                    if (zF2 || objM == uobVar) {
                        objM = new q58(q88Var, 1, i88Var);
                        p65Var.j0(objM);
                    }
                    k40.t(rh4Var, null, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, 390, 506);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i2);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, zk7VarC2);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i3, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    b24 b24Var = ((o88) q88Var).a;
                    i88 i88Var2 = this.c;
                    boolean zF3 = p65Var2.f(i88Var2);
                    Object objM2 = p65Var2.M();
                    if (zF3 || objM2 == uobVar) {
                        qv7 qv7Var = new qv7(0, i88Var2, i88.class, "refresh", "refresh()V", 0, 5);
                        p65Var2.j0(qv7Var);
                        objM2 = qv7Var;
                    }
                    iq7.a(b24Var, null, null, null, null, null, (m45) ((qh6) objM2), null, p65Var2, 0, 190);
                    p65Var2.p(true);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
