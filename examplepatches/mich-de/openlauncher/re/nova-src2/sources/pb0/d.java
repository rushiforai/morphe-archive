package pb0;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public final class d extends vh.a implements m {

    /* renamed from: g, reason: collision with root package name */
    public static final long f82506g;

    /* renamed from: h, reason: collision with root package name */
    public static final TimeUnit f82507h = TimeUnit.SECONDS;

    /* renamed from: i, reason: collision with root package name */
    public static final c f82508i;

    /* renamed from: j, reason: collision with root package name */
    public static final a f82509j;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicReference f82510f;

    static {
        c cVar = new c(rb0.e.f85781b);
        f82508i = cVar;
        cVar.b();
        a aVar = new a(null, 0L, null);
        f82509j = aVar;
        aVar.a();
        f82506g = Integer.getInteger("rx.io-scheduler.keepalive", 60).intValue();
    }

    public d(rb0.e eVar) {
        a aVar = f82509j;
        AtomicReference atomicReference = new AtomicReference(aVar);
        this.f82510f = atomicReference;
        a aVar2 = new a(eVar, f82506g, f82507h);
        while (!atomicReference.compareAndSet(aVar, aVar2)) {
            if (atomicReference.get() != aVar) {
                aVar2.a();
                return;
            }
        }
    }

    @Override // vh.a
    public final ib0.g q() {
        return new b((a) this.f82510f.get());
    }

    @Override // pb0.m
    public final void shutdown() {
        while (true) {
            AtomicReference atomicReference = this.f82510f;
            a aVar = (a) atomicReference.get();
            a aVar2 = f82509j;
            if (aVar == aVar2) {
                return;
            }
            while (!atomicReference.compareAndSet(aVar, aVar2)) {
                if (atomicReference.get() != aVar) {
                    break;
                }
            }
            aVar.a();
            return;
        }
    }
}
