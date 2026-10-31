package tm;

import com.amplitude.android.migration.DatabaseConstants;

/* loaded from: classes3.dex */
public final class a implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final a f89443a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f89444b = new gm.c("projectNumber", a80.m.o(qm.e.d(jm.e.class, new jm.a(1))));

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f89445c = new gm.c("messageId", a80.m.o(qm.e.d(jm.e.class, new jm.a(2))));

    /* renamed from: d, reason: collision with root package name */
    public static final gm.c f89446d = new gm.c("instanceId", a80.m.o(qm.e.d(jm.e.class, new jm.a(3))));

    /* renamed from: e, reason: collision with root package name */
    public static final gm.c f89447e = new gm.c("messageType", a80.m.o(qm.e.d(jm.e.class, new jm.a(4))));

    /* renamed from: f, reason: collision with root package name */
    public static final gm.c f89448f = new gm.c("sdkPlatform", a80.m.o(qm.e.d(jm.e.class, new jm.a(5))));

    /* renamed from: g, reason: collision with root package name */
    public static final gm.c f89449g = new gm.c("packageName", a80.m.o(qm.e.d(jm.e.class, new jm.a(6))));

    /* renamed from: h, reason: collision with root package name */
    public static final gm.c f89450h = new gm.c("collapseKey", a80.m.o(qm.e.d(jm.e.class, new jm.a(7))));

    /* renamed from: i, reason: collision with root package name */
    public static final gm.c f89451i = new gm.c("priority", a80.m.o(qm.e.d(jm.e.class, new jm.a(8))));

    /* renamed from: j, reason: collision with root package name */
    public static final gm.c f89452j = new gm.c("ttl", a80.m.o(qm.e.d(jm.e.class, new jm.a(9))));

    /* renamed from: k, reason: collision with root package name */
    public static final gm.c f89453k = new gm.c("topic", a80.m.o(qm.e.d(jm.e.class, new jm.a(10))));

    /* renamed from: l, reason: collision with root package name */
    public static final gm.c f89454l = new gm.c("bulkId", a80.m.o(qm.e.d(jm.e.class, new jm.a(11))));

    /* renamed from: m, reason: collision with root package name */
    public static final gm.c f89455m = new gm.c(DatabaseConstants.EVENT_FIELD, a80.m.o(qm.e.d(jm.e.class, new jm.a(12))));
    public static final gm.c n = new gm.c("analyticsLabel", a80.m.o(qm.e.d(jm.e.class, new jm.a(13))));
    public static final gm.c o = new gm.c("campaignId", a80.m.o(qm.e.d(jm.e.class, new jm.a(14))));

    /* renamed from: p, reason: collision with root package name */
    public static final gm.c f89456p = new gm.c("composerLabel", a80.m.o(qm.e.d(jm.e.class, new jm.a(15))));

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        um.d dVar = (um.d) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.d(f89444b, dVar.f91353a);
        eVar.f(f89445c, dVar.f91354b);
        eVar.f(f89446d, dVar.f91355c);
        eVar.f(f89447e, dVar.f91356d);
        eVar.f(f89448f, um.c.ANDROID);
        eVar.f(f89449g, dVar.f91357e);
        eVar.f(f89450h, dVar.f91358f);
        eVar.c(f89451i, dVar.f91359g);
        eVar.c(f89452j, dVar.f91360h);
        eVar.f(f89453k, dVar.f91361i);
        eVar.d(f89454l, 0L);
        eVar.f(f89455m, um.a.MESSAGE_DELIVERED);
        eVar.f(n, dVar.f91362j);
        eVar.d(o, 0L);
        eVar.f(f89456p, dVar.f91363k);
    }
}
