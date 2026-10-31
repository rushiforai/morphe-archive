package tk;

import m.w;

/* loaded from: classes3.dex */
public final class u extends t {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ fi.j f89439b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ok.g f89440c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b f89441d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(b bVar, fi.j jVar, fi.j jVar2, ok.g gVar) {
        super(jVar);
        this.f89439b = jVar2;
        this.f89440c = gVar;
        this.f89441d = bVar;
    }

    @Override // tk.t
    public final void b() {
        synchronized (this.f89441d.f89405f) {
            try {
                b bVar = this.f89441d;
                fi.j jVar = this.f89439b;
                bVar.f89404e.add(jVar);
                jVar.f55135a.b(new w(bVar, jVar, false, 17));
                if (this.f89441d.f89411l.getAndIncrement() > 0) {
                    this.f89441d.f89401b.b("Already connected to the service.", new Object[0]);
                }
                b.b(this.f89441d, this.f89440c);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
