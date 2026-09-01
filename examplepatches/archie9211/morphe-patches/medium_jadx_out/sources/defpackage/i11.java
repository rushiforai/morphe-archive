package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class i11 {
    public static final float a;
    public static final float b;
    public static final jy8 c;

    static {
        new jy8(16.0f, 8.0f, 16.0f, 8.0f);
        a = 64.0f;
        b = 36.0f;
        c = new jy8(8.0f, 8.0f, 8.0f, 8.0f);
    }

    public static ay2 a(long j, long j2, long j3, long j4, x12 x12Var, int i, int i2) {
        if ((i2 & 1) != 0) {
            j = ((sv1) ((p65) x12Var).j(tv1.a)).d();
        }
        if ((i2 & 2) != 0) {
            j2 = tv1.b(j, x12Var);
        }
        if ((i2 & 4) != 0) {
            sn3 sn3Var = tv1.a;
            p65 p65Var = (p65) x12Var;
            j3 = op8.M(uu1.b(0.12f, ((sv1) p65Var.j(sn3Var)).c()), ((sv1) p65Var.j(sn3Var)).e());
        }
        if ((i2 & 8) != 0) {
            sn3 sn3Var2 = tv1.a;
            p65 p65Var2 = (p65) x12Var;
            long jC = ((sv1) p65Var2.j(sn3Var2)).c();
            long j5 = ((uu1) p65Var2.j(d82.a)).a;
            if (((sv1) p65Var2.j(sn3Var2)).f()) {
                op8.f0(j5);
            } else {
                op8.f0(j5);
            }
            j4 = uu1.b(0.38f, jC);
        }
        return new ay2(j, j2, j3, j4);
    }

    public static ay2 b(long j, x12 x12Var, int i) {
        long j2 = uu1.g;
        if ((i & 2) != 0) {
            j = ((sv1) ((p65) x12Var).j(tv1.a)).d();
        }
        long j3 = j;
        sn3 sn3Var = tv1.a;
        p65 p65Var = (p65) x12Var;
        long jC = ((sv1) p65Var.j(sn3Var)).c();
        long j4 = ((uu1) p65Var.j(d82.a)).a;
        if (((sv1) p65Var.j(sn3Var)).f()) {
            op8.f0(j4);
        } else {
            op8.f0(j4);
        }
        return new ay2(j2, j3, j2, uu1.b(0.38f, jC));
    }
}
