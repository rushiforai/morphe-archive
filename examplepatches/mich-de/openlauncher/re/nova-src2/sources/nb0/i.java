package nb0;

import java.util.Queue;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public final class i extends h {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f78131c = 1;

    /* renamed from: d, reason: collision with root package name */
    public Throwable f78132d;

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f78133e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicInteger f78134f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f78135g;

    public i(ib0.h hVar, int i5) {
        super(hVar);
        this.f78135g = (rx.internal.util.unsafe.l.f86488a == null || rx.internal.util.unsafe.l.f86489b) ? new sb0.c(i5) : new rx.internal.util.unsafe.i(i5);
        this.f78134f = new AtomicInteger();
    }

    @Override // ib0.e
    public final void c(Object obj) {
        switch (this.f78131c) {
            case 0:
                Queue queue = (Queue) this.f78135g;
                if (obj == null) {
                    obj = d.f78105b;
                }
                queue.offer(obj);
                g();
                break;
            default:
                AtomicReference atomicReference = (AtomicReference) this.f78135g;
                if (obj == null) {
                    obj = d.f78105b;
                }
                atomicReference.set(obj);
                g();
                break;
        }
    }

    @Override // nb0.h
    public final void d() {
        switch (this.f78131c) {
            case 0:
                g();
                break;
            default:
                g();
                break;
        }
    }

    @Override // nb0.h
    public final void e() {
        switch (this.f78131c) {
            case 0:
                if (this.f78134f.getAndIncrement() == 0) {
                    ((Queue) this.f78135g).clear();
                    break;
                }
                break;
            default:
                if (this.f78134f.getAndIncrement() == 0) {
                    ((AtomicReference) this.f78135g).lazySet(null);
                    break;
                }
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:77:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x010b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void g() {
        switch (this.f78131c) {
            case 0:
                if (this.f78134f.getAndIncrement() == 0) {
                    ib0.h hVar = this.f78129a;
                    Queue queue = (Queue) this.f78135g;
                    int iAddAndGet = 1;
                    do {
                        long j11 = get();
                        for (long j12 = 0; j12 != j11; j12++) {
                            if (hVar.f61509a.f85789b) {
                                queue.clear();
                                break;
                            } else {
                                boolean z11 = this.f78133e;
                                Object objPoll = queue.poll();
                                boolean z12 = objPoll == null;
                                if (z11 && z12) {
                                    Throwable th2 = this.f78132d;
                                    if (th2 != null) {
                                        super.onError(th2);
                                        break;
                                    } else {
                                        super.onCompleted();
                                        break;
                                    }
                                } else if (z12) {
                                    if (j12 == j11) {
                                        if (hVar.f61509a.f85789b) {
                                            queue.clear();
                                            break;
                                        } else {
                                            boolean z13 = this.f78133e;
                                            boolean zIsEmpty = queue.isEmpty();
                                            if (z13 && zIsEmpty) {
                                                Throwable th3 = this.f78132d;
                                                if (th3 != null) {
                                                    super.onError(th3);
                                                    break;
                                                } else {
                                                    super.onCompleted();
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                    if (j12 != 0) {
                                        jk.b.S(this, j12);
                                    }
                                    iAddAndGet = this.f78134f.addAndGet(-iAddAndGet);
                                } else {
                                    if (objPoll == d.f78105b) {
                                        objPoll = null;
                                    }
                                    hVar.c(objPoll);
                                }
                            }
                        }
                        if (j12 == j11) {
                        }
                        if (j12 != 0) {
                        }
                        iAddAndGet = this.f78134f.addAndGet(-iAddAndGet);
                    } while (iAddAndGet != 0);
                }
                break;
            default:
                if (this.f78134f.getAndIncrement() == 0) {
                    ib0.h hVar2 = this.f78129a;
                    AtomicReference atomicReference = (AtomicReference) this.f78135g;
                    int iAddAndGet2 = 1;
                    do {
                        long j13 = get();
                        long j14 = 0;
                        while (true) {
                            Object obj = null;
                            if (j14 != j13) {
                                if (hVar2.f61509a.f85789b) {
                                    atomicReference.lazySet(null);
                                    break;
                                } else {
                                    boolean z14 = this.f78133e;
                                    Object andSet = atomicReference.getAndSet(null);
                                    boolean z15 = andSet == null;
                                    if (z14 && z15) {
                                        Throwable th4 = this.f78132d;
                                        if (th4 != null) {
                                            super.onError(th4);
                                            break;
                                        } else {
                                            super.onCompleted();
                                            break;
                                        }
                                    } else if (!z15) {
                                        if (andSet != d.f78105b) {
                                            obj = andSet;
                                        }
                                        hVar2.c(obj);
                                        j14++;
                                    }
                                }
                            }
                        }
                        if (j14 == j13) {
                            if (hVar2.f61509a.f85789b) {
                                atomicReference.lazySet(null);
                                break;
                            } else {
                                boolean z16 = this.f78133e;
                                boolean z17 = atomicReference.get() == null;
                                if (z16 && z17) {
                                    Throwable th5 = this.f78132d;
                                    if (th5 != null) {
                                        super.onError(th5);
                                        break;
                                    } else {
                                        super.onCompleted();
                                        break;
                                    }
                                }
                            }
                        }
                        if (j14 != 0) {
                            jk.b.S(this, j14);
                        }
                        iAddAndGet2 = this.f78134f.addAndGet(-iAddAndGet2);
                    } while (iAddAndGet2 != 0);
                }
                break;
        }
    }

    @Override // nb0.h, ib0.e
    public final void onCompleted() {
        switch (this.f78131c) {
            case 0:
                this.f78133e = true;
                g();
                break;
            default:
                this.f78133e = true;
                g();
                break;
        }
    }

    @Override // nb0.h, ib0.e
    public final void onError(Throwable th2) {
        switch (this.f78131c) {
            case 0:
                this.f78132d = th2;
                this.f78133e = true;
                g();
                break;
            default:
                this.f78132d = th2;
                this.f78133e = true;
                g();
                break;
        }
    }

    public i(ib0.h hVar) {
        super(hVar);
        this.f78135g = new AtomicReference();
        this.f78134f = new AtomicInteger();
    }
}
