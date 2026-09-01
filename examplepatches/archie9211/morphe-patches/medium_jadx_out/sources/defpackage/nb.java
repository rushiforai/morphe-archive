package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nb implements c55 {
    public final /* synthetic */ int a = 2;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ nb(ms3 ms3Var, fq3 fq3Var, l78 l78Var, boolean z) {
        this.c = ms3Var;
        this.d = fq3Var;
        this.e = l78Var;
        this.b = z;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean z;
        boolean z2;
        boolean z3;
        int i = this.a;
        int i2 = 18;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
        Object obj4 = this.d;
        boolean z4 = this.b;
        Object obj5 = this.e;
        Object obj6 = this.c;
        switch (i) {
            case 0:
                x45 x45Var = (x45) obj6;
                String str = (String) obj4;
                g49 g49Var = (g49) obj5;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    r28 r28VarB = w2g.B(o28Var, hy8Var);
                    rh4 rh4Var = jfc.c;
                    r28 r28VarB2 = r28VarB.b(rh4Var);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarB2);
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
                    tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    boolean zF = p65Var.f(x45Var) | p65Var.g(z4);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new rb(x45Var, g49Var, z4, 0);
                        p65Var.j0(objM);
                    }
                    x45 x45Var2 = (x45) objM;
                    boolean zF2 = p65Var.f(str);
                    Object objM2 = p65Var.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new mb(str, 1);
                        p65Var.j0(objM2);
                    }
                    vc2.a(x45Var2, rh4Var, (x45) objM2, p65Var, 48, 0);
                    if (g49Var.g() < 1.0f) {
                        p65Var.Y(-1225198495);
                        xz5.p(jfc.d(o28Var, 1.0f), Float.valueOf(g49Var.g()), ((zo7) p65Var.j(kt7.b)).e, 0L, 0, 0.0f, null, p65Var, 6, 120);
                        z = false;
                    } else {
                        z = false;
                        p65Var.Y(-1231715749);
                    }
                    p65Var.p(z);
                    p65Var.p(true);
                }
                break;
            case 1:
                ms3 ms3Var = (ms3) obj6;
                fq3 fq3Var = (fq3) obj4;
                l78 l78Var = (l78) obj5;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    ks3 ks3Var = ks3.a;
                    if (ms3Var.equals(ks3Var)) {
                        p65Var2.Y(-120585449);
                        boolean zF3 = p65Var2.f(fq3Var);
                        Object objM3 = p65Var2.M();
                        if (zF3 || objM3 == uobVar) {
                            objM3 = new hq3(0, fq3Var, fq3.class, "openPreview", "openPreview()V", 0, 3);
                            p65Var2.j0(objM3);
                        }
                        fo7.i((m45) ((qh6) objM3), vo7.R(p65Var2, R.string.preview), xn7.XS, null, false, p65Var2, 384, 24);
                        z2 = false;
                        p65Var2.p(false);
                    } else if (ms3Var.equals(ls3.a)) {
                        p65Var2.Y(-120240326);
                        boolean zF4 = p65Var2.f(fq3Var);
                        Object objM4 = p65Var2.M();
                        if (zF4 || objM4 == uobVar) {
                            objM4 = new hq3(0, fq3Var, fq3.class, "saveAndPublish", "saveAndPublish()V", 0, 4);
                            p65Var2.j0(objM4);
                        }
                        fo7.i((m45) ((qh6) objM4), vo7.R(p65Var2, R.string.publication_flow_save_and_publish), xn7.XS, null, false, p65Var2, 384, 24);
                        z2 = false;
                        p65Var2.p(false);
                    } else {
                        z2 = false;
                        p65Var2.Y(273225832);
                        p65Var2.p(false);
                    }
                    if (!ms3Var.equals(ks3Var)) {
                        km4.F(10.0f, -119822663, p65Var2, p65Var2, o28Var);
                        p65Var2.p(z2);
                    } else {
                        p65Var2.Y(-122462530);
                        p65Var2.p(z2);
                        zk7 zk7VarC2 = dy0.c(z46.d, z2);
                        long j2 = p65Var2.T;
                        int i4 = (int) (j2 ^ (j2 >>> 32));
                        i89 i89VarL2 = p65Var2.l();
                        r28 r28VarR2 = gx1.R(p65Var2, o28Var);
                        r12.W.getClass();
                        ot2 ot2Var2 = q12.b;
                        p65Var2.c0();
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var2);
                        } else {
                            p65Var2.m0();
                        }
                        tp7.B(p65Var2, q12.f, zk7VarC2);
                        tp7.B(p65Var2, q12.e, i89VarL2);
                        tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
                        tp7.y(p65Var2, q12.h);
                        tp7.B(p65Var2, q12.d, r28VarR2);
                        Object objM5 = p65Var2.M();
                        if (objM5 == uobVar) {
                            objM5 = new vs(l78Var, i2);
                            p65Var2.j0(objM5);
                        }
                        f49.l((m45) objM5, null, false, null, null, op8.a, p65Var2, 1572870, 62);
                        boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
                        Object objM6 = p65Var2.M();
                        if (objM6 == uobVar) {
                            objM6 = new vs(l78Var, 19);
                            p65Var2.j0(objM6);
                        }
                        xp7.b(zBooleanValue, (m45) objM6, null, 0L, null, null, null, 0L, 0.0f, pxf.E(745423653, new pr3(fq3Var, z4, l78Var, 0), p65Var2), p65Var2, 48, 2044);
                        p65Var2.p(true);
                    }
                }
                break;
            case 2:
                it4 it4Var = (it4) obj6;
                upc upcVar = (upc) obj4;
                r28 r28Var = (r28) obj5;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    p65Var3.S();
                } else {
                    mkd mkdVarA = mkd.a((mkd) it4Var.getTextStyle().invoke(p65Var3, 0), ((uu1) upcVar.getValue()).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    r28 r28VarB3 = xz5.B(jfc.f(o28Var, ((m73) p65Var3.j(z22.h)).z(mkdVarA.b.c), 0.0f, 2));
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var3, 48);
                    long j3 = p65Var3.T;
                    int i5 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var3.l();
                    r28 r28VarR3 = gx1.R(p65Var3, r28VarB3);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, ombVarA);
                    tp7.B(p65Var3, q12.e, i89VarL3);
                    tp7.B(p65Var3, q12.g, Integer.valueOf(i5));
                    tp7.y(p65Var3, q12.h);
                    tp7.B(p65Var3, q12.d, r28VarR3);
                    jjd.b(vo7.R(p65Var3, z4 ? R.string.common_following : R.string.common_follow), r28Var, 0L, 0L, 0L, null, new jgd(3), 0L, 2, false, 1, 0, null, mkdVarA, p65Var3, 0, 24960, 109564);
                    if (z4) {
                        km4.F(4.0f, 1031289370, p65Var3, p65Var3, o28Var);
                        z3 = false;
                        qv5.b(vn7.J(R.drawable.ic_chevron_down_16, 0, p65Var3), null, null, 0L, p65Var3, 56, 12);
                    } else {
                        z3 = false;
                        p65Var3.Y(1022954555);
                    }
                    p65Var3.p(z3);
                    p65Var3.p(true);
                }
                break;
            default:
                yn7 yn7Var = (yn7) obj6;
                l78 l78Var2 = (l78) obj5;
                String str2 = (String) obj4;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    p65Var4.S();
                } else {
                    mkd mkdVarA2 = mkd.a(dl7.m((mkd) yn7Var.getTextStyle().invoke(p65Var4, 0)), ((uu1) l78Var2.getValue()).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    r28 r28VarF = jfc.f(o28Var, ((m73) p65Var4.j(z22.h)).z(mkdVarA2.b.c), 0.0f, 2);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j4 = p65Var4.T;
                    int i6 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var4.l();
                    r28 r28VarR4 = gx1.R(p65Var4, r28VarF);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, q12.f, zk7VarC3);
                    tp7.B(p65Var4, q12.e, i89VarL4);
                    tp7.B(p65Var4, q12.g, Integer.valueOf(i6));
                    tp7.y(p65Var4, q12.h);
                    tp7.B(p65Var4, q12.d, r28VarR4);
                    kjd.b(str2, null, 0L, 0L, 0L, z4 ? ohd.c : ohd.b, null, 0L, 2, false, 1, 0, null, mkdVarA2, p65Var4, 0, 3120, 55038);
                    p65Var4.p(true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ nb(it4 it4Var, upc upcVar, boolean z, r28 r28Var) {
        this.c = it4Var;
        this.d = upcVar;
        this.b = z;
        this.e = r28Var;
    }

    public /* synthetic */ nb(x45 x45Var, boolean z, String str, g49 g49Var) {
        this.c = x45Var;
        this.b = z;
        this.d = str;
        this.e = g49Var;
    }

    public /* synthetic */ nb(yn7 yn7Var, l78 l78Var, boolean z, String str) {
        this.c = yn7Var;
        this.e = l78Var;
        this.b = z;
        this.d = str;
    }
}
