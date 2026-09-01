package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s08 {
    public static s08 h;
    public final ip6 a;
    public final mkd b;
    public final p73 c;
    public final yy4 d;
    public final mkd e;
    public float f = Float.NaN;
    public float g = Float.NaN;

    public s08(ip6 ip6Var, mkd mkdVar, p73 p73Var, yy4 yy4Var) {
        this.a = ip6Var;
        this.b = mkdVar;
        this.c = p73Var;
        this.d = yy4Var;
        this.e = il7.C(mkdVar, ip6Var);
    }

    public final long a(int i, long j) {
        int i2;
        float f = this.g;
        float f2 = this.f;
        if (Float.isNaN(f) || Float.isNaN(f2)) {
            String str = t08.a;
            long jB = h72.b(0, 0, 0, 0, 15);
            mkd mkdVar = this.e;
            p73 p73Var = this.c;
            float fB = no7.f(str, mkdVar, jB, p73Var, this.d, 1, 96).b();
            float fB2 = no7.f(t08.b, mkdVar, h72.b(0, 0, 0, 0, 15), p73Var, this.d, 2, 96).b() - fB;
            this.g = fB;
            this.f = fB2;
            f2 = fB2;
            f = fB;
        }
        if (i != 1) {
            int iRound = Math.round((f2 * (i - 1)) + f);
            i2 = iRound >= 0 ? iRound : 0;
            int iG = f72.g(j);
            if (i2 > iG) {
                i2 = iG;
            }
        } else {
            i2 = f72.i(j);
        }
        return h72.a(f72.j(j), f72.h(j), i2, f72.g(j));
    }
}
