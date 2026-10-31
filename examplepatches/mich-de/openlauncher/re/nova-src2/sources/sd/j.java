package sd;

/* loaded from: classes.dex */
public final class j implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final j f87161a = new j();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f87162b = gm.c.a("requestTimeMs");

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f87163c = gm.c.a("requestUptimeMs");

    /* renamed from: d, reason: collision with root package name */
    public static final gm.c f87164d = gm.c.a("clientInfo");

    /* renamed from: e, reason: collision with root package name */
    public static final gm.c f87165e = gm.c.a("logSource");

    /* renamed from: f, reason: collision with root package name */
    public static final gm.c f87166f = gm.c.a("logSourceName");

    /* renamed from: g, reason: collision with root package name */
    public static final gm.c f87167g = gm.c.a("logEvent");

    /* renamed from: h, reason: collision with root package name */
    public static final gm.c f87168h = gm.c.a("qosTier");

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        gm.e eVar = (gm.e) obj2;
        x xVar = (x) ((j0) obj);
        eVar.d(f87162b, xVar.f87226a);
        eVar.d(f87163c, xVar.f87227b);
        eVar.f(f87164d, xVar.f87228c);
        eVar.f(f87165e, xVar.f87229d);
        eVar.f(f87166f, xVar.f87230e);
        eVar.f(f87167g, xVar.f87231f);
        eVar.f(f87168h, xVar.f87232g);
    }
}
