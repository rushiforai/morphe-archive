package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pe1 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ Object c;

    public /* synthetic */ pe1(oe1 oe1Var, long j) {
        this.a = 0;
        this.c = oe1Var;
        this.b = j;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                oe1 oe1Var = (oe1) obj4;
                jy0 jy0Var = (jy0) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                jy0Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(jy0Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    long j = jy0Var.b;
                    if (f72.d(j) && f72.c(j)) {
                        rh4 rh4Var = jfc.c;
                        omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
                        long j2 = p65Var.T;
                        int i2 = (int) (j2 ^ (j2 >>> 32));
                        i89 i89VarL = p65Var.l();
                        r28 r28VarR = gx1.R(p65Var, rh4Var);
                        r12.W.getClass();
                        ot2 ot2Var = q12.b;
                        p65Var.c0();
                        if (p65Var.S) {
                            p65Var.k(ot2Var);
                        } else {
                            p65Var.m0();
                        }
                        tp7.B(p65Var, q12.f, ombVarA);
                        tp7.B(p65Var, q12.e, i89VarL);
                        tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                        tp7.y(p65Var, q12.h);
                        tp7.B(p65Var, q12.d, r28VarR);
                        long j3 = this.b;
                        s42.v(j, oe1Var, 0, j3, p65Var, 384);
                        s42.v(j, oe1Var, 1, j3, p65Var, 384);
                        s42.v(j, oe1Var, 2, j3, p65Var, 384);
                        p65Var.p(true);
                    }
                }
                break;
            case 1:
                oe1 oe1Var2 = (oe1) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    r28 r28VarF = jfc.f(jfc.d(o28.b, 1.0f), 148.0f, 0.0f, 2);
                    wgd.w(-1003410150, 212064437, p65Var2, false);
                    m73 m73Var = (m73) p65Var2.j(z22.h);
                    Object objM = p65Var2.M();
                    uob uobVar = w12.a;
                    if (objM == uobVar) {
                        objM = b09.t(m73Var, p65Var2);
                    }
                    hl7 hl7Var = (hl7) objM;
                    Object objM2 = p65Var2.M();
                    if (objM2 == uobVar) {
                        objM2 = b09.r(p65Var2);
                    }
                    z52 z52Var = (z52) objM2;
                    Object objM3 = p65Var2.M();
                    if (objM3 == uobVar) {
                        objM3 = qo7.u(Boolean.FALSE);
                        p65Var2.j0(objM3);
                    }
                    l78 l78Var = (l78) objM3;
                    Object objM4 = p65Var2.M();
                    if (objM4 == uobVar) {
                        objM4 = b09.s(z52Var, p65Var2);
                    }
                    m62 m62Var = (m62) objM4;
                    Object objM5 = p65Var2.M();
                    if (objM5 == uobVar) {
                        objM5 = b09.v(c1eVar, y3b.h, p65Var2);
                    }
                    l78 l78Var2 = (l78) objM5;
                    boolean zH = p65Var2.h(hl7Var) | p65Var2.d(257);
                    Object objM6 = p65Var2.M();
                    if (zH || objM6 == uobVar) {
                        objM6 = new fr0(l78Var2, hl7Var, m62Var, l78Var, 6);
                        p65Var2.j0(objM6);
                    }
                    zk7 zk7Var = (zk7) objM6;
                    Object objM7 = p65Var2.M();
                    if (objM7 == uobVar) {
                        objM7 = new gr0(l78Var, m62Var, 6);
                        p65Var2.j0(objM7);
                    }
                    m45 m45Var = (m45) objM7;
                    boolean zH2 = p65Var2.h(hl7Var);
                    Object objM8 = p65Var2.M();
                    if (zH2 || objM8 == uobVar) {
                        objM8 = new hr0(hl7Var, 6);
                        p65Var2.j0(objM8);
                    }
                    hlg.j(wxb.a(r28VarF, false, (x45) objM8), pxf.E(1200550679, new ue1(l78Var2, z52Var, m45Var, this.b, oe1Var2), p65Var2), zk7Var, p65Var2, 48);
                    p65Var2.p(false);
                }
                break;
            default:
                upc upcVar = (upc) obj4;
                jy0 jy0Var2 = (jy0) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                jy0Var2.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(jy0Var2) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    p65Var3.S();
                } else {
                    m73 m73Var2 = jy0Var2.a;
                    long j4 = jy0Var2.b;
                    dy0.a(flb.a0(jfc.m(w2g.G(o28.b, 0.0f, ((Number) upcVar.getValue()).floatValue() * ((f72.c(j4) ? m73Var2.N(f72.g(j4)) : Float.POSITIVE_INFINITY) - 48.0f), 0.0f, 0.0f, 13), 4.0f, 48.0f), this.b, bmb.a), p65Var3, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pe1(int i, long j, Object obj) {
        this.a = i;
        this.b = j;
        this.c = obj;
    }
}
