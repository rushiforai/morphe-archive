package com.vungle.ads.internal.executor;

import com.iab.omid.library.vungle.internal.l;
import com.vungle.ads.OutOfMemory;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j extends ThreadPoolExecutor implements AutoCloseable {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f46834b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final c f46835a;

    static {
        new g();
    }

    public j(int i5, int i11, long j11, TimeUnit timeUnit, BlockingQueue blockingQueue, c cVar) {
        super(i5, i11, j11, timeUnit, (BlockingQueue<Runnable>) blockingQueue, cVar);
        this.f46835a = cVar;
        allowCoreThreadTimeOut(true);
    }

    public static final void b(j this$0) {
        Intrinsics.g(this$0, "this$0");
        StringBuilder sbA = l.a("submit error in ");
        sbA.append(this$0.a());
        new OutOfMemory(sbA.toString()).logErrorNoReturnValue$vungle_ads_release();
    }

    public static final void c(j this$0) {
        Intrinsics.g(this$0, "this$0");
        StringBuilder sbA = l.a("submit error with result in ");
        sbA.append(this$0.a());
        new OutOfMemory(sbA.toString()).logErrorNoReturnValue$vungle_ads_release();
    }

    public final String a() {
        String str;
        c cVar = this.f46835a;
        return (cVar == null || (str = cVar.f46817a) == null) ? "VungleThreadPoolExecutor" : str;
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

    @Override // java.util.concurrent.ThreadPoolExecutor, java.util.concurrent.Executor
    public final void execute(Runnable command) {
        Intrinsics.g(command, "command");
        try {
            super.execute(g.a(command, new c40.b(this, 2)));
        } catch (Exception e3) {
            boolean z11 = u.f47714a;
            t.a("VungleThreadPool", "execute exception", e3);
        } catch (OutOfMemoryError e11) {
            StringBuilder sbA = l.a("execute error in ");
            sbA.append(a());
            sbA.append(": ");
            sbA.append(e11.getLocalizedMessage());
            String string = sbA.toString();
            boolean z12 = u.f47714a;
            t.a("VungleThreadPool", string, e11);
            new OutOfMemory(string).logErrorNoReturnValue$vungle_ads_release();
        }
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public final Future submit(Runnable task) {
        Intrinsics.g(task, "task");
        try {
            Future<?> futureSubmit = super.submit(g.a(task, new c40.b(this, 3)));
            Intrinsics.f(futureSubmit, "{\n            super.subm…\n            })\n        }");
            return futureSubmit;
        } catch (Exception e3) {
            boolean z11 = u.f47714a;
            t.a("VungleThreadPool", "submit exception", e3);
            return new b(null);
        } catch (OutOfMemoryError e11) {
            StringBuilder sbA = l.a("submit error in ");
            sbA.append(a());
            sbA.append(": ");
            sbA.append(e11.getLocalizedMessage());
            String string = sbA.toString();
            boolean z12 = u.f47714a;
            t.a("VungleThreadPool", string, e11);
            new OutOfMemory(string).logErrorNoReturnValue$vungle_ads_release();
            return new b(null);
        }
    }

    public static final void a(j this$0) {
        Intrinsics.g(this$0, "this$0");
        StringBuilder sbA = l.a("execute error in ");
        sbA.append(this$0.a());
        new OutOfMemory(sbA.toString()).logErrorNoReturnValue$vungle_ads_release();
    }

    public final void a(Runnable command, Runnable fail) {
        Intrinsics.g(command, "command");
        Intrinsics.g(fail, "fail");
        try {
            super.execute(g.a(command, fail));
        } catch (Exception e3) {
            boolean z11 = u.f47714a;
            t.a("VungleThreadPool", "execute exception with fail", e3);
            fail.run();
        } catch (OutOfMemoryError e11) {
            StringBuilder sbA = l.a("execute error with fail in ");
            sbA.append(a());
            sbA.append(": ");
            sbA.append(e11.getLocalizedMessage());
            String string = sbA.toString();
            boolean z12 = u.f47714a;
            t.a("VungleThreadPool", string, e11);
            new OutOfMemory(string).logErrorNoReturnValue$vungle_ads_release();
            fail.run();
        }
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public final Future submit(Runnable task, Object obj) {
        Intrinsics.g(task, "task");
        try {
            Future futureSubmit = super.submit(g.a(task, new c40.b(this, 1)), obj);
            Intrinsics.f(futureSubmit, "{\n            super.subm…     }, result)\n        }");
            return futureSubmit;
        } catch (Exception e3) {
            boolean z11 = u.f47714a;
            t.a("VungleThreadPool", "submit exception with result", e3);
            return new b(null);
        } catch (OutOfMemoryError e11) {
            StringBuilder sbA = l.a("submit error with result in ");
            sbA.append(a());
            sbA.append(": ");
            sbA.append(e11.getLocalizedMessage());
            String string = sbA.toString();
            boolean z12 = u.f47714a;
            t.a("VungleThreadPool", string, e11);
            new OutOfMemory(string).logErrorNoReturnValue$vungle_ads_release();
            return new b(null);
        }
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public final Future submit(Callable task) {
        Intrinsics.g(task, "task");
        try {
            Future futureSubmit = super.submit(g.b(task, new i(this)));
            Intrinsics.f(futureSubmit, "override fun <T> submit(…Future<T>\n        }\n    }");
            return futureSubmit;
        } catch (Exception e3) {
            boolean z11 = u.f47714a;
            t.b("VungleThreadPool", "submit exception callable: " + e3);
            return new b(null);
        } catch (OutOfMemoryError e11) {
            StringBuilder sbA = l.a("submit error callable in ");
            sbA.append(a());
            sbA.append(": ");
            sbA.append(e11.getLocalizedMessage());
            String string = sbA.toString();
            boolean z12 = u.f47714a;
            t.a("VungleThreadPool", string, e11);
            new OutOfMemory(string).logErrorNoReturnValue$vungle_ads_release();
            return new b(null);
        }
    }
}
