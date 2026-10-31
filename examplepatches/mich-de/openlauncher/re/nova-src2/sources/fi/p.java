package fi;

import cl.u0;
import com.google.android.gms.tasks.Task;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class p implements g, f, d, q {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55152a;

    /* renamed from: b, reason: collision with root package name */
    public final Executor f55153b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f55154c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f55155d;

    public p(Executor executor, d dVar) {
        this.f55152a = 1;
        this.f55154c = new Object();
        this.f55153b = executor;
        this.f55155d = dVar;
    }

    @Override // fi.q
    public final void a(Task task) {
        switch (this.f55152a) {
            case 0:
                this.f55153b.execute(new u0(this, task, false, 2));
                return;
            case 1:
                if (task.o()) {
                    synchronized (this.f55154c) {
                        try {
                            if (((d) this.f55155d) != null) {
                                this.f55153b.execute(new ai.h(this, 16));
                            }
                        } finally {
                        }
                    }
                    return;
                }
                return;
            case 2:
                synchronized (this.f55154c) {
                }
                this.f55153b.execute(new u0(this, task, false, 3));
                return;
            case 3:
                if (task.q() || task.o()) {
                    return;
                }
                synchronized (this.f55154c) {
                    try {
                        if (((f) this.f55155d) != null) {
                            this.f55153b.execute(new u0(this, task, false, 4));
                        }
                    } finally {
                    }
                }
                return;
            case 4:
                if (task.q()) {
                    synchronized (this.f55154c) {
                        try {
                            if (((g) this.f55155d) != null) {
                                this.f55153b.execute(new u0(this, task, false, 5));
                            }
                        } finally {
                        }
                    }
                    return;
                }
                return;
            default:
                this.f55153b.execute(new u0(this, task, false, 6));
                return;
        }
    }

    @Override // fi.f
    public void i(Exception exc) {
        switch (this.f55152a) {
            case 0:
                ((t) this.f55155d).v(exc);
                break;
            default:
                ((t) this.f55155d).v(exc);
                break;
        }
    }

    @Override // fi.d
    public void onCanceled() {
        switch (this.f55152a) {
            case 0:
                ((t) this.f55155d).w();
                break;
            default:
                ((t) this.f55155d).w();
                break;
        }
    }

    @Override // fi.g
    public void onSuccess(Object obj) {
        switch (this.f55152a) {
            case 0:
                ((t) this.f55155d).t(obj);
                break;
            default:
                ((t) this.f55155d).t(obj);
                break;
        }
    }

    public p(Executor executor, e eVar) {
        this.f55152a = 2;
        this.f55154c = new Object();
        this.f55153b = executor;
        this.f55155d = eVar;
    }

    public p(Executor executor, f fVar) {
        this.f55152a = 3;
        this.f55154c = new Object();
        this.f55153b = executor;
        this.f55155d = fVar;
    }

    public p(Executor executor, g gVar) {
        this.f55152a = 4;
        this.f55154c = new Object();
        this.f55153b = executor;
        this.f55155d = gVar;
    }

    public /* synthetic */ p(Executor executor, Object obj, t tVar, int i5) {
        this.f55152a = i5;
        this.f55153b = executor;
        this.f55154c = obj;
        this.f55155d = tVar;
    }
}
