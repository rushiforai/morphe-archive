package defpackage;

import io.reactivex.exceptions.MissingBackpressureException;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qq4 extends AtomicLong implements uq4, rxc {
    public final /* synthetic */ int a = 1;
    public final ywc b;
    public rxc c;
    public boolean d;

    public qq4(ywc ywcVar) {
        this.b = ywcVar;
    }

    @Override // defpackage.ywc
    public final void a(rxc rxcVar) {
        int i = this.a;
        ywc ywcVar = this.b;
        switch (i) {
            case 0:
                if (yxc.validate(this.c, rxcVar)) {
                    this.c = rxcVar;
                    ywcVar.a(this);
                    rxcVar.request(Long.MAX_VALUE);
                }
                break;
            default:
                if (yxc.validate(this.c, rxcVar)) {
                    this.c = rxcVar;
                    ywcVar.a(this);
                    rxcVar.request(Long.MAX_VALUE);
                }
                break;
        }
    }

    @Override // defpackage.rxc
    public final void cancel() {
        switch (this.a) {
            case 0:
                this.c.cancel();
                break;
            default:
                this.c.cancel();
                break;
        }
    }

    @Override // defpackage.ywc
    public final void onComplete() {
        int i = this.a;
        ywc ywcVar = this.b;
        switch (i) {
            case 0:
                if (!this.d) {
                    this.d = true;
                    ywcVar.onComplete();
                    break;
                }
                break;
            default:
                if (!this.d) {
                    this.d = true;
                    ywcVar.onComplete();
                    break;
                }
                break;
        }
    }

    @Override // defpackage.ywc
    public final void onError(Throwable th) {
        int i = this.a;
        ywc ywcVar = this.b;
        switch (i) {
            case 0:
                if (!this.d) {
                    this.d = true;
                    ywcVar.onError(th);
                } else {
                    ok7.H(th);
                }
                break;
            default:
                if (!this.d) {
                    this.d = true;
                    ywcVar.onError(th);
                } else {
                    ok7.H(th);
                }
                break;
        }
    }

    @Override // defpackage.ywc
    public final void onNext(Object obj) {
        int i = this.a;
        ywc ywcVar = this.b;
        switch (i) {
            case 0:
                if (!this.d && get() != 0) {
                    ywcVar.onNext(obj);
                    qb8.Q(this, 1L);
                }
                break;
            default:
                if (!this.d) {
                    if (get() == 0) {
                        this.c.cancel();
                        onError(new MissingBackpressureException("could not emit value due to lack of requests"));
                    } else {
                        ywcVar.onNext(obj);
                        qb8.Q(this, 1L);
                    }
                    break;
                }
                break;
        }
    }

    @Override // defpackage.rxc
    public final void request(long j) {
        switch (this.a) {
            case 0:
                if (yxc.validate(j)) {
                    qb8.y(this, j);
                }
                break;
            default:
                if (yxc.validate(j)) {
                    qb8.y(this, j);
                }
                break;
        }
    }

    public qq4(ywc ywcVar, rq4 rq4Var) {
        this.b = ywcVar;
    }
}
