package nb0;

/* loaded from: classes5.dex */
public final class b0 extends ib0.h {

    /* renamed from: e, reason: collision with root package name */
    public int f78101e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ ib0.h f78102f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(c0 c0Var, ib0.h hVar, ib0.h hVar2) {
        super(hVar, true);
        this.f78102f = hVar2;
    }

    @Override // ib0.e
    public final void c(Object obj) {
        int i5 = this.f78101e;
        if (i5 >= 1) {
            this.f78102f.c(obj);
        } else {
            this.f78101e = i5 + 1;
        }
    }

    @Override // ib0.h
    public final void g(ib0.f fVar) {
        this.f78102f.g(fVar);
        fVar.j(1);
    }

    @Override // ib0.e
    public final void onCompleted() {
        this.f78102f.onCompleted();
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        this.f78102f.onError(th2);
    }
}
