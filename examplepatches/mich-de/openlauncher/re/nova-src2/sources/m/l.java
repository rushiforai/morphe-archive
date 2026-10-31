package m;

/* loaded from: classes2.dex */
public final class l implements i.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f75308a;

    public l(m mVar) {
        this.f75308a = mVar;
    }

    @Override // i.b
    public final void a(g.o oVar) {
        m mVar = this.f75308a;
        s delegate = mVar.getDelegate();
        delegate.l();
        mVar.getSavedStateRegistry().a("androidx:appcompat");
        delegate.p();
    }
}
