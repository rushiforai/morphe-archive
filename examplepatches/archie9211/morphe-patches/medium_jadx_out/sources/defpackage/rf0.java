package defpackage;

import com.drew.imaging.avi.hzjl.bPUi;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class rf0 implements lm8 {
    public static final rf0 a = new rf0();
    public static final gf4 b = gf4.a("requestTimeMs");
    public static final gf4 c = gf4.a("requestUptimeMs");
    public static final gf4 d = gf4.a("clientInfo");
    public static final gf4 e = gf4.a(bPUi.DiWu);
    public static final gf4 f = gf4.a("logSourceName");
    public static final gf4 g = gf4.a("logEvent");
    public static final gf4 h = gf4.a("qosTier");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        y77 y77Var = (y77) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.g(b, ((uj0) y77Var).a);
        uj0 uj0Var = (uj0) y77Var;
        mm8Var.g(c, uj0Var.b);
        mm8Var.a(d, uj0Var.c);
        mm8Var.a(e, uj0Var.d);
        mm8Var.a(f, uj0Var.e);
        mm8Var.a(g, uj0Var.f);
        mm8Var.a(h, uj0Var.g);
    }
}
