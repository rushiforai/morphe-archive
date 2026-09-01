package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j03 {
    public static final j03 a = new j03();

    public final void a(gc8 gc8Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(882141204);
        int i2 = (p65Var.f(gc8Var) ? 4 : 2) | i;
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            g3d.a(gc8Var.a, null, gc8Var.b, gc8Var.c, 0.0f, 0.0f, null, pxf.E(1991263321, new fx2(i3, gc8Var), p65Var), p65Var, 12582912, 98);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(this, gc8Var, i, 9);
        }
    }
}
