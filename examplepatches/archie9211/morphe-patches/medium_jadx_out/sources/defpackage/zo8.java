package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zo8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ m45 d;

    public /* synthetic */ zo8(boolean z, m45 m45Var, m45 m45Var2, int i) {
        this.a = 2;
        this.b = z;
        this.c = m45Var;
        this.d = m45Var2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i;
        boolean z;
        int i2 = this.a;
        boolean z2 = this.b;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    rz5 rz5Var = qb8.c;
                    yq0 yq0Var = z46.p;
                    wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    o28 o28Var = o28.b;
                    r28 r28VarR = gx1.R(p65Var, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var, cuVar, wv1VarA);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    c09 c09VarJ = vn7.J(R.drawable.offline_mode_whats_new, 0, p65Var);
                    r28 r28VarG = w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8);
                    yq0 yq0Var2 = z46.q;
                    w2g.e(c09VarJ, null, ka1.i(yq0Var2, r28VarG), null, null, 0.0f, null, p65Var, 56, 120);
                    String strR = vo7.R(p65Var, R.string.offline_mode_whats_new_title);
                    r28 r28VarI = ka1.i(yq0Var2, w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8));
                    jgd jgdVar = new jgd(3);
                    sn3 sn3Var = jt7.c;
                    jjd.b(strR, r28VarI, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).i, p65Var, 0, 0, 130044);
                    r28 r28VarU = km4.u(1.0f, wgf.R(w2g.G(o28Var, 24.0f, 16.0f, 24.0f, 0.0f, 8), wgf.K(p65Var), false, 14), false);
                    wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarU);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, wv1VarA2);
                    tp7.B(p65Var, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    jjd.b(vo7.R(p65Var, R.string.offline_mode_whats_new_text), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
                    p65Var.p(true);
                    int i5 = !z2 ? R.string.offline_mode_whats_new_non_member_positive_button : R.string.offline_mode_whats_new_member_positive_button;
                    r28 r28VarI2 = ka1.i(z46.r, w2g.G(o28Var, 0.0f, 24.0f, 8.0f, 12.0f, 1));
                    omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
                    long j3 = p65Var.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var.l();
                    r28 r28VarR3 = gx1.R(p65Var, r28VarI2);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, ombVarA);
                    tp7.B(p65Var, cuVar2, i89VarL3);
                    ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR3);
                    if (z2) {
                        i = i5;
                        z = false;
                        p65Var.Y(338142193);
                    } else {
                        p65Var.Y(341858101);
                        i = i5;
                        fo7.k(1573248, 56, null, p65Var, this.c, xn7.M, null, vo7.R(p65Var, R.string.offline_mode_whats_new_non_member_negative_button), false, false);
                        z = false;
                    }
                    p65Var.p(z);
                    fo7.k(1573248, 56, null, p65Var, this.d, xn7.M, null, vo7.R(p65Var, i), false, false);
                    p65Var.p(true);
                    p65Var.p(true);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    to7.d(this.b, this.c, this.d, null, p65Var2, 0);
                }
                break;
            default:
                ((Integer) obj2).getClass();
                to7.c(z2, this.c, this.d, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ zo8(boolean z, m45 m45Var, m45 m45Var2, int i, byte b) {
        this.a = i;
        this.b = z;
        this.c = m45Var;
        this.d = m45Var2;
    }
}
