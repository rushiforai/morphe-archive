package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ux4 implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ zx4 b;
    public final /* synthetic */ nza c;

    public /* synthetic */ ux4(zx4 zx4Var, nza nzaVar) {
        this.b = zx4Var;
        this.c = nzaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        nza nzaVar = this.c;
        zx4 zx4Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                    o28 o28Var = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i2);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    ar0 ar0Var = z46.d;
                    zk7 zk7VarC2 = dy0.c(ar0Var, false);
                    long j2 = p65Var.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, zk7VarC2);
                    tp7.B(p65Var, cuVar2, i89VarL2);
                    ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 32.0f, 24.0f, 0.0f, 8);
                    zk7 zk7VarC3 = dy0.c(ar0Var, false);
                    long j3 = p65Var.T;
                    int i4 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var.l();
                    r28 r28VarR3 = gx1.R(p65Var, r28VarG);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, zk7VarC3);
                    tp7.B(p65Var, cuVar2, i89VarL3);
                    ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR3);
                    Object objM = p65Var.M();
                    if (objM == uobVar) {
                        objM = qo7.u(Boolean.FALSE);
                        p65Var.j0(objM);
                    }
                    l78 l78Var = (l78) objM;
                    nwb nwbVar = new nwb(vo7.R(p65Var, nzaVar.b.getTitleResId()));
                    Object objM2 = p65Var.M();
                    if (objM2 == uobVar) {
                        objM2 = new ei4(l78Var, 2);
                        p65Var.j0(objM2);
                    }
                    tr7.a(nwbVar, (m45) objM2, bgf.N(o28Var, "refine_recommendation_filter_selector"), 0L, 0, 0, 0, p65Var, 432, 120);
                    boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
                    Object objM3 = p65Var.M();
                    if (objM3 == uobVar) {
                        objM3 = new ei4(l78Var, 3);
                        p65Var.j0(objM3);
                    }
                    xp7.b(zBooleanValue, (m45) objM3, bgf.N(o28Var, "refine_recommendation_filter_dropdown"), 0L, null, null, null, 0L, 0.0f, pxf.E(1873799471, new gx4(nzaVar, zx4Var, l78Var, 4), p65Var), p65Var, 432, 2040);
                    b09.H(p65Var, true, true, true);
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
                    jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.h, false);
                    long j4 = p65Var2.T;
                    int i5 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var2.l();
                    r28 r28VarR4 = gx1.R(p65Var2, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var2, cuVar5, zk7VarC4);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var2, cuVar6, i89VarL4);
                    Integer numValueOf2 = Integer.valueOf(i5);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var2, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var2, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var2, cuVar8, r28VarR4);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.d, false);
                    long j5 = p65Var2.T;
                    int i6 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var2.l();
                    r28 r28VarR5 = gx1.R(p65Var2, r28VarD2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC5);
                    tp7.B(p65Var2, cuVar6, i89VarL5);
                    ka1.z(i6, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR5);
                    boolean zF = p65Var2.f(zx4Var) | p65Var2.f(nzaVar);
                    Object objM4 = p65Var2.M();
                    if (zF || objM4 == uobVar) {
                        objM4 = new gd3(zx4Var, 17, nzaVar);
                        p65Var2.j0(objM4);
                    }
                    fo7.i((m45) objM4, vo7.R(p65Var2, nzaVar.f ? R.string.refine_recommendations_view_friends_on_medium : R.string.refine_recommendations_find_friends_on_medium), xn7.M, bgf.N(jfc.d(w2g.G(o28Var2, 24.0f, 7.0f, 24.0f, 0.0f, 8), 1.0f), "following_find_friends_button"), false, p65Var2, 3456, 16);
                    p65Var2.p(true);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ux4(nza nzaVar, zx4 zx4Var) {
        this.c = nzaVar;
        this.b = zx4Var;
    }
}
