package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eg0 implements lm8 {
    public static final eg0 a = new eg0();
    public static final gf4 b = gf4.a("generator");
    public static final gf4 c = gf4.a("identifier");
    public static final gf4 d = gf4.a("appQualitySessionId");
    public static final gf4 e = gf4.a("startedAt");
    public static final gf4 f = gf4.a("endedAt");
    public static final gf4 g = gf4.a("crashed");
    public static final gf4 h = gf4.a("app");
    public static final gf4 i = gf4.a("user");
    public static final gf4 j = gf4.a("os");
    public static final gf4 k = gf4.a("device");
    public static final gf4 l = gf4.a("events");
    public static final gf4 m = gf4.a("generatorType");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        od2 od2Var = (od2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((ei0) od2Var).a);
        ei0 ei0Var = (ei0) od2Var;
        mm8Var.a(c, ei0Var.b.getBytes(pd2.a));
        mm8Var.a(d, ei0Var.c);
        mm8Var.g(e, ei0Var.d);
        mm8Var.a(f, ei0Var.e);
        mm8Var.d(g, ei0Var.f);
        mm8Var.a(h, ei0Var.g);
        mm8Var.a(i, ei0Var.h);
        mm8Var.a(j, ei0Var.i);
        mm8Var.a(k, ei0Var.j);
        mm8Var.a(l, ei0Var.k);
        mm8Var.e(m, ei0Var.l);
    }
}
