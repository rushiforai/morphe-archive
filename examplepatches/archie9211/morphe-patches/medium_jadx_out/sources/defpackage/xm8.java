package defpackage;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xm8 extends AtomicReference implements Runnable, sh3 {
    public final Object a;
    public final long b;
    public final ym8 c;
    public final AtomicBoolean d = new AtomicBoolean();

    public xm8(Object obj, long j, ym8 ym8Var) {
        this.a = obj;
        this.b = j;
        this.c = ym8Var;
    }

    @Override // defpackage.sh3
    public final void dispose() {
        zh3.dispose(this);
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.d.compareAndSet(false, true)) {
            ym8 ym8Var = this.c;
            long j = this.b;
            Object obj = this.a;
            if (j == ym8Var.e) {
                ym8Var.a.onNext(obj);
                zh3.dispose(this);
            }
        }
    }
}
