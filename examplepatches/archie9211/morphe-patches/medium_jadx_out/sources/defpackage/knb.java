package defpackage;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class knb implements n92, ub2 {
    public static final AtomicReferenceFieldUpdater b = AtomicReferenceFieldUpdater.newUpdater(knb.class, Object.class, "result");
    public final n92 a;
    private volatile Object result;

    public knb(n92 n92Var, tb2 tb2Var) {
        this.a = n92Var;
        this.result = tb2Var;
    }

    @Override // defpackage.ub2
    public final ub2 getCallerFrame() {
        n92 n92Var = this.a;
        if (n92Var instanceof ub2) {
            return (ub2) n92Var;
        }
        return null;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return this.a.getContext();
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = b;
        while (true) {
            Object obj2 = this.result;
            tb2 tb2Var = tb2.UNDECIDED;
            if (obj2 == tb2Var) {
                while (!atomicReferenceFieldUpdater.compareAndSet(this, tb2Var, obj)) {
                    if (atomicReferenceFieldUpdater.get(this) != tb2Var) {
                        break;
                    }
                }
                return;
            }
            tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
            if (obj2 != tb2Var2) {
                ygf.f("Already resumed");
                return;
            }
            tb2 tb2Var3 = tb2.RESUMED;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, tb2Var2, tb2Var3)) {
                if (atomicReferenceFieldUpdater.get(this) != tb2Var2) {
                    break;
                }
            }
            this.a.resumeWith(obj);
            return;
        }
    }

    public final String toString() {
        return "SafeContinuation for " + this.a;
    }
}
