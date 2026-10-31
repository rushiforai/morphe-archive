package fi;

import com.google.android.gms.tasks.DuplicateTaskCompletionException;
import com.google.android.gms.tasks.RuntimeExecutionException;
import com.google.android.gms.tasks.Task;
import e1.w0;
import java.io.IOException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import sg.w;

/* loaded from: classes.dex */
public final class t extends Task {

    /* renamed from: a, reason: collision with root package name */
    public final Object f55159a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final w0 f55160b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f55161c;

    /* renamed from: d, reason: collision with root package name */
    public volatile boolean f55162d;

    /* renamed from: e, reason: collision with root package name */
    public Object f55163e;

    /* renamed from: f, reason: collision with root package name */
    public Exception f55164f;

    public t() {
        w0 w0Var = new w0();
        w0Var.f51406b = new Object();
        this.f55160b = w0Var;
    }

    @Override // com.google.android.gms.tasks.Task
    public final void a(Executor executor, d dVar) {
        this.f55160b.c(new p(executor, dVar));
        x();
    }

    @Override // com.google.android.gms.tasks.Task
    public final void b(e eVar) {
        this.f55160b.c(new p(k.f55136a, eVar));
        x();
    }

    @Override // com.google.android.gms.tasks.Task
    public final void c(Executor executor, e eVar) {
        this.f55160b.c(new p(executor, eVar));
        x();
    }

    @Override // com.google.android.gms.tasks.Task
    public final t d(f fVar) {
        e(k.f55136a, fVar);
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    public final t e(Executor executor, f fVar) {
        this.f55160b.c(new p(executor, fVar));
        x();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    public final t f(g gVar) {
        g(k.f55136a, gVar);
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    public final t g(Executor executor, g gVar) {
        this.f55160b.c(new p(executor, gVar));
        x();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    public final Task h(c cVar) {
        return i(k.f55136a, cVar);
    }

    @Override // com.google.android.gms.tasks.Task
    public final Task i(Executor executor, c cVar) {
        t tVar = new t();
        this.f55160b.c(new o(executor, cVar, tVar));
        x();
        return tVar;
    }

    @Override // com.google.android.gms.tasks.Task
    public final Task j(c cVar) {
        return k(k.f55136a, cVar);
    }

    @Override // com.google.android.gms.tasks.Task
    public final Task k(Executor executor, c cVar) {
        t tVar = new t();
        this.f55160b.c(new p(executor, cVar, tVar, 0));
        x();
        return tVar;
    }

    @Override // com.google.android.gms.tasks.Task
    public final Exception l() {
        Exception exc;
        synchronized (this.f55159a) {
            exc = this.f55164f;
        }
        return exc;
    }

    @Override // com.google.android.gms.tasks.Task
    public final Object m() {
        Object obj;
        synchronized (this.f55159a) {
            try {
                w.j("Task is not yet complete", this.f55161c);
                if (this.f55162d) {
                    throw new CancellationException("Task is already canceled.");
                }
                Exception exc = this.f55164f;
                if (exc != null) {
                    throw new RuntimeExecutionException(exc);
                }
                obj = this.f55163e;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return obj;
    }

    @Override // com.google.android.gms.tasks.Task
    public final Object n() {
        Object obj;
        synchronized (this.f55159a) {
            try {
                w.j("Task is not yet complete", this.f55161c);
                if (this.f55162d) {
                    throw new CancellationException("Task is already canceled.");
                }
                if (IOException.class.isInstance(this.f55164f)) {
                    throw ((Throwable) IOException.class.cast(this.f55164f));
                }
                Exception exc = this.f55164f;
                if (exc != null) {
                    throw new RuntimeExecutionException(exc);
                }
                obj = this.f55163e;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return obj;
    }

    @Override // com.google.android.gms.tasks.Task
    public final boolean o() {
        return this.f55162d;
    }

    @Override // com.google.android.gms.tasks.Task
    public final boolean p() {
        boolean z11;
        synchronized (this.f55159a) {
            z11 = this.f55161c;
        }
        return z11;
    }

    @Override // com.google.android.gms.tasks.Task
    public final boolean q() {
        boolean z11;
        synchronized (this.f55159a) {
            try {
                z11 = false;
                if (this.f55161c && !this.f55162d && this.f55164f == null) {
                    z11 = true;
                }
            } finally {
            }
        }
        return z11;
    }

    @Override // com.google.android.gms.tasks.Task
    public final Task r(i iVar) {
        a8.b bVar = k.f55136a;
        t tVar = new t();
        this.f55160b.c(new p(bVar, iVar, tVar, 5));
        x();
        return tVar;
    }

    @Override // com.google.android.gms.tasks.Task
    public final Task s(Executor executor, i iVar) {
        t tVar = new t();
        this.f55160b.c(new p(executor, iVar, tVar, 5));
        x();
        return tVar;
    }

    public final void t(Object obj) {
        synchronized (this.f55159a) {
            if (this.f55161c) {
                throw DuplicateTaskCompletionException.a(this);
            }
            this.f55161c = true;
            this.f55163e = obj;
        }
        this.f55160b.d(this);
    }

    public final boolean u(Object obj) {
        synchronized (this.f55159a) {
            try {
                if (this.f55161c) {
                    return false;
                }
                this.f55161c = true;
                this.f55163e = obj;
                this.f55160b.d(this);
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void v(Exception exc) {
        w.i(exc, "Exception must not be null");
        synchronized (this.f55159a) {
            if (this.f55161c) {
                throw DuplicateTaskCompletionException.a(this);
            }
            this.f55161c = true;
            this.f55164f = exc;
        }
        this.f55160b.d(this);
    }

    public final void w() {
        synchronized (this.f55159a) {
            try {
                if (this.f55161c) {
                    return;
                }
                this.f55161c = true;
                this.f55162d = true;
                this.f55160b.d(this);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void x() {
        synchronized (this.f55159a) {
            try {
                if (this.f55161c) {
                    this.f55160b.d(this);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
