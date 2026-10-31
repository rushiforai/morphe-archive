package td;

/* loaded from: classes3.dex */
public final class c implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final c f88962a = new c();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f88963b = new gm.c("eventsDroppedCount", a80.m.o(qm.e.d(jm.e.class, new jm.a(1))));

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f88964c = new gm.c("reason", a80.m.o(qm.e.d(jm.e.class, new jm.a(3))));

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        wd.d dVar = (wd.d) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.d(f88963b, dVar.f94200a);
        eVar.f(f88964c, dVar.f94201b);
    }
}
