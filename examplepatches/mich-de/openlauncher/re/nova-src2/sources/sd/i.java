package sd;

/* loaded from: classes.dex */
public final class i implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final i f87151a = new i();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f87152b = gm.c.a("eventTimeMs");

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f87153c = gm.c.a("eventCode");

    /* renamed from: d, reason: collision with root package name */
    public static final gm.c f87154d = gm.c.a("complianceData");

    /* renamed from: e, reason: collision with root package name */
    public static final gm.c f87155e = gm.c.a("eventUptimeMs");

    /* renamed from: f, reason: collision with root package name */
    public static final gm.c f87156f = gm.c.a("sourceExtension");

    /* renamed from: g, reason: collision with root package name */
    public static final gm.c f87157g = gm.c.a("sourceExtensionJsonProto3");

    /* renamed from: h, reason: collision with root package name */
    public static final gm.c f87158h = gm.c.a("timezoneOffsetSeconds");

    /* renamed from: i, reason: collision with root package name */
    public static final gm.c f87159i = gm.c.a("networkConnectionInfo");

    /* renamed from: j, reason: collision with root package name */
    public static final gm.c f87160j = gm.c.a("experimentIds");

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        gm.e eVar = (gm.e) obj2;
        w wVar = (w) ((i0) obj);
        eVar.d(f87152b, wVar.f87217a);
        eVar.f(f87153c, wVar.f87218b);
        eVar.f(f87154d, wVar.f87219c);
        eVar.d(f87155e, wVar.f87220d);
        eVar.f(f87156f, wVar.f87221e);
        eVar.f(f87157g, wVar.f87222f);
        eVar.d(f87158h, wVar.f87223g);
        eVar.f(f87159i, wVar.f87224h);
        eVar.f(f87160j, wVar.f87225i);
    }
}
