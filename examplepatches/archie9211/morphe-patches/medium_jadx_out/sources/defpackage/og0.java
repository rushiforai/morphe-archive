package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class og0 implements lm8 {
    public static final og0 a = new og0();
    public static final gf4 b = gf4.a("timestamp");
    public static final gf4 c = gf4.a("type");
    public static final gf4 d = gf4.a("app");
    public static final gf4 e = gf4.a("device");
    public static final gf4 f = gf4.a("log");
    public static final gf4 g = gf4.a("rollouts");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        ld2 ld2Var = (ld2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.g(b, ((ki0) ld2Var).a);
        ki0 ki0Var = (ki0) ld2Var;
        mm8Var.a(c, ki0Var.b);
        mm8Var.a(d, ki0Var.c);
        mm8Var.a(e, ki0Var.d);
        mm8Var.a(f, ki0Var.e);
        mm8Var.a(g, ki0Var.f);
    }
}
