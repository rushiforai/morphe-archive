package defpackage;

import android.view.ViewConfiguration;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class plc {
    public static final float a = ViewConfiguration.getScrollFriction();

    public static final xv2 a(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        m73 m73Var = (m73) p65Var.j(z22.h);
        boolean zC = p65Var.c(m73Var.b());
        Object objM = p65Var.M();
        if (zC || objM == w12.a) {
            objM = new xv2(new qlb(m73Var));
            p65Var.j0(objM);
        }
        return (xv2) objM;
    }
}
