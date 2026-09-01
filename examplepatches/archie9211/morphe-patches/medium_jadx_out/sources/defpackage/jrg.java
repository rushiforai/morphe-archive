package defpackage;

import com.google.android.gms.tasks.RuntimeExecutionException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jrg {
    public final Object a = new Object();
    public final o72 b = new o72(7);
    public boolean c;
    public volatile boolean d;
    public Object e;
    public Exception f;

    public final void a(xq8 xq8Var) {
        this.b.h(new l6g(yfd.a, xq8Var));
        r();
    }

    public final void b(Executor executor, xq8 xq8Var) {
        this.b.h(new l6g(executor, xq8Var));
        r();
    }

    public final void c(br8 br8Var) {
        d(yfd.a, br8Var);
    }

    public final void d(Executor executor, br8 br8Var) {
        this.b.h(new l6g(executor, br8Var));
        r();
    }

    public final void e(Executor executor, kr8 kr8Var) {
        this.b.h(new l6g(executor, kr8Var));
        r();
    }

    public final jrg f(Executor executor, o92 o92Var) {
        jrg jrgVar = new jrg();
        this.b.h(new h0g(executor, o92Var, jrgVar, 0));
        r();
        return jrgVar;
    }

    public final jrg g(Executor executor, o92 o92Var) {
        jrg jrgVar = new jrg();
        this.b.h(new h0g(executor, o92Var, jrgVar, 1));
        r();
        return jrgVar;
    }

    public final Exception h() {
        Exception exc;
        synchronized (this.a) {
            exc = this.f;
        }
        return exc;
    }

    public final Object i() {
        Object obj;
        synchronized (this.a) {
            try {
                vp7.r("Task is not yet complete", this.c);
                if (this.d) {
                    throw new CancellationException("Task is already canceled.");
                }
                Exception exc = this.f;
                if (exc != null) {
                    throw new RuntimeExecutionException(exc);
                }
                obj = this.e;
            } catch (Throwable th) {
                throw th;
            }
        }
        return obj;
    }

    public final boolean j() {
        boolean z;
        synchronized (this.a) {
            z = this.c;
        }
        return z;
    }

    public final boolean k() {
        boolean z;
        synchronized (this.a) {
            try {
                z = false;
                if (this.c && !this.d && this.f == null) {
                    z = true;
                }
            } finally {
            }
        }
        return z;
    }

    public final jrg l(Executor executor, v0d v0dVar) {
        jrg jrgVar = new jrg();
        this.b.h(new l6g(executor, v0dVar, jrgVar));
        r();
        return jrgVar;
    }

    public final void m(Object obj) {
        synchronized (this.a) {
            q();
            this.c = true;
            this.e = obj;
        }
        this.b.i(this);
    }

    public final boolean n(Object obj) {
        synchronized (this.a) {
            try {
                if (this.c) {
                    return false;
                }
                this.c = true;
                this.e = obj;
                this.b.i(this);
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void o(Exception exc) {
        vp7.q("Exception must not be null", exc);
        synchronized (this.a) {
            q();
            this.c = true;
            this.f = exc;
        }
        this.b.i(this);
    }

    public final void p() {
        synchronized (this.a) {
            try {
                if (this.c) {
                    return;
                }
                this.c = true;
                this.d = true;
                this.b.i(this);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void q() {
        if (this.c) {
            if (!j()) {
                throw new IllegalStateException("DuplicateTaskCompletionException can only be created from completed Task.");
            }
            Exception excH = h();
        }
    }

    public final void r() {
        synchronized (this.a) {
            try {
                if (this.c) {
                    this.b.i(this);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
