package te;

import ke.r;
import ke.s;
import ke.t;
import wf.v;

/* loaded from: classes3.dex */
public final class a implements s {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b f89011a;

    public a(b bVar) {
        this.f89011a = bVar;
    }

    @Override // ke.s
    public final r d(long j11) {
        b bVar = this.f89011a;
        long j12 = bVar.f89013b;
        long j13 = bVar.f89014c;
        t tVar = new t(j11, v.i(((((j13 - j12) * ((bVar.f89015d.f89048i * j11) / 1000000)) / bVar.f89017f) + j12) - 30000, j12, j13 - 1));
        return new r(tVar, tVar);
    }

    @Override // ke.s
    public final boolean f() {
        return true;
    }

    @Override // ke.s
    public final long i() {
        return (this.f89011a.f89017f * 1000000) / r0.f89015d.f89048i;
    }
}
