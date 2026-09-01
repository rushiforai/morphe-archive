package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nh0 implements lm8 {
    public static final nh0 a = new nh0();
    public static final gf4 b = gf4.a("sessionId");
    public static final gf4 c = gf4.a("firstSessionId");
    public static final gf4 d = gf4.a("sessionIndex");
    public static final gf4 e = gf4.a("eventTimestampUs");
    public static final gf4 f = gf4.a("dataCollectionStatus");
    public static final gf4 g = gf4.a("firebaseInstallationId");
    public static final gf4 h = gf4.a("firebaseAuthenticationToken");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        g1c g1cVar = (g1c) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, g1cVar.a);
        mm8Var.a(c, g1cVar.b);
        mm8Var.e(d, g1cVar.c);
        mm8Var.g(e, g1cVar.d);
        mm8Var.a(f, g1cVar.e);
        mm8Var.a(g, g1cVar.f);
        mm8Var.a(h, g1cVar.g);
    }
}
