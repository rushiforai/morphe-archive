package defpackage;

import io.reactivex.exceptions.MissingBackpressureException;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mq4 extends po0 implements uq4, Runnable {
    public final nqb a;
    public final int b;
    public final int c;
    public final AtomicLong d = new AtomicLong();
    public rxc e;
    public fec f;
    public volatile boolean g;
    public volatile boolean h;
    public Throwable i;
    public int j;
    public long k;
    public boolean l;
    public final ywc m;

    public mq4(ywc ywcVar, nqb nqbVar, int i) {
        this.a = nqbVar;
        this.b = i;
        this.c = i - (i >> 2);
        this.m = ywcVar;
    }

    @Override // defpackage.ywc
    public final void a(rxc rxcVar) {
        if (yxc.validate(this.e, rxcVar)) {
            this.e = rxcVar;
            if (rxcVar instanceof po0) {
                po0 po0Var = (po0) rxcVar;
                int iRequestFusion = po0Var.requestFusion(7);
                if (iRequestFusion == 1) {
                    this.j = 1;
                    this.f = po0Var;
                    this.h = true;
                    this.m.a(this);
                    return;
                }
                if (iRequestFusion == 2) {
                    this.j = 2;
                    this.f = po0Var;
                    this.m.a(this);
                    rxcVar.request(this.b);
                    return;
                }
            }
            this.f = new xlc(this.b);
            this.m.a(this);
            rxcVar.request(this.b);
        }
    }

    public final boolean b(boolean z, boolean z2, ywc ywcVar) {
        if (this.g) {
            clear();
            return true;
        }
        if (!z) {
            return false;
        }
        Throwable th = this.i;
        if (th != null) {
            this.g = true;
            clear();
            ywcVar.onError(th);
            this.a.dispose();
            return true;
        }
        if (!z2) {
            return false;
        }
        this.g = true;
        ywcVar.onComplete();
        this.a.dispose();
        return true;
    }

    public final void c() {
        if (getAndIncrement() != 0) {
            return;
        }
        this.a.b(this);
    }

    @Override // defpackage.rxc
    public final void cancel() {
        if (this.g) {
            return;
        }
        this.g = true;
        this.e.cancel();
        this.a.dispose();
        if (this.l || getAndIncrement() != 0) {
            return;
        }
        this.f.clear();
    }

    @Override // defpackage.fec
    public final void clear() {
        this.f.clear();
    }

    @Override // defpackage.fec
    public final boolean isEmpty() {
        return this.f.isEmpty();
    }

    @Override // defpackage.ywc
    public final void onComplete() {
        if (this.h) {
            return;
        }
        this.h = true;
        c();
    }

    @Override // defpackage.ywc
    public final void onError(Throwable th) {
        if (this.h) {
            ok7.H(th);
            return;
        }
        this.i = th;
        this.h = true;
        c();
    }

    @Override // defpackage.ywc
    public final void onNext(Object obj) {
        if (this.h) {
            return;
        }
        if (this.j == 2) {
            c();
            return;
        }
        if (!this.f.offer(obj)) {
            this.e.cancel();
            this.i = new MissingBackpressureException("Queue is full?!");
            this.h = true;
        }
        c();
    }

    @Override // defpackage.fec
    public final Object poll() {
        Object objPoll = this.f.poll();
        if (objPoll != null && this.j != 1) {
            long j = this.k + 1;
            if (j == this.c) {
                this.k = 0L;
                this.e.request(j);
                return objPoll;
            }
            this.k = j;
        }
        return objPoll;
    }

    @Override // defpackage.rxc
    public final void request(long j) {
        if (yxc.validate(j)) {
            qb8.y(this.d, j);
            c();
        }
    }

    @Override // defpackage.dra
    public final int requestFusion(int i) {
        this.l = true;
        return 2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.l) {
            int iAddAndGet = 1;
            while (!this.g) {
                boolean z = this.h;
                this.m.onNext(null);
                if (z) {
                    this.g = true;
                    Throwable th = this.i;
                    ywc ywcVar = this.m;
                    if (th != null) {
                        ywcVar.onError(th);
                    } else {
                        ywcVar.onComplete();
                    }
                    this.a.dispose();
                    return;
                }
                iAddAndGet = addAndGet(-iAddAndGet);
                if (iAddAndGet == 0) {
                    return;
                }
            }
            return;
        }
        if (this.j == 1) {
            ywc ywcVar2 = this.m;
            fec fecVar = this.f;
            long j = this.k;
            int iAddAndGet2 = 1;
            while (true) {
                long j2 = this.d.get();
                while (j != j2) {
                    try {
                        Object objPoll = fecVar.poll();
                        if (this.g) {
                            return;
                        }
                        if (objPoll == null) {
                            this.g = true;
                            ywcVar2.onComplete();
                            this.a.dispose();
                            return;
                        }
                        ywcVar2.onNext(objPoll);
                        j++;
                    } catch (Throwable th2) {
                        pwd.c0(th2);
                        this.g = true;
                        this.e.cancel();
                        ywcVar2.onError(th2);
                        this.a.dispose();
                        return;
                    }
                }
                if (this.g) {
                    return;
                }
                if (fecVar.isEmpty()) {
                    this.g = true;
                    ywcVar2.onComplete();
                    this.a.dispose();
                    return;
                } else {
                    int i = get();
                    if (iAddAndGet2 == i) {
                        this.k = j;
                        iAddAndGet2 = addAndGet(-iAddAndGet2);
                        if (iAddAndGet2 == 0) {
                            return;
                        }
                    } else {
                        iAddAndGet2 = i;
                    }
                }
            }
        } else {
            ywc ywcVar3 = this.m;
            fec fecVar2 = this.f;
            long j3 = this.k;
            int iAddAndGet3 = 1;
            while (true) {
                long jAddAndGet = this.d.get();
                while (j3 != jAddAndGet) {
                    boolean z2 = this.h;
                    try {
                        Object objPoll2 = fecVar2.poll();
                        boolean z3 = objPoll2 == null;
                        if (b(z2, z3, ywcVar3)) {
                            return;
                        }
                        if (z3) {
                            break;
                        }
                        ywcVar3.onNext(objPoll2);
                        j3++;
                        if (j3 == this.c) {
                            if (jAddAndGet != Long.MAX_VALUE) {
                                jAddAndGet = this.d.addAndGet(-j3);
                            }
                            this.e.request(j3);
                            j3 = 0;
                        }
                    } catch (Throwable th3) {
                        pwd.c0(th3);
                        this.g = true;
                        this.e.cancel();
                        fecVar2.clear();
                        ywcVar3.onError(th3);
                        this.a.dispose();
                        return;
                    }
                }
                if (j3 == jAddAndGet && b(this.h, fecVar2.isEmpty(), ywcVar3)) {
                    return;
                }
                int i2 = get();
                if (iAddAndGet3 == i2) {
                    this.k = j3;
                    iAddAndGet3 = addAndGet(-iAddAndGet3);
                    if (iAddAndGet3 == 0) {
                        return;
                    }
                } else {
                    iAddAndGet3 = i2;
                }
            }
        }
    }
}
