package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class e29 {
    public static final void a(n39 n39Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(193061818);
        int i2 = (p65Var.h(n39Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            Context context = (Context) p65Var.j(eo.b);
            l78 l78VarY = qo7.y(n39Var, p65Var);
            boolean zF = p65Var.f(n39Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new h09(n39Var.i, n39Var.j, n39Var);
                p65Var.j0(objM);
            }
            h09 h09Var = (h09) objM;
            boolean zH = p65Var.h(n39Var);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new c29(n39Var, 0);
                p65Var.j0(objM2);
            }
            x45 x45Var = (x45) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new hb8(21);
                p65Var.j0(objM3);
            }
            x45 x45Var2 = (x45) objM3;
            boolean zH2 = p65Var.h(h09Var) | p65Var.f(l78VarY) | p65Var.h(context);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new o8(h09Var, l78VarY, context, 29);
                p65Var.j0(objM4);
            }
            r28Var2 = r28Var;
            vc2.b(x45Var, r28Var2, x45Var2, (x45) objM4, p65Var, 3120);
        } else {
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(n39Var, r28Var2, i, 3);
        }
    }
}
