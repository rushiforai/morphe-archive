package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kh0 implements lm8 {
    public static final kh0 a = new kh0();
    public static final gf4 b = gf4.a("performance");
    public static final gf4 c = gf4.a("crashlytics");
    public static final gf4 d = gf4.a("sessionSamplingRate");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        jt2 jt2Var = (jt2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, jt2Var.a);
        mm8Var.a(c, jt2Var.b);
        mm8Var.f(d, jt2Var.c);
    }
}
