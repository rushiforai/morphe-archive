package defpackage;

import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class ku0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ iv0 b;
    public final /* synthetic */ pu0 c;

    public /* synthetic */ ku0(iv0 iv0Var, pu0 pu0Var, int i) {
        this.a = 2;
        this.b = iv0Var;
        this.c = pu0Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pu0 pu0Var = this.c;
        iv0 iv0Var = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    kyd.c(iv0Var, pu0Var, p65Var, 0);
                }
                break;
            case 1:
                int iIntValue2 = num.intValue();
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    r28 r28VarD = jfc.d(o28.b, 1.0f);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var2, 48);
                    long j = p65Var2.T;
                    int i2 = (int) (j ^ (j >>> 32));
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
                    tp7.B(p65Var2, q12.f, wv1VarA);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR);
                    kyd.c(iv0Var, pu0Var, p65Var2, 0);
                    WeakHashMap weakHashMap = f5f.w;
                    hp7.t(p65Var2, f49.Y(tr7.o(p65Var2).e));
                    p65Var2.p(true);
                }
                break;
            default:
                num.getClass();
                kyd.c(iv0Var, pu0Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ku0(iv0 iv0Var, pu0 pu0Var, int i, byte b) {
        this.a = i;
        this.b = iv0Var;
        this.c = pu0Var;
    }
}
