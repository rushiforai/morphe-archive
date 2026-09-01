package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lg5 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ lg5(dr9 dr9Var, float f, r28 r28Var) {
        this.a = 0;
        this.c = dr9Var;
        this.b = f;
        this.d = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        float f = this.b;
        Object obj3 = this.d;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                dr9 dr9Var = (dr9) obj4;
                r28 r28Var = (r28) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    nx5 nx5Var = new nx5((Context) p65Var.j(eo.b));
                    nx5Var.c = dr9Var.b;
                    nx5Var.r = dqb.FILL;
                    ord[] ordVarArr = {new gmb(f, f, f, f)};
                    q84 q84Var = tx5.a;
                    tx5.b(nx5Var, k80.Q0(ordVarArr));
                    ur7.b(nx5Var.a(), dr9Var.b.getAlt(), r28Var, hlg.O(((zo7) p65Var.j(kt7.b)).c, p65Var), null, null, null, null, null, null, p65Var, 0, 0, 32752);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                gsa.y((Long) obj4, (ik8) obj3, f, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                gsa.O((m8d) obj4, (f8d) obj3, f, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ lg5(Object obj, Object obj2, float f, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.b = f;
    }
}
