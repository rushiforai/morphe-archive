package m;

import java.util.ArrayDeque;
import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public final class q implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final Object f75324a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f75325b = new ArrayDeque();

    /* renamed from: c, reason: collision with root package name */
    public final r f75326c;

    /* renamed from: d, reason: collision with root package name */
    public Runnable f75327d;

    public q(r rVar) {
        this.f75326c = rVar;
    }

    public final void a() {
        synchronized (this.f75324a) {
            try {
                Runnable runnable = (Runnable) this.f75325b.poll();
                this.f75327d = runnable;
                if (runnable != null) {
                    this.f75326c.execute(runnable);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        synchronized (this.f75324a) {
            try {
                this.f75325b.add(new kz.c(5, this, runnable));
                if (this.f75327d == null) {
                    a();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
