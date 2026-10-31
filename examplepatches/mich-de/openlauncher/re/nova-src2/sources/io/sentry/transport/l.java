package io.sentry.transport;

import io.sentry.ILogger;
import io.sentry.g3;
import io.sentry.u2;
import io.sentry.v2;
import io.sentry.y;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class l extends ThreadPoolExecutor implements AutoCloseable {

    /* renamed from: a, reason: collision with root package name */
    public final int f67808a;

    /* renamed from: b, reason: collision with root package name */
    public u2 f67809b;

    /* renamed from: c, reason: collision with root package name */
    public final ILogger f67810c;

    /* renamed from: d, reason: collision with root package name */
    public final v2 f67811d;

    /* renamed from: e, reason: collision with root package name */
    public final gu.j f67812e;

    public l(int i5, y yVar, a aVar, ILogger iLogger, v2 v2Var) {
        super(1, 1, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue(), yVar, aVar);
        this.f67809b = null;
        this.f67812e = new gu.j(25, (byte) 0);
        this.f67808a = i5;
        this.f67810c = iLogger;
        this.f67811d = v2Var;
    }

    @Override // java.util.concurrent.ThreadPoolExecutor
    public final void afterExecute(Runnable runnable, Throwable th2) {
        gu.j jVar = this.f67812e;
        try {
            super.afterExecute(runnable, th2);
        } finally {
            n nVar = (n) jVar.f57836b;
            int i5 = n.f67819a;
            nVar.releaseShared(1);
        }
    }

    @Override // java.lang.AutoCloseable
    public final /* synthetic */ void close() throws InterruptedException {
        boolean zIsTerminated;
        if (this == ForkJoinPool.commonPool() || (zIsTerminated = isTerminated())) {
            return;
        }
        shutdown();
        boolean z11 = false;
        while (!zIsTerminated) {
            try {
                zIsTerminated = awaitTermination(1L, TimeUnit.DAYS);
            } catch (InterruptedException unused) {
                if (!z11) {
                    shutdownNow();
                    z11 = true;
                }
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public final Future submit(Runnable runnable) {
        gu.j jVar = this.f67812e;
        if (n.a((n) jVar.f57836b) < this.f67808a) {
            n.b((n) jVar.f57836b);
            return super.submit(runnable);
        }
        this.f67809b = this.f67811d.a();
        this.f67810c.g(g3.WARNING, "Submit cancelled", new Object[0]);
        return new k();
    }
}
