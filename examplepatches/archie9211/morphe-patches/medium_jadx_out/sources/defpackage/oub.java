package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oub implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ oub(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        Object obj4 = this.c;
        Object obj5 = this.b;
        o28 o28Var = o28.b;
        switch (i) {
            case 0:
                final long j = ((uu1) obj).a;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).e(j) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    if (muc.b0(((uid) obj5).a.b)) {
                        p65Var.Y(-1645083309);
                    } else {
                        p65Var.Y(-1642037497);
                        pub pubVar = (pub) obj4;
                        boolean zF = p65Var.f(pubVar);
                        Object objM = p65Var.M();
                        if (zF || objM == uobVar) {
                            xib xibVar = new xib(0, pubVar, pub.class, "onClearSearchSelected", "onClearSearchSelected()V", 0, 2);
                            p65Var.j0(xibVar);
                            objM = xibVar;
                        }
                        f49.l((m45) ((qh6) objM), bgf.N(o28Var, "clear_search"), false, null, null, pxf.E(-1452542872, new b55() { // from class: nub
                            @Override // defpackage.b55
                            public final Object invoke(Object obj6, Object obj7) {
                                x12 x12Var2 = (x12) obj6;
                                int iIntValue2 = ((Integer) obj7).intValue();
                                p65 p65Var2 = (p65) x12Var2;
                                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                                    qv5.b(vn7.J(R.drawable.ic_close_24, 0, p65Var2), vo7.R(p65Var2, R.string.search_clear_search), null, j, p65Var2, 8, 4);
                                } else {
                                    p65Var2.S();
                                }
                                return c1e.a;
                            }
                        }, p65Var), p65Var, 1572912, 60);
                    }
                    p65Var.p(false);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    zq0 zq0Var = z46.n;
                    r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 12.0f, 0.0f, 24.0f, 0.0f, 10);
                    tmc tmcVar = (tmc) obj5;
                    omc omcVar = (omc) obj4;
                    omb ombVarA = nmb.a(qb8.a, zq0Var, p65Var2, 48);
                    long j2 = p65Var2.T;
                    int i2 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarG);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, ombVarA);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i2);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    boolean z = tmcVar.a;
                    boolean zF2 = p65Var2.f(omcVar) | p65Var2.f(tmcVar);
                    Object objM2 = p65Var2.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new vja(omcVar, 8, tmcVar);
                        p65Var2.j0(objM2);
                    }
                    vo7.b(z, (x45) objM2, null, false, null, p65Var2, 0, 28);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j3 = p65Var2.T;
                    int i3 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, o28Var);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, wv1VarA);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i3, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    String str = tmcVar.b;
                    sn3 sn3Var = jt7.c;
                    jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var2.j(sn3Var)).m, p65Var2, 0, 24960, 110590);
                    jjd.b(tmcVar.c, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var2.j(sn3Var)).o, p65Var2, 0, 24960, 110590);
                    p65Var2.p(true);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
