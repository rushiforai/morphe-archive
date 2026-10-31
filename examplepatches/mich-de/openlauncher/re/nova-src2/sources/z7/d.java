package z7;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* loaded from: classes.dex */
public final class d extends w.b {

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReferenceFieldUpdater f98283d;

    /* renamed from: j, reason: collision with root package name */
    public final AtomicReferenceFieldUpdater f98284j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicReferenceFieldUpdater f98285k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicReferenceFieldUpdater f98286l;
    public final AtomicReferenceFieldUpdater o;

    public d(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater3, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater4, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater5) {
        this.f98283d = atomicReferenceFieldUpdater;
        this.f98284j = atomicReferenceFieldUpdater2;
        this.f98285k = atomicReferenceFieldUpdater3;
        this.f98286l = atomicReferenceFieldUpdater4;
        this.o = atomicReferenceFieldUpdater5;
    }

    @Override // w.b
    public final boolean b(h hVar, c cVar, c cVar2) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        do {
            atomicReferenceFieldUpdater = this.f98286l;
            if (atomicReferenceFieldUpdater.compareAndSet(hVar, cVar, cVar2)) {
                return true;
            }
        } while (atomicReferenceFieldUpdater.get(hVar) == cVar);
        return false;
    }

    @Override // w.b
    public final boolean c(h hVar, Object obj, Object obj2) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        do {
            atomicReferenceFieldUpdater = this.o;
            if (atomicReferenceFieldUpdater.compareAndSet(hVar, obj, obj2)) {
                return true;
            }
        } while (atomicReferenceFieldUpdater.get(hVar) == obj);
        return false;
    }

    @Override // w.b
    public final boolean d(h hVar, g gVar, g gVar2) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        do {
            atomicReferenceFieldUpdater = this.f98285k;
            if (atomicReferenceFieldUpdater.compareAndSet(hVar, gVar, gVar2)) {
                return true;
            }
        } while (atomicReferenceFieldUpdater.get(hVar) == gVar);
        return false;
    }

    @Override // w.b
    public final void l(g gVar, g gVar2) {
        this.f98284j.lazySet(gVar, gVar2);
    }

    @Override // w.b
    public final void m(g gVar, Thread thread) {
        this.f98283d.lazySet(gVar, thread);
    }
}
