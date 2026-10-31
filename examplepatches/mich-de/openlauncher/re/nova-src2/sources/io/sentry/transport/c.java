package io.sentry.transport;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.g3;
import io.sentry.u2;
import io.sentry.u4;
import io.sentry.v2;
import io.sentry.w2;
import io.sentry.w3;
import io.sentry.x;
import io.sentry.y;
import io.sentry.z2;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class c implements f {

    /* renamed from: a, reason: collision with root package name */
    public final l f67790a;

    /* renamed from: b, reason: collision with root package name */
    public final io.sentry.cache.c f67791b;

    /* renamed from: c, reason: collision with root package name */
    public final w3 f67792c;

    /* renamed from: d, reason: collision with root package name */
    public final m f67793d;

    /* renamed from: e, reason: collision with root package name */
    public final g f67794e;

    /* renamed from: f, reason: collision with root package name */
    public final e f67795f;

    /* renamed from: g, reason: collision with root package name */
    public volatile b f67796g;

    /* JADX WARN: Type inference failed for: r3v0, types: [io.sentry.transport.a] */
    public c(w3 w3Var, m mVar, g gVar, io.sentry.internal.debugmeta.c cVar) {
        int maxQueueSize = w3Var.getMaxQueueSize();
        final io.sentry.cache.c envelopeDiskCache = w3Var.getEnvelopeDiskCache();
        final ILogger logger = w3Var.getLogger();
        v2 dateProvider = w3Var.getDateProvider();
        l lVar = new l(maxQueueSize, new y(2), new RejectedExecutionHandler() { // from class: io.sentry.transport.a
            @Override // java.util.concurrent.RejectedExecutionHandler
            public final void rejectedExecution(Runnable runnable, ThreadPoolExecutor threadPoolExecutor) {
                if (runnable instanceof b) {
                    b bVar = (b) runnable;
                    x xVar = bVar.f67786b;
                    if (!ex.i.H(xVar, io.sentry.hints.d.class)) {
                        envelopeDiskCache.a(bVar.f67785a, xVar);
                    }
                    Object objB = ex.i.B(xVar);
                    if (io.sentry.hints.j.class.isInstance(ex.i.B(xVar)) && objB != null) {
                        ((io.sentry.hints.j) objB).b(false);
                    }
                    Object objB2 = ex.i.B(xVar);
                    if (io.sentry.hints.g.class.isInstance(ex.i.B(xVar)) && objB2 != null) {
                        ((io.sentry.hints.g) objB2).c(true);
                    }
                    logger.g(g3.WARNING, "Envelope rejected", new Object[0]);
                }
            }
        }, logger, dateProvider);
        e eVar = new e(w3Var, cVar, mVar);
        this.f67796g = null;
        this.f67790a = lVar;
        io.sentry.cache.c envelopeDiskCache2 = w3Var.getEnvelopeDiskCache();
        i30.j.Q(envelopeDiskCache2, "envelopeCache is required");
        this.f67791b = envelopeDiskCache2;
        this.f67792c = w3Var;
        this.f67793d = mVar;
        i30.j.Q(gVar, "transportGate is required");
        this.f67794e = gVar;
        this.f67795f = eVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        n(false);
    }

    @Override // io.sentry.transport.f
    public final boolean k() {
        boolean z11;
        m mVar = this.f67793d;
        mVar.getClass();
        mVar.f67813a.getClass();
        Date date = new Date(System.currentTimeMillis());
        ConcurrentHashMap concurrentHashMap = mVar.f67815c;
        Iterator it = concurrentHashMap.keySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                z11 = false;
                break;
            }
            Date date2 = (Date) concurrentHashMap.get((io.sentry.i) it.next());
            if (date2 != null && !date.after(date2)) {
                z11 = true;
                break;
            }
        }
        l lVar = this.f67790a;
        u2 u2Var = lVar.f67809b;
        return (z11 || (u2Var != null && (lVar.f67811d.a().b(u2Var) > 2000000000L ? 1 : (lVar.f67811d.a().b(u2Var) == 2000000000L ? 0 : -1)) < 0)) ? false : true;
    }

    @Override // io.sentry.transport.f
    public final void n(boolean z11) {
        long flushTimeoutMillis;
        this.f67793d.close();
        this.f67790a.shutdown();
        this.f67792c.getLogger().g(g3.DEBUG, "Shutting down", new Object[0]);
        if (z11) {
            flushTimeoutMillis = 0;
        } else {
            try {
                flushTimeoutMillis = this.f67792c.getFlushTimeoutMillis();
            } catch (InterruptedException unused) {
                this.f67792c.getLogger().g(g3.DEBUG, "Thread interrupted while closing the connection.", new Object[0]);
                Thread.currentThread().interrupt();
                return;
            }
        }
        if (this.f67790a.awaitTermination(flushTimeoutMillis, TimeUnit.MILLISECONDS)) {
            return;
        }
        this.f67792c.getLogger().g(g3.WARNING, "Failed to shutdown the async connection async sender  within " + flushTimeoutMillis + " ms. Trying to force it now.", new Object[0]);
        this.f67790a.shutdownNow();
        if (this.f67796g != null) {
            this.f67790a.getRejectedExecutionHandler().rejectedExecution(this.f67796g, this.f67790a);
        }
    }

    @Override // io.sentry.transport.f
    public final m o() {
        return this.f67793d;
    }

    @Override // io.sentry.transport.f
    public final void q(long j11) throws InterruptedException {
        l lVar = this.f67790a;
        lVar.getClass();
        try {
            ((n) lVar.f67812e.f57836b).tryAcquireSharedNanos(1, TimeUnit.MILLISECONDS.toNanos(j11));
        } catch (InterruptedException e3) {
            lVar.f67810c.e(g3.ERROR, "Failed to wait till idle", e3);
            Thread.currentThread().interrupt();
        }
    }

    @Override // io.sentry.transport.f
    public final void x(e3 e3Var, x xVar) {
        io.sentry.cache.c cVar;
        boolean z11;
        io.sentry.i iVar;
        Iterable<z2> iterable = (Iterable) e3Var.f67209c;
        boolean zIsInstance = io.sentry.hints.d.class.isInstance(ex.i.B(xVar));
        w3 w3Var = this.f67792c;
        io.sentry.cache.c cVar2 = this.f67791b;
        if (zIsInstance) {
            w3Var.getLogger().g(g3.DEBUG, "Captured Envelope is already cached", new Object[0]);
            cVar = h.f67804a;
            z11 = true;
        } else {
            cVar = cVar2;
            z11 = false;
        }
        m mVar = this.f67793d;
        w3 w3Var2 = mVar.f67814b;
        e3 e3VarL = null;
        ArrayList arrayList = null;
        for (z2 z2Var : iterable) {
            String itemType = z2Var.f67945a.f66743c.getItemType();
            itemType.getClass();
            switch (itemType) {
                case "attachment":
                    iVar = io.sentry.i.Attachment;
                    break;
                case "replay_video":
                    iVar = io.sentry.i.Replay;
                    break;
                case "statsd":
                    iVar = io.sentry.i.MetricBucket;
                    break;
                case "profile":
                    iVar = io.sentry.i.Profile;
                    break;
                case "event":
                    iVar = io.sentry.i.Error;
                    break;
                case "check_in":
                    iVar = io.sentry.i.Monitor;
                    break;
                case "session":
                    iVar = io.sentry.i.Session;
                    break;
                case "transaction":
                    iVar = io.sentry.i.Transaction;
                    break;
                default:
                    iVar = io.sentry.i.Unknown;
                    break;
            }
            if (mVar.b(iVar)) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(z2Var);
                w3Var2.getClientReportRecorder().h(io.sentry.clientreport.d.RATELIMIT_BACKOFF, z2Var);
            }
        }
        if (arrayList != null) {
            w3Var2.getLogger().g(g3.INFO, "%d items will be dropped due rate limiting.", Integer.valueOf(arrayList.size()));
            ArrayList arrayList2 = new ArrayList();
            for (z2 z2Var2 : iterable) {
                if (!arrayList.contains(z2Var2)) {
                    arrayList2.add(z2Var2);
                }
            }
            if (arrayList2.isEmpty()) {
                w3Var2.getLogger().g(g3.INFO, "Envelope discarded due all items rate limited.", new Object[0]);
                Object objB = ex.i.B(xVar);
                if (io.sentry.hints.j.class.isInstance(ex.i.B(xVar)) && objB != null) {
                    ((io.sentry.hints.j) objB).b(false);
                }
                Object objB2 = ex.i.B(xVar);
                if (io.sentry.hints.g.class.isInstance(ex.i.B(xVar)) && objB2 != null) {
                    ((io.sentry.hints.g) objB2).c(false);
                }
            } else {
                e3VarL = new e3((w2) e3Var.f67208b, arrayList2);
            }
        } else {
            e3VarL = e3Var;
        }
        if (e3VarL == null) {
            if (z11) {
                cVar2.p0(e3Var);
                return;
            }
            return;
        }
        if (u4.class.isInstance(ex.i.B(xVar))) {
            e3VarL = w3Var.getClientReportRecorder().l(e3VarL);
        }
        Future futureSubmit = this.f67790a.submit(new b(this, e3VarL, xVar, cVar));
        if (futureSubmit != null && futureSubmit.isCancelled()) {
            w3Var.getClientReportRecorder().i(io.sentry.clientreport.d.QUEUE_OVERFLOW, e3VarL);
            return;
        }
        Object objB3 = ex.i.B(xVar);
        if (!io.sentry.m.class.isInstance(ex.i.B(xVar)) || objB3 == null) {
            return;
        }
        io.sentry.m mVar2 = (io.sentry.m) objB3;
        mVar2.f67393g.add(mVar2.f67392f);
        w3Var.getLogger().g(g3.DEBUG, "Envelope enqueued", new Object[0]);
    }
}
