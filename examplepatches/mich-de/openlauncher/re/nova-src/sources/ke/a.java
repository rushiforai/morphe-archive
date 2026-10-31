package ke;

/* loaded from: classes3.dex */
public final class a implements s {

    /* renamed from: a, reason: collision with root package name */
    public final c f71371a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71372b;

    /* renamed from: c, reason: collision with root package name */
    public final long f71373c;

    /* renamed from: d, reason: collision with root package name */
    public final long f71374d;

    /* renamed from: e, reason: collision with root package name */
    public final long f71375e;

    /* renamed from: f, reason: collision with root package name */
    public final long f71376f;

    public a(c cVar, long j11, long j12, long j13, long j14, long j15) {
        this.f71371a = cVar;
        this.f71372b = j11;
        this.f71373c = j12;
        this.f71374d = j13;
        this.f71375e = j14;
        this.f71376f = j15;
    }

    @Override // ke.s
    public final r d(long j11) {
        t tVar = new t(j11, b.a(this.f71371a.c(j11), 0L, this.f71373c, this.f71374d, this.f71375e, this.f71376f));
        return new r(tVar, tVar);
    }

    @Override // ke.s
    public final boolean f() {
        return true;
    }

    @Override // ke.s
    public final long i() {
        return this.f71372b;
    }
}
