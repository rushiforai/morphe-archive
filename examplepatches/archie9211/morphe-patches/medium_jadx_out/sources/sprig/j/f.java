package sprig.j;

import android.os.Handler;
import android.os.Looper;
import defpackage.aif;
import defpackage.b09;
import defpackage.gy2;
import defpackage.hk7;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000g\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0012\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0003*\u00012\bÀ\u0002\u0018\u00002\u00020\u0001:\u0001\fB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0005\u0010\u0003J\r\u0010\u0006\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0003J\r\u0010\u0007\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\u0003J\u0015\u0010\n\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\f\u0010\u0003J\u000f\u0010\r\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\r\u0010\u0003R$\u0010\u0014\u001a\u0004\u0018\u00010\u000e8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\f\u0010\u000f\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u0016\u0010\u0018\u001a\u00020\u00158\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0016\u0010\u0017R\u0016\u0010\u001a\u001a\u00020\u00158\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0019\u0010\u0017R\u0016\u0010\u001b\u001a\u00020\u00158\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\r\u0010\u0017R\u0014\u0010\u001f\u001a\u00020\u001c8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR\u001c\u0010$\u001a\n !*\u0004\u0018\u00010 0 8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\"\u0010#R \u0010)\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030&0%8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b'\u0010(R\u0018\u0010-\u001a\u0004\u0018\u00010*8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b+\u0010,R\u0014\u00101\u001a\u00020.8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b/\u00100R\u0014\u00105\u001a\u0002028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b3\u00104R\u0011\u00107\u001a\u0002068F¢\u0006\u0006\u001a\u0004\b7\u00108¨\u00069"}, d2 = {"Lsprig/j/f;", "", "<init>", "()V", "Lc1e;", "onRebuildStarted", "onTeardownComplete", "onCreateComplete", "", "staleWebViewCount", "onSdkReady", "(I)V", "a", "d", "Lsprig/j/f$a;", "Lsprig/j/f$a;", "getSimulatedLoadConfig", "()Lsprig/j/f$a;", "setSimulatedLoadConfig", "(Lsprig/j/f$a;)V", "simulatedLoadConfig", "", "b", "J", "rebuildStartTimeMs", "c", "teardownDoneTimeMs", "createDoneTimeMs", "Ljava/util/concurrent/atomic/AtomicBoolean;", "e", "Ljava/util/concurrent/atomic/AtomicBoolean;", "loadRunning", "Ljava/util/concurrent/ExecutorService;", "kotlin.jvm.PlatformType", "f", "Ljava/util/concurrent/ExecutorService;", "executor", "", "Ljava/util/concurrent/Future;", "g", "Ljava/util/List;", "cpuFutures", "", "h", "[B", "memoryBallast", "Landroid/os/Handler;", "i", "Landroid/os/Handler;", "mainHandler", "sprig/j/f$b", "j", "Lsprig/j/f$b;", "jankRunnable", "", "isTracking", "()Z", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class f {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public static volatile a simulatedLoadConfig;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public static long rebuildStartTimeMs;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public static long teardownDoneTimeMs;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public static long createDoneTimeMs;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    public static byte[] memoryBallast;
    public static final f INSTANCE = new f();

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public static final AtomicBoolean loadRunning = new AtomicBoolean(false);

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public static final ExecutorService executor = Executors.newCachedThreadPool(new aif());

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public static List cpuFutures = new ArrayList();

    /* JADX INFO: renamed from: i, reason: from kotlin metadata */
    public static final Handler mainHandler = new Handler(Looper.getMainLooper());

    /* JADX INFO: renamed from: j, reason: from kotlin metadata */
    public static final b jankRunnable = new b();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"sprig/j/f$b", "Ljava/lang/Runnable;", "Lc1e;", "run", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class b implements Runnable {
        @Override // java.lang.Runnable
        public void run() {
            a simulatedLoadConfig;
            if (f.loadRunning.get() && (simulatedLoadConfig = f.INSTANCE.getSimulatedLoadConfig()) != null) {
                try {
                    Thread.sleep(simulatedLoadConfig.getMainThreadJankDurationMs());
                } catch (InterruptedException unused) {
                }
                if (!f.loadRunning.get() || simulatedLoadConfig.getMainThreadJankIntervalMs() <= 0) {
                    return;
                }
                f.mainHandler.postDelayed(this, simulatedLoadConfig.getMainThreadJankIntervalMs());
            }
        }
    }

    private f() {
    }

    public static final void b() {
        while (loadRunning.get()) {
            for (int i = 0; i < 100000; i++) {
            }
        }
    }

    public static final void c() {
        INSTANCE.d();
    }

    public final void a() {
        a aVar = simulatedLoadConfig;
        if (aVar != null) {
            int i = 0;
            if (loadRunning.compareAndSet(false, true)) {
                int cpuThreads = aVar.getCpuThreads();
                for (int i2 = 0; i2 < cpuThreads; i2++) {
                    List list = cpuFutures;
                    Future<?> futureSubmit = executor.submit(new defpackage.e(17));
                    futureSubmit.getClass();
                    list.add(futureSubmit);
                }
                if (aVar.getMemoryBytes() > 0) {
                    int memoryBytes = aVar.getMemoryBytes();
                    byte[] bArr = new byte[memoryBytes];
                    int iU = hk7.u(0, memoryBytes - 1, 4096);
                    if (iU >= 0) {
                        while (true) {
                            bArr[i] = 1;
                            if (i == iU) {
                                break;
                            } else {
                                i += 4096;
                            }
                        }
                    }
                    memoryBallast = bArr;
                }
                if (aVar.getMainThreadJankIntervalMs() > 0) {
                    mainHandler.post(jankRunnable);
                }
                if (aVar.getDurationMs() > 0) {
                    mainHandler.postDelayed(new defpackage.e(18), aVar.getDurationMs());
                }
            }
        }
    }

    public final void d() {
        if (loadRunning.compareAndSet(true, false)) {
            Iterator it2 = cpuFutures.iterator();
            while (it2.hasNext()) {
                ((Future) it2.next()).cancel(true);
            }
            cpuFutures.clear();
            memoryBallast = null;
            mainHandler.removeCallbacks(jankRunnable);
        }
    }

    public final a getSimulatedLoadConfig() {
        return simulatedLoadConfig;
    }

    public final boolean isTracking() {
        return rebuildStartTimeMs > 0;
    }

    public final void onCreateComplete() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        createDoneTimeMs = jCurrentTimeMillis;
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, b09.x("WebView rebuild phase: create=", "ms", jCurrentTimeMillis - teardownDoneTimeMs), null, 0, 6, null);
    }

    public final void onRebuildStarted() {
        rebuildStartTimeMs = System.currentTimeMillis();
        a();
    }

    public final void onSdkReady(int staleWebViewCount) {
        String str;
        if (isTracking()) {
            d();
            long jCurrentTimeMillis = System.currentTimeMillis();
            long j = rebuildStartTimeMs;
            long j2 = jCurrentTimeMillis - j;
            long j3 = teardownDoneTimeMs;
            long j4 = j3 - j;
            long j5 = createDoneTimeMs;
            long j6 = j5 - j3;
            long j7 = jCurrentTimeMillis - j5;
            a aVar = simulatedLoadConfig;
            if (aVar != null) {
                str = ", loadSim=" + aVar;
            } else {
                str = "";
            }
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            StringBuilder sbD = b09.D("WebView rebuild complete — total=", "ms (teardown=", j2);
            sbD.append(j4);
            wgd.y(sbD, "ms, create=", j6, "ms, sdkReady=");
            sbD.append(j7);
            sbD.append("ms), staleCount=");
            sbD.append(staleWebViewCount);
            sbD.append(str);
            sprig.b.b.sendLoggingEvent$default(bVar, sbD.toString(), null, 0, 6, null);
            rebuildStartTimeMs = 0L;
        }
    }

    public final void onTeardownComplete() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        teardownDoneTimeMs = jCurrentTimeMillis;
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, b09.x("WebView rebuild phase: teardown=", "ms", jCurrentTimeMillis - rebuildStartTimeMs), null, 0, 6, null);
    }

    public final void setSimulatedLoadConfig(a aVar) {
        simulatedLoadConfig = aVar;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0012\b\u0086\b\u0018\u00002\u00020\u0001B9\u0012\b\b\u0002\u0010\t\u001a\u00020\u0002\u0012\b\b\u0002\u0010\n\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0004\u0012\b\b\u0002\u0010\f\u001a\u00020\u0002\u0012\b\b\u0002\u0010\r\u001a\u00020\u0002¢\u0006\u0004\b#\u0010$J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0006\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0007\u001a\u00020\u0002HÆ\u0003J\t\u0010\b\u001a\u00020\u0002HÆ\u0003J;\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\t\u001a\u00020\u00022\b\b\u0002\u0010\n\u001a\u00020\u00042\b\b\u0002\u0010\u000b\u001a\u00020\u00042\b\b\u0002\u0010\f\u001a\u00020\u00022\b\b\u0002\u0010\r\u001a\u00020\u0002HÆ\u0001J\t\u0010\u0010\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0011\u001a\u00020\u0004HÖ\u0001J\u0013\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\t\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018R\u0017\u0010\n\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001d\u0010\u001a\u001a\u0004\b\u001e\u0010\u001cR\u0017\u0010\f\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u001f\u0010\u0016\u001a\u0004\b \u0010\u0018R\u0017\u0010\r\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b!\u0010\u0016\u001a\u0004\b\"\u0010\u0018¨\u0006%"}, d2 = {"Lsprig/j/f$a;", "", "", "component1", "", "component2", "component3", "component4", "component5", "durationMs", "cpuThreads", "memoryBytes", "mainThreadJankIntervalMs", "mainThreadJankDurationMs", "copy", "", "toString", "hashCode", "other", "", "equals", "a", "J", "getDurationMs", "()J", "b", "I", "getCpuThreads", "()I", "c", "getMemoryBytes", "d", "getMainThreadJankIntervalMs", "e", "getMainThreadJankDurationMs", "<init>", "(JIIJJ)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class a {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final long durationMs;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final int cpuThreads;

        /* JADX INFO: renamed from: c, reason: from kotlin metadata */
        public final int memoryBytes;

        /* JADX INFO: renamed from: d, reason: from kotlin metadata */
        public final long mainThreadJankIntervalMs;

        /* JADX INFO: renamed from: e, reason: from kotlin metadata */
        public final long mainThreadJankDurationMs;

        public /* synthetic */ a(long j, int i, int i2, long j2, long j3, int i3, gy2 gy2Var) {
            this((i3 & 1) != 0 ? 0L : j, (i3 & 2) != 0 ? 0 : i, (i3 & 4) != 0 ? 0 : i2, (i3 & 8) != 0 ? 0L : j2, (i3 & 16) != 0 ? 0L : j3);
        }

        public static /* synthetic */ a copy$default(a aVar, long j, int i, int i2, long j2, long j3, int i3, Object obj) {
            if ((i3 & 1) != 0) {
                j = aVar.durationMs;
            }
            long j4 = j;
            if ((i3 & 2) != 0) {
                i = aVar.cpuThreads;
            }
            int i4 = i;
            if ((i3 & 4) != 0) {
                i2 = aVar.memoryBytes;
            }
            int i5 = i2;
            if ((i3 & 8) != 0) {
                j2 = aVar.mainThreadJankIntervalMs;
            }
            return aVar.copy(j4, i4, i5, j2, (i3 & 16) != 0 ? aVar.mainThreadJankDurationMs : j3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final long getDurationMs() {
            return this.durationMs;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final int getCpuThreads() {
            return this.cpuThreads;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final int getMemoryBytes() {
            return this.memoryBytes;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final long getMainThreadJankIntervalMs() {
            return this.mainThreadJankIntervalMs;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final long getMainThreadJankDurationMs() {
            return this.mainThreadJankDurationMs;
        }

        public final a copy(long durationMs, int cpuThreads, int memoryBytes, long mainThreadJankIntervalMs, long mainThreadJankDurationMs) {
            return new a(durationMs, cpuThreads, memoryBytes, mainThreadJankIntervalMs, mainThreadJankDurationMs);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof a)) {
                return false;
            }
            a aVar = (a) other;
            return this.durationMs == aVar.durationMs && this.cpuThreads == aVar.cpuThreads && this.memoryBytes == aVar.memoryBytes && this.mainThreadJankIntervalMs == aVar.mainThreadJankIntervalMs && this.mainThreadJankDurationMs == aVar.mainThreadJankDurationMs;
        }

        public final int getCpuThreads() {
            return this.cpuThreads;
        }

        public final long getDurationMs() {
            return this.durationMs;
        }

        public final long getMainThreadJankDurationMs() {
            return this.mainThreadJankDurationMs;
        }

        public final long getMainThreadJankIntervalMs() {
            return this.mainThreadJankIntervalMs;
        }

        public final int getMemoryBytes() {
            return this.memoryBytes;
        }

        public int hashCode() {
            long j = this.durationMs;
            int i = ((((((int) (j ^ (j >>> 32))) * 31) + this.cpuThreads) * 31) + this.memoryBytes) * 31;
            long j2 = this.mainThreadJankIntervalMs;
            int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
            long j3 = this.mainThreadJankDurationMs;
            return i2 + ((int) ((j3 >>> 32) ^ j3));
        }

        public String toString() {
            return "SimulatedLoadConfig(durationMs=" + this.durationMs + ", cpuThreads=" + this.cpuThreads + ", memoryBytes=" + this.memoryBytes + ", mainThreadJankIntervalMs=" + this.mainThreadJankIntervalMs + ", mainThreadJankDurationMs=" + this.mainThreadJankDurationMs + ")";
        }

        public a(long j, int i, int i2, long j2, long j3) {
            this.durationMs = j;
            this.cpuThreads = i;
            this.memoryBytes = i2;
            this.mainThreadJankIntervalMs = j2;
            this.mainThreadJankDurationMs = j3;
        }

        public a() {
            this(0L, 0, 0, 0L, 0L, 31, null);
        }
    }

    public static final Thread a(Runnable runnable) {
        Thread thread = new Thread(runnable, "sprig-load-sim");
        thread.setDaemon(true);
        return thread;
    }
}
