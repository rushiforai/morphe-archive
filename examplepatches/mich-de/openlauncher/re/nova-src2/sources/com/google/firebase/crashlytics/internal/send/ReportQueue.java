package com.google.firebase.crashlytics.internal.send;

import android.annotation.SuppressLint;
import android.os.SystemClock;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.common.CrashlyticsReportWithSessionId;
import com.google.firebase.crashlytics.internal.common.OnDemandCounter;
import com.google.firebase.crashlytics.internal.common.Utils;
import com.google.firebase.crashlytics.internal.settings.Settings;
import fi.j;
import java.util.Locale;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import ps.l;
import qd.d;
import qd.f;
import qd.h;
import td.p;

/* loaded from: classes.dex */
final class ReportQueue {
    private static final int MAX_DELAY_MS = 3600000;
    private static final int MS_PER_MINUTE = 60000;
    private static final int MS_PER_SECOND = 1000;
    private static final int STARTUP_DURATION_MS = 2000;
    private final double base;
    private long lastUpdatedMs;
    private final OnDemandCounter onDemandCounter;
    private final BlockingQueue<Runnable> queue;
    private final int queueCapacity;
    private final double ratePerMinute;
    private final ThreadPoolExecutor singleThreadExecutor;
    private final long startTimeMs;
    private int step;
    private final long stepDurationMs;
    private final f transport;

    /* loaded from: classes3.dex */
    public final class ReportRunnable implements Runnable {
        private final CrashlyticsReportWithSessionId reportWithSessionId;
        private final j tcs;

        @Override // java.lang.Runnable
        public void run() throws InterruptedException {
            ReportQueue.this.sendReport(this.reportWithSessionId, this.tcs);
            ReportQueue.this.onDemandCounter.resetDroppedOnDemandExceptions();
            double dCalcDelay = ReportQueue.this.calcDelay();
            Logger.getLogger().d("Delay for: " + String.format(Locale.US, "%.2f", Double.valueOf(dCalcDelay / 1000.0d)) + " s for report: " + this.reportWithSessionId.getSessionId());
            ReportQueue.sleep(dCalcDelay);
        }

        private ReportRunnable(CrashlyticsReportWithSessionId crashlyticsReportWithSessionId, j jVar) {
            this.reportWithSessionId = crashlyticsReportWithSessionId;
            this.tcs = jVar;
        }
    }

    public ReportQueue(f fVar, Settings settings, OnDemandCounter onDemandCounter) {
        this(settings.onDemandUploadRatePerMinute, settings.onDemandBackoffBase, settings.onDemandBackoffStepDurationSeconds * 1000, fVar, onDemandCounter);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public double calcDelay() {
        return Math.min(3600000.0d, Math.pow(this.base, calcStep()) * (60000.0d / this.ratePerMinute));
    }

    private int calcStep() {
        if (this.lastUpdatedMs == 0) {
            this.lastUpdatedMs = now();
        }
        int iNow = (int) ((now() - this.lastUpdatedMs) / this.stepDurationMs);
        int iMin = isQueueFull() ? Math.min(100, this.step + iNow) : Math.max(0, this.step - iNow);
        if (this.step != iMin) {
            this.step = iMin;
            this.lastUpdatedMs = now();
        }
        return iMin;
    }

    private boolean isQueueAvailable() {
        return this.queue.size() < this.queueCapacity;
    }

    private boolean isQueueFull() {
        return this.queue.size() == this.queueCapacity;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$flushScheduledReportsIfAble$0(CountDownLatch countDownLatch) {
        try {
            l.t(this.transport);
        } catch (Exception unused) {
        }
        countDownLatch.countDown();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$sendReport$1(j jVar, boolean z11, CrashlyticsReportWithSessionId crashlyticsReportWithSessionId, Exception exc) {
        if (exc != null) {
            jVar.b(exc);
            return;
        }
        if (z11) {
            flushScheduledReportsIfAble();
        }
        jVar.c(crashlyticsReportWithSessionId);
    }

    private long now() {
        return System.currentTimeMillis();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendReport(final CrashlyticsReportWithSessionId crashlyticsReportWithSessionId, final j jVar) {
        Logger.getLogger().d("Sending report through Google DataTransport: " + crashlyticsReportWithSessionId.getSessionId());
        final boolean z11 = SystemClock.elapsedRealtime() - this.startTimeMs < 2000;
        ((p) this.transport).a(new qd.a(crashlyticsReportWithSessionId.getReport(), d.f83920c, null), new h() { // from class: com.google.firebase.crashlytics.internal.send.b
            @Override // qd.h
            public final void a(Exception exc) {
                this.f34744a.lambda$sendReport$1(jVar, z11, crashlyticsReportWithSessionId, exc);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void sleep(double d5) throws InterruptedException {
        try {
            Thread.sleep((long) d5);
        } catch (InterruptedException unused) {
        }
    }

    public j enqueueReport(CrashlyticsReportWithSessionId crashlyticsReportWithSessionId, boolean z11) {
        synchronized (this.queue) {
            try {
                j jVar = new j();
                if (!z11) {
                    sendReport(crashlyticsReportWithSessionId, jVar);
                    return jVar;
                }
                this.onDemandCounter.incrementRecordedOnDemandExceptions();
                if (!isQueueAvailable()) {
                    calcStep();
                    Logger.getLogger().d("Dropping report due to queue being full: " + crashlyticsReportWithSessionId.getSessionId());
                    this.onDemandCounter.incrementDroppedOnDemandExceptions();
                    jVar.c(crashlyticsReportWithSessionId);
                    return jVar;
                }
                Logger.getLogger().d("Enqueueing report: " + crashlyticsReportWithSessionId.getSessionId());
                Logger.getLogger().d("Queue size: " + this.queue.size());
                this.singleThreadExecutor.execute(new ReportRunnable(crashlyticsReportWithSessionId, jVar));
                Logger.getLogger().d("Closing task for report: " + crashlyticsReportWithSessionId.getSessionId());
                jVar.c(crashlyticsReportWithSessionId);
                return jVar;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @SuppressLint({"DiscouragedApi", "ThreadPoolCreation"})
    public void flushScheduledReportsIfAble() {
        final CountDownLatch countDownLatch = new CountDownLatch(1);
        new Thread(new Runnable() { // from class: com.google.firebase.crashlytics.internal.send.a
            @Override // java.lang.Runnable
            public final void run() {
                this.f34742a.lambda$flushScheduledReportsIfAble$0(countDownLatch);
            }
        }).start();
        Utils.awaitUninterruptibly(countDownLatch, 2L, TimeUnit.SECONDS);
    }

    @SuppressLint({"ThreadPoolCreation"})
    public ReportQueue(double d5, double d11, long j11, f fVar, OnDemandCounter onDemandCounter) {
        this.ratePerMinute = d5;
        this.base = d11;
        this.stepDurationMs = j11;
        this.transport = fVar;
        this.onDemandCounter = onDemandCounter;
        this.startTimeMs = SystemClock.elapsedRealtime();
        int i5 = (int) d5;
        this.queueCapacity = i5;
        ArrayBlockingQueue arrayBlockingQueue = new ArrayBlockingQueue(i5);
        this.queue = arrayBlockingQueue;
        this.singleThreadExecutor = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS, arrayBlockingQueue);
        this.step = 0;
        this.lastUpdatedMs = 0L;
    }
}
