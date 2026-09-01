package defpackage;

import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l6g implements tig, kr8, br8, kq8 {
    public final /* synthetic */ int a;
    public final Executor b;
    public final Object c;
    public final Object d;

    public l6g(Executor executor, kq8 kq8Var) {
        this.a = 0;
        this.c = new Object();
        this.b = executor;
        this.d = kq8Var;
    }

    private final void c(jrg jrgVar) {
        synchronized (this.c) {
        }
        this.b.execute(new p0g(this, jrgVar, false, 23));
    }

    private final void d(jrg jrgVar) {
        if (jrgVar.k() || jrgVar.d) {
            return;
        }
        synchronized (this.c) {
        }
        this.b.execute(new p0g(this, jrgVar, false, 25));
    }

    private final void e(jrg jrgVar) {
        if (jrgVar.k()) {
            synchronized (this.c) {
            }
            this.b.execute(new p0g(this, jrgVar, false, 26));
        }
    }

    @Override // defpackage.kq8
    public void a() {
        ((jrg) this.d).p();
    }

    @Override // defpackage.tig
    public final void b(jrg jrgVar) {
        switch (this.a) {
            case 0:
                if (jrgVar.d) {
                    synchronized (this.c) {
                        break;
                    }
                    this.b.execute(new jn(26, this));
                    return;
                }
                return;
            case 1:
                c(jrgVar);
                return;
            case 2:
                d(jrgVar);
                return;
            case 3:
                e(jrgVar);
                return;
            default:
                this.b.execute(new p0g(this, jrgVar, false, 28));
                return;
        }
    }

    @Override // defpackage.kr8
    public void i(Object obj) {
        ((jrg) this.d).m(obj);
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        ((jrg) this.d).o(exc);
    }

    public l6g(Executor executor, xq8 xq8Var) {
        this.a = 1;
        this.c = new Object();
        this.b = executor;
        this.d = xq8Var;
    }

    public l6g(Executor executor, br8 br8Var) {
        this.a = 2;
        this.c = new Object();
        this.b = executor;
        this.d = br8Var;
    }

    public l6g(Executor executor, kr8 kr8Var) {
        this.a = 3;
        this.c = new Object();
        this.b = executor;
        this.d = kr8Var;
    }

    public l6g(Executor executor, v0d v0dVar, jrg jrgVar) {
        this.a = 4;
        this.b = executor;
        this.c = v0dVar;
        this.d = jrgVar;
    }
}
