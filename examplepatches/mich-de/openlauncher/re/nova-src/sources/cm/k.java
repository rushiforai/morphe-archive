package cm;

import cl.u0;
import java.util.ArrayDeque;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.logging.Logger;
import sg.w;

/* loaded from: classes.dex */
public final class k implements Executor {

    /* renamed from: f, reason: collision with root package name */
    public static final Logger f20122f = Logger.getLogger(k.class.getName());

    /* renamed from: a, reason: collision with root package name */
    public final Executor f20123a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f20124b = new ArrayDeque();

    /* renamed from: c, reason: collision with root package name */
    public int f20125c = 1;

    /* renamed from: d, reason: collision with root package name */
    public long f20126d = 0;

    /* renamed from: e, reason: collision with root package name */
    public final u0 f20127e = new u0(this);

    public k(Executor executor) {
        w.h(executor);
        this.f20123a = executor;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        w.h(runnable);
        synchronized (this.f20124b) {
            int i5 = this.f20125c;
            if (i5 != 4 && i5 != 3) {
                long j11 = this.f20126d;
                j jVar = new j(runnable, 0);
                this.f20124b.add(jVar);
                this.f20125c = 2;
                try {
                    this.f20123a.execute(this.f20127e);
                    if (this.f20125c != 2) {
                        return;
                    }
                    synchronized (this.f20124b) {
                        try {
                            if (this.f20126d == j11 && this.f20125c == 2) {
                                this.f20125c = 3;
                            }
                        } finally {
                        }
                    }
                    return;
                } catch (Error | RuntimeException e3) {
                    synchronized (this.f20124b) {
                        try {
                            int i11 = this.f20125c;
                            boolean z11 = true;
                            if ((i11 != 1 && i11 != 2) || !this.f20124b.removeLastOccurrence(jVar)) {
                                z11 = false;
                            }
                            if (!(e3 instanceof RejectedExecutionException) || z11) {
                                throw e3;
                            }
                        } finally {
                        }
                    }
                    return;
                }
            }
            this.f20124b.add(runnable);
        }
    }

    public final String toString() {
        return "SequentialExecutor@" + System.identityHashCode(this) + "{" + this.f20123a + "}";
    }
}
