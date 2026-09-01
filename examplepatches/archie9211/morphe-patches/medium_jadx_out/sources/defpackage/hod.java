package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class hod {
    public static final float a;

    static {
        pwd.i(16.0f, 8.0f);
        a = 200.0f;
    }

    public static mod a(int i, int i2, x12 x12Var) {
        float f;
        if ((i2 & 2) != 0) {
            jy8 jy8Var = kod.a;
            f = 4.0f;
        } else {
            f = 16.0f;
        }
        p65 p65Var = (p65) x12Var;
        int iI0 = ((m73) p65Var.j(z22.h)).i0(f);
        boolean zD = p65Var.d(iI0);
        boolean z = true;
        if ((((i & 14) ^ 6) <= 4 || !p65Var.d(1)) && (i & 6) != 4) {
            z = false;
        }
        boolean z2 = zD | z;
        Object objM = p65Var.M();
        if (z2 || objM == w12.a) {
            objM = new mod(iI0);
            p65Var.j0(objM);
        }
        return (mod) objM;
    }
}
