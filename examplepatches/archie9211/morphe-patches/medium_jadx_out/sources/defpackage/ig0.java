package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ig0 implements lm8 {
    public static final ig0 a = new ig0();
    public static final gf4 b = gf4.a("type");
    public static final gf4 c = gf4.a("reason");
    public static final gf4 d = gf4.a("frames");
    public static final gf4 e = gf4.a("causedBy");
    public static final gf4 f = gf4.a("overflowCount");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        zc2 zc2Var = (zc2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((oi0) zc2Var).a);
        oi0 oi0Var = (oi0) zc2Var;
        mm8Var.a(c, oi0Var.b);
        mm8Var.a(d, oi0Var.c);
        mm8Var.a(e, oi0Var.d);
        mm8Var.e(f, oi0Var.e);
    }
}
