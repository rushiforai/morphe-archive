package sprig.graphics;

import defpackage.x45;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0004\b\u0007\u0010\bJ/\u0010\r\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\t2\u0012\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u00050\u0004H\u0086\bø\u0001\u0000¢\u0006\u0004\b\r\u0010\u000eJ\u001d\u0010\u0011\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0011\u0010\u0012R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016R \u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010\u0018R \u0010\u001d\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u001a0\u00198\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010\u001c\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u001e"}, d2 = {"Lsprig/h/i;", "", "", "thresholdMs", "Lkotlin/Function1;", "Lc1e;", "onThresholdExceeded", "<init>", "(ILx45;)V", "Lsprig/h/g;", "type", "Ljava/util/concurrent/CountDownLatch;", "operation", "recordMetric", "(Lsprig/h/g;Lx45;)V", "", "time", "updateMetrics", "(Lsprig/h/g;J)V", "a", "I", "getThresholdMs", "()I", "b", "Lx45;", "", "Lsprig/h/h;", "c", "Ljava/util/Map;", "metrics", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class i {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final int thresholdMs;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final x45 onThresholdExceeded;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final Map metrics;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "run", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class a implements Runnable {
        final /* synthetic */ CountDownLatch $latch;
        final /* synthetic */ long $startTime;
        final /* synthetic */ g $type;
        final /* synthetic */ i this$0;

        public a(CountDownLatch countDownLatch, long j, i iVar, g gVar) {
            this.$latch = countDownLatch;
            this.$startTime = j;
            this.this$0 = iVar;
            this.$type = gVar;
        }

        @Override // java.lang.Runnable
        public final void run() throws InterruptedException {
            this.$latch.await();
            this.this$0.updateMetrics(this.$type, System.currentTimeMillis() - this.$startTime);
        }
    }

    public i(int i, x45 x45Var) {
        x45Var.getClass();
        this.thresholdMs = i;
        this.onThresholdExceeded = x45Var;
        this.metrics = new LinkedHashMap();
    }

    public final int getThresholdMs() {
        return this.thresholdMs;
    }

    public final void recordMetric(g type, x45 operation) {
        type.getClass();
        operation.getClass();
        CountDownLatch countDownLatch = new CountDownLatch(1);
        long jCurrentTimeMillis = System.currentTimeMillis();
        operation.invoke(countDownLatch);
        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
        executorServiceNewSingleThreadExecutor.execute(new a(countDownLatch, jCurrentTimeMillis, this, type));
        executorServiceNewSingleThreadExecutor.shutdown();
    }

    public final void updateMetrics(g type, long time) {
        type.getClass();
        h hVar = (h) this.metrics.get(type);
        if (hVar == null) {
            hVar = new h(0, 0L, 3, null);
        }
        hVar.setSampleCount(hVar.getSampleCount() + 1);
        hVar.setTotal(hVar.getTotal() + time);
        long total = hVar.getTotal() / ((long) hVar.getSampleCount());
        int i = this.thresholdMs;
        if (total > i) {
            this.onThresholdExceeded.invoke(Integer.valueOf(i));
        }
        this.metrics.put(type, hVar);
    }
}
