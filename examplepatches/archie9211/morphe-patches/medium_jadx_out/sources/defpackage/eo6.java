package defpackage;

import io.reactivex.exceptions.CompositeException;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eo6 extends AtomicReference implements uq4, rxc, sh3 {
    public final o19 a;
    public final o19 b;
    public final lq4 c;

    public eo6(o19 o19Var, o19 o19Var2, lq4 lq4Var) {
        this.a = o19Var;
        this.b = o19Var2;
        this.c = lq4Var;
    }

    @Override // defpackage.ywc
    public final void a(rxc rxcVar) {
        if (yxc.setOnce(this, rxcVar)) {
            try {
                this.c.accept((Object) this);
            } catch (Throwable th) {
                pwd.c0(th);
                rxcVar.cancel();
                onError(th);
            }
        }
    }

    @Override // defpackage.rxc
    public final void cancel() {
        yxc.cancel(this);
    }

    @Override // defpackage.sh3
    public final void dispose() {
        yxc.cancel(this);
    }

    @Override // defpackage.ywc
    public final void onComplete() {
        Object obj = get();
        yxc yxcVar = yxc.CANCELLED;
        if (obj != yxcVar) {
            lazySet(yxcVar);
        }
    }

    @Override // defpackage.ywc
    public final void onError(Throwable th) {
        Object obj = get();
        yxc yxcVar = yxc.CANCELLED;
        if (obj == yxcVar) {
            ok7.H(th);
            return;
        }
        lazySet(yxcVar);
        try {
            this.b.accept(th);
        } catch (Throwable th2) {
            pwd.c0(th2);
            ok7.H(new CompositeException(th, th2));
        }
    }

    @Override // defpackage.ywc
    public final void onNext(Object obj) {
        if (get() == yxc.CANCELLED) {
            return;
        }
        try {
            this.a.accept(obj);
        } catch (Throwable th) {
            pwd.c0(th);
            ((rxc) get()).cancel();
            onError(th);
        }
    }

    @Override // defpackage.rxc
    public final void request(long j) {
        ((rxc) get()).request(j);
    }
}
