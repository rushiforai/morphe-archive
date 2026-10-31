package td;

/* loaded from: classes3.dex */
public final class d implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f88965a = new d();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f88966b = new gm.c("logSource", a80.m.o(qm.e.d(jm.e.class, new jm.a(1))));

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f88967c = new gm.c("logEventDropped", a80.m.o(qm.e.d(jm.e.class, new jm.a(2))));

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        wd.e eVar = (wd.e) obj;
        gm.e eVar2 = (gm.e) obj2;
        eVar2.f(f88966b, eVar.f94203a);
        eVar2.f(f88967c, eVar.f94204b);
    }
}
