package cl;

import java.util.ArrayDeque;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class l1 implements Executor {

    /* renamed from: f, reason: collision with root package name */
    public static final Logger f20032f = Logger.getLogger(l1.class.getName());

    /* renamed from: a, reason: collision with root package name */
    public final Executor f20033a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f20034b = new ArrayDeque();

    /* renamed from: c, reason: collision with root package name */
    public int f20035c = 1;

    /* renamed from: d, reason: collision with root package name */
    public long f20036d = 0;

    /* renamed from: e, reason: collision with root package name */
    public final ab.z f20037e = new ab.z(this);

    public l1(Executor executor) {
        executor.getClass();
        this.f20033a = executor;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        runnable.getClass();
        synchronized (this.f20034b) {
            int i5 = this.f20035c;
            if (i5 != 4 && i5 != 3) {
                long j11 = this.f20036d;
                k1 k1Var = new k1(runnable, 0);
                this.f20034b.add(k1Var);
                this.f20035c = 2;
                try {
                    this.f20033a.execute(this.f20037e);
                    if (this.f20035c != 2) {
                        return;
                    }
                    synchronized (this.f20034b) {
                        try {
                            if (this.f20036d == j11 && this.f20035c == 2) {
                                this.f20035c = 3;
                            }
                        } finally {
                        }
                    }
                    return;
                } catch (Error | RuntimeException e3) {
                    synchronized (this.f20034b) {
                        try {
                            int i11 = this.f20035c;
                            boolean z11 = true;
                            if ((i11 != 1 && i11 != 2) || !this.f20034b.removeLastOccurrence(k1Var)) {
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
            this.f20034b.add(runnable);
        }
    }

    public final String toString() {
        return "SequentialExecutor@" + System.identityHashCode(this) + "{" + this.f20033a + "}";
    }
}
