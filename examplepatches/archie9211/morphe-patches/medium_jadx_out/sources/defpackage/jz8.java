package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jz8 {
    public static final iz8 a;
    public static final yy8 b;

    static {
        iz8 iz8Var = new iz8(0);
        a = iz8Var;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        b = new yy8(i, i2, i3, hw8.Horizontal, i4, 0, 0, hpe.i, new vr6(3), o7f.c(zx3.a), iz8Var, h72.b(0, 0, 0, 0, 15));
    }

    public static final long a(yy8 yy8Var, int i) {
        int i2 = yy8Var.c;
        long j = (((((long) i) * ((long) (yy8Var.b + i2))) + ((long) (-yy8Var.f))) + ((long) yy8Var.d)) - ((long) i2);
        int iG = (int) (yy8Var.e == hw8.Horizontal ? yy8Var.g() >> 32 : yy8Var.g() & 4294967295L);
        yy8Var.n.getClass();
        long jV = j - ((long) (iG - iq7.v(0, 0, iG)));
        if (jV < 0) {
            return 0L;
        }
        return jV;
    }

    public static final d13 b(int i, m45 m45Var, x12 x12Var, int i2, int i3) {
        boolean z = true;
        if ((i3 & 1) != 0) {
            i = 0;
        }
        Object[] objArr = new Object[0];
        mya myaVar = d13.I;
        boolean zD = ((p65) x12Var).d(i) | ((p65) x12Var).c(0.0f);
        if ((((i2 & 896) ^ 384) <= 256 || !((p65) x12Var).f(m45Var)) && (i2 & 384) != 256) {
            z = false;
        }
        boolean z2 = zD | z;
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (z2 || objM == w12.a) {
            objM = new hz8(i, m45Var);
            p65Var.j0(objM);
        }
        d13 d13Var = (d13) hp7.F(objArr, myaVar, (m45) objM, p65Var, 0);
        d13Var.H.setValue(m45Var);
        return d13Var;
    }
}
