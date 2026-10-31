package nb0;

/* loaded from: classes5.dex */
public final class e0 extends ib0.h implements mb0.a {

    /* renamed from: e, reason: collision with root package name */
    public final ib0.h f78110e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f78111f;

    /* renamed from: g, reason: collision with root package name */
    public final ib0.g f78112g;

    /* renamed from: h, reason: collision with root package name */
    public ib0.d f78113h;

    /* renamed from: i, reason: collision with root package name */
    public Thread f78114i;

    public e0(ib0.h hVar, boolean z11, ib0.g gVar, ib0.d dVar) {
        this.f78110e = hVar;
        this.f78111f = z11;
        this.f78112g = gVar;
        this.f78113h = dVar;
    }

    @Override // ib0.e
    public final void c(Object obj) {
        this.f78110e.c(obj);
    }

    @Override // mb0.a
    public final void call() {
        ib0.d dVar = this.f78113h;
        this.f78113h = null;
        this.f78114i = Thread.currentThread();
        dVar.d(this);
    }

    @Override // ib0.h
    public final void g(ib0.f fVar) {
        this.f78110e.g(new c10.a(this, fVar, false, 28));
    }

    @Override // ib0.e
    public final void onCompleted() {
        ib0.g gVar = this.f78112g;
        try {
            this.f78110e.onCompleted();
        } finally {
            gVar.b();
        }
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        ib0.g gVar = this.f78112g;
        try {
            this.f78110e.onError(th2);
        } finally {
            gVar.b();
        }
    }
}
