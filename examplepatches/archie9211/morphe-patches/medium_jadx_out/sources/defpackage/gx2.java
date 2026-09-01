package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gx2 {
    public static final gx2 a = new gx2();

    public final void a(n0c n0cVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1565826668);
        int i2 = (p65Var.f(n0cVar) ? 4 : 2) | i;
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            m40.h((m45) n0cVar.b, (pb3) n0cVar.d, pxf.E(1163527043, new fx2(i3, n0cVar), p65Var), p65Var, 384, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(this, n0cVar, i, 8);
        }
    }
}
