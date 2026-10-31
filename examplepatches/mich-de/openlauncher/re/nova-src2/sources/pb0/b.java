package pb0;

import java.util.concurrent.atomic.AtomicBoolean;
import nb0.s;

/* loaded from: classes5.dex */
public final class b extends ib0.g implements mb0.a {

    /* renamed from: b, reason: collision with root package name */
    public final a f82502b;

    /* renamed from: c, reason: collision with root package name */
    public final c f82503c;

    /* renamed from: a, reason: collision with root package name */
    public final xb0.c f82501a = new xb0.c();

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f82504d = new AtomicBoolean();

    public b(a aVar) {
        c cVar;
        c cVar2;
        this.f82502b = aVar;
        if (aVar.f82498d.f95757b) {
            cVar2 = d.f82508i;
        } else {
            while (true) {
                if (aVar.f82497c.isEmpty()) {
                    cVar = new c(aVar.f82495a);
                    aVar.f82498d.c(cVar);
                    break;
                } else {
                    cVar = (c) aVar.f82497c.poll();
                    if (cVar != null) {
                        break;
                    }
                }
            }
            cVar2 = cVar;
        }
        this.f82503c = cVar2;
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f82501a.f95757b;
    }

    @Override // ib0.i
    public final void b() {
        if (this.f82504d.compareAndSet(false, true)) {
            this.f82503c.c(this);
        }
        this.f82501a.b();
    }

    @Override // ib0.g
    public final ib0.i c(mb0.a aVar) {
        if (this.f82501a.f95757b) {
            return xb0.e.f95758a;
        }
        l lVarE = this.f82503c.e(new s(1, this, aVar), 0L, null);
        this.f82501a.c(lVarE);
        lVarE.f82534a.c(new k(lVarE, this.f82501a, 1));
        return lVarE;
    }

    @Override // mb0.a
    public final void call() {
        long jNanoTime = System.nanoTime();
        a aVar = this.f82502b;
        long j11 = jNanoTime + aVar.f82496b;
        c cVar = this.f82503c;
        cVar.f82505i = j11;
        aVar.f82497c.offer(cVar);
    }
}
