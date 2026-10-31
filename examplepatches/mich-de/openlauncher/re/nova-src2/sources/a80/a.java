package a80;

import androidx.compose.ui.node.LayoutNode;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.concurrent.locks.LockSupport;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class a extends Thread {

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f462i = AtomicIntegerFieldUpdater.newUpdater(a.class, "workerCtl$volatile");

    /* renamed from: a, reason: collision with root package name */
    public final n f463a;

    /* renamed from: b, reason: collision with root package name */
    public final Ref.ObjectRef f464b;

    /* renamed from: c, reason: collision with root package name */
    public b f465c;

    /* renamed from: d, reason: collision with root package name */
    public long f466d;

    /* renamed from: e, reason: collision with root package name */
    public long f467e;

    /* renamed from: f, reason: collision with root package name */
    public int f468f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f469g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ c f470h;
    private volatile int indexInArray;

    @Nullable
    private volatile Object nextParkedWorker;
    private volatile /* synthetic */ int workerCtl$volatile;

    public a(c cVar, int i5) {
        this.f470h = cVar;
        setDaemon(true);
        setContextClassLoader(c.class.getClassLoader());
        this.f463a = new n();
        this.f464b = new Ref.ObjectRef();
        this.f465c = b.f474d;
        this.nextParkedWorker = c.f480k;
        int iNanoTime = (int) System.nanoTime();
        this.f468f = iNanoTime == 0 ? 42 : iNanoTime;
        f(i5);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0041, code lost:
    
        r12 = a80.n.f505d.get(r10);
        r0 = a80.n.f504c.get(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x004d, code lost:
    
        if (r12 == r0) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0055, code lost:
    
        if (a80.n.f506e.get(r10) != 0) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0058, code lost:
    
        r0 = r0 - 1;
        r1 = r10.c(r0, true);
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x005e, code lost:
    
        if (r1 == null) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0060, code lost:
    
        r8 = r1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final i a(boolean z11) {
        i iVarE;
        i iVarE2;
        long j11;
        b bVar = this.f465c;
        b bVar2 = b.f471a;
        c cVar = this.f470h;
        i iVar = null;
        n nVar = this.f463a;
        if (bVar != bVar2) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = c.f478i;
            do {
                j11 = atomicLongFieldUpdater.get(cVar);
                if (((int) ((9223367638808264704L & j11) >> 42)) == 0) {
                    nVar.getClass();
                    loop1: while (true) {
                        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = n.f503b;
                        i iVar2 = (i) atomicReferenceFieldUpdater.get(nVar);
                        if (iVar2 == null || !iVar2.f494b) {
                            break;
                        }
                        while (!atomicReferenceFieldUpdater.compareAndSet(nVar, iVar2, null)) {
                            if (atomicReferenceFieldUpdater.get(nVar) != iVar2) {
                                break;
                            }
                        }
                        iVar = iVar2;
                        break loop1;
                    }
                    if (iVar != null) {
                        return iVar;
                    }
                    i iVar3 = (i) cVar.f486f.c();
                    return iVar3 == null ? i(1) : iVar3;
                }
            } while (!c.f478i.compareAndSet(cVar, j11, j11 - 4398046511104L));
            this.f465c = b.f471a;
        }
        if (z11) {
            boolean z12 = d(cVar.f481a * 2) == 0;
            if (z12 && (iVarE2 = e()) != null) {
                return iVarE2;
            }
            nVar.getClass();
            i iVarB = (i) n.f503b.getAndSet(nVar, null);
            if (iVarB == null) {
                iVarB = nVar.b();
            }
            if (iVarB != null) {
                return iVarB;
            }
            if (!z12 && (iVarE = e()) != null) {
                return iVarE;
            }
        } else {
            i iVarE3 = e();
            if (iVarE3 != null) {
                return iVarE3;
            }
        }
        return i(3);
    }

    public final int b() {
        return this.indexInArray;
    }

    public final Object c() {
        return this.nextParkedWorker;
    }

    public final int d(int i5) {
        int i11 = this.f468f;
        int i12 = i11 ^ (i11 << 13);
        int i13 = i12 ^ (i12 >> 17);
        int i14 = i13 ^ (i13 << 5);
        this.f468f = i14;
        int i15 = i5 - 1;
        return (i15 & i5) == 0 ? i14 & i15 : (i14 & LayoutNode.NotPlacedPlaceOrder) % i5;
    }

    public final i e() {
        int iD = d(2);
        c cVar = this.f470h;
        if (iD == 0) {
            i iVar = (i) cVar.f485e.c();
            return iVar != null ? iVar : (i) cVar.f486f.c();
        }
        i iVar2 = (i) cVar.f486f.c();
        return iVar2 != null ? iVar2 : (i) cVar.f485e.c();
    }

    public final void f(int i5) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f470h.f484d);
        sb2.append("-worker-");
        sb2.append(i5 == 0 ? "TERMINATED" : String.valueOf(i5));
        setName(sb2.toString());
        this.indexInArray = i5;
    }

    public final void g(Object obj) {
        this.nextParkedWorker = obj;
    }

    public final boolean h(b bVar) {
        b bVar2 = this.f465c;
        boolean z11 = bVar2 == b.f471a;
        if (z11) {
            c.f478i.addAndGet(this.f470h, 4398046511104L);
        }
        if (bVar2 != bVar) {
            this.f465c = bVar;
        }
        return z11;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x006b, code lost:
    
        r7 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x009f, code lost:
    
        r7 = -2;
        r5 = r4;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final i i(int i5) {
        long j11;
        i iVarC;
        long j12;
        long j13;
        i iVar;
        AtomicLongFieldUpdater atomicLongFieldUpdater = c.f478i;
        c cVar = this.f470h;
        int i11 = (int) (atomicLongFieldUpdater.get(cVar) & 2097151);
        i iVar2 = null;
        if (i11 < 2) {
            return null;
        }
        int iD = d(i11);
        int i12 = 0;
        long jMin = Long.MAX_VALUE;
        while (i12 < i11) {
            iD++;
            if (iD > i11) {
                iD = 1;
            }
            a aVar = (a) cVar.f487g.b(iD);
            if (aVar != null && aVar != this) {
                n nVar = aVar.f463a;
                if (i5 != 3) {
                    nVar.getClass();
                    int i13 = n.f505d.get(nVar);
                    int i14 = n.f504c.get(nVar);
                    boolean z11 = i5 == 1;
                    while (true) {
                        if (i13 == i14) {
                            j11 = 0;
                            break;
                        }
                        j11 = 0;
                        if (!z11 || n.f506e.get(nVar) != 0) {
                            int i15 = i13 + 1;
                            iVarC = nVar.c(i13, z11);
                            if (iVarC != null) {
                                break;
                            }
                            i13 = i15;
                        } else {
                            break;
                        }
                    }
                } else {
                    iVarC = nVar.b();
                    j11 = 0;
                }
                Ref.ObjectRef objectRef = this.f464b;
                if (iVarC != null) {
                    objectRef.f71863a = iVarC;
                    iVar = iVar2;
                    j13 = -1;
                    j12 = -1;
                } else {
                    while (true) {
                        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = n.f503b;
                        i iVar3 = (i) atomicReferenceFieldUpdater.get(nVar);
                        if (iVar3 == null) {
                            j12 = -1;
                            break;
                        }
                        j12 = -1;
                        if (((iVar3.f494b ? 1 : 2) & i5) == 0) {
                            break;
                        }
                        k.f501f.getClass();
                        n nVar2 = nVar;
                        long jNanoTime = System.nanoTime() - iVar3.f493a;
                        long j14 = k.f497b;
                        if (jNanoTime < j14) {
                            j13 = j14 - jNanoTime;
                            iVar = null;
                            break;
                        }
                        do {
                            iVar = null;
                            if (atomicReferenceFieldUpdater.compareAndSet(nVar2, iVar3, null)) {
                                objectRef.f71863a = iVar3;
                                j13 = -1;
                                break;
                            }
                        } while (atomicReferenceFieldUpdater.get(nVar2) == iVar3);
                        nVar = nVar2;
                        iVar2 = null;
                    }
                }
                if (j13 == j12) {
                    i iVar4 = (i) objectRef.f71863a;
                    objectRef.f71863a = iVar;
                    return iVar4;
                }
                if (j13 > j11) {
                    jMin = Math.min(jMin, j13);
                }
            }
            i12++;
            iVar2 = null;
        }
        if (jMin == Long.MAX_VALUE) {
            jMin = 0;
        }
        this.f467e = jMin;
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:124:0x0004, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x0004, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x0004, code lost:
    
        continue;
     */
    @Override // java.lang.Thread, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        long j11;
        loop0: while (true) {
            boolean z11 = false;
            while (c.f479j.get(this.f470h) != 1) {
                b bVar = this.f465c;
                b bVar2 = b.f475e;
                if (bVar == bVar2) {
                    break loop0;
                }
                i iVarA = a(this.f469g);
                if (iVarA != null) {
                    this.f467e = 0L;
                    c cVar = this.f470h;
                    this.f466d = 0L;
                    if (this.f465c == b.f473c) {
                        this.f465c = b.f472b;
                    }
                    if (iVarA.f494b) {
                        if (h(b.f472b) && !cVar.f() && !cVar.e(c.f478i.get(cVar))) {
                            cVar.f();
                        }
                        try {
                            iVarA.run();
                        } catch (Throwable th2) {
                            Thread threadCurrentThread = Thread.currentThread();
                            threadCurrentThread.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread, th2);
                        }
                        c.f478i.addAndGet(cVar, -2097152L);
                        if (this.f465c != bVar2) {
                            this.f465c = b.f474d;
                        }
                    } else {
                        try {
                            iVarA.run();
                        } catch (Throwable th3) {
                            Thread threadCurrentThread2 = Thread.currentThread();
                            threadCurrentThread2.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread2, th3);
                        }
                    }
                } else {
                    this.f469g = false;
                    if (this.f467e == 0) {
                        Object obj = this.nextParkedWorker;
                        w50.g gVar = c.f480k;
                        if (obj != gVar) {
                            f462i.set(this, -1);
                            while (this.nextParkedWorker != c.f480k) {
                                AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = f462i;
                                if (atomicIntegerFieldUpdater.get(this) == -1) {
                                    c cVar2 = this.f470h;
                                    AtomicIntegerFieldUpdater atomicIntegerFieldUpdater2 = c.f479j;
                                    if (atomicIntegerFieldUpdater2.get(cVar2) == 1) {
                                        break;
                                    }
                                    b bVar3 = this.f465c;
                                    b bVar4 = b.f475e;
                                    if (bVar3 == bVar4) {
                                        break;
                                    }
                                    h(b.f473c);
                                    Thread.interrupted();
                                    if (this.f466d == 0) {
                                        j11 = 2097151;
                                        this.f466d = System.nanoTime() + this.f470h.f483c;
                                    } else {
                                        j11 = 2097151;
                                    }
                                    LockSupport.parkNanos(this.f470h.f483c);
                                    if (System.nanoTime() - this.f466d >= 0) {
                                        this.f466d = 0L;
                                        c cVar3 = this.f470h;
                                        synchronized (cVar3.f487g) {
                                            try {
                                                if (!(atomicIntegerFieldUpdater2.get(cVar3) == 1)) {
                                                    AtomicLongFieldUpdater atomicLongFieldUpdater = c.f478i;
                                                    if (((int) (atomicLongFieldUpdater.get(cVar3) & j11)) > cVar3.f481a) {
                                                        if (atomicIntegerFieldUpdater.compareAndSet(this, -1, 1)) {
                                                            int i5 = this.indexInArray;
                                                            f(0);
                                                            cVar3.d(this, i5, 0);
                                                            int andDecrement = (int) (atomicLongFieldUpdater.getAndDecrement(cVar3) & j11);
                                                            if (andDecrement != i5) {
                                                                Object objB = cVar3.f487g.b(andDecrement);
                                                                Intrinsics.d(objB);
                                                                a aVar = (a) objB;
                                                                cVar3.f487g.c(i5, aVar);
                                                                aVar.f(i5);
                                                                cVar3.d(aVar, andDecrement, i5);
                                                            }
                                                            cVar3.f487g.c(andDecrement, null);
                                                            Unit unit = Unit.f71706a;
                                                            this.f465c = bVar4;
                                                        }
                                                    }
                                                }
                                            } catch (Throwable th4) {
                                                throw th4;
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            c cVar4 = this.f470h;
                            if (this.nextParkedWorker == gVar) {
                                AtomicLongFieldUpdater atomicLongFieldUpdater2 = c.f477h;
                                while (true) {
                                    long j12 = atomicLongFieldUpdater2.get(cVar4);
                                    int i11 = this.indexInArray;
                                    this.nextParkedWorker = cVar4.f487g.b((int) (j12 & 2097151));
                                    c cVar5 = cVar4;
                                    if (c.f477h.compareAndSet(cVar5, j12, ((j12 + 2097152) & (-2097152)) | i11)) {
                                        break;
                                    } else {
                                        cVar4 = cVar5;
                                    }
                                }
                            }
                        }
                    } else if (z11) {
                        h(b.f473c);
                        Thread.interrupted();
                        LockSupport.parkNanos(this.f467e);
                        this.f467e = 0L;
                    } else {
                        z11 = true;
                    }
                }
            }
            break loop0;
        }
        h(b.f475e);
    }
}
