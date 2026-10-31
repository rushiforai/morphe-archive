package t70;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.concurrent.locks.LockSupport;
import kotlin.collections.ArrayDeque;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class h1 extends i1 implements r0 {

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88798g = AtomicReferenceFieldUpdater.newUpdater(h1.class, Object.class, "_queue$volatile");

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88799h = AtomicReferenceFieldUpdater.newUpdater(h1.class, Object.class, "_delayed$volatile");

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88800i = AtomicIntegerFieldUpdater.newUpdater(h1.class, "_isCompleted$volatile");
    private volatile /* synthetic */ Object _delayed$volatile;
    private volatile /* synthetic */ int _isCompleted$volatile;
    private volatile /* synthetic */ Object _queue$volatile;

    @Override // t70.r0
    public final void V(long j11, m mVar) {
        long j12 = j11 > 0 ? j11 >= 9223372036854L ? Long.MAX_VALUE : 1000000 * j11 : 0L;
        if (j12 < 4611686018427387903L) {
            long jNanoTime = System.nanoTime();
            d1 d1Var = new d1(this, j12 + jNanoTime, mVar);
            r0(jNanoTime, d1Var);
            mVar.w(new j(d1Var, 1));
        }
    }

    @Override // t70.r0
    public a1 a(long j11, Runnable runnable, CoroutineContext coroutineContext) {
        return pg.p.p(j11, runnable, coroutineContext);
    }

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        n0(runnable);
    }

    /* JADX WARN: Code restructure failed: missing block: B:8:0x0018, code lost:
    
        r7 = null;
     */
    @Override // t70.i1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long k0() {
        Runnable runnable;
        f1 f1Var;
        w50.g gVar = m0.f88827c;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88798g;
        if (!l0()) {
            o0();
            loop0: while (true) {
                Object obj = atomicReferenceFieldUpdater.get(this);
                if (obj == null) {
                    break;
                }
                if (!(obj instanceof y70.n)) {
                    if (obj != gVar) {
                        while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, null)) {
                            if (atomicReferenceFieldUpdater.get(this) != obj) {
                                break;
                            }
                        }
                        runnable = (Runnable) obj;
                        break loop0;
                    }
                    break;
                }
                y70.n nVar = (y70.n) obj;
                Object objD = nVar.d();
                if (objD != y70.n.f96814g) {
                    runnable = (Runnable) objD;
                    break;
                }
                y70.n nVarC = nVar.c();
                while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, nVarC) && atomicReferenceFieldUpdater.get(this) == obj) {
                }
            }
            if (runnable != null) {
                runnable.run();
                return 0L;
            }
            ArrayDeque arrayDeque = this.f88808e;
            if (((arrayDeque == null || arrayDeque.isEmpty()) ? Long.MAX_VALUE : 0L) != 0) {
                Object obj2 = atomicReferenceFieldUpdater.get(this);
                if (obj2 != null) {
                    if (obj2 instanceof y70.n) {
                        long j11 = y70.n.f96813f.get((y70.n) obj2);
                        if (((int) (1073741823 & j11)) != ((int) ((j11 & 1152921503533105152L) >> 30))) {
                            return 0L;
                        }
                    } else if (obj2 == gVar) {
                        return Long.MAX_VALUE;
                    }
                }
                g1 g1Var = (g1) f88799h.get(this);
                if (g1Var != null) {
                    synchronized (g1Var) {
                        f1[] f1VarArr = g1Var.f96838a;
                        f1Var = f1VarArr != null ? f1VarArr[0] : null;
                    }
                    if (f1Var != null) {
                        long jNanoTime = f1Var.f88792a - System.nanoTime();
                        if (jNanoTime >= 0) {
                            return jNanoTime;
                        }
                    }
                }
                return Long.MAX_VALUE;
            }
        }
        return 0L;
    }

    public void n0(Runnable runnable) {
        o0();
        if (!p0(runnable)) {
            n0.f88840j.n0(runnable);
            return;
        }
        Thread threadI0 = i0();
        if (Thread.currentThread() != threadI0) {
            LockSupport.unpark(threadI0);
        }
    }

    public final void o0() {
        f1 f1VarB;
        g1 g1Var = (g1) f88799h.get(this);
        if (g1Var == null || y70.z.f96837b.get(g1Var) == 0) {
            return;
        }
        long jNanoTime = System.nanoTime();
        do {
            synchronized (g1Var) {
                try {
                    f1[] f1VarArr = g1Var.f96838a;
                    f1 f1Var = f1VarArr != null ? f1VarArr[0] : null;
                    if (f1Var != null) {
                        f1VarB = ((jNanoTime - f1Var.f88792a) > 0L ? 1 : ((jNanoTime - f1Var.f88792a) == 0L ? 0 : -1)) >= 0 ? p0(f1Var) : false ? g1Var.b(0) : null;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } while (f1VarB != null);
    }

    public final boolean p0(Runnable runnable) {
        loop0: while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88798g;
            Object obj = atomicReferenceFieldUpdater.get(this);
            if (f88800i.get(this) != 1) {
                if (obj != null) {
                    if (!(obj instanceof y70.n)) {
                        if (obj != m0.f88827c) {
                            y70.n nVar = new y70.n(8, true);
                            nVar.a((Runnable) obj);
                            nVar.a(runnable);
                            while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, nVar)) {
                                if (atomicReferenceFieldUpdater.get(this) != obj) {
                                    break;
                                }
                            }
                            break loop0;
                        }
                        return false;
                    }
                    y70.n nVar2 = (y70.n) obj;
                    int iA = nVar2.a(runnable);
                    if (iA == 0) {
                        break;
                    }
                    if (iA == 1) {
                        y70.n nVarC = nVar2.c();
                        while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, nVarC) && atomicReferenceFieldUpdater.get(this) == obj) {
                        }
                    } else if (iA == 2) {
                        return false;
                    }
                } else {
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, null, runnable)) {
                        if (atomicReferenceFieldUpdater.get(this) != null) {
                            break;
                        }
                    }
                    break loop0;
                }
            } else {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0027  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean q0() {
        ArrayDeque arrayDeque = this.f88808e;
        if (arrayDeque != null ? arrayDeque.isEmpty() : true) {
            g1 g1Var = (g1) f88799h.get(this);
            if (g1Var == null) {
                Object obj = f88798g.get(this);
                if (obj != null) {
                    if (obj instanceof y70.n) {
                        long j11 = y70.n.f96813f.get((y70.n) obj);
                        return ((int) (1073741823 & j11)) == ((int) ((j11 & 1152921503533105152L) >> 30));
                    }
                    if (obj == m0.f88827c) {
                    }
                }
                return true;
            }
            if (y70.z.f96837b.get(g1Var) == 0) {
            }
        }
        return false;
    }

    public final void r0(long j11, f1 f1Var) {
        int iB;
        Thread threadI0;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88799h;
        if (f88800i.get(this) == 1) {
            iB = 1;
        } else {
            g1 g1Var = (g1) atomicReferenceFieldUpdater.get(this);
            if (g1Var == null) {
                g1 g1Var2 = new g1();
                g1Var2.f88796c = j11;
                while (!atomicReferenceFieldUpdater.compareAndSet(this, null, g1Var2) && atomicReferenceFieldUpdater.get(this) == null) {
                }
                Object obj = atomicReferenceFieldUpdater.get(this);
                Intrinsics.d(obj);
                g1Var = (g1) obj;
            }
            iB = f1Var.b(j11, g1Var, this);
        }
        if (iB != 0) {
            if (iB == 1) {
                m0(j11, f1Var);
                return;
            } else {
                if (iB != 2) {
                    throw new IllegalStateException("unexpected result");
                }
                return;
            }
        }
        g1 g1Var3 = (g1) atomicReferenceFieldUpdater.get(this);
        if (g1Var3 != null) {
            synchronized (g1Var3) {
                f1[] f1VarArr = g1Var3.f96838a;
                f1Var = f1VarArr != null ? f1VarArr[0] : null;
            }
        }
        if (f1Var != f1Var || Thread.currentThread() == (threadI0 = i0())) {
            return;
        }
        LockSupport.unpark(threadI0);
    }

    @Override // t70.i1
    public void shutdown() {
        f1 f1VarB;
        k2.f88812a.set(null);
        f88800i.set(this, 1);
        w50.g gVar = m0.f88827c;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88798g;
        loop0: while (true) {
            Object obj = atomicReferenceFieldUpdater.get(this);
            if (obj != null) {
                if (!(obj instanceof y70.n)) {
                    if (obj != gVar) {
                        y70.n nVar = new y70.n(8, true);
                        nVar.a((Runnable) obj);
                        while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, nVar)) {
                            if (atomicReferenceFieldUpdater.get(this) != obj) {
                                break;
                            }
                        }
                        break loop0;
                    }
                    break;
                }
                ((y70.n) obj).b();
                break;
            }
            while (!atomicReferenceFieldUpdater.compareAndSet(this, null, gVar)) {
                if (atomicReferenceFieldUpdater.get(this) != null) {
                    break;
                }
            }
            break loop0;
        }
        while (k0() <= 0) {
        }
        long jNanoTime = System.nanoTime();
        while (true) {
            g1 g1Var = (g1) f88799h.get(this);
            if (g1Var == null) {
                return;
            }
            synchronized (g1Var) {
                f1VarB = y70.z.f96837b.get(g1Var) > 0 ? g1Var.b(0) : null;
            }
            if (f1VarB == null) {
                return;
            } else {
                m0(jNanoTime, f1VarB);
            }
        }
    }
}
