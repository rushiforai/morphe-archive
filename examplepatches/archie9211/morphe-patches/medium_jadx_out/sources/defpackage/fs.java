package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fs implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ long c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ fs(long j, boolean z, r28 r28Var, lp8 lp8Var) {
        this.c = j;
        this.b = z;
        this.d = r28Var;
        this.e = lp8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.d;
        switch (i) {
            case 0:
                r28 r28Var = (r28) obj4;
                final lp8 lp8Var = (lp8) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                final int i2 = 0;
                final int i3 = 1;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    long j = this.c;
                    boolean z = this.b;
                    uob uobVar = w12.a;
                    if (j == 9205357640488583168L) {
                        p65Var.Y(4389176);
                        boolean zH = p65Var.h(lp8Var);
                        Object objM = p65Var.M();
                        if (zH || objM == uobVar) {
                            objM = new m45() { // from class: gs
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i4 = i3;
                                    lp8 lp8Var2 = lp8Var;
                                    switch (i4) {
                                        case 0:
                                            return Boolean.valueOf((9223372034707292159L & lp8Var2.a()) != 9205357640488583168L);
                                        default:
                                            return Boolean.valueOf((9223372034707292159L & lp8Var2.a()) != 9205357640488583168L);
                                    }
                                }
                            };
                            p65Var.j0(objM);
                        }
                        g01.B(0, p65Var, (m45) objM, r28Var, z);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(3458246);
                        g70 g70Var = z ? nk7.b : nk7.a;
                        r28 r28VarJ = jfc.j(r28Var, yj3.b(j), yj3.a(j), 0.0f, 0.0f, 12);
                        omb ombVarA = nmb.a(g70Var, z46.m, p65Var, 0);
                        long j2 = p65Var.T;
                        int i4 = (int) (j2 ^ (j2 >>> 32));
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
                        tp7.B(p65Var, q12.f, ombVarA);
                        tp7.B(p65Var, q12.e, i89VarL);
                        tp7.B(p65Var, q12.g, Integer.valueOf(i4));
                        tp7.y(p65Var, q12.h);
                        tp7.B(p65Var, q12.d, r28VarR);
                        boolean zH2 = p65Var.h(lp8Var);
                        Object objM2 = p65Var.M();
                        if (zH2 || objM2 == uobVar) {
                            objM2 = new m45() { // from class: gs
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i42 = i2;
                                    lp8 lp8Var2 = lp8Var;
                                    switch (i42) {
                                        case 0:
                                            return Boolean.valueOf((9223372034707292159L & lp8Var2.a()) != 9205357640488583168L);
                                        default:
                                            return Boolean.valueOf((9223372034707292159L & lp8Var2.a()) != 9205357640488583168L);
                                    }
                                }
                            };
                            p65Var.j0(objM2);
                        }
                        g01.B(6, p65Var, (m45) objM2, o28.b, z);
                        p65Var.p(true);
                        p65Var.p(false);
                    }
                }
                break;
            default:
                ((Integer) obj2).getClass();
                rv8.e(this.b, this.c, (mz1) obj4, (mx) obj3, (x12) obj, tr7.y(385));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ fs(boolean z, long j, mz1 mz1Var, mx mxVar, int i) {
        this.b = z;
        this.c = j;
        this.d = mz1Var;
        this.e = mxVar;
    }
}
