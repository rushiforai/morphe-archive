package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hg0 implements lm8 {
    public static final hg0 a = new hg0();
    public static final gf4 b = gf4.a("threads");
    public static final gf4 c = gf4.a("exception");
    public static final gf4 d = gf4.a("appExitInfo");
    public static final gf4 e = gf4.a("signal");
    public static final gf4 f = gf4.a("binaries");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        dd2 dd2Var = (dd2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((mi0) dd2Var).a);
        mi0 mi0Var = (mi0) dd2Var;
        mm8Var.a(c, mi0Var.b);
        mm8Var.a(d, mi0Var.c);
        mm8Var.a(e, mi0Var.d);
        mm8Var.a(f, mi0Var.e);
    }
}
