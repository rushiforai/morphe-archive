package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eh0 implements lm8 {
    public static final eh0 a = new eh0();
    public static final gf4 b;
    public static final gf4 c;

    static {
        ad adVarE = ad.e();
        adVarE.b = 1;
        b = new gf4("currentCacheSizeBytes", y30.w(y30.v(s7a.class, adVarE.c())));
        ad adVarE2 = ad.e();
        adVarE2.b = 2;
        c = new gf4("maxCacheSizeBytes", y30.w(y30.v(s7a.class, adVarE2.c())));
    }

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        bsc bscVar = (bsc) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.g(b, bscVar.a);
        mm8Var.g(c, bscVar.b);
    }
}
