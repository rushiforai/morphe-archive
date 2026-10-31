package a90;

import b.c0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.logging.Logger;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: h, reason: collision with root package name */
    public static final lm.e f523h = new lm.e(1);

    /* renamed from: i, reason: collision with root package name */
    public static final e f524i;

    /* renamed from: j, reason: collision with root package name */
    public static final Logger f525j;

    /* renamed from: a, reason: collision with root package name */
    public final vm.c f526a;

    /* renamed from: c, reason: collision with root package name */
    public boolean f528c;

    /* renamed from: d, reason: collision with root package name */
    public long f529d;

    /* renamed from: b, reason: collision with root package name */
    public int f527b = 10000;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f530e = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f531f = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public final d f532g = new d(this, 0);

    static {
        String name = y80.c.f96859g + " TaskRunner";
        Intrinsics.g(name, "name");
        f524i = new e(new vm.c(new y80.b(name, true)));
        Logger logger = Logger.getLogger(e.class.getName());
        Intrinsics.f(logger, "getLogger(TaskRunner::class.java.name)");
        f525j = logger;
    }

    public e(vm.c cVar) {
        this.f526a = cVar;
    }

    public static final void a(e eVar, a aVar) {
        byte[] bArr = y80.c.f96853a;
        Thread threadCurrentThread = Thread.currentThread();
        String name = threadCurrentThread.getName();
        threadCurrentThread.setName(aVar.f509a);
        try {
            long jA = aVar.a();
            synchronized (eVar) {
                eVar.b(aVar, jA);
                Unit unit = Unit.f71706a;
            }
            threadCurrentThread.setName(name);
        } catch (Throwable th2) {
            synchronized (eVar) {
                eVar.b(aVar, -1L);
                Unit unit2 = Unit.f71706a;
                threadCurrentThread.setName(name);
                throw th2;
            }
        }
    }

    public final void b(a aVar, long j11) {
        byte[] bArr = y80.c.f96853a;
        c cVar = aVar.f511c;
        Intrinsics.d(cVar);
        if (cVar.f518d != aVar) {
            throw new IllegalStateException("Check failed.");
        }
        boolean z11 = cVar.f520f;
        cVar.f520f = false;
        cVar.f518d = null;
        this.f530e.remove(cVar);
        if (j11 != -1 && !z11 && !cVar.f517c) {
            cVar.e(aVar, j11, true);
        }
        if (cVar.f519e.isEmpty()) {
            return;
        }
        this.f531f.add(cVar);
    }

    public final a c() {
        boolean z11;
        byte[] bArr = y80.c.f96853a;
        while (true) {
            ArrayList arrayList = this.f531f;
            if (arrayList.isEmpty()) {
                break;
            }
            long jNanoTime = System.nanoTime();
            Iterator it = arrayList.iterator();
            long jMin = Long.MAX_VALUE;
            a aVar = null;
            while (true) {
                if (!it.hasNext()) {
                    z11 = false;
                    break;
                }
                a aVar2 = (a) ((c) it.next()).f519e.get(0);
                long jMax = Math.max(0L, aVar2.f512d - jNanoTime);
                if (jMax > 0) {
                    jMin = Math.min(jMax, jMin);
                } else {
                    if (aVar != null) {
                        z11 = true;
                        break;
                    }
                    aVar = aVar2;
                }
            }
            ArrayList arrayList2 = this.f530e;
            if (aVar != null) {
                byte[] bArr2 = y80.c.f96853a;
                aVar.f512d = -1L;
                c cVar = aVar.f511c;
                Intrinsics.d(cVar);
                cVar.f519e.remove(aVar);
                arrayList.remove(cVar);
                cVar.f518d = aVar;
                arrayList2.add(cVar);
                if (z11 || (!this.f528c && !arrayList.isEmpty())) {
                    d runnable = this.f532g;
                    Intrinsics.g(runnable, "runnable");
                    ((ThreadPoolExecutor) this.f526a.f92857b).execute(runnable);
                }
                return aVar;
            }
            if (!this.f528c) {
                this.f528c = true;
                this.f529d = jNanoTime + jMin;
                try {
                    try {
                        long j11 = jMin / 1000000;
                        long j12 = jMin - (1000000 * j11);
                        if (j11 > 0 || jMin > 0) {
                            wait(j11, (int) j12);
                        }
                    } catch (InterruptedException unused) {
                        for (int size = arrayList2.size() - 1; -1 < size; size--) {
                            ((c) arrayList2.get(size)).b();
                        }
                        for (int size2 = arrayList.size() - 1; -1 < size2; size2--) {
                            c cVar2 = (c) arrayList.get(size2);
                            cVar2.b();
                            if (cVar2.f519e.isEmpty()) {
                                arrayList.remove(size2);
                            }
                        }
                    }
                } finally {
                    this.f528c = false;
                }
            } else if (jMin < this.f529d - jNanoTime) {
                notify();
            }
        }
        return null;
    }

    public final void d(c taskQueue) {
        Intrinsics.g(taskQueue, "taskQueue");
        byte[] bArr = y80.c.f96853a;
        if (taskQueue.f518d == null) {
            boolean zIsEmpty = taskQueue.f519e.isEmpty();
            ArrayList arrayList = this.f531f;
            if (zIsEmpty) {
                arrayList.remove(taskQueue);
            } else {
                Intrinsics.g(arrayList, "<this>");
                if (!arrayList.contains(taskQueue)) {
                    arrayList.add(taskQueue);
                }
            }
        }
        if (this.f528c) {
            notify();
            return;
        }
        d runnable = this.f532g;
        Intrinsics.g(runnable, "runnable");
        ((ThreadPoolExecutor) this.f526a.f92857b).execute(runnable);
    }

    public final c e() {
        int i5;
        synchronized (this) {
            i5 = this.f527b;
            this.f527b = i5 + 1;
        }
        return new c(this, c0.h(i5, "Q"));
    }
}
