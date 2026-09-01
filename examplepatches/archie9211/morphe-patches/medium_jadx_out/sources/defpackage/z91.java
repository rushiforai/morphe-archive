package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z91 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ boolean c;

    public /* synthetic */ z91(int i, String str, boolean z) {
        this.a = i;
        this.b = str;
        this.c = z;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 0;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    String str = this.b;
                    if (str != null) {
                        p65Var.Y(1306207750);
                        vv2.c(this.c, null, sz3.c(null, 3), sz3.d(null, 3), null, pxf.E(2045254556, new ba1(str, i2), p65Var), p65Var, 200064, 18);
                    } else {
                        p65Var.Y(1304275923);
                    }
                    p65Var.p(false);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    o28 o28Var = o28.b;
                    r28 r28VarE = w2g.E(o28Var, 12.0f, 0.0f, 2);
                    omb ombVarA = nmb.a(qb8.e, z46.n, p65Var2, 54);
                    long j = p65Var2.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarE);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, ombVarA);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR);
                    jjd.b(this.b, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).n, p65Var2, 0, 0, 131070);
                    if (this.c) {
                        km4.F(8.0f, -247031259, p65Var2, p65Var2, o28Var);
                        qv5.b(vn7.J(R.drawable.ic_close_16, 0, p65Var2), null, jfc.l(o28Var, 12.0f), 0L, p65Var2, 440, 8);
                    } else {
                        p65Var2.Y(-251908024);
                    }
                    p65Var2.p(false);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
