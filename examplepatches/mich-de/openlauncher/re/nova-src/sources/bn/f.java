package bn;

/* loaded from: classes.dex */
public final class f implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final f f18184a = new f();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f18185b = gm.c.a("processName");

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f18186c = gm.c.a("pid");

    /* renamed from: d, reason: collision with root package name */
    public static final gm.c f18187d = gm.c.a("importance");

    /* renamed from: e, reason: collision with root package name */
    public static final gm.c f18188e = gm.c.a("defaultProcess");

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        d0 d0Var = (d0) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.f(f18185b, d0Var.f18167a);
        eVar.c(f18186c, d0Var.f18168b);
        eVar.c(f18187d, d0Var.f18169c);
        eVar.b(f18188e, d0Var.f18170d);
    }
}
