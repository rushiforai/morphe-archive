package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ng0 implements lm8 {
    public static final ng0 a = new ng0();
    public static final gf4 b = gf4.a("batteryLevel");
    public static final gf4 c = gf4.a("batteryVelocity");
    public static final gf4 d = gf4.a("proximityOn");
    public static final gf4 e = gf4.a("orientation");
    public static final gf4 f = gf4.a("ramUsed");
    public static final gf4 g = gf4.a("diskUsed");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        gd2 gd2Var = (gd2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((wi0) gd2Var).a);
        wi0 wi0Var = (wi0) gd2Var;
        mm8Var.e(c, wi0Var.b);
        mm8Var.d(d, wi0Var.c);
        mm8Var.e(e, wi0Var.d);
        mm8Var.g(f, wi0Var.e);
        mm8Var.g(g, wi0Var.f);
    }
}
