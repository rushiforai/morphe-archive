package nb0;

import e1.m0;
import java.util.AbstractQueue;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import rx.exceptions.MissingBackpressureException;

/* loaded from: classes5.dex */
public final class f extends ib0.h {

    /* renamed from: e, reason: collision with root package name */
    public final tb0.c f78115e;

    /* renamed from: h, reason: collision with root package name */
    public final AbstractQueue f78118h;

    /* renamed from: k, reason: collision with root package name */
    public final xb0.b f78121k;

    /* renamed from: l, reason: collision with root package name */
    public volatile boolean f78122l;

    /* renamed from: m, reason: collision with root package name */
    public volatile boolean f78123m;

    /* renamed from: f, reason: collision with root package name */
    public final rb0.i f78116f = rb0.i.f85790a;

    /* renamed from: g, reason: collision with root package name */
    public final ob0.a f78117g = new ob0.a();

    /* renamed from: i, reason: collision with root package name */
    public final AtomicInteger f78119i = new AtomicInteger();

    /* renamed from: j, reason: collision with root package name */
    public final AtomicReference f78120j = new AtomicReference();

    public f(tb0.c cVar) {
        this.f78115e = cVar;
        this.f78118h = (rx.internal.util.unsafe.l.f86488a == null || rx.internal.util.unsafe.l.f86489b) ? new sb0.b(2) : new rx.internal.util.unsafe.c(2);
        this.f78121k = new xb0.b();
        f(2);
    }

    @Override // ib0.e
    public final void c(Object obj) {
        if (obj == null) {
            obj = d.f78105b;
        }
        if (this.f78118h.offer(obj)) {
            h();
        } else {
            b();
            onError(new MissingBackpressureException());
        }
    }

    public final void h() {
        if (this.f78119i.getAndIncrement() != 0) {
            return;
        }
        while (!this.f78115e.f61509a.f85789b) {
            if (!this.f78123m) {
                boolean z11 = this.f78122l;
                Object objPoll = this.f78118h.poll();
                boolean z12 = objPoll == null;
                if (z11 && z12) {
                    Throwable thB = rb0.a.b(this.f78120j);
                    if (thB == null) {
                        this.f78115e.onCompleted();
                        return;
                    } else {
                        if (thB == rb0.a.f85774a) {
                            return;
                        }
                        this.f78115e.onError(thB);
                        return;
                    }
                }
                if (!z12) {
                    try {
                        rb0.i iVar = this.f78116f;
                        if (objPoll == d.f78105b) {
                            objPoll = null;
                        }
                        iVar.getClass();
                        ib0.d dVar = (ib0.d) objPoll;
                        if (dVar == null) {
                            i(new NullPointerException("The source returned by the mapper was null"));
                            return;
                        }
                        if (dVar != a.f78096a) {
                            if (dVar instanceof rb0.g) {
                                this.f78123m = true;
                                this.f78117g.b(new m0(8, ((rb0.g) dVar).f85787b, this));
                            } else {
                                e eVar = new e(this);
                                this.f78121k.c(eVar);
                                if (eVar.f61509a.f85789b) {
                                    return;
                                }
                                this.f78123m = true;
                                dVar.d(eVar);
                            }
                            f(1L);
                        } else {
                            f(1L);
                        }
                    } catch (Throwable th2) {
                        g90.k.g0(th2);
                        i(th2);
                        return;
                    }
                }
            }
            if (this.f78119i.decrementAndGet() == 0) {
                return;
            }
        }
    }

    public final void i(Throwable th2) {
        b();
        AtomicReference atomicReference = this.f78120j;
        if (!rb0.a.a(atomicReference, th2)) {
            ub0.a.a(th2);
            return;
        }
        Throwable thB = rb0.a.b(atomicReference);
        if (thB == rb0.a.f85774a) {
            return;
        }
        this.f78115e.onError(thB);
    }

    public final void j(long j11) {
        if (j11 != 0) {
            ob0.a aVar = this.f78117g;
            if (j11 <= 0) {
                aVar.getClass();
                throw new IllegalArgumentException("n > 0 required");
            }
            synchronized (aVar) {
                try {
                    if (aVar.f80304c) {
                        aVar.f80306e += j11;
                    } else {
                        aVar.f80304c = true;
                        try {
                            long j12 = aVar.f80302a;
                            if (j12 != Long.MAX_VALUE) {
                                long j13 = j12 - j11;
                                if (j13 < 0) {
                                    throw new IllegalStateException("more items arrived than were requested");
                                }
                                aVar.f80302a = j13;
                            }
                            aVar.a();
                        } catch (Throwable th2) {
                            synchronized (aVar) {
                                aVar.f80304c = false;
                                throw th2;
                            }
                        }
                    }
                } finally {
                }
            }
        }
        this.f78123m = false;
        h();
    }

    @Override // ib0.e
    public final void onCompleted() {
        this.f78122l = true;
        h();
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        if (!rb0.a.a(this.f78120j, th2)) {
            ub0.a.a(th2);
            return;
        }
        this.f78122l = true;
        Throwable thB = rb0.a.b(this.f78120j);
        if (thB != rb0.a.f85774a) {
            this.f78115e.onError(thB);
        }
        this.f78121k.b();
    }
}
