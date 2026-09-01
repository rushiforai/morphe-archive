package defpackage;

import io.reactivex.exceptions.CompositeException;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class do6 extends AtomicReference implements jn8, sh3 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public do6(jn8 jn8Var) {
        this.a = 1;
        this.b = jn8Var;
        this.c = new AtomicReference();
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        switch (this.a) {
            case 0:
                zh3.setOnce(this, sh3Var);
                break;
            default:
                zh3.setOnce((AtomicReference) this.c, sh3Var);
                break;
        }
    }

    @Override // defpackage.sh3
    public final void dispose() {
        switch (this.a) {
            case 0:
                zh3.dispose(this);
                break;
            default:
                zh3.dispose((AtomicReference) this.c);
                zh3.dispose(this);
                break;
        }
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        switch (this.a) {
            case 0:
                Object obj = get();
                zh3 zh3Var = zh3.DISPOSED;
                if (obj != zh3Var) {
                    lazySet(zh3Var);
                    break;
                }
                break;
            default:
                ((jn8) this.b).onComplete();
                break;
        }
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        switch (this.a) {
            case 0:
                Object obj = get();
                zh3 zh3Var = zh3.DISPOSED;
                if (obj == zh3Var) {
                    ok7.H(th);
                } else {
                    lazySet(zh3Var);
                    try {
                        ((s72) this.c).accept(th);
                    } catch (Throwable th2) {
                        pwd.c0(th2);
                        ok7.H(new CompositeException(th, th2));
                        return;
                    }
                }
                break;
            default:
                ((jn8) this.b).onError(th);
                break;
        }
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                if (get() != zh3.DISPOSED) {
                    try {
                        ((s72) obj2).accept(obj);
                    } catch (Throwable th) {
                        pwd.c0(th);
                        ((sh3) get()).dispose();
                        onError(th);
                        return;
                    }
                    break;
                }
                break;
            default:
                ((jn8) obj2).onNext(obj);
                break;
        }
    }

    public do6(s72 s72Var, s72 s72Var2) {
        this.a = 0;
        this.b = s72Var;
        this.c = s72Var2;
    }
}
