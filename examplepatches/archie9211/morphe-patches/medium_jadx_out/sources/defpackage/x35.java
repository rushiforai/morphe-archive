package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class x35 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sw5 b;

    public /* synthetic */ x35(sw5 sw5Var, int i) {
        this.a = i;
        this.b = sw5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        sw5 sw5Var = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarI = w2g.i(flb.a0(jfc.c, xo7.i, rv8.r), 0.25f);
                    if (vj3.a(20.0f, 0.0f) > 0) {
                        vj3.a(20.0f, 0.0f);
                    }
                    ur7.a(this.b, null, xz5.W(r28VarI, new vs0(0, true)), null, v82.a, 0.0f, null, 0, p65Var, 1572912, 1976);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    nx5 nx5Var = new nx5((Context) p65Var2.j(eo.b));
                    nx5Var.c = sw5Var;
                    tx5.b(nx5Var, d46.Q(new ws0()));
                    q84 q84Var = wx5.a;
                    nx5Var.b().a(wx5.f, Boolean.FALSE);
                    ur7.a(nx5Var.a(), null, jfc.c, null, v82.a, 0.0f, null, 0, p65Var2, 1573296, 1976);
                }
                break;
            case 2:
                ((Integer) obj2).getClass();
                vc2.g(sw5Var, o28.b, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                iq7.d(sw5Var, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ x35(sw5 sw5Var, int i, int i2) {
        this.a = i2;
        this.b = sw5Var;
    }
}
