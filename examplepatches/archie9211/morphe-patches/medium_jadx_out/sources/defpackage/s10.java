package defpackage;

import java.util.ArrayDeque;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s10 implements Executor {
    public final /* synthetic */ int a;
    public final ArrayDeque b;
    public Runnable c;
    public final Object d;
    public final Executor e;

    public s10(Executor executor) {
        this.a = 2;
        executor.getClass();
        this.e = executor;
        this.b = new ArrayDeque();
        this.d = new Object();
    }

    private final void a(Runnable runnable) {
        synchronized (this.d) {
            try {
                this.b.add(new ho(this, 1, runnable));
                if (this.c == null) {
                    c();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    private final void b(Runnable runnable) {
        synchronized (this.d) {
            try {
                this.b.add(new p0g(this, 16, runnable));
                if (this.c == null) {
                    c();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    private final void d() {
        synchronized (this.d) {
            try {
                Runnable runnable = (Runnable) this.b.poll();
                this.c = runnable;
                if (runnable != null) {
                    ((bf3) this.e).execute(runnable);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void c() {
        switch (this.a) {
            case 0:
                d();
                return;
            case 1:
                Runnable runnable = (Runnable) this.b.poll();
                this.c = runnable;
                if (runnable != null) {
                    ((ExecutorService) this.e).execute(runnable);
                    return;
                }
                return;
            default:
                synchronized (this.d) {
                    Object objPoll = this.b.poll();
                    Runnable runnable2 = (Runnable) objPoll;
                    this.c = runnable2;
                    if (objPoll != null) {
                        this.e.execute(runnable2);
                    }
                    break;
                }
                return;
        }
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.a) {
            case 0:
                a(runnable);
                return;
            case 1:
                b(runnable);
                return;
            default:
                runnable.getClass();
                synchronized (this.d) {
                    this.b.offer(new fi2(runnable, 25, this));
                    if (this.c == null) {
                        c();
                    }
                    break;
                }
                return;
        }
    }

    public s10(ExecutorService executorService) {
        this.a = 1;
        this.e = executorService;
        this.b = new ArrayDeque();
        this.d = new Object();
    }

    public s10(bf3 bf3Var) {
        this.a = 0;
        this.d = new Object();
        this.b = new ArrayDeque();
        this.e = bf3Var;
    }
}
