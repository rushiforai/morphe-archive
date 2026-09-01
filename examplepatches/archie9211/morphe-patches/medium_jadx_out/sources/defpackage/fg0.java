package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fg0 implements lm8 {
    public static final fg0 a = new fg0();
    public static final gf4 b = gf4.a("execution");
    public static final gf4 c = gf4.a("customAttributes");
    public static final gf4 d = gf4.a("internalKeys");
    public static final gf4 e = gf4.a("background");
    public static final gf4 f = gf4.a("currentProcessDetails");
    public static final gf4 g = gf4.a("appProcessDetails");
    public static final gf4 h = gf4.a("uiOrientation");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        fd2 fd2Var = (fd2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((li0) fd2Var).a);
        li0 li0Var = (li0) fd2Var;
        mm8Var.a(c, li0Var.b);
        mm8Var.a(d, li0Var.c);
        mm8Var.a(e, li0Var.d);
        mm8Var.a(f, li0Var.e);
        mm8Var.a(g, li0Var.f);
        mm8Var.e(h, li0Var.g);
    }
}
