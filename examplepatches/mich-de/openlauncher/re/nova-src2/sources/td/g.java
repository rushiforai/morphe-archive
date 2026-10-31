package td;

/* loaded from: classes3.dex */
public final class g implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final g f88972a = new g();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f88973b = new gm.c("startMs", a80.m.o(qm.e.d(jm.e.class, new jm.a(1))));

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f88974c = new gm.c("endMs", a80.m.o(qm.e.d(jm.e.class, new jm.a(2))));

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        wd.g gVar = (wd.g) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.d(f88973b, gVar.f94207a);
        eVar.d(f88974c, gVar.f94208b);
    }
}
