package t70;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* loaded from: classes5.dex */
public final class m2 extends t1 {

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88836g = AtomicIntegerFieldUpdater.newUpdater(m2.class, "_state$volatile");
    private volatile /* synthetic */ int _state$volatile;

    /* renamed from: e, reason: collision with root package name */
    public final Thread f88837e = Thread.currentThread();

    /* renamed from: f, reason: collision with root package name */
    public a1 f88838f;

    public static void m(int i5) {
        throw new IllegalStateException(("Illegal state " + i5).toString());
    }

    @Override // t70.t1
    public final boolean j() {
        return true;
    }

    @Override // t70.t1
    public final void k(Throwable th2) {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater;
        int i5;
        do {
            atomicIntegerFieldUpdater = f88836g;
            i5 = atomicIntegerFieldUpdater.get(this);
            if (i5 != 0) {
                if (i5 == 1 || i5 == 2 || i5 == 3) {
                    return;
                }
                m(i5);
                throw null;
            }
        } while (!atomicIntegerFieldUpdater.compareAndSet(this, i5, 2));
        this.f88837e.interrupt();
        atomicIntegerFieldUpdater.set(this, 3);
    }

    public final void l() {
        while (true) {
            AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = f88836g;
            int i5 = atomicIntegerFieldUpdater.get(this);
            if (i5 != 0) {
                if (i5 != 2) {
                    if (i5 == 3) {
                        Thread.interrupted();
                        return;
                    } else {
                        m(i5);
                        throw null;
                    }
                }
            } else if (atomicIntegerFieldUpdater.compareAndSet(this, i5, 1)) {
                a1 a1Var = this.f88838f;
                if (a1Var != null) {
                    a1Var.dispose();
                    return;
                }
                return;
            }
        }
    }
}
