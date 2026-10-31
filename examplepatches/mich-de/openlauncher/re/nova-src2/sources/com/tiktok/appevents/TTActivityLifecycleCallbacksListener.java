package com.tiktok.appevents;

import com.tiktok.iap.TTInAppPurchaseWrapper;
import com.tiktok.util.JSON;
import com.tiktok.util.TTUtil;
import h6.a0;
import org.json.JSONObject;

/* loaded from: classes4.dex */
class TTActivityLifecycleCallbacksListener extends TTLifeCycleCallbacksAdapter {
    private static boolean isPaused = false;
    private final TTAppEventLogger appEventLogger;
    private long bgStart = 0;
    private long fgStart = System.currentTimeMillis();

    public TTActivityLifecycleCallbacksListener(TTAppEventLogger tTAppEventLogger) {
        this.appEventLogger = tTAppEventLogger;
    }

    public static boolean isBackground() {
        return isPaused;
    }

    private void reportBackground(long j11) {
        try {
            long jCurrentTimeMillis = System.currentTimeMillis() - j11;
            JSONObject metaWithTS = TTUtil.getMetaWithTS(Long.valueOf(j11));
            JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis);
            this.appEventLogger.monitorMetric("background", metaWithTS, null);
        } catch (Throwable unused) {
        }
    }

    private void reportForeground(long j11) {
        try {
            long jCurrentTimeMillis = System.currentTimeMillis() - j11;
            JSONObject metaWithTS = TTUtil.getMetaWithTS(Long.valueOf(j11));
            JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis);
            this.appEventLogger.monitorMetric("foreground", metaWithTS, null);
        } catch (Throwable unused) {
        }
    }

    @Override // com.tiktok.appevents.TTLifeCycleCallbacksAdapter, androidx.lifecycle.DefaultLifecycleObserver
    public void onDestroy(a0 a0Var) {
        this.appEventLogger.stopScheduler();
    }

    @Override // com.tiktok.appevents.TTLifeCycleCallbacksAdapter, androidx.lifecycle.DefaultLifecycleObserver
    public void onPause(a0 a0Var) {
        reportForeground(this.fgStart);
        this.bgStart = System.currentTimeMillis();
        this.appEventLogger.stopScheduler();
        isPaused = true;
        TTInAppPurchaseWrapper.registerIapTrack();
    }

    @Override // com.tiktok.appevents.TTLifeCycleCallbacksAdapter, androidx.lifecycle.DefaultLifecycleObserver
    public void onResume(a0 a0Var) {
        if (isPaused) {
            reportBackground(this.bgStart);
            this.fgStart = System.currentTimeMillis();
            this.appEventLogger.fetchGlobalConfig(0);
            this.appEventLogger.restartScheduler();
            this.appEventLogger.autoEventsManager.track2DayRetentionEvent();
        }
        isPaused = false;
    }

    @Override // com.tiktok.appevents.TTLifeCycleCallbacksAdapter, androidx.lifecycle.DefaultLifecycleObserver
    public void onStop(a0 a0Var) {
        this.appEventLogger.persistEvents();
        this.appEventLogger.persistMonitor();
    }
}
