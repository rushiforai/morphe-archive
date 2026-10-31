package bn;

/* loaded from: classes.dex */
public final class h implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final h f18200a = new h();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f18201b = gm.c.a("sessionId");

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f18202c = gm.c.a("firstSessionId");

    /* renamed from: d, reason: collision with root package name */
    public static final gm.c f18203d = gm.c.a("sessionIndex");

    /* renamed from: e, reason: collision with root package name */
    public static final gm.c f18204e = gm.c.a("eventTimestampUs");

    /* renamed from: f, reason: collision with root package name */
    public static final gm.c f18205f = gm.c.a("dataCollectionStatus");

    /* renamed from: g, reason: collision with root package name */
    public static final gm.c f18206g = gm.c.a("firebaseInstallationId");

    /* renamed from: h, reason: collision with root package name */
    public static final gm.c f18207h = gm.c.a("firebaseAuthenticationToken");

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        v0 v0Var = (v0) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.f(f18201b, v0Var.f18296a);
        eVar.f(f18202c, v0Var.f18297b);
        eVar.c(f18203d, v0Var.f18298c);
        eVar.d(f18204e, v0Var.f18299d);
        eVar.f(f18205f, v0Var.f18300e);
        eVar.f(f18206g, v0Var.f18301f);
        eVar.f(f18207h, v0Var.f18302g);
    }
}
