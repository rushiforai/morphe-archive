package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wg0 implements lm8 {
    public static final wg0 a = new wg0();
    public static final gf4 b;
    public static final gf4 c;
    public static final gf4 d;
    public static final gf4 e;

    static {
        ad adVarE = ad.e();
        adVarE.b = 1;
        b = new gf4("window", y30.w(y30.v(s7a.class, adVarE.c())));
        ad adVarE2 = ad.e();
        adVarE2.b = 2;
        c = new gf4("logSourceMetrics", y30.w(y30.v(s7a.class, adVarE2.c())));
        ad adVarE3 = ad.e();
        adVarE3.b = 3;
        d = new gf4("globalMetrics", y30.w(y30.v(s7a.class, adVarE3.c())));
        ad adVarE4 = ad.e();
        adVarE4.b = 4;
        e = new gf4("appNamespace", y30.w(y30.v(s7a.class, adVarE4.c())));
    }

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        yo1 yo1Var = (yo1) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, yo1Var.a);
        mm8Var.a(c, yo1Var.b);
        mm8Var.a(d, yo1Var.c);
        mm8Var.a(e, yo1Var.d);
    }
}
