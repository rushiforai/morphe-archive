package nb0;

/* loaded from: classes5.dex */
public final class e extends ib0.h {

    /* renamed from: e, reason: collision with root package name */
    public final f f78108e;

    /* renamed from: f, reason: collision with root package name */
    public long f78109f;

    public e(f fVar) {
        this.f78108e = fVar;
    }

    @Override // ib0.e
    public final void c(Object obj) {
        this.f78109f++;
        this.f78108e.f78115e.c(obj);
    }

    @Override // ib0.h
    public final void g(ib0.f fVar) {
        this.f78108e.f78117g.b(fVar);
    }

    @Override // ib0.e
    public final void onCompleted() {
        this.f78108e.j(this.f78109f);
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        f fVar = this.f78108e;
        if (!rb0.a.a(fVar.f78120j, th2)) {
            ub0.a.a(th2);
            return;
        }
        Throwable thB = rb0.a.b(fVar.f78120j);
        if (thB != rb0.a.f85774a) {
            fVar.f78115e.onError(thB);
        }
        fVar.b();
    }
}
