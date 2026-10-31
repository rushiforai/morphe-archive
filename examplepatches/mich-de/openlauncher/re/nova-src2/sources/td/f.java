package td;

/* loaded from: classes3.dex */
public final class f implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final f f88969a = new f();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f88970b = new gm.c("currentCacheSizeBytes", a80.m.o(qm.e.d(jm.e.class, new jm.a(1))));

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f88971c = new gm.c("maxCacheSizeBytes", a80.m.o(qm.e.d(jm.e.class, new jm.a(2))));

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        wd.f fVar = (wd.f) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.d(f88970b, fVar.f94205a);
        eVar.d(f88971c, fVar.f94206b);
    }
}
