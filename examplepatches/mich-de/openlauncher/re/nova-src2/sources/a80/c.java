package a80;

import b.c0;
import h6.c1;
import java.io.Closeable;
import java.lang.Thread;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.concurrent.locks.LockSupport;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import y70.r;

/* loaded from: classes.dex */
public final class c implements Executor, Closeable {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f477h = AtomicLongFieldUpdater.newUpdater(c.class, "parkedWorkersStack$volatile");

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f478i = AtomicLongFieldUpdater.newUpdater(c.class, "controlState$volatile");

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f479j = AtomicIntegerFieldUpdater.newUpdater(c.class, "_isTerminated$volatile");

    /* renamed from: k, reason: collision with root package name */
    public static final w50.g f480k = new w50.g("NOT_IN_STACK", 1);
    private volatile /* synthetic */ int _isTerminated$volatile;

    /* renamed from: a, reason: collision with root package name */
    public final int f481a;

    /* renamed from: b, reason: collision with root package name */
    public final int f482b;

    /* renamed from: c, reason: collision with root package name */
    public final long f483c;
    private volatile /* synthetic */ long controlState$volatile;

    /* renamed from: d, reason: collision with root package name */
    public final String f484d;

    /* renamed from: e, reason: collision with root package name */
    public final f f485e;

    /* renamed from: f, reason: collision with root package name */
    public final f f486f;

    /* renamed from: g, reason: collision with root package name */
    public final r f487g;
    private volatile /* synthetic */ long parkedWorkersStack$volatile;

    public c(int i5, long j11, int i11, String str) {
        this.f481a = i5;
        this.f482b = i11;
        this.f483c = j11;
        this.f484d = str;
        if (i5 < 1) {
            throw new IllegalArgumentException(c0.i(i5, "Core pool size ", " should be at least 1").toString());
        }
        if (i11 < i5) {
            throw new IllegalArgumentException(c0.g(i11, i5, "Max pool size ", " should be greater than or equals to core pool size ").toString());
        }
        if (i11 > 2097150) {
            throw new IllegalArgumentException(c0.i(i11, "Max pool size ", " should not exceed maximal supported number of threads 2097150").toString());
        }
        if (j11 <= 0) {
            throw new IllegalArgumentException(c1.o(j11, "Idle worker keep alive time ", " must be positive").toString());
        }
        this.f485e = new f();
        this.f486f = new f();
        this.f487g = new r((i5 + 1) * 2);
        this.controlState$volatile = i5 << 42;
    }

    public static /* synthetic */ void c(c cVar, Runnable runnable, int i5) {
        cVar.b(false, (i5 & 4) == 0, runnable);
    }

