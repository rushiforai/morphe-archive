package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jg0 implements lm8 {
    public static final jg0 a = new jg0();
    public static final gf4 b = gf4.a("name");
    public static final gf4 c = gf4.a("code");
    public static final gf4 d = gf4.a("address");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        ad2 ad2Var = (ad2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((pi0) ad2Var).a);
        pi0 pi0Var = (pi0) ad2Var;
        mm8Var.a(c, pi0Var.b);
        mm8Var.g(d, pi0Var.c);
    }
}
