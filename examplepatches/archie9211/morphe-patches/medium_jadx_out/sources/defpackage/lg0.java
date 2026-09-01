package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lg0 implements lm8 {
    public static final lg0 a = new lg0();
    public static final gf4 b = gf4.a("pc");
    public static final gf4 c = gf4.a("symbol");
    public static final gf4 d = gf4.a("file");
    public static final gf4 e = gf4.a("offset");
    public static final gf4 f = gf4.a("importance");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        bd2 bd2Var = (bd2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.g(b, ((si0) bd2Var).a);
        si0 si0Var = (si0) bd2Var;
        mm8Var.a(c, si0Var.b);
        mm8Var.a(d, si0Var.c);
        mm8Var.g(e, si0Var.d);
        mm8Var.e(f, si0Var.e);
    }
}
