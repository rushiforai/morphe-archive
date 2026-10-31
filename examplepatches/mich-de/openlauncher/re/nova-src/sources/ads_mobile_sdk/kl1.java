package ads_mobile_sdk;

import android.os.SystemClock;
import b.o2;
import java.util.Iterator;
import java.util.PriorityQueue;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class kl1 implements b.g7 {

    /* renamed from: a, reason: collision with root package name */
    public final Executor f5766a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f5767b;

    /* renamed from: c, reason: collision with root package name */
    public final PriorityQueue f5768c = new PriorityQueue();

    public kl1(Executor executor, o2 o2Var) {
        this.f5766a = executor;
        this.f5767b = o2Var;
    }

    @Override // b.g7
    public final void a() {
        synchronized (this.f5768c) {
            try {
                if (this.f5768c.isEmpty()) {
                    return;
                }
                PriorityQueue priorityQueue = new PriorityQueue();
                this.f5767b.getClass();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                n13 n13Var = (n13) this.f5768c.peek();
                while (n13Var != null && n13Var.f7398b <= jElapsedRealtime) {
                    priorityQueue.add(n13Var);
                    n13Var = (n13) this.f5768c.peek();
                }
                Iterator it = priorityQueue.iterator();
                while (it.hasNext()) {
                    try {
                        this.f5766a.execute(((n13) it.next()).f7397a);
                    } catch (RuntimeException unused) {
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // b.g7
    public final void a(Runnable runnable, long j11) {
        if (j11 <= 0) {
            this.f5766a.execute(runnable);
            return;
        }
        this.f5767b.getClass();
        n13 n13Var = new n13(runnable, SystemClock.elapsedRealtime() + j11);
        synchronized (this.f5768c) {
            this.f5768c.add(n13Var);
        }
    }
}
