package defpackage;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class az6 extends kb2 implements x33 {
    public static final /* synthetic */ AtomicIntegerFieldUpdater h = AtomicIntegerFieldUpdater.newUpdater(az6.class, "runningWorkers$volatile");
    public static final /* synthetic */ long i = m80.a.objectFieldOffset(az6.class.getDeclaredField("runningWorkers$volatile"));
    public final /* synthetic */ x33 c;
    public final kb2 d;
    public final int e;
    public final z67 f;
    public final Object g;
    private volatile /* synthetic */ int runningWorkers$volatile;

    /* JADX WARN: Multi-variable type inference failed */
    public az6(kb2 kb2Var, int i2) {
        x33 x33Var = kb2Var instanceof x33 ? (x33) kb2Var : null;
        this.c = x33Var == null ? xy2.a : x33Var;
        this.d = kb2Var;
        this.e = i2;
        this.f = new z67();
        this.g = new Object();
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        Runnable runnableI0;
        this.f.a(runnable);
        if (m80.a.getIntVolatile(this, i) >= this.e || !J0() || (runnableI0 = I0()) == null) {
            return;
        }
        try {
            op8.l0(this.d, this, new p0g(this, runnableI0, false, 9));
        } catch (Throwable th) {
            h.decrementAndGet(this);
            throw th;
        }
    }

    @Override // defpackage.kb2
    public final void F0(ib2 ib2Var, Runnable runnable) {
        Runnable runnableI0;
        this.f.a(runnable);
        if (m80.a.getIntVolatile(this, i) >= this.e || !J0() || (runnableI0 = I0()) == null) {
            return;
        }
        try {
            this.d.F0(this, new p0g(this, runnableI0, false, 9));
        } catch (Throwable th) {
            h.decrementAndGet(this);
            throw th;
        }
    }

    @Override // defpackage.kb2
    public final kb2 H0(int i2) {
        wgf.f(i2);
        return i2 >= this.e ? this : super.H0(i2);
    }

    public final Runnable I0() {
        while (true) {
            Runnable runnable = (Runnable) this.f.d();
            if (runnable != null) {
                return runnable;
            }
            synchronized (this.g) {
                AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = h;
                atomicIntegerFieldUpdater.decrementAndGet(this);
                if (this.f.c() == 0) {
                    return null;
                }
                atomicIntegerFieldUpdater.incrementAndGet(this);
            }
        }
    }

    public final boolean J0() {
        synchronized (this.g) {
            AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = h;
            if (m80.a.getIntVolatile(this, i) >= this.e) {
                return false;
            }
            atomicIntegerFieldUpdater.incrementAndGet(this);
            return true;
        }
    }

    @Override // defpackage.x33
    public final yh3 Q(long j, Runnable runnable, ib2 ib2Var) {
        return this.c.Q(j, runnable, ib2Var);
    }

    @Override // defpackage.x33
    public final void g0(long j, x51 x51Var) {
        this.c.g0(j, x51Var);
    }

    @Override // defpackage.kb2
    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.d);
        sb.append(".limitedParallelism(");
        return km4.A(sb, this.e, ')');
    }
}
