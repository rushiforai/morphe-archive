package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dj3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ float c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ dj3(float f, jy8 jy8Var, mz1 mz1Var, l78 l78Var) {
        this.a = 3;
        this.c = f;
        this.d = jy8Var;
        this.e = mz1Var;
        this.b = l78Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        Object obj4 = this.e;
        Object obj5 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                flb.E((lj3) obj5, (m45) obj4, (r28) obj3, this.c, (x12) obj, tr7.y(1));
                return c1eVar;
            case 1:
                ((Integer) obj2).getClass();
                pxf.f((String) obj5, (r28) obj3, (mkd) obj4, this.c, (x12) obj, tr7.y(1));
                return c1eVar;
            case 2:
                ((Integer) obj2).getClass();
                ok7.t((ot7) obj5, this.c, (hy8) obj4, (mz1) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 3:
                hy8 hy8Var = (hy8) obj5;
                mz1 mz1Var = (mz1) obj4;
                l78 l78Var = (l78) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    pt7 pt7Var = (pt7) l78Var.getValue();
                    if (g76.L(pt7Var, nt7.a)) {
                        p65Var.Y(-614587636);
                        zk7 zk7VarC = dy0.c(z46.d, false);
                        long j = p65Var.T;
                        int i2 = (int) (j ^ (j >>> 32));
                        i89 i89VarL = p65Var.l();
                        r28 r28VarR = gx1.R(p65Var, o28Var);
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
                        tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                        tp7.y(p65Var, q12.h);
                        tp7.B(p65Var, q12.d, r28VarR);
                        p65Var.p(true);
                        p65Var.p(false);
                    } else {
                        if (!(pt7Var instanceof ot7) && pt7Var != null) {
                            throw ho2.L(p65Var, 1781287334, false);
                        }
                        p65Var.Y(-614382354);
                        pt7 pt7Var2 = (pt7) l78Var.getValue();
                        ok7.t(pt7Var2 instanceof ot7 ? (ot7) pt7Var2 : null, this.c, hy8Var, mz1Var, p65Var, 0);
                        p65Var.p(false);
                    }
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 4:
                oh8 oh8Var = (oh8) obj5;
                md5 md5Var = (md5) obj4;
                String str = (String) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    String str2 = oh8Var.b;
                    r28 r28VarE = w2g.E(bgf.N(jfc.b(jfc.d(o28Var, 1.0f), 0.0f, 48.0f, 1), "non_moc_upsell_image"), this.c, 0.0f, 2);
                    boolean zF = p65Var2.f(md5Var) | p65Var2.f(oh8Var);
                    Object objM = p65Var2.M();
                    if (zF || objM == w12.a) {
                        objM = new ps5(md5Var, 18, oh8Var);
                        p65Var2.j0(objM);
                    }
                    ur7.a(new ax5(str), str2, hlg.r(r28VarE, false, null, null, (m45) objM, 15), null, v82.d, 0.0f, null, 0, p65Var2, 1572864, 1976);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 5:
                ((Integer) obj2).getClass();
                gsa.G((bbb) obj5, this.c, (mab) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 6:
                ((Integer) obj2).getClass();
                flb.S((String) obj5, (o9d) obj4, (uod) obj3, this.c, (x12) obj, tr7.y(1));
                return c1eVar;
            case 7:
                ((Integer) obj2).getClass();
                pwd.s((String) obj5, (m45) obj4, (uod) obj3, this.c, (x12) obj, tr7.y(1));
                return c1eVar;
            default:
                ((Integer) obj2).getClass();
                r40.x((y3e) obj5, this.c, (s3e) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
        }
    }

    public /* synthetic */ dj3(oh8 oh8Var, float f, md5 md5Var, String str) {
        this.a = 4;
        this.d = oh8Var;
        this.c = f;
        this.e = md5Var;
        this.b = str;
    }

    public /* synthetic */ dj3(Object obj, float f, Object obj2, Object obj3, int i, int i2) {
        this.a = i2;
        this.d = obj;
        this.c = f;
        this.e = obj2;
        this.b = obj3;
    }

    public /* synthetic */ dj3(Object obj, Object obj2, Object obj3, float f, int i, int i2) {
        this.a = i2;
        this.d = obj;
        this.e = obj2;
        this.b = obj3;
        this.c = f;
    }

    public /* synthetic */ dj3(String str, r28 r28Var, mkd mkdVar, float f, int i) {
        this.a = 1;
        this.d = str;
        this.b = r28Var;
        this.e = mkdVar;
        this.c = f;
    }
}
