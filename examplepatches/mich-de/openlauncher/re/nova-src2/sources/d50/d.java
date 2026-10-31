package d50;

/* loaded from: classes.dex */
public final class d extends b {

    /* renamed from: f, reason: collision with root package name */
    public final byte[] f48985f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f48986g;

    public d(c50.e eVar, k50.b bVar, l50.b bVar2, byte[] bArr) {
        super(eVar);
        this.f48985f = bArr;
        this.f48980b = new e(this, bVar);
        this.f48981c = new f(this, bArr, bVar2);
        fg.a.f(u90.b.m(bVar2), bArr.length, bVar.getMethod());
        this.f48986g = true;
    }

    @Override // d50.b
    public final boolean b() {
        return this.f48986g;
    }

    @Override // d50.b
    public final Object e() {
        return u90.b.a(this.f48985f);
    }
}
