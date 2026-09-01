package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bg0 implements lm8 {
    public static final bg0 a = new bg0();
    public static final gf4 b = gf4.a("identifier");
    public static final gf4 c = gf4.a("version");
    public static final gf4 d = gf4.a("displayVersion");
    public static final gf4 e = gf4.a("organization");
    public static final gf4 f = gf4.a("installationUuid");
    public static final gf4 g = gf4.a("developmentPlatform");
    public static final gf4 h = gf4.a("developmentPlatformVersion");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        wc2 wc2Var = (wc2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((fi0) wc2Var).a);
        fi0 fi0Var = (fi0) wc2Var;
        mm8Var.a(c, fi0Var.b);
        mm8Var.a(d, fi0Var.c);
        mm8Var.a(e, null);
        mm8Var.a(f, fi0Var.d);
        mm8Var.a(g, fi0Var.e);
        mm8Var.a(h, fi0Var.f);
    }
}
