package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gh0 implements lm8 {
    public static final gh0 a = new gh0();
    public static final gf4 b = gf4.a("rolloutId");
    public static final gf4 c = gf4.a("parameterKey");
    public static final gf4 d = gf4.a("parameterValue");
    public static final gf4 e = gf4.a("variantId");
    public static final gf4 f = gf4.a("templateVersion");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        wkb wkbVar = (wkb) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((bk0) wkbVar).b);
        bk0 bk0Var = (bk0) wkbVar;
        mm8Var.a(c, bk0Var.c);
        mm8Var.a(d, bk0Var.d);
        mm8Var.a(e, bk0Var.e);
        mm8Var.g(f, bk0Var.f);
    }
}
