package defpackage;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.locks.LockSupport;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rb2 implements Executor, Closeable {
    public static final /* synthetic */ AtomicLongFieldUpdater h = AtomicLongFieldUpdater.newUpdater(rb2.class, "parkedWorkersStack$volatile");
    public static final /* synthetic */ AtomicLongFieldUpdater i = AtomicLongFieldUpdater.newUpdater(rb2.class, "controlState$volatile");
    public static final /* synthetic */ AtomicIntegerFieldUpdater j = AtomicIntegerFieldUpdater.newUpdater(rb2.class, "_isTerminated$volatile");
    public static final d1g k = new d1g(16, "NOT_IN_STACK", false);
    private volatile /* synthetic */ int _isTerminated$volatile;
    public final int a;
    public final int b;
    public final long c;
    private volatile /* synthetic */ long controlState$volatile;
    public final String d;
    public final pd5 e;
    public final pd5 f;
    public final ccb g;
    private volatile /* synthetic */ long parkedWorkersStack$volatile;

    public rb2(int i2, int i3, long j2, String str) {
        this.a = i2;
        this.b = i3;
        this.c = j2;
        this.d = str;
        if (i2 < 1) {
            ywb.g(ev6.w("Core pool size ", i2, " should be at least 1"));
            throw null;
        }
        if (i3 < i2) {
            ywb.g(ev6.v("Max pool size ", i3, i2, " should be greater than or equals to core pool size "));
            throw null;
        }
        if (i3 > 2097150) {
            ywb.g(ev6.w("Max pool size ", i3, " should not exceed maximal supported number of threads 2097150"));
            throw null;
        }
        if (j2 <= 0) {
            ywb.g(b09.x("Idle worker keep alive time ", " must be positive", j2));
            throw null;
        }
        this.e = new pd5();
        this.f = new pd5();
        this.g = new ccb((i2 + 1) * 2);
        this.controlState$volatile = ((long) i2) << 42;
    }

    public static /* synthetic */ void p(rb2 rb2Var, Runnable runnable, int i2) {
        rb2Var.m(runnable, false, (i2 & 4) == 0);
    }

    public final void B(pb2 pb2Var, int i2, int i3) {
        while (true) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = h;
            long j2 = atomicLongFieldUpdater.get(this);
            int i4 = (int) (2097151 & j2);
            long j3 = (2097152 + j2) & (-2097152);
            if (i4 == i2) {
                if (i3 == 0) {
                    Object objC = pb2Var.c();
                    while (true) {
                        if (objC == k) {
                            i4 = -1;
                            break;
                        }
                        if (objC == null) {
                            i4 = 0;
                            break;
                        }
                        pb2 pb2Var2 = (pb2) objC;
                        int iB = pb2Var2.b();
                        if (iB != 0) {
                            i4 = iB;
                            break;
                        }
                        objC = pb2Var2.c();
                    }
                } else {
                    i4 = i3;
                }
            }
            if (i4 >= 0) {
                long j4 = j3 | ((long) i4);
                rb2 rb2Var = this;
                if (atomicLongFieldUpdater.compareAndSet(rb2Var, j2, j4)) {
                    return;
                } else {
                    this = rb2Var;
                }
            }
        }
    }

    public final boolean D(long j2) {
        int i2 = ((int) (2097151 & j2)) - ((int) ((j2 & 4398044413952L) >> 21));
        if (i2 < 0) {
            i2 = 0;
        }
        int i3 = this.a;
        if (i2 < i3) {
            int iF = f();
            if (iF == 1 && i3 > 1) {
                f();
            }
            if (iF > 0) {
                return true;
            }
        }
        return false;
    }

    public final boolean I() {
        rb2 rb2Var;
        d1g d1gVar;
        int iB;
        while (true) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = h;
            long j2 = atomicLongFieldUpdater.get(this);
            pb2 pb2Var = (pb2) this.g.b((int) (2097151 & j2));
            if (pb2Var == null) {
                pb2Var = null;
                rb2Var = this;
            } else {
                long j3 = (2097152 + j2) & (-2097152);
                Object objC = pb2Var.c();
                while (true) {
                    d1gVar = k;
                    if (objC == d1gVar) {
                        iB = -1;
                        break;
                    }
                    if (objC == null) {
                        iB = 0;
                        break;
                    }
                    pb2 pb2Var2 = (pb2) objC;
                    iB = pb2Var2.b();
                    if (iB != 0) {
                        break;
                    }
                    objC = pb2Var2.c();
                    atomicLongFieldUpdater = atomicLongFieldUpdater;
                    this = this;
                }
                if (iB >= 0) {
                    rb2 rb2Var2 = this;
                    boolean zCompareAndSet = atomicLongFieldUpdater.compareAndSet(rb2Var2, j2, j3 | ((long) iB));
                    rb2Var = rb2Var2;
                    if (zCompareAndSet) {
                        pb2Var.g(d1gVar);
                    }
                    this = rb2Var;
                } else {
                    continue;
                }
            }
            if (pb2Var == null) {
                return false;
            }
            if (pb2.i.compareAndSet(pb2Var, -1, 0)) {
                LockSupport.unpark(pb2Var);
                return true;
            }
            this = rb2Var;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0085  */
    @Override // java.io.Closeable, java.lang.AutoCloseable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void close() throws java.lang.InterruptedException {
        /*
            r9 = this;
            java.util.concurrent.atomic.AtomicIntegerFieldUpdater r0 = defpackage.rb2.j
            r1 = 0
            r2 = 1
            boolean r0 = r0.compareAndSet(r9, r1, r2)
            if (r0 != 0) goto Lb
            return
        Lb:
            java.lang.Thread r0 = java.lang.Thread.currentThread()
            boolean r1 = r0 instanceof defpackage.pb2
            r3 = 0
            if (r1 == 0) goto L17
            pb2 r0 = (defpackage.pb2) r0
            goto L18
        L17:
            r0 = r3
        L18:
            if (r0 == 0) goto L1e
            rb2 r1 = r0.h
            if (r1 == r9) goto L1f
        L1e:
            r0 = r3
        L1f:
            ccb r1 = r9.g
            monitor-enter(r1)
            java.util.concurrent.atomic.AtomicLongFieldUpdater r4 = defpackage.rb2.i     // Catch: java.lang.Throwable -> Lbe
            long r4 = r4.get(r9)     // Catch: java.lang.Throwable -> Lbe
            r6 = 2097151(0x1fffff, double:1.0361303E-317)
            long r4 = r4 & r6
            int r4 = (int) r4
            monitor-exit(r1)
            if (r2 > r4) goto L73
            r1 = r2
        L31:
            ccb r5 = r9.g
            java.lang.Object r5 = r5.b(r1)
            r5.getClass()
            pb2 r5 = (defpackage.pb2) r5
            if (r5 == r0) goto L6e
        L3e:
            java.lang.Thread$State r6 = r5.getState()
            java.lang.Thread$State r7 = java.lang.Thread.State.TERMINATED
            if (r6 == r7) goto L4f
            java.util.concurrent.locks.LockSupport.unpark(r5)
            r6 = 10000(0x2710, double:4.9407E-320)
            r5.join(r6)
            goto L3e
        L4f:
            w7f r5 = r5.a
            pd5 r6 = r9.f
            r5.getClass()
            long r7 = defpackage.w7f.f
            java.lang.Object r7 = defpackage.m80.a(r7, r5, r3)
            vfd r7 = (defpackage.vfd) r7
            if (r7 == 0) goto L63
            r6.a(r7)
        L63:
            vfd r7 = r5.c()
            if (r7 != 0) goto L6a
            goto L6e
        L6a:
            r6.a(r7)
            goto L63
        L6e:
            if (r1 == r4) goto L73
            int r1 = r1 + 1
            goto L31
        L73:
            pd5 r1 = r9.f
            r1.b()
            pd5 r1 = r9.e
            r1.b()
        L7d:
            if (r0 == 0) goto L85
            vfd r1 = r0.a(r2)
            if (r1 != 0) goto Lad
        L85:
            pd5 r1 = r9.e
            java.lang.Object r1 = r1.d()
            vfd r1 = (defpackage.vfd) r1
            if (r1 != 0) goto Lad
            pd5 r1 = r9.f
            java.lang.Object r1 = r1.d()
            vfd r1 = (defpackage.vfd) r1
            if (r1 != 0) goto Lad
            if (r0 == 0) goto La0
            qb2 r1 = defpackage.qb2.TERMINATED
            r0.h(r1)
        La0:
            java.util.concurrent.atomic.AtomicLongFieldUpdater r0 = defpackage.rb2.h
            r1 = 0
            r0.set(r9, r1)
            java.util.concurrent.atomic.AtomicLongFieldUpdater r0 = defpackage.rb2.i
            r0.set(r9, r1)
            return
        Lad:
            r1.run()     // Catch: java.lang.Throwable -> Lb1
            goto L7d
        Lb1:
            r1 = move-exception
            java.lang.Thread r3 = java.lang.Thread.currentThread()
            java.lang.Thread$UncaughtExceptionHandler r4 = r3.getUncaughtExceptionHandler()
            r4.uncaughtException(r3, r1)
            goto L7d
        Lbe:
            r9 = move-exception
            monitor-exit(r1)
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rb2.close():void");
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        p(this, runnable, 6);
    }

    public final int f() {
        synchronized (this.g) {
            try {
                if (j.get(this) == 1) {
                    return -1;
                }
                AtomicLongFieldUpdater atomicLongFieldUpdater = i;
                long j2 = atomicLongFieldUpdater.get(this);
                int i2 = (int) (j2 & 2097151);
                int i3 = i2 - ((int) ((j2 & 4398044413952L) >> 21));
                if (i3 < 0) {
                    i3 = 0;
                }
                if (i3 >= this.a) {
                    return 0;
                }
                if (i2 >= this.b) {
                    return 0;
                }
                int i4 = ((int) (atomicLongFieldUpdater.get(this) & 2097151)) + 1;
                if (i4 <= 0 || this.g.b(i4) != null) {
                    throw new IllegalArgumentException("Failed requirement.");
                }
                pb2 pb2Var = new pb2(this, i4);
                this.g.c(i4, pb2Var);
                if (i4 != ((int) (2097151 & atomicLongFieldUpdater.incrementAndGet(this)))) {
                    throw new IllegalArgumentException("Failed requirement.");
                }
                int i5 = i3 + 1;
                pb2Var.start();
                return i5;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void m(Runnable runnable, boolean z, boolean z2) {
        vfd zfdVar;
        qb2 qb2Var;
        dgd.f.getClass();
        long jNanoTime = System.nanoTime();
        if (runnable instanceof vfd) {
            zfdVar = (vfd) runnable;
            zfdVar.a = jNanoTime;
            zfdVar.b = z;
        } else {
            zfdVar = new zfd(runnable, jNanoTime, z);
        }
        boolean z3 = zfdVar.b;
        AtomicLongFieldUpdater atomicLongFieldUpdater = i;
        long jAddAndGet = z3 ? atomicLongFieldUpdater.addAndGet(this, 2097152L) : 0L;
        Thread threadCurrentThread = Thread.currentThread();
        pb2 pb2Var = threadCurrentThread instanceof pb2 ? (pb2) threadCurrentThread : null;
        if (pb2Var == null || pb2Var.h != this) {
            pb2Var = null;
        }
        if (pb2Var != null && (qb2Var = pb2Var.c) != qb2.TERMINATED && (zfdVar.b || qb2Var != qb2.BLOCKING)) {
            pb2Var.g = true;
            w7f w7fVar = pb2Var.a;
            if (z2) {
                zfdVar = w7fVar.a(zfdVar);
            } else {
                w7fVar.getClass();
                vfd vfdVar = (vfd) m80.a(w7f.f, w7fVar, zfdVar);
                zfdVar = vfdVar == null ? null : w7fVar.a(vfdVar);
            }
        }
        if (zfdVar != null) {
            if (!(zfdVar.b ? this.f.a(zfdVar) : this.e.a(zfdVar))) {
                throw new RejectedExecutionException(ka1.v(new StringBuilder(), this.d, " was terminated"));
            }
        }
        if (z3) {
            if (I() || D(jAddAndGet)) {
                return;
            }
            I();
            return;
        }
        if (I() || D(atomicLongFieldUpdater.get(this))) {
            return;
        }
        I();
    }

    public final String toString() {
        ArrayList arrayList = new ArrayList();
        ccb ccbVar = this.g;
        int iA = ccbVar.a();
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        for (int i7 = 1; i7 < iA; i7++) {
            pb2 pb2Var = (pb2) ccbVar.b(i7);
            if (pb2Var != null) {
                w7f w7fVar = pb2Var.a;
                w7fVar.getClass();
                Object objectVolatile = m80.a.getObjectVolatile(w7fVar, w7f.f);
                int iB = w7fVar.b();
                if (objectVolatile != null) {
                    iB++;
                }
                int i8 = ob2.a[pb2Var.c.ordinal()];
                if (i8 == 1) {
                    i4++;
                } else if (i8 == 2) {
                    i3++;
                    StringBuilder sb = new StringBuilder();
                    sb.append(iB);
                    sb.append('b');
                    arrayList.add(sb.toString());
                } else if (i8 == 3) {
                    i2++;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(iB);
                    sb2.append('c');
                    arrayList.add(sb2.toString());
                } else if (i8 == 4) {
                    i5++;
                    if (iB > 0) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append(iB);
                        sb3.append('d');
                        arrayList.add(sb3.toString());
                    }
                } else {
                    if (i8 != 5) {
                        ygf.a();
                        return null;
                    }
                    i6++;
                }
            }
        }
        long j2 = i.get(this);
        StringBuilder sb4 = new StringBuilder();
        sb4.append(this.d);
        sb4.append('@');
        sb4.append(vv2.I(this));
        sb4.append("[Pool Size {core = ");
        int i9 = this.a;
        sb4.append(i9);
        sb4.append(", max = ");
        sb4.append(this.b);
        sb4.append("}, Worker States {CPU = ");
        sb4.append(i2);
        sb4.append(", blocking = ");
        sb4.append(i3);
        sb4.append(", parked = ");
        sb4.append(i4);
        sb4.append(", dormant = ");
        sb4.append(i5);
        sb4.append(", terminated = ");
        sb4.append(i6);
        sb4.append("}, running workers queues = ");
        sb4.append(arrayList);
        sb4.append(", global CPU queue size = ");
        sb4.append(this.e.c());
        sb4.append(", global blocking queue size = ");
        sb4.append(this.f.c());
        sb4.append(", Control State {created workers= ");
        sb4.append((int) (2097151 & j2));
        sb4.append(", blocking tasks = ");
        sb4.append((int) ((4398044413952L & j2) >> 21));
        sb4.append(", CPUs acquired = ");
        sb4.append(i9 - ((int) ((j2 & 9223367638808264704L) >> 42)));
        sb4.append("}]");
        return sb4.toString();
    }
}
