package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eid {
    public static final mya g = kng.K(new n2c(7), new d3d(24));
    public final g49 a;
    public final g49 b = new g49(0.0f);
    public final h49 c = new h49(0);
    public zwa d = zwa.e;
    public long e = bkd.b;
    public final k49 f;

    public eid(hw8 hw8Var, float f) {
        this.a = new g49(f);
        this.f = new k49(hw8Var, xsa.h);
    }

    public final void a(hw8 hw8Var, zwa zwaVar, int i, int i2) {
        float f = i2 - i;
        this.b.h(f);
        float f2 = zwaVar.a;
        float f3 = zwaVar.b;
        zwa zwaVar2 = this.d;
        float f4 = zwaVar2.a;
        g49 g49Var = this.a;
        if (f2 != f4 || f3 != zwaVar2.b) {
            boolean z = hw8Var == hw8.Vertical;
            if (z) {
                f2 = f3;
            }
            float f5 = z ? zwaVar.d : zwaVar.c;
            float fG = g49Var.g();
            float f6 = i;
            float f7 = fG + f6;
            g49Var.h(g49Var.g() + ((f5 <= f7 && (f2 >= fG || f5 - f2 <= f6)) ? (f2 >= fG || f5 - f2 > f6) ? 0.0f : f2 - fG : f5 - f7));
            this.d = zwaVar;
        }
        g49Var.h(iq7.u(g49Var.g(), 0.0f, f));
        this.c.h(i);
    }
}
