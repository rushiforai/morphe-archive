package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ap8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ r28 e;

    public /* synthetic */ ap8(r28 r28Var, boolean z, m45 m45Var, m45 m45Var2) {
        this.a = 2;
        this.e = r28Var;
        this.b = z;
        this.c = m45Var;
        this.d = m45Var2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                to7.d(this.b, this.c, this.d, this.e, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                qb8.x(this.b, this.c, this.d, this.e, (x12) obj, tr7.y(1));
                break;
            default:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                ar0 ar0Var = z46.h;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    amb ambVar = bmb.a;
                    r28 r28VarY = r40.y(jfc.l(this.e, 38.0f), ambVar);
                    boolean z = this.b;
                    o28 o28Var = o28.b;
                    if (!z) {
                        p65Var.Y(780699185);
                        sn3 sn3Var = kt7.b;
                        r28 r28VarN = bgf.N(hlg.r(flb.a0(r28VarY, ((zo7) p65Var.j(sn3Var)).d, rv8.r), true, null, new vkb(0), this.d, 8), "btn_subscribe_to_newsletter");
                        zk7 zk7VarC = dy0.c(ar0Var, false);
                        long j = p65Var.T;
                        int i2 = (int) (j ^ (j >>> 32));
                        i89 i89VarL = p65Var.l();
                        r28 r28VarR = gx1.R(p65Var, r28VarN);
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
                        qv5.b(vn7.J(R.drawable.ic_subscribe, 0, p65Var), vo7.R(p65Var, R.string.common_subscribe), jfc.l(o28Var, 24.0f), ((zo7) p65Var.j(sn3Var)).p, p65Var, 392, 0);
                        p65Var.p(true);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(779696583);
                        sn3 sn3Var2 = kt7.b;
                        cu0 cu0VarB = k40.b(1.0f, ((zo7) p65Var.j(sn3Var2)).y);
                        r28 r28VarN2 = bgf.N(hlg.r(bo.C(r28VarY, cu0VarB.a, cu0VarB.b, ambVar), true, null, new vkb(0), this.c, 8), "btn_unsubscribe_to_newsletter");
                        zk7 zk7VarC2 = dy0.c(ar0Var, false);
                        long j2 = p65Var.T;
                        int i3 = (int) (j2 ^ (j2 >>> 32));
                        i89 i89VarL2 = p65Var.l();
                        r28 r28VarR2 = gx1.R(p65Var, r28VarN2);
                        r12.W.getClass();
                        ot2 ot2Var2 = q12.b;
                        p65Var.c0();
                        if (p65Var.S) {
                            p65Var.k(ot2Var2);
                        } else {
                            p65Var.m0();
                        }
                        tp7.B(p65Var, q12.f, zk7VarC2);
                        tp7.B(p65Var, q12.e, i89VarL2);
                        tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                        tp7.y(p65Var, q12.h);
                        tp7.B(p65Var, q12.d, r28VarR2);
                        qv5.b(vn7.J(R.drawable.ic_subscribed, 0, p65Var), vo7.R(p65Var, R.string.common_unsubscribe), jfc.l(o28Var, 24.0f), ((zo7) p65Var.j(sn3Var2)).n, p65Var, 392, 0);
                        p65Var.p(true);
                        p65Var.p(false);
                    }
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ap8(boolean z, m45 m45Var, m45 m45Var2, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = z;
        this.c = m45Var;
        this.d = m45Var2;
        this.e = r28Var;
    }
}
