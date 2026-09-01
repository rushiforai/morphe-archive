package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jf0 implements lm8 {
    public static final jf0 a = new jf0();
    public static final gf4 b = gf4.a("sdkVersion");
    public static final gf4 c = gf4.a("model");
    public static final gf4 d = gf4.a("hardware");
    public static final gf4 e = gf4.a("device");
    public static final gf4 f = gf4.a("product");
    public static final gf4 g = gf4.a("osBuild");
    public static final gf4 h = gf4.a("manufacturer");
    public static final gf4 i = gf4.a("fingerprint");
    public static final gf4 j = gf4.a("locale");
    public static final gf4 k = gf4.a("country");
    public static final gf4 l = gf4.a("mccMnc");
    public static final gf4 m = gf4.a("applicationBuild");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        sm smVar = (sm) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((ph0) smVar).a);
        ph0 ph0Var = (ph0) smVar;
        mm8Var.a(c, ph0Var.b);
        mm8Var.a(d, ph0Var.c);
        mm8Var.a(e, ph0Var.d);
        mm8Var.a(f, ph0Var.e);
        mm8Var.a(g, ph0Var.f);
        mm8Var.a(h, ph0Var.g);
        mm8Var.a(i, ph0Var.h);
        mm8Var.a(j, ph0Var.i);
        mm8Var.a(k, ph0Var.j);
        mm8Var.a(l, ph0Var.k);
        mm8Var.a(m, ph0Var.l);
    }
}
