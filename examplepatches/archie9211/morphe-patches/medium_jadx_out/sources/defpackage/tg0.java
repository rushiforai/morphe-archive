package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tg0 implements lm8 {
    public static final tg0 a = new tg0();
    public static final gf4 b = gf4.a("platform");
    public static final gf4 c = gf4.a("version");
    public static final gf4 d = gf4.a("buildVersion");
    public static final gf4 e = gf4.a("jailbroken");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        md2 md2Var = (md2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.e(b, ((dj0) md2Var).a);
        dj0 dj0Var = (dj0) md2Var;
        mm8Var.a(c, dj0Var.b);
        mm8Var.a(d, dj0Var.c);
        mm8Var.d(e, dj0Var.d);
    }
}
