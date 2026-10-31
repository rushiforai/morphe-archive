package e1;

/* loaded from: classes2.dex */
public final class j implements c4.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final b2.f f51313a;

    /* renamed from: b, reason: collision with root package name */
    public final k f51314b;

    /* renamed from: c, reason: collision with root package name */
    public long f51315c = 0;

    public j(b2.f fVar, k kVar) {
        this.f51313a = fVar;
        this.f51314b = kVar;
    }

    @Override // c4.f0
    public final long s(y3.l lVar, long j11, y3.n nVar, long j12) {
        long jA = this.f51314b.a();
        if ((9223372034707292159L & jA) == 9205357640488583168L) {
            jA = this.f51315c;
        }
        this.f51315c = jA;
        return y3.k.d(y3.k.d(lVar.g(), w.b.n(jA)), this.f51313a.a(j12, 0L, nVar));
    }
}
