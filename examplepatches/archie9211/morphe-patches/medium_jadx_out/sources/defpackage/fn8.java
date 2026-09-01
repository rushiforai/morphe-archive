package defpackage;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fn8 extends AtomicInteger implements jn8, sh3, Runnable {
    public final jn8 a;
    public final nqb b;
    public final AtomicReference c = new AtomicReference();
    public sh3 d;
    public volatile boolean e;
    public Throwable f;
    public volatile boolean g;
    public volatile boolean h;
    public boolean i;

    public fn8(jn8 jn8Var, nqb nqbVar) {
        this.a = jn8Var;
        this.b = nqbVar;
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        if (zh3.validate(this.d, sh3Var)) {
            this.d = sh3Var;
            this.a.a(this);
        }
    }

    public final void b() {
        if (getAndIncrement() != 0) {
            return;
        }
        AtomicReference atomicReference = this.c;
        jn8 jn8Var = this.a;
        int iAddAndGet = 1;
        while (!this.g) {
            boolean z = this.e;
            if (z && this.f != null) {
                atomicReference.lazySet(null);
                jn8Var.onError(this.f);
                this.b.dispose();
                return;
            }
            boolean z2 = atomicReference.get() == null;
            if (z) {
                atomicReference.getAndSet(null);
                jn8Var.onComplete();
                this.b.dispose();
                return;
            }
            if (z2) {
                if (this.h) {
                    this.i = false;
                    this.h = false;
                }
            } else if (!this.i || this.h) {
                jn8Var.onNext(atomicReference.getAndSet(null));
                this.h = false;
                this.i = true;
                this.b.a(this, 1000L, TimeUnit.MILLISECONDS);
            }
            iAddAndGet = addAndGet(-iAddAndGet);
            if (iAddAndGet == 0) {
                return;
            }
        }
        atomicReference.lazySet(null);
    }

    @Override // defpackage.sh3
    public final void dispose() {
        this.g = true;
        this.d.dispose();
        this.b.dispose();
        if (getAndIncrement() == 0) {
            this.c.lazySet(null);
        }
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        this.e = true;
        b();
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        this.f = th;
        this.e = true;
        b();
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        this.c.set(obj);
        b();
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.h = true;
        b();
    }
}
