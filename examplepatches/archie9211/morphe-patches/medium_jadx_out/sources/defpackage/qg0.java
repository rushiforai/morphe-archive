package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qg0 implements lm8 {
    public static final qg0 a = new qg0();
    public static final gf4 b = gf4.a("rolloutVariant");
    public static final gf4 c = gf4.a("parameterKey");
    public static final gf4 d = gf4.a("parameterValue");
    public static final gf4 e = gf4.a("templateVersion");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        jd2 jd2Var = (jd2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, ((zi0) jd2Var).a);
        zi0 zi0Var = (zi0) jd2Var;
        mm8Var.a(c, zi0Var.b);
        mm8Var.a(d, zi0Var.c);
        mm8Var.g(e, zi0Var.d);
    }
}
