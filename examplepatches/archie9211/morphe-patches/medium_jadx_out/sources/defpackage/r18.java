package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r18 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ v7c b;
    public final /* synthetic */ mz1 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ sb2 e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    public r18(b55 b55Var, ou ouVar, v7c v7cVar, mz1 mz1Var, mz1 mz1Var2, m45 m45Var, sb2 sb2Var, boolean z) {
        this.g = b55Var;
        this.h = ouVar;
        this.b = v7cVar;
        this.c = mz1Var;
        this.i = mz1Var2;
        this.d = m45Var;
        this.e = sb2Var;
        this.f = z;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        Object obj3 = this.i;
        Object obj4 = this.g;
        Object obj5 = this.h;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    final v7c v7cVar = this.b;
                    boolean zF = p65Var.f(v7cVar);
                    m45 m45Var = this.d;
                    boolean zF2 = zF | p65Var.f(m45Var);
                    sb2 sb2Var = this.e;
                    boolean zH = zF2 | p65Var.h(sb2Var);
                    Object objM = p65Var.M();
                    if (zH || objM == uobVar) {
                        objM = new pq7(v7cVar, m45Var, sb2Var);
                        p65Var.j0(objM);
                    }
                    r28 r28VarQ = hlg.q((m45) objM);
                    boolean zF3 = p65Var.f(m45Var) | p65Var.g(this.f) | p65Var.f(v7cVar) | p65Var.f((String) obj4) | p65Var.f((String) obj5) | p65Var.h(sb2Var) | p65Var.f((String) obj3);
                    final String str = (String) obj4;
                    final String str2 = (String) obj5;
                    final String str3 = (String) obj3;
                    Object objM2 = p65Var.M();
                    if (zF3 || objM2 == uobVar) {
                        final boolean z = this.f;
                        final m45 m45Var2 = this.d;
                        final sb2 sb2Var2 = this.e;
                        x45 x45Var = new x45() { // from class: p18
                            @Override // defpackage.x45
                            public final Object invoke(Object obj6) {
                                jyb jybVar = (jyb) obj6;
                                if (z) {
                                    z23 z23Var = new z23(7, m45Var2);
                                    fj6[] fj6VarArr = gyb.a;
                                    jybVar.d(sxb.v, new i4(str, z23Var));
                                    v7c v7cVar2 = v7cVar;
                                    w7c w7cVarC = v7cVar2.c();
                                    w7c w7cVar = w7c.PartiallyExpanded;
                                    sb2 sb2Var3 = sb2Var2;
                                    if (w7cVarC == w7cVar) {
                                        jybVar.d(sxb.t, new i4(str2, new i16(v7cVar2, sb2Var3, v7cVar2, 5)));
                                    } else if (v7cVar2.e.g().a.containsKey(w7cVar)) {
                                        jybVar.d(sxb.u, new i4(str3, new dx0(v7cVar2, sb2Var3, 6)));
                                    }
                                }
                                return c1e.a;
                            }
                        };
                        p65Var.j0(x45Var);
                        objM2 = x45Var;
                    }
                    r28 r28VarA = wxb.a(r28VarQ, true, (x45) objM2);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    int iS = w2g.s(p65Var);
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarA);
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
                    km4.H(0, this.c, p65Var, true);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                ou ouVar = (ou) obj5;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    r28 r28VarP0 = op8.p0(jfc.d(o28.b, 1.0f), (y3f) ((b55) obj4).invoke(p65Var2, 0));
                    boolean zH2 = p65Var2.h(ouVar);
                    Object objM3 = p65Var2.M();
                    if (zH2 || objM3 == uobVar) {
                        objM3 = new ff4(27, ouVar);
                        p65Var2.j0(objM3);
                    }
                    r28 r28VarW = xz5.W(r28VarP0, (x45) objM3);
                    v7c v7cVar2 = this.b;
                    r28 r28VarW2 = xz5.W(r28VarW, new hw0(v7cVar2, 0));
                    mz1 mz1Var = (mz1) obj3;
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    int iS2 = w2g.s(p65Var2);
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarW2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    cu cuVar2 = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS2))) {
                        lv8.w(iS2, p65Var2, iS2, cuVar2);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    p65Var2.Y(1352934765);
                    s7c.a(pxf.E(2000500644, new r18(v7cVar2, this.d, this.e, this.f, ep7.v(p65Var2, R.string.m3c_bottom_sheet_dismiss_description), ep7.v(p65Var2, R.string.m3c_bottom_sheet_expand_description), ep7.v(p65Var2, R.string.m3c_bottom_sheet_collapse_description), this.c), p65Var2), p65Var2, 54);
                    p65Var2.p(false);
                    mz1Var.f(xv1.a, p65Var2, 6);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }

    public r18(v7c v7cVar, m45 m45Var, sb2 sb2Var, boolean z, String str, String str2, String str3, mz1 mz1Var) {
        this.b = v7cVar;
        this.d = m45Var;
        this.e = sb2Var;
        this.f = z;
        this.g = str;
        this.h = str2;
        this.i = str3;
        this.c = mz1Var;
    }
}
