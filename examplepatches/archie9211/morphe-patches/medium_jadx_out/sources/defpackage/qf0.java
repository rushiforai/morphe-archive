package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qf0 implements lm8 {
    public static final qf0 a = new qf0();
    public static final gf4 b = gf4.a("eventTimeMs");
    public static final gf4 c = gf4.a("eventCode");
    public static final gf4 d = gf4.a("complianceData");
    public static final gf4 e = gf4.a("eventUptimeMs");
    public static final gf4 f = gf4.a("sourceExtension");
    public static final gf4 g = gf4.a("sourceExtensionJsonProto3");
    public static final gf4 h = gf4.a("timezoneOffsetSeconds");
    public static final gf4 i = gf4.a("networkConnectionInfo");
    public static final gf4 j = gf4.a("experimentIds");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        t77 t77Var = (t77) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.g(b, ((tj0) t77Var).a);
        tj0 tj0Var = (tj0) t77Var;
        mm8Var.a(c, tj0Var.b);
        mm8Var.a(d, tj0Var.c);
        mm8Var.g(e, tj0Var.d);
        mm8Var.a(f, tj0Var.e);
        mm8Var.a(g, tj0Var.f);
        mm8Var.g(h, tj0Var.g);
        mm8Var.a(i, tj0Var.h);
        mm8Var.a(j, tj0Var.i);
    }
}
