package defpackage;

import io.reactivex.exceptions.MissingBackpressureException;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oq4 extends po0 implements uq4 {
    public final ywc a;
    public final eec b;
    public rxc c;
    public volatile boolean d;
    public volatile boolean e;
    public Throwable f;
    public final AtomicLong g = new AtomicLong();
    public boolean h;

    public oq4(ywc ywcVar, int i) {
        this.a = ywcVar;
        this.b = new ylc(i);
    }

    @Override // defpackage.ywc
    public final void a(rxc rxcVar) {
        if (yxc.validate(this.c, rxcVar)) {
            this.c = rxcVar;
            this.a.a(this);
            rxcVar.request(Long.MAX_VALUE);
        }
    }

    public final boolean b(boolean z, boolean z2, ywc ywcVar) {
        if (this.d) {
            this.b.clear();
            return true;
        }
        if (!z) {
            return false;
        }
        Throwable th = this.f;
        if (th != null) {
            this.b.clear();
            ywcVar.onError(th);
            return true;
        }
        if (!z2) {
            return false;
        }
        ywcVar.onComplete();
        return true;
    }

    public final void c() {
        if (getAndIncrement() == 0) {
            eec eecVar = this.b;
            ywc ywcVar = this.a;
            int iAddAndGet = 1;
            while (!b(this.e, eecVar.isEmpty(), ywcVar)) {
                long j = this.g.get();
                long j2 = 0;
                while (j2 != j) {
                    boolean z = this.e;
                    Object objPoll = eecVar.poll();
                    boolean z2 = objPoll == null;
                    if (b(z, z2, ywcVar)) {
                        return;
                    }
                    if (z2) {
                        break;
                    }
                    ywcVar.onNext(objPoll);
                    j2++;
                }
                if (j2 == j && b(this.e, eecVar.isEmpty(), ywcVar)) {
                    return;
                }
                if (j2 != 0 && j != Long.MAX_VALUE) {
                    this.g.addAndGet(-j2);
                }
                iAddAndGet = addAndGet(-iAddAndGet);
                if (iAddAndGet == 0) {
                    return;
                }
            }
        }
    }

    @Override // defpackage.rxc
    public final void cancel() {
        if (this.d) {
            return;
        }
        this.d = true;
        this.c.cancel();
        if (this.h || getAndIncrement() != 0) {
            return;
        }
        this.b.clear();
    }

    @Override // defpackage.fec
    public final void clear() {
        this.b.clear();
    }

    @Override // defpackage.fec
    public final boolean isEmpty() {
        return this.b.isEmpty();
    }

    @Override // defpackage.ywc
    public final void onComplete() {
        this.e = true;
        if (this.h) {
            this.a.onComplete();
        } else {
            c();
        }
    }

    @Override // defpackage.ywc
    public final void onError(Throwable th) {
        this.f = th;
        this.e = true;
        if (this.h) {
            this.a.onError(th);
        } else {
            c();
        }
    }

    @Override // defpackage.ywc
    public final void onNext(Object obj) {
        if (!this.b.offer(obj)) {
            this.c.cancel();
            onError(new MissingBackpressureException("Buffer is full"));
        } else if (this.h) {
            this.a.onNext(null);
        } else {
            c();
        }
    }

    @Override // defpackage.fec
    public final Object poll() {
        return this.b.poll();
    }

    @Override // defpackage.rxc
    public final void request(long j) {
        if (this.h || !yxc.validate(j)) {
            return;
        }
        qb8.y(this.g, j);
        c();
    }

    @Override // defpackage.dra
    public final int requestFusion(int i) {
        this.h = true;
        return 2;
    }
}
