package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fz9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ m45 e;

    public /* synthetic */ fz9(String str, boolean z, m45 m45Var, m45 m45Var2, int i) {
        this.a = 1;
        this.b = str;
        this.c = z;
        this.d = m45Var;
        this.e = m45Var2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ot2 ot2Var;
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    g3d.a(null, bmb.a(24.0f), 0L, 0L, 0.0f, 0.0f, null, pxf.E(-1724839999, new fz9(this.b, this.d, this.c, this.e, 2), p65Var), p65Var, 12582912, 125);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                qq7.b(this.b, this.c, this.d, this.e, (x12) obj, tr7.y(1));
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    rz5 rz5Var = qb8.c;
                    yq0 yq0Var = z46.p;
                    wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var2, 0);
                    long j = p65Var2.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    o28 o28Var = o28.b;
                    r28 r28VarR = gx1.R(p65Var2, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, wv1VarA);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i2);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarG = w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8);
                    yq0 yq0Var2 = z46.q;
                    d46.a(this.b, hl0.XL, ka1.i(yq0Var2, r28VarG), zw7.PREMIUM, vo7.R(p65Var2, R.string.premium_tier_educational_cd_avatar), null, null, 0.0f, 0, null, null, p65Var2, 3120, 0, 4064);
                    String strR = vo7.R(p65Var2, R.string.premium_tier_educational_title);
                    r28 r28VarI = ka1.i(yq0Var2, w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8));
                    jgd jgdVar = new jgd(3);
                    sn3 sn3Var = jt7.c;
                    jjd.b(strR, r28VarI, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).j, p65Var2, 0, 0, 130044);
                    r28 r28VarU = km4.u(1.0f, wgf.R(w2g.G(o28Var, 24.0f, 16.0f, 24.0f, 0.0f, 8), wgf.K(p65Var2), false, 14), false);
                    wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var2, 0);
                    long j2 = p65Var2.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarU);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        ot2Var = ot2Var2;
                        p65Var2.k(ot2Var);
                    } else {
                        ot2Var = ot2Var2;
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, wv1VarA2);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i3, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    ot2 ot2Var3 = ot2Var;
                    jjd.b(vo7.R(p65Var2, R.string.premium_tier_educational_text), null, 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var)).m, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 130046);
                    p65Var2.p(true);
                    r28 r28VarI2 = ka1.i(z46.r, w2g.G(o28Var, 0.0f, 24.0f, 8.0f, 12.0f, 1));
                    omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
                    long j3 = p65Var2.T;
                    int i4 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarI2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var3);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, ombVarA);
                    tp7.B(p65Var2, cuVar2, i89VarL3);
                    ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR3);
                    String strR2 = vo7.R(p65Var2, R.string.premium_tier_educational_negative_button);
                    xn7 xn7Var = xn7.M;
                    fo7.k(1573248, 56, null, p65Var2, this.d, xn7Var, null, strR2, false, false);
                    fo7.k(1573248, 56, null, p65Var2, this.e, xn7Var, null, vo7.R(p65Var2, this.c ? R.string.premium_tier_educational_upgrade_button : R.string.premium_tier_educational_learn_more_button), false, false);
                    p65Var2.p(true);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ fz9(String str, m45 m45Var, boolean z, m45 m45Var2, int i) {
        this.a = i;
        this.b = str;
        this.d = m45Var;
        this.c = z;
        this.e = m45Var2;
    }
}
