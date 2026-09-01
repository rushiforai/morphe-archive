package defpackage;

import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ym8 implements jn8, sh3 {
    public final h0c a;
    public final nqb b;
    public sh3 c;
    public xm8 d;
    public volatile long e;
    public boolean f;

    public ym8(h0c h0cVar, nqb nqbVar) {
        this.a = h0cVar;
        this.b = nqbVar;
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        if (zh3.validate(this.c, sh3Var)) {
            this.c = sh3Var;
            this.a.a(this);
        }
    }

    @Override // defpackage.sh3
    public final void dispose() {
        this.c.dispose();
        this.b.dispose();
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        if (this.f) {
            return;
        }
        this.f = true;
        xm8 xm8Var = this.d;
        if (xm8Var != null) {
            zh3.dispose(xm8Var);
        }
        if (xm8Var != null) {
            xm8Var.run();
        }
        this.a.onComplete();
        this.b.dispose();
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        if (this.f) {
            ok7.H(th);
            return;
        }
        xm8 xm8Var = this.d;
        if (xm8Var != null) {
            zh3.dispose(xm8Var);
        }
        this.f = true;
        this.a.onError(th);
        this.b.dispose();
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        if (this.f) {
            return;
        }
        long j = this.e + 1;
        this.e = j;
        xm8 xm8Var = this.d;
        if (xm8Var != null) {
            zh3.dispose(xm8Var);
        }
        xm8 xm8Var2 = new xm8(obj, j, this);
        this.d = xm8Var2;
        zh3.replace(xm8Var2, this.b.a(xm8Var2, 200L, TimeUnit.MILLISECONDS));
    }
}
