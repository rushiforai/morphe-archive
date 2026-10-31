package bn;

/* loaded from: classes3.dex */
public final class u0 implements dn.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18290a;

    /* renamed from: b, reason: collision with root package name */
    public final dn.c f18291b;

    /* renamed from: c, reason: collision with root package name */
    public final dn.c f18292c;

    public /* synthetic */ u0(dn.c cVar, dn.c cVar2, int i5) {
        this.f18290a = i5;
        this.f18291b = cVar;
        this.f18292c = cVar2;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f18290a) {
            case 0:
                return new t0((h1) this.f18291b.get(), (j1) this.f18292c.get());
            default:
                return new en.k((en.p) this.f18291b.get(), (en.p) this.f18292c.get());
        }
    }
}
