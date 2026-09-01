package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xr7 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;

    public /* synthetic */ xr7(eid eidVar, boolean z) {
        this.a = 2;
        this.c = eidVar;
        this.b = z;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean z;
        int i;
        int i2;
        int i3 = this.a;
        c1e c1eVar = c1e.a;
        boolean z2 = this.b;
        Object obj4 = this.c;
        switch (i3) {
            case 0:
                boolean z3 = false;
                qfc qfcVar = (qfc) obj4;
                bgc bgcVar = (bgc) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                bgcVar.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= (iIntValue & 8) == 0 ? ((p65) x12Var).f(bgcVar) : ((p65) x12Var).h(bgcVar) ? 4 : 2;
                }
                if ((iIntValue & 19) != 18) {
                    z3 = true;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, z3)) {
                    ufc.a.b(bgcVar, bgf.N(jfc.e(o28.b, zr7.c), "track"), this.b, qfcVar, null, null, 0.0f, 0.0f, p65Var, 102260792 | (iIntValue & 14), 160);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                laa laaVar = (laa) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    o28 o28Var = o28.b;
                    r28 r28VarD = jfc.d(jfc.r(o28Var, 3), 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i4 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarD);
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
                    Integer numValueOf = Integer.valueOf(i4);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i5 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, zk7VarC2);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j3 = p65Var2.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, o28Var);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, wv1VarA);
                    tp7.B(p65Var2, cuVar2, i89VarL3);
                    ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR3);
                    if (z2) {
                        p65Var2.Y(1405756871);
                        tp7.c(0.0f, 6, 6, 0L, p65Var2, w2g.G(o28Var, 0.0f, 24.0f, 0.0f, 0.0f, 13));
                        z = false;
                    } else {
                        z = false;
                        p65Var2.Y(1388187900);
                    }
                    p65Var2.p(z);
                    int i7 = jaa.a[laaVar.ordinal()];
                    if (i7 == 1) {
                        i = -785928700;
                        i2 = R.string.common_editors;
                    } else {
                        if (i7 != 2) {
                            throw ho2.L(p65Var2, -785932290, z);
                        }
                        i = -785922268;
                        i2 = R.string.common_writers;
                    }
                    jjd.b(km4.w(p65Var2, i, i2, p65Var2, z), w2g.F(o28Var, 24.0f, 32.0f, 24.0f, 4.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).j, p65Var2, 0, 0, 131068);
                    b09.H(p65Var2, true, true, true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            default:
                eid eidVar = (eid) obj4;
                k49 k49Var = eidVar.f;
                ((Integer) obj3).getClass();
                p65 p65Var3 = (p65) ((x12) obj2);
                p65Var3.Y(-2137546592);
                boolean z4 = ((hw8) k49Var.getValue()) == hw8.Vertical || !(p65Var3.j(z22.n) == ip6.Rtl);
                boolean zF = p65Var3.f(eidVar);
                Object objM = p65Var3.M();
                uob uobVar = w12.a;
                if (zF || objM == uobVar) {
                    objM = new zzb(15, eidVar);
                    p65Var3.j0(objM);
                }
                l78 l78VarY = qo7.y((x45) objM, p65Var3);
                Object objM2 = p65Var3.M();
                if (objM2 == uobVar) {
                    v13 v13Var = new v13(new ws(l78VarY, 24));
                    p65Var3.j0(v13Var);
                    objM2 = v13Var;
                }
                nsb nsbVar = (nsb) objM2;
                boolean zF2 = p65Var3.f(nsbVar) | p65Var3.f(eidVar);
                Object objM3 = p65Var3.M();
                if (zF2 || objM3 == uobVar) {
                    objM3 = new did(nsbVar, eidVar);
                    p65Var3.j0(objM3);
                }
                r28 r28VarJ = w2g.J((did) objM3, (hw8) k49Var.getValue(), z2 && eidVar.b.g() != 0.0f, z4);
                p65Var3.p(false);
                return r28VarJ;
        }
    }

    public /* synthetic */ xr7(boolean z, Object obj, int i) {
        this.a = i;
        this.b = z;
        this.c = obj;
    }
}
