package com.tiktok.appevents;

import aa.x;
import ab.k;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import androidx.lifecycle.ProcessLifecycleOwner;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.appevents.TTAppEvent;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.EDPConfig;
import com.tiktok.appevents.edp.TTEDPEventTrack;
import com.tiktok.iap.TTInAppPurchaseWrapper;
import com.tiktok.unity.TTUnityBridge;
import com.tiktok.util.HttpRequestUtil;
import com.tiktok.util.JSON;
import com.tiktok.util.LastSessionUtil;
import com.tiktok.util.NetworkTimeout;
import com.tiktok.util.SystemInfoUtil;
import com.tiktok.util.TTConst;
import com.tiktok.util.TTHandlerUtil;
import com.tiktok.util.TTLogger;
import com.tiktok.util.TTUtil;
import h6.u;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTAppEventLogger {
    public static final String NETWORK_IS_TURNED_OFF = "SDK can't send tracking events to server, it will be cached locally, and will be sent in batches only after startTracking";
    static final String SKIP_FLUSHING_BECAUSE_GLOBAL_CONFIG_IS_NOT_FETCHED = "Skip flushing because global config is not fetched";
    static final String SKIP_FLUSHING_BECAUSE_GLOBAL_SWITCH_IS_TURNED_OFF = "Skip flushing because global switch is turned off";
    static final String TAG = "TTAppEventLogger";
    static final int THRESHOLD = 100;
    private static int TIME_BUFFER = 0;
    public static volatile boolean autoTrackRetentionEnable = true;
    static int totalDumped;
    final TTAutoEventsManager autoEventsManager;
    int counter;
    final List<TTConst.AutoEvents> disabledEvents;
    private final Runnable heartRunnable;
    u lifecycle;
    final boolean lifecycleTrackEnable;
    TTLogger logger;
    final Handler uiThreadHandler;
    static final ScheduledExecutorService eventLoop = Executors.newSingleThreadScheduledExecutor(new TTThreadFactory());
    static final ScheduledExecutorService timerService = Executors.newSingleThreadScheduledExecutor(new TTThreadFactory());
    static boolean metricsEnabled = true;
    private static final TTLifecycleListener mLifecycleListener = new TTLifecycleListener();
    int flushId = 0;
    ScheduledFuture<?> future = null;
    ScheduledFuture<?> timeFuture = null;
    private final Runnable batchFlush = new b(this, 1);

    public enum FlushReason {
        THRESHOLD,
        TIMER,
        START_UP,
        FORCE_FLUSH,
        IDENTIFY,
        LOGOUT
    }

    public TTAppEventLogger(boolean z11, List<TTConst.AutoEvents> list, int i5, boolean z12) {
        Handler handler = new Handler(Looper.getMainLooper());
        this.uiThreadHandler = handler;
        this.heartRunnable = new Runnable() { // from class: com.tiktok.appevents.TTAppEventLogger.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    TTAppEventLogger.this.startHeart();
                    if (!TTActivityLifecycleCallbacksListener.isBackground() && TikTokBusinessSdk.isGlobalConfigFetched().booleanValue() && TikTokBusinessSdk.isSystemActivated()) {
                        TikTokBusinessSdk.getAppEventLogger().monitorMetric("session_activity", TTUtil.getMetaWithTS(Long.valueOf(System.currentTimeMillis())), null);
                    }
                } catch (Throwable unused) {
                }
            }
        };
        this.logger = new TTLogger(TAG, TikTokBusinessSdk.getLogLevel());
        this.lifecycleTrackEnable = z11;
        this.disabledEvents = list;
        TIME_BUFFER = i5;
        this.counter = i5;
        this.lifecycle = ProcessLifecycleOwner.f14727c.f14729b;
        if (z12) {
            metricsEnabled = false;
        }
        Runnable runnable = new Runnable() { // from class: com.tiktok.appevents.TTAppEventLogger.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    TTAppEventLogger.this.lifecycle.a(new TTActivityLifecycleCallbacksListener(TTAppEventLogger.this));
                    TikTokBusinessSdk.getApplicationContext().registerActivityLifecycleCallbacks(TTAppEventLogger.mLifecycleListener);
                } catch (Throwable unused) {
                }
            }
        };
        try {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                runnable.run();
            } else {
                handler.post(runnable);
            }
        } catch (Throwable unused) {
        }
        this.autoEventsManager = new TTAutoEventsManager(this);
    }

    private void activateSdk() {
        this.autoEventsManager.trackOnAppOpenEvents();
        startScheduler();
        lambda$flushWithReason$6(FlushReason.START_UP);
        TTEDPEventTrack.trackFirstAppLaunch();
    }

    private void addToLater(Runnable runnable, int i5) {
        try {
            eventLoop.schedule(runnable, i5, TimeUnit.SECONDS);
        } catch (Throwable th2) {
            onExecuteFailed(runnable, th2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addToTask(final TTAppEvent tTAppEvent, final TTAppEvent.TTAppEventType tTAppEventType, final String str, final JSONObject jSONObject, final String str2, final boolean z11) {
        addToQ(new Runnable() { // from class: com.tiktok.appevents.a
            @Override // java.lang.Runnable
            public final void run() {
                String str3 = str;
                String str4 = str2;
                TTAppEventLogger tTAppEventLogger = this.f46531a;
                TTAppEvent tTAppEvent2 = tTAppEvent;
                TTAppEvent.TTAppEventType tTAppEventType2 = tTAppEventType;
                tTAppEventLogger.lambda$addToTask$5(tTAppEvent2, z11, jSONObject, tTAppEventType2, str3, str4);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAllImmediately() {
        TTAppEventsQueue.clearAll();
        TTEdpAppEventsQueue.clearAll();
        TTAppEventStorage.clearAll();
    }

    private void doStartScheduler(int i5, boolean z11) {
        try {
            if (this.future == null) {
                this.future = eventLoop.scheduleWithFixedDelay(this.batchFlush, z11 ? 0L : i5, i5, TimeUnit.SECONDS);
            }
            if (this.timeFuture != null || TikTokBusinessSdk.nextTimeFlushListener == null) {
                return;
            }
            this.counter = i5;
            this.timeFuture = timerService.scheduleWithFixedDelay(new k(this, i5, 4), 0L, 1L, TimeUnit.SECONDS);
        } catch (Throwable unused) {
            TikTokBusinessSdk.setSdkGlobalSwitch(Boolean.FALSE);
        }
    }

    public static List<TTAppEvent> getSuccessfulEvents() {
        return TTRequest.getSuccessfullySentRequests();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$addToTask$5(TTAppEvent tTAppEvent, boolean z11, JSONObject jSONObject, TTAppEvent.TTAppEventType tTAppEventType, String str, String str2) {
        if (tTAppEvent == null) {
            if (z11) {
                try {
                    JSON.putObject(jSONObject, "track_source", "edp");
                } catch (Throwable unused) {
                    return;
                }
            }
            tTAppEvent = new TTAppEvent(tTAppEventType, str, jSONObject == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : jSONObject.toString(), str2, TikTokBusinessSdk.getTTAppIds());
        }
        if (z11) {
            TTEdpAppEventsQueue.addEvent(tTAppEvent);
        } else {
            TTAppEventsQueue.addEvent(tTAppEvent);
        }
        if (TTAppEventsQueue.size() + TTEdpAppEventsQueue.size() > 100) {
            lambda$flushWithReason$6(FlushReason.THRESHOLD);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$doStartScheduler$4(int i5) {
        TikTokBusinessSdk.nextTimeFlushListener.timeLeft(this.counter);
        if (this.counter == 0) {
            this.counter = i5;
        }
        this.counter--;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ void lambda$fetchDeferredDeeplinkWithCompletion$9(DeeplinkCallbackWrapper deeplinkCallbackWrapper) {
        ErrorData errorData;
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        deeplinkCallbackWrapper.markThread();
        try {
            HttpRequestUtil.HttpResponse httpResponseFetchDeferredDeeplinkWithCompletion = TTRequest.fetchDeferredDeeplinkWithCompletion();
            String string = JSON.getString(JSON.getJsonObject(httpResponseFetchDeferredDeeplinkWithCompletion.body, "data"), "ddl");
            deeplinkCallbackWrapper.markRequest();
            if (!httpResponseFetchDeferredDeeplinkWithCompletion.isOK() || TextUtils.isEmpty(string)) {
                errorData = new ErrorData(httpResponseFetchDeferredDeeplinkWithCompletion.getErrCode(), httpResponseFetchDeferredDeeplinkWithCompletion.getErrMsg());
            } else {
                errorData = null;
                str = string;
            }
        } catch (Throwable th2) {
            errorData = new ErrorData(-2, th2.getMessage());
        }
        deeplinkCallbackWrapper.markEnd();
        deeplinkCallbackWrapper.completion(str, errorData);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$fetchGlobalConfig$7() {
        boolean z11;
        JSONObject jsonObject;
        boolean zIsSuccess;
        try {
            this.logger.info("Fetching global config....", new Object[0]);
            JSONObject businessSDKConfig = TTRequest.getBusinessSDKConfig();
            try {
                if (businessSDKConfig == null) {
                    this.logger.info("config is null, api returns error", new Object[0]);
                    businessSDKConfig = TTRequest.getBusinessSDKConfig();
                    if (businessSDKConfig == null) {
                        this.logger.info("config is null, api returns error2", new Object[0]);
                        if (TikTokBusinessSdk.isSystemActivated() && !TikTokBusinessSdk.isActivatedLogicRun) {
                            TikTokBusinessSdk.isActivatedLogicRun = true;
                            activateSdk();
                            return;
                        }
                    }
                    return;
                }
                String string = JSON.getString(jsonObject, "available_version");
                String string2 = JSON.getString(jsonObject, "domain");
                NetworkTimeout.updateConfig(jsonObject);
                TikTokBusinessSdk.setSdkGlobalSwitch(Boolean.valueOf(z11));
                this.logger.debug("enable_sdk=" + z11, new Object[0]);
                if (!z11) {
                    this.logger.info("Clear all events and stop timers because global switch is not turned on", new Object[0]);
                    clearAllImmediately();
                }
                TikTokBusinessSdk.setApiAvailableVersion(string);
                TikTokBusinessSdk.setApiTrackDomain(string2);
                this.logger.debug("available_version=" + string, new Object[0]);
                TikTokBusinessSdk.setGlobalConfigFetched();
                autoTrackRetentionEnable = JSON.getBoolean(jsonObject, "auto_track_Retention_enable");
                TTInAppPurchaseWrapper.updateConfig(jsonObject);
                TTUnityBridge.setConfigCallback(businessSDKConfig);
                EDPConfig.optConfig(JSON.getJsonObject(jsonObject, EDPConfig.ConfigConst.EDP_NATIVE_SDK_CONFIG));
                if (z11) {
                    if (!zIsSuccess) {
                        return;
                    }
                }
                return;
            } catch (Throwable th2) {
                th = th2;
                try {
                    this.logger.error(th, "Errors occurred during initGlobalConfig", new Object[0]);
                    if (TikTokBusinessSdk.isSystemActivated() && !TikTokBusinessSdk.isActivatedLogicRun) {
                        TikTokBusinessSdk.isActivatedLogicRun = true;
                        activateSdk();
                    }
                    if (!z11 || DebugModeHelper.isSuccess()) {
                        return;
                    }
                    addToQ(new c(0));
                    return;
                } finally {
                    if (TikTokBusinessSdk.isSystemActivated() && !TikTokBusinessSdk.isActivatedLogicRun) {
                        TikTokBusinessSdk.isActivatedLogicRun = true;
                        activateSdk();
                    }
                    if (z11 && !DebugModeHelper.isSuccess()) {
                        addToQ(new c(0));
                    }
                }
            }
            jsonObject = JSON.getJsonObject(businessSDKConfig, "business_sdk_config");
            z11 = JSON.getBoolean(jsonObject, EDPConfig.ConfigConst.ENABLE_SDK, false);
        } catch (Throwable th3) {
            th = th3;
            z11 = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initConfig$1(AtomicBoolean atomicBoolean, TikTokBusinessSdk.TTInitCallback tTInitCallback, long j11) {
        try {
            startHeart();
            LastSessionUtil.getLastSessionID();
            SystemInfoUtil.initAppSessionId();
            SystemInfoUtil.initInstallReferrer();
            SystemInfoUtil.updateSensigInfo();
            SystemInfoUtil.initUserAgent();
            TTAppEventsQueue.clearAll();
            TTEdpAppEventsQueue.clearAll();
            atomicBoolean.set(true);
            if (tTInitCallback != null) {
                tTInitCallback.success();
            }
            JSON.putLong(TTUtil.getMetaWithTS(Long.valueOf(j11)), "duration", System.currentTimeMillis() - j11);
            monitorMetric("init_end_callback", TTUtil.getMetaWithTS(Long.valueOf(j11)), null);
        } catch (Throwable th2) {
            this.logger.error(th2, "init error", new Object[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ void lambda$monitorMetric$8(String str, JSONObject jSONObject, JSONObject jSONObject2) {
        JSONObject jSONObjectBuild;
        if (metricsEnabled) {
            try {
                jSONObjectBuild = TTRequestBuilder.getHealthMonitorBase();
            } catch (Throwable unused) {
                jSONObjectBuild = JSON.build();
            }
            JSONObject jSONObjectBuild2 = JSON.build();
            JSON.putObject(jSONObjectBuild2, TTConst.TRACK_TYPE, "metric");
            JSON.putObject(jSONObjectBuild2, PendingUpgradeStore.KEY_NAME, str);
            if (jSONObject != null) {
                JSON.putObject(jSONObjectBuild2, "meta", jSONObject);
            }
            if (jSONObject2 != null) {
                JSON.putObject(jSONObjectBuild2, "extra", jSONObject2);
            }
            JSON.putObject(jSONObjectBuild, "monitor", jSONObjectBuild2);
            TTCrashHandler.retryLater(jSONObjectBuild);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$0() {
        lambda$flushWithReason$6(FlushReason.TIMER);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$trackPurchase$3(List list, boolean z11) {
        if (list.isEmpty()) {
            return;
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            TTPurchaseInfo tTPurchaseInfo = (TTPurchaseInfo) it.next();
            JSONObject purchaseProps = TTInAppPurchaseManager.getPurchaseProps(tTPurchaseInfo);
            if (purchaseProps != null) {
                track(z11 ? "__purchase_history" : TTContentsEventConstants.ContentsEventName.EVENT_NAME_PURCHASE, purchaseProps, tTPurchaseInfo.getEventId());
            }
        }
    }

    private void onExecuteFailed(Runnable runnable, Throwable th2) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            runnable.run();
        } else {
            this.logger.error(th2, "Runnable execute error", new Object[0]);
        }
    }

    private void trackEvent(final TTAppEvent.TTAppEventType tTAppEventType, final String str, JSONObject jSONObject, final String str2, final boolean z11) {
        if (!TikTokBusinessSdk.isSystemActivated() || TextUtils.isEmpty(TikTokBusinessSdk.getAppId())) {
            return;
        }
        try {
            if ("enhanced_data_postback".equals(JSON.getString(jSONObject, "monitor_type", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b))) {
                TTEDPEventTrack.trackUnityEvent(str, jSONObject);
                return;
            }
        } catch (Throwable unused) {
        }
        if (jSONObject == null) {
            jSONObject = JSON.build();
        }
        final JSONObject jSONObject2 = jSONObject;
        if (TikTokBusinessSdk.isEnableDebugMode().booleanValue()) {
            this.uiThreadHandler.post(new Runnable() { // from class: com.tiktok.appevents.TTAppEventLogger.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (z11) {
                            JSON.putObject(jSONObject2, "track_source", "edp");
                        }
                        TTAppEvent tTAppEvent = new TTAppEvent(tTAppEventType, str, jSONObject2.toString(), str2, TikTokBusinessSdk.getTTAppIds());
                        tTAppEvent.setScreenShot();
                        TTAppEventLogger.this.addToTask(tTAppEvent, null, null, null, null, z11);
                    } catch (Throwable unused2) {
                    }
                }
            });
        } else {
            addToTask(null, tTAppEventType, str, jSONObject2, str2, z11);
        }
    }

    public void addToQ(Runnable runnable) {
        try {
            eventLoop.execute(runnable);
        } catch (Throwable th2) {
            onExecuteFailed(runnable, th2);
        }
    }

    public void clearAll() {
        addToQ(new b(this, 0));
    }

    public void closeHeart() {
        TTHandlerUtil.getInstance().removeCallbacks(this.heartRunnable);
    }

    public void destroy() {
        TTAppEventsQueue.clearAll();
        TTEdpAppEventsQueue.clearAll();
        stopScheduler();
    }

    public void fetchDeferredDeeplinkWithCompletion(TikTokBusinessSdk.FetchDeferredDeeplinkCompletion fetchDeferredDeeplinkCompletion) {
        DeeplinkCallbackWrapper deeplinkCallbackWrapper = new DeeplinkCallbackWrapper(fetchDeferredDeeplinkCompletion);
        deeplinkCallbackWrapper.markInit();
        addToQ(new x(deeplinkCallbackWrapper, 21));
    }

    public void fetchGlobalConfig(int i5) {
        addToLater(new b(this, 2), i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00d1 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* renamed from: flush, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void lambda$flushWithReason$6(FlushReason flushReason) {
        int size;
        Throwable th2;
        long jCurrentTimeMillis = System.currentTimeMillis();
        TTUtil.checkThread(TAG);
        int i5 = 0;
        if (!TikTokBusinessSdk.isGlobalConfigFetched().booleanValue()) {
            this.logger.info(SKIP_FLUSHING_BECAUSE_GLOBAL_CONFIG_IS_NOT_FETCHED, new Object[0]);
            return;
        }
        if (!TikTokBusinessSdk.isSystemActivated()) {
            this.logger.info(SKIP_FLUSHING_BECAUSE_GLOBAL_SWITCH_IS_TURNED_OFF, new Object[0]);
            return;
        }
        try {
        } catch (Throwable th3) {
            size = 0;
            th2 = th3;
        }
        if (!TikTokBusinessSdk.getNetworkSwitch()) {
            this.logger.info(NETWORK_IS_TURNED_OFF, new Object[0]);
            TTAppEventStorage.persist(null);
            if (i5 != 0) {
            }
            addToQ(new c(2));
        }
        this.logger.debug("Start flush, version %d reason is %s", Integer.valueOf(this.flushId), flushReason.name());
        TTAppEventPersist fromDisk = TTAppEventStorage.readFromDisk();
        fromDisk.addEvents(TTAppEventsQueue.exportAllEvents());
        size = fromDisk.getAppEvents().size() + TTEdpAppEventsQueue.size();
        try {
            List<TTAppEvent> listReportAppEvent = TTRequest.reportAppEvent(TTRequestBuilder.getBasePayloadWithTs(), fromDisk.getAppEvents(), false);
            TTRequest.reportAppEvent(TTRequestBuilder.getBasePayloadWithTs(), TTEdpAppEventsQueue.exportAllEvents(), true);
            if (listReportAppEvent != null && !listReportAppEvent.isEmpty()) {
                this.logger.debug("Failed to send %d events, will save to disk", Integer.valueOf(listReportAppEvent.size()));
                TTAppEventStorage.persist(listReportAppEvent);
            }
            this.logger.debug("END flush, version %d reason is %s", Integer.valueOf(this.flushId), flushReason.name());
            this.flushId++;
        } catch (Throwable th4) {
            th2 = th4;
            try {
                TTEdpAppEventsQueue.clearAll();
                TTCrashHandler.handleCrash(TAG, th2, 2);
            } catch (Throwable unused) {
            }
            i5 = size;
            if (i5 != 0) {
            }
            addToQ(new c(2));
        }
        i5 = size;
        if (i5 != 0) {
            try {
                long jCurrentTimeMillis2 = System.currentTimeMillis();
                JSONObject metaWithTS = TTUtil.getMetaWithTS(Long.valueOf(jCurrentTimeMillis));
                JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis2 - jCurrentTimeMillis);
                JSON.putObject(metaWithTS, TTConst.TRACK_TYPE, flushReason.name());
                JSON.putInt(metaWithTS, "interval", TIME_BUFFER);
                JSON.putInt(metaWithTS, "size", i5);
                monitorMetric("flush", metaWithTS, null);
            } catch (Throwable unused2) {
            }
        }
        addToQ(new c(2));
    }

    public void flushWithReason(FlushReason flushReason) {
        this.logger.debug(flushReason.name() + " triggered flush", new Object[0]);
        addToQ(new ae.c(18, this, flushReason));
    }

    public void forceFlush() {
        flushWithReason(FlushReason.FORCE_FLUSH);
    }

    public boolean identify(String str, String str2, String str3, String str4) {
        try {
            TTUserInfo tTUserInfo = TTUserInfo.sharedInstance;
            if (tTUserInfo.isIdentified()) {
                this.logger.warn("SDK is already identified, if you want to switch to anotheruser account, plz call TiktokBusinessSDK.logout() first and then identify", new Object[0]);
                return false;
            }
            tTUserInfo.setIdentified();
            if (!TextUtils.isEmpty(str)) {
                tTUserInfo.setExternalId(str);
            }
            if (!TextUtils.isEmpty(str2)) {
                tTUserInfo.setExternalUserName(str2);
            }
            if (!TextUtils.isEmpty(str3)) {
                tTUserInfo.setPhoneNumber(str3);
            }
            if (!TextUtils.isEmpty(str4)) {
                tTUserInfo.setEmail(str4);
            }
            try {
                trackEvent(TTAppEvent.TTAppEventType.identify, null, null, null, false);
                flushWithReason(FlushReason.IDENTIFY);
                return true;
            } catch (Throwable unused) {
                return false;
            }
        } catch (Throwable unused2) {
        }
    }

    public void initConfig(long j11, TikTokBusinessSdk.TTInitCallback tTInitCallback, AtomicBoolean atomicBoolean) {
        addToQ(new c40.a(this, atomicBoolean, tTInitCallback, j11));
        fetchGlobalConfig(0);
        monitorMetric("init_start", TTUtil.getMetaWithTS(Long.valueOf(j11)), null);
    }

    public void logout() {
        TTUserInfo.reset(TikTokBusinessSdk.getApplicationContext(), true);
        flushWithReason(FlushReason.LOGOUT);
    }

    public void monitorMetric(String str, JSONObject jSONObject, JSONObject jSONObject2) {
        if (metricsEnabled) {
            addToQ(new androidx.fragment.app.d(9, str, jSONObject, jSONObject2));
        }
    }

    public void persistEvents() {
        addToQ(new c(1));
    }

    public void persistMonitor() {
        addToQ(new c(3));
    }

    public void restartScheduler() {
        int i5 = TIME_BUFFER;
        if (i5 != 0) {
            doStartScheduler(i5, true);
        }
    }

    public void startHeart() {
        try {
            TTHandlerUtil.getInstance().removeCallbacks(this.heartRunnable);
            TTHandlerUtil.getInstance().postDelayed(this.heartRunnable, 60000L);
        } catch (Throwable unused) {
        }
    }

    public void startScheduler() {
        int i5 = TIME_BUFFER;
        if (i5 != 0) {
            doStartScheduler(i5, false);
        }
    }

    public void stopScheduler() {
        try {
            ScheduledFuture<?> scheduledFuture = this.future;
            if (scheduledFuture != null) {
                scheduledFuture.cancel(false);
                this.future = null;
            }
            ScheduledFuture<?> scheduledFuture2 = this.timeFuture;
            if (scheduledFuture2 != null) {
                scheduledFuture2.cancel(false);
                this.timeFuture = null;
            }
        } catch (Throwable th2) {
            this.logger.error(th2, "stop scheduler exception", new Object[0]);
        }
    }

    public void track(String str, JSONObject jSONObject) {
        trackEvent(TTAppEvent.TTAppEventType.track, str, jSONObject, null, false);
    }

    public void trackEdp(String str, JSONObject jSONObject, String str2) {
        trackEvent(TTAppEvent.TTAppEventType.track, str, jSONObject, str2, true);
    }

    public void trackPurchase(List<TTPurchaseInfo> list) {
        trackPurchase(false, list);
    }

    public void track(String str, JSONObject jSONObject, String str2) {
        trackEvent(TTAppEvent.TTAppEventType.track, str, jSONObject, str2, false);
    }

    public void trackPurchase(boolean z11, List<TTPurchaseInfo> list) {
        if (TikTokBusinessSdk.isSystemActivated()) {
            addToQ(new com.amplitude.android.internal.gestures.c(this, list, z11));
        } else {
            this.logger.info("Global switch is off, ignore track purchase", new Object[0]);
        }
    }
}
