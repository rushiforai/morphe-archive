package vb0;

import java.util.concurrent.atomic.AtomicReference;
import pb0.d;
import pb0.h;
import pb0.m;
import rb0.e;

/* loaded from: classes5.dex */
public final class a {

    /* renamed from: d, reason: collision with root package name */
    public static final AtomicReference f92584d = new AtomicReference();

    /* renamed from: a, reason: collision with root package name */
    public final h f92585a;

    /* renamed from: b, reason: collision with root package name */
    public final d f92586b;

    /* renamed from: c, reason: collision with root package name */
    public final kb0.d f92587c;

    public a() {
        ub0.d.f90783d.d().getClass();
        this.f92585a = new h(new e("RxComputationScheduler-"));
        this.f92586b = new d(new e("RxIoScheduler-"));
        this.f92587c = new kb0.d(new e("RxNewThreadScheduler-"));
    }

    public static d a() {
        a aVar;
        loop0: while (true) {
            AtomicReference atomicReference = f92584d;
            aVar = (a) atomicReference.get();
            if (aVar == null) {
                aVar = new a();
                while (!atomicReference.compareAndSet(null, aVar)) {
                    if (atomicReference.get() != null) {
                        synchronized (aVar) {
                            try {
                                h hVar = aVar.f92585a;
                                if (hVar != null) {
                                    hVar.shutdown();
                                }
                                d dVar = aVar.f92586b;
                                if (dVar != null) {
                                    dVar.shutdown();
                                }
                                Object obj = aVar.f92587c;
                                if (obj instanceof m) {
                                    ((m) obj).shutdown();
                                }
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                    }
                }
                break loop0;
            }
            break;
        }
        return aVar.f92586b;
    }
}
