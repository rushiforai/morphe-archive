package bn;

/* loaded from: classes3.dex */
public final class i0 implements dn.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18215a;

    /* renamed from: b, reason: collision with root package name */
    public final dn.c f18216b;

    public /* synthetic */ i0(dn.c cVar, int i5) {
        this.f18215a = i5;
        this.f18216b = cVar;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f18215a) {
            case 0:
                return new h0((t0) this.f18216b.get());
            default:
                return new w0((c1) this.f18216b.get());
        }
    }
}
