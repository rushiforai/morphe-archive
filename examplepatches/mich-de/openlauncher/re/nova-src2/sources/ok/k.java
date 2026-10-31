package ok;

import fi.t;
import tk.u;

/* loaded from: classes3.dex */
public final /* synthetic */ class k {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f80481a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f80482b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f80483c;

    public /* synthetic */ k(l lVar, long j11, long j12) {
        this.f80481a = lVar;
        this.f80482b = j11;
        this.f80483c = j12;
    }

    public final t a(o oVar) {
        h hVar = this.f80481a.f80484a;
        long j11 = this.f80483c;
        hVar.f80474a.b("requestExpressIntegrityToken(%s)", Long.valueOf(j11));
        fi.j jVar = new fi.j();
        e eVar = new e(hVar, jVar, oVar, this.f80482b, j11, jVar);
        tk.b bVar = hVar.f80478e;
        bVar.getClass();
        bVar.a().post(new u(bVar, jVar, jVar, eVar));
        return jVar.f55135a;
    }
}
