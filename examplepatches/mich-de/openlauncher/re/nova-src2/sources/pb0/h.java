package pb0;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public final class h extends vh.a implements m {

    /* renamed from: g, reason: collision with root package name */
    public static final int f82517g;

    /* renamed from: h, reason: collision with root package name */
    public static final g f82518h;

    /* renamed from: i, reason: collision with root package name */
    public static final f f82519i;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicReference f82520f;

    static {
        int iIntValue = Integer.getInteger("rx.scheduler.max-computation-threads", 0).intValue();
        int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
        if (iIntValue <= 0 || iIntValue > iAvailableProcessors) {
            iIntValue = iAvailableProcessors;
        }
        f82517g = iIntValue;
        g gVar = new g(rb0.e.f85781b);
        f82518h = gVar;
        gVar.b();
        f82519i = new f(null, 0);
    }

    public h(rb0.e eVar) {
        f fVar = f82519i;
        AtomicReference atomicReference = new AtomicReference(fVar);
        this.f82520f = atomicReference;
        f fVar2 = new f(eVar, f82517g);
        while (!atomicReference.compareAndSet(fVar, fVar2)) {
            if (atomicReference.get() != fVar) {
                for (g gVar : fVar2.f82515b) {
                    gVar.b();
                }
                return;
            }
        }
    }

    @Override // vh.a
    public final ib0.g q() {
        g gVar;
        f fVar = (f) this.f82520f.get();
        int i5 = fVar.f82514a;
        if (i5 == 0) {
            gVar = f82518h;
        } else {
            g[] gVarArr = fVar.f82515b;
            long j11 = fVar.f82516c;
            fVar.f82516c = 1 + j11;
            gVar = gVarArr[(int) (j11 % i5)];
        }
        return new e(gVar);
    }

    @Override // pb0.m
    public final void shutdown() {
        while (true) {
            AtomicReference atomicReference = this.f82520f;
            f fVar = (f) atomicReference.get();
            f fVar2 = f82519i;
            if (fVar == fVar2) {
                return;
            }
            while (!atomicReference.compareAndSet(fVar, fVar2)) {
                if (atomicReference.get() != fVar) {
                    break;
                }
            }
            for (g gVar : fVar.f82515b) {
                gVar.b();
            }
            return;
        }
    }
}
