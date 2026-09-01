package defpackage;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g2 extends o7f {
    public final AtomicReferenceFieldUpdater u;
    public final AtomicReferenceFieldUpdater v;
    public final AtomicReferenceFieldUpdater w;
    public final AtomicReferenceFieldUpdater x;
    public final AtomicReferenceFieldUpdater y;

    public g2(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater3, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater4, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater5) {
        this.u = atomicReferenceFieldUpdater;
        this.v = atomicReferenceFieldUpdater2;
        this.w = atomicReferenceFieldUpdater3;
        this.x = atomicReferenceFieldUpdater4;
        this.y = atomicReferenceFieldUpdater5;
    }

    @Override // defpackage.o7f
    public final void F(i2 i2Var, i2 i2Var2) {
        this.v.lazySet(i2Var, i2Var2);
    }

    @Override // defpackage.o7f
    public final void G(i2 i2Var, Thread thread) {
        this.u.lazySet(i2Var, thread);
    }

    @Override // defpackage.o7f
    public final boolean n(j2 j2Var, f2 f2Var, f2 f2Var2) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        do {
            atomicReferenceFieldUpdater = this.x;
            if (atomicReferenceFieldUpdater.compareAndSet(j2Var, f2Var, f2Var2)) {
                return true;
            }
        } while (atomicReferenceFieldUpdater.get(j2Var) == f2Var);
        return false;
    }

    @Override // defpackage.o7f
    public final boolean o(j2 j2Var, Object obj, Object obj2) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        do {
            atomicReferenceFieldUpdater = this.y;
            if (atomicReferenceFieldUpdater.compareAndSet(j2Var, obj, obj2)) {
                return true;
            }
        } while (atomicReferenceFieldUpdater.get(j2Var) == obj);
        return false;
    }

    @Override // defpackage.o7f
    public final boolean p(j2 j2Var, i2 i2Var, i2 i2Var2) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        do {
            atomicReferenceFieldUpdater = this.w;
            if (atomicReferenceFieldUpdater.compareAndSet(j2Var, i2Var, i2Var2)) {
                return true;
            }
        } while (atomicReferenceFieldUpdater.get(j2Var) == i2Var);
        return false;
    }
}
