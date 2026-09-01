package defpackage;

import androidx.compose.ui.tooling.PreviewActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class q60 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;

    public /* synthetic */ q60(String str, String str2, int i) {
        this.a = i;
        this.b = str;
        this.c = str2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws Exception {
        int i = this.a;
        o28 o28Var = o28.b;
        String str = this.c;
        String str2 = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    zi5 zi5Var = qb8.e;
                    r28 r28VarD = jfc.d(o28Var, 1.0f);
                    wv1 wv1VarA = uv1.a(zi5Var, z46.p, p65Var, 6);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, wv1VarA);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    sn3 sn3Var = jt7.c;
                    jjd.b(this.b, bgf.N(o28Var, "title"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, dl7.m(((bu7) p65Var.j(sn3Var)).e), p65Var, 48, 24960, 110588);
                    String str3 = this.c;
                    if (muc.b0(str3)) {
                        p65Var.Y(-922623367);
                    } else {
                        p65Var.Y(-914111263);
                        jjd.b(str3, bgf.N(o28Var, "subtitle"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(((bu7) p65Var.j(sn3Var)).o), p65Var, 48, 0, 131068);
                    }
                    p65Var.p(false);
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
                    r28 r28VarD2 = jfc.d(o28Var, 1.0f);
                    wv1 wv1VarA2 = uv1.a(qb8.e, z46.p, p65Var2, 54);
                    long j2 = p65Var2.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA2);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    sn3 sn3Var2 = jt7.c;
                    jjd.b(this.b, bgf.N(jfc.d(o28Var, 1.0f), "title"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).e, ((zo7) p65Var2.j(kt7.b)).n, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 48, 24960, 110588);
                    String str4 = this.c;
                    if (muc.b0(str4)) {
                        p65Var2.Y(1531470624);
                    } else {
                        p65Var2.Y(1546346191);
                        jjd.b(str4, bgf.N(jfc.d(o28Var, 1.0f), "subtitle"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var2)).w, p65Var2, 48, 0, 131068);
                    }
                    p65Var2.p(false);
                    p65Var2.p(true);
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                int i4 = PreviewActivity.b;
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    wgf.z(str2, str, p65Var3, new Object[0]);
                }
                break;
            default:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    mq7.a(0, p65Var4, null, str2, str);
                }
                break;
        }
        return c1eVar;
    }
}