    public final int a() {
        synchronized (this.f487g) {
            try {
                if (f479j.get(this) == 1) {
                    return -1;
                }
                AtomicLongFieldUpdater atomicLongFieldUpdater = f478i;
                long j11 = atomicLongFieldUpdater.get(this);
                int i5 = (int) (j11 & 2097151);
                int i11 = i5 - ((int) ((j11 & 4398044413952L) >> 21));
                if (i11 < 0) {
                    i11 = 0;
                }
                if (i11 >= this.f481a) {
                    return 0;
                }
                if (i5 >= this.f482b) {
                    return 0;
                }
                int i12 = ((int) (atomicLongFieldUpdater.get(this) & 2097151)) + 1;
                if (i12 <= 0 || this.f487g.b(i12) != null) {
                    throw new IllegalArgumentException("Failed requirement.");
                }
                a aVar = new a(this, i12);
                this.f487g.c(i12, aVar);
                if (i12 != ((int) (2097151 & atomicLongFieldUpdater.incrementAndGet(this)))) {
                    throw new IllegalArgumentException("Failed requirement.");
                }
                int i13 = i11 + 1;
                aVar.start();
                return i13;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void b(boolean z11, boolean z12, Runnable runnable) {
        i jVar;
        b bVar;
        k.f501f.getClass();
        long jNanoTime = System.nanoTime();
        if (runnable instanceof i) {
            jVar = (i) runnable;
            jVar.f493a = jNanoTime;
            jVar.f494b = z11;
        } else {
            jVar = new j(runnable, jNanoTime, z11);
        }
        boolean z13 = jVar.f494b;
        AtomicLongFieldUpdater atomicLongFieldUpdater = f478i;
        long jAddAndGet = z13 ? atomicLongFieldUpdater.addAndGet(this, 2097152L) : 0L;
        Thread threadCurrentThread = Thread.currentThread();
        a aVar = threadCurrentThread instanceof a ? (a) threadCurrentThread : null;
        if (aVar == null || !Intrinsics.b(aVar.f470h, this)) {
            aVar = null;
        }
        if (aVar != null && (bVar = aVar.f465c) != b.f475e && (jVar.f494b || bVar != b.f472b)) {
            aVar.f469g = true;
            n nVar = aVar.f463a;
            if (z12) {
                jVar = nVar.a(jVar);
            } else {
                nVar.getClass();
                i iVar = (i) n.f503b.getAndSet(nVar, jVar);
                jVar = iVar == null ? null : nVar.a(iVar);
            }
        }
        if (jVar != null) {
            if (!(jVar.f494b ? this.f486f.a(jVar) : this.f485e.a(jVar))) {
                throw new RejectedExecutionException(c0.q(new StringBuilder(), this.f484d, " was terminated"));
            }
        }
        if (z13) {
            if (f() || e(jAddAndGet)) {
                return;
            }
            f();
            return;
        }
        if (f() || e(atomicLongFieldUpdater.get(this))) {
            return;
        }
        f();
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00a6  */
    @Override // java.io.Closeable, java.lang.AutoCloseable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void close() throws InterruptedException {
        int i5;
        i iVarA;
        if (f479j.compareAndSet(this, 0, 1)) {
            Thread threadCurrentThread = Thread.currentThread();
            a aVar = threadCurrentThread instanceof a ? (a) threadCurrentThread : null;
            if (aVar == null || !Intrinsics.b(aVar.f470h, this)) {
                aVar = null;
            }
            synchronized (this.f487g) {
                i5 = (int) (f478i.get(this) & 2097151);
            }
            if (1 <= i5) {
                int i11 = 1;
                while (true) {
                    Object objB = this.f487g.b(i11);
                    Intrinsics.d(objB);
                    a aVar2 = (a) objB;
                    if (aVar2 != aVar) {
                        while (aVar2.getState() != Thread.State.TERMINATED) {
                            LockSupport.unpark(aVar2);
                            aVar2.join(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
                        }
                        n nVar = aVar2.f463a;
                        f fVar = this.f486f;
                        nVar.getClass();
                        i iVar = (i) n.f503b.getAndSet(nVar, null);
                        if (iVar != null) {
                            fVar.a(iVar);
                        }
                        while (true) {
                            i iVarB = nVar.b();
                            if (iVarB == null) {
                                break;
                            } else {
                                fVar.a(iVarB);
                            }
                        }
                    }
                    if (i11 == i5) {
                        break;
                    } else {
                        i11++;
                    }
                }
            }
            f fVar2 = this.f486f;
            fVar2.getClass();
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = y70.l.f96810a;
            while (true) {
                y70.n nVar2 = (y70.n) atomicReferenceFieldUpdater.get(fVar2);
                if (nVar2.b()) {
                    break;
                } else {
                    x8.h.d(atomicReferenceFieldUpdater, fVar2, nVar2, nVar2.c());
                }
            }
            f fVar3 = this.f485e;
            fVar3.getClass();
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = y70.l.f96810a;
            while (true) {
                y70.n nVar3 = (y70.n) atomicReferenceFieldUpdater2.get(fVar3);
                if (nVar3.b()) {
                    break;
                } else {
                    x8.h.d(atomicReferenceFieldUpdater2, fVar3, nVar3, nVar3.c());
                }
            }
            while (true) {
                if (aVar == null) {
                    iVarA = (i) this.f485e.c();
                    if (iVarA == null && (iVarA = (i) this.f486f.c()) == null) {
                        break;
                    }
                } else {
                    iVarA = aVar.a(true);
                    if (iVarA == null) {
                    }
                }
                try {
                    iVarA.run();
                } catch (Throwable th2) {
                    Thread threadCurrentThread2 = Thread.currentThread();
                    threadCurrentThread2.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread2, th2);
                }
            }
            if (aVar != null) {
                aVar.h(b.f475e);
            }
            f477h.set(this, 0L);
            f478i.set(this, 0L);
        }
    }

    public final void d(a aVar, int i5, int i11) {
        while (true) {
            long j11 = f477h.get(this);
            int i12 = (int) (2097151 & j11);
            long j12 = (2097152 + j11) & (-2097152);
            if (i12 == i5) {
                if (i11 == 0) {
                    Object objC = aVar.c();
                    while (true) {
                        if (objC == f480k) {
                            i12 = -1;
                            break;
                        }
                        if (objC == null) {
                            i12 = 0;
                            break;
                        }
                        a aVar2 = (a) objC;
                        int iB = aVar2.b();
                        if (iB != 0) {
                            i12 = iB;
                            break;
                        }
                        objC = aVar2.c();
                    }
                } else {
                    i12 = i11;
                }
            }
            if (i12 >= 0) {
                if (f477h.compareAndSet(this, j11, i12 | j12)) {
                    return;
                }
            }
        }
    }

    public final boolean e(long j11) {
        int i5 = ((int) (2097151 & j11)) - ((int) ((j11 & 4398044413952L) >> 21));
        if (i5 < 0) {
            i5 = 0;
        }
        int i11 = this.f481a;
        if (i5 < i11) {
            int iA = a();
            if (iA == 1 && i11 > 1) {
                a();
            }
            if (iA > 0) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        c(this, runnable, 6);
    }

    public final boolean f() {
        w50.g gVar;
        int iB;
        while (true) {
            long j11 = f477h.get(this);
            a aVar = (a) this.f487g.b((int) (2097151 & j11));
            if (aVar == null) {
                aVar = null;
            } else {
                long j12 = (2097152 + j11) & (-2097152);
                Object objC = aVar.c();
                while (true) {
                    gVar = f480k;
                    if (objC == gVar) {
                        iB = -1;
                        break;
                    }
                    if (objC == null) {
                        iB = 0;
                        break;
                    }
                    a aVar2 = (a) objC;
                    iB = aVar2.b();
                    if (iB != 0) {
                        break;
                    }
                    objC = aVar2.c();
                }
                if (iB >= 0) {
                    if (f477h.compareAndSet(this, j11, iB | j12)) {
                        aVar.g(gVar);
                    } else {
                        continue;
                    }
                } else {
                    continue;
                }
            }
            if (aVar == null) {
                return false;
            }
            if (a.f462i.compareAndSet(aVar, -1, 0)) {
                LockSupport.unpark(aVar);
                return true;
            }
        }
    }

    public final String toString() {
        ArrayList arrayList = new ArrayList();
        r rVar = this.f487g;
        int iA = rVar.a();
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        int i14 = 0;
        for (int i15 = 1; i15 < iA; i15++) {
            a aVar = (a) rVar.b(i15);
            if (aVar != null) {
                n nVar = aVar.f463a;
                nVar.getClass();
                int i16 = n.f503b.get(nVar) != null ? (n.f504c.get(nVar) - n.f505d.get(nVar)) + 1 : n.f504c.get(nVar) - n.f505d.get(nVar);
                int iOrdinal = aVar.f465c.ordinal();
                if (iOrdinal == 0) {
                    i5++;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(i16);
                    sb2.append('c');
                    arrayList.add(sb2.toString());
                } else if (iOrdinal == 1) {
                    i11++;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(i16);
                    sb3.append('b');
                    arrayList.add(sb3.toString());
                } else if (iOrdinal == 2) {
                    i12++;
                } else if (iOrdinal == 3) {
                    i13++;
                    if (i16 > 0) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append(i16);
                        sb4.append('d');
                        arrayList.add(sb4.toString());
                    }
                } else {
                    if (iOrdinal != 4) {
                        throw new NoWhenBranchMatchedException();
                    }
                    i14++;
                }
            }
        }
        long j11 = f478i.get(this);
        StringBuilder sb5 = new StringBuilder();
        sb5.append(this.f484d);
        sb5.append('@');
        sb5.append(m0.m(this));
        sb5.append("[Pool Size {core = ");
        int i17 = this.f481a;
        sb5.append(i17);
        sb5.append(", max = ");
        c0.A(sb5, this.f482b, "}, Worker States {CPU = ", i5, ", blocking = ");
        c0.A(sb5, i11, ", parked = ", i12, ", dormant = ");
        c0.A(sb5, i13, ", terminated = ", i14, "}, running workers queues = ");
        sb5.append(arrayList);
        sb5.append(", global CPU queue size = ");
        sb5.append(this.f485e.b());
        sb5.append(", global blocking queue size = ");
        sb5.append(this.f486f.b());
        sb5.append(", Control State {created workers= ");
        sb5.append((int) (2097151 & j11));
        sb5.append(", blocking tasks = ");
        sb5.append((int) ((4398044413952L & j11) >> 21));
        sb5.append(", CPUs acquired = ");
        sb5.append(i17 - ((int) ((j11 & 9223367638808264704L) >> 42)));
        sb5.append("}]");
        return sb5.toString();
    }
}
