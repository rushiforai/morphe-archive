package bm;

/* loaded from: classes.dex */
public final class p implements nm.c, nm.b {

    /* renamed from: c, reason: collision with root package name */
    public static final bb.a f18103c = new bb.a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final f f18104d = new f(1);

    /* renamed from: a, reason: collision with root package name */
    public nm.a f18105a;

    /* renamed from: b, reason: collision with root package name */
    public volatile nm.c f18106b;

    public p(bb.a aVar, nm.c cVar) {
        this.f18105a = aVar;
        this.f18106b = cVar;
    }

    public final void a(nm.a aVar) {
        nm.c cVar;
        nm.c cVar2;
        nm.c cVar3 = this.f18106b;
        f fVar = f18104d;
        if (cVar3 != fVar) {
            aVar.h(cVar3);
            return;
        }
        synchronized (this) {
            cVar = this.f18106b;
            if (cVar != fVar) {
                cVar2 = cVar;
            } else {
                this.f18105a = new o(0, this.f18105a, aVar);
                cVar2 = null;
            }
        }
        if (cVar2 != null) {
            aVar.h(cVar);
        }
    }

    @Override // nm.c
    public final Object get() {
        return this.f18106b.get();
    }
}
