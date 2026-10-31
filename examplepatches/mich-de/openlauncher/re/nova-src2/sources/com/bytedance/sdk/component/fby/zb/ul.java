package com.bytedance.sdk.component.fby.zb;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import androidx.compose.ui.node.LayoutNode;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public class ul extends ThreadPoolExecutor implements AutoCloseable {

    /* renamed from: dj, reason: collision with root package name */
    private int f23756dj;
    private boolean lud;
    private int sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23757zb;

    public static class ycx {
        private String ycx = "cache";

        /* renamed from: zb, reason: collision with root package name */
        private int f23764zb = 4;
        private int sya = 100;

        /* renamed from: dj, reason: collision with root package name */
        private int f23759dj = 0;
        private long lud = 30000;

        /* renamed from: lt, reason: collision with root package name */
        private boolean f23762lt = false;

        /* renamed from: ul, reason: collision with root package name */
        private TimeUnit f23763ul = TimeUnit.MILLISECONDS;
        private boolean fby = false;

        /* renamed from: jw, reason: collision with root package name */
        private BlockingQueue<Runnable> f23761jw = new PriorityBlockingQueue();

        /* renamed from: jc, reason: collision with root package name */
        private ThreadFactory f23760jc = null;

        public ycx dj(int i5) {
            return this;
        }

        public ycx lud(int i5) {
            return this;
        }

        public ycx sya(int i5) {
            this.f23759dj = i5;
            return this;
        }

        public ycx ycx(String str) {
            this.ycx = str;
            return this;
        }

        public ycx zb(int i5) {
            this.sya = i5;
            return this;
        }

        public ycx ycx(int i5) {
            this.f23764zb = i5;
            return this;
        }

        public ycx zb(boolean z11) {
            this.fby = z11;
            return this;
        }

        public ycx ycx(long j11) {
            this.lud = j11;
            return this;
        }

        public ycx ycx(boolean z11) {
            this.f23762lt = z11;
            return this;
        }

        public ycx ycx(BlockingQueue<Runnable> blockingQueue) {
            this.f23761jw = blockingQueue;
            return this;
        }

        public ul ycx() {
            if (this.f23760jc == null) {
                this.f23760jc = new lud(this.ycx);
            }
            if (this.f23764zb < 0) {
                this.f23764zb = 8;
            }
            if (this.f23764zb == 0) {
                this.f23761jw = new SynchronousQueue();
            }
            if (this.f23761jw == null) {
                this.f23761jw = new LinkedBlockingQueue();
            }
            if (this.sya > 100) {
                this.sya = 100;
            }
            int i5 = this.sya;
            int i11 = this.f23764zb;
            if (i5 < i11) {
                this.sya = i11;
            }
            return new ul(this);
        }
    }

    private void dj() {
        try {
            if (this.f23757zb != 0 && getCorePoolSize() > this.f23757zb && getQueue().size() == 0) {
                setCorePoolSize(this.f23757zb);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5gZsi1a6mOFArs=", "a+8qoQuubMaEethSgDS4LVj7OZoR", "SespgAC5XcijRcVYuBmyLVrq", 142);
            e3.getMessage();
        }
    }

    private void sya() {
        try {
            if (this.f23757zb != 0 && getCorePoolSize() < this.sya) {
                int size = getQueue().size();
                if (getActiveCount() < this.f23757zb || size < this.f23756dj) {
                    return;
                }
                setCorePoolSize(this.sya);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5gZsi1a6mOFArs=", "a+8qoQuubMaEethSgDS4LVj7OZoR", "UuAuhwa9esK0RfpclCWoOl7vKQ==", Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
            e3.getMessage();
        }
    }

    @Override // java.util.concurrent.ThreadPoolExecutor
    public void afterExecute(Runnable runnable, Throwable th2) {
        boolean z11 = runnable instanceof sya;
        if (z11) {
            ((sya) runnable).setAfterTimestamp(SystemClock.elapsedRealtime());
        }
        super.afterExecute(runnable, th2);
        if (z11) {
            sya syaVar = (sya) runnable;
            syaVar.getName();
            syaVar.getPriority();
            syaVar.getSubmitTimestamp();
            syaVar.getBeforeTimestamp();
            syaVar.getAfterTimestamp();
        }
        dj();
    }

    @Override // java.util.concurrent.ThreadPoolExecutor
    public void beforeExecute(Thread thread, Runnable runnable) {
        if (runnable instanceof sya) {
            ((sya) runnable).setBeforeTimestamp(SystemClock.elapsedRealtime());
        }
        super.beforeExecute(thread, runnable);
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
    public void execute(Runnable runnable) {
        com.bytedance.sdk.component.fby.zb.ycx ycxVarYcx;
        if (!(runnable instanceof sya)) {
            runnable = new sya("unknown", runnable) { // from class: com.bytedance.sdk.component.fby.zb.ul.2
                @Override // java.lang.Runnable
                public void run() {
                    Runnable target = getTarget();
                    if (target != null) {
                        target.run();
                    }
                }
            };
        }
        if (!"cache".equals(this.ycx)) {
            String name = Thread.currentThread().getName();
            if (!TextUtils.isEmpty(name) && name.startsWith(lud.ycx(this.ycx)) && (ycxVarYcx = dj.ycx()) != null) {
                ycxVarYcx.ycx(this, (sya) runnable);
            }
        }
        ((sya) runnable).setSubmitTimestamp(SystemClock.elapsedRealtime());
        try {
            super.execute(runnable);
            sya();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5gZsi1a6mOFArs=", "a+8qoQuubMaEethSgDS4LVj7OZoR", "XvYolhaobA==", Sdk.SDKError.Reason.AD_IS_LOADING_VALUE);
            ycx(runnable, th2);
        }
    }

    @Override // java.util.concurrent.ThreadPoolExecutor, java.util.concurrent.ExecutorService
    public void shutdown() {
        if ("aidl".equals(this.ycx)) {
            return;
        }
        super.shutdown();
    }

    @Override // java.util.concurrent.ThreadPoolExecutor, java.util.concurrent.ExecutorService
    public List<Runnable> shutdownNow() {
        return "aidl".equals(this.ycx) ? Collections.EMPTY_LIST : super.shutdownNow();
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public Future<?> submit(Runnable runnable) {
        int priority;
        String name;
        runnable.getClass();
        final RunnableFuture runnableFutureNewTaskFor = newTaskFor(runnable, null);
        if (runnable instanceof sya) {
            sya syaVar = (sya) runnable;
            priority = syaVar.getPriority();
            name = syaVar.getName();
        } else {
            priority = 6;
            name = b.f42142b;
        }
        if (priority == 0 || TextUtils.isEmpty(name)) {
            new RuntimeException();
        }
        execute(new sya(name, priority) { // from class: com.bytedance.sdk.component.fby.zb.ul.1
            @Override // java.lang.Runnable
            public void run() {
                runnableFutureNewTaskFor.run();
            }
        });
        return runnableFutureNewTaskFor;
    }

    public void ycx(ycx ycxVar) {
        try {
            if (ycxVar.f23764zb >= 0 && this.f23757zb != ycxVar.f23764zb) {
                int i5 = ycxVar.f23764zb;
                this.f23757zb = i5;
                setCorePoolSize(i5);
            }
            this.sya = ycxVar.sya;
            this.f23756dj = ycxVar.f23759dj;
            allowCoreThreadTimeOut(ycxVar.f23762lt);
            this.lud = ycxVar.fby;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5gZsi1a6mOFArs=", "a+8qoQuubMaEethSgDS4LVj7OZoR", "Tv4plBe5SsiOTN5a", 72);
            th2.getMessage();
        }
        String unused = ycxVar.ycx;
        int unused2 = ycxVar.f23764zb;
        int unused3 = ycxVar.sya;
        long unused4 = ycxVar.lud;
        int unused5 = ycxVar.f23759dj;
        boolean unused6 = ycxVar.fby;
        BlockingQueue unused7 = ycxVar.f23761jw;
    }

    public boolean zb() {
        return this.lud;
    }

    private ul(ycx ycxVar) {
        super(ycxVar.f23764zb, LayoutNode.NotPlacedPlaceOrder, ycxVar.lud, ycxVar.f23763ul, (BlockingQueue<Runnable>) ycxVar.f23761jw, ycxVar.f23760jc);
        this.lud = false;
        String unused = ycxVar.ycx;
        int unused2 = ycxVar.f23764zb;
        int unused3 = ycxVar.sya;
        long unused4 = ycxVar.lud;
        int unused5 = ycxVar.f23759dj;
        boolean unused6 = ycxVar.fby;
        BlockingQueue unused7 = ycxVar.f23761jw;
        this.ycx = ycxVar.ycx;
        this.f23757zb = ycxVar.f23764zb;
        this.sya = ycxVar.sya;
        this.f23756dj = ycxVar.f23759dj;
        allowCoreThreadTimeOut(ycxVar.f23762lt);
        this.lud = ycxVar.fby;
    }

    private void ycx(Runnable runnable, Throwable th2) {
        try {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                Handler handlerZb = dj.zb();
                if (handlerZb != null) {
                    handlerZb.post(runnable);
                    return;
                }
                return;
            }
            runnable.run();
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5gZsi1a6mOFArs=", "a+8qoQuubMaEethSgDS4LVj7OZoR", "VOAIjQa/fNOFbNZUgBSk", Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE);
        }
    }

    public int ycx() {
        return this.sya;
    }
}
