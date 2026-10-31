package com.tiktok;

import android.app.Application;
import android.content.Context;
import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.ErrorData;
import com.tiktok.appevents.TTAppEventLogger;
import com.tiktok.appevents.TTCrashHandler;
import com.tiktok.appevents.TTPurchaseInfo;
import com.tiktok.appevents.TTUserInfo;
import com.tiktok.appevents.base.EventName;
import com.tiktok.appevents.base.TTBaseEvent;
import com.tiktok.appevents.edp.TTActivityLifecycleCallbacks;
import com.tiktok.iap.TTInAppPurchaseWrapper;
import com.tiktok.util.JSON;
import com.tiktok.util.RegexUtil;
import com.tiktok.util.TTConst;
import com.tiktok.util.TTLogger;
import com.tiktok.util.TTUtil;
import java.lang.Thread;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TikTokBusinessSdk {
    public static final int INVALID_ID = -2;
    static final String TAG = "com.tiktok.TikTokBusinessSdk";
    static TTAppEventLogger appEventLogger = null;
    private static TTConfig config = null;
    public static DiskStatusListener diskListener = null;
    public static volatile boolean isActivatedLogicRun = false;
    private static TTLogger logger;
    public static MemoryListener memoryListener;
    public static NetworkListener networkListener;
    private static AtomicBoolean networkSwitch;
    public static NextTimeFlushListener nextTimeFlushListener;
    private static CrashListener onCrashListener;
    private static TTActivityLifecycleCallbacks ttActivityLifecycleCallbacks;
    static volatile TikTokBusinessSdk ttSdk;
    private static final AtomicBoolean globalConfigFetched = new AtomicBoolean(false);
    private static final AtomicBoolean enableDebugMode = new AtomicBoolean(false);
    private static Boolean sdkGlobalSwitch = Boolean.TRUE;
    private static String apiAvailableVersion = "v1.2";
    private static String apiTrackDomain = "analytics.us.tiktok.com";
    private static LogLevel logLevel = LogLevel.INFO;
    private static AtomicBoolean sdkDebugModeSwitch = new AtomicBoolean(false);
    private static AtomicBoolean sdkLDUModeSwitch = new AtomicBoolean(false);
    private static AtomicBoolean sdkInitialized = new AtomicBoolean(false);
    private static String testEventCode = b.f42142b;
    private static final String sessionID = UUID.randomUUID().toString();

    public interface CrashListener {
        void onCrash(Thread thread, Throwable th2);
    }

    public interface DiskStatusListener {
        void onDiskChange(int i5, boolean z11);

        void onDumped(int i5);
    }

    public interface FetchDeferredDeeplinkCompletion {
        void completion(String str, ErrorData errorData);
    }

    public enum LogLevel {
        NONE,
        INFO,
        WARN,
        DEBUG;

        public boolean log() {
            return this != NONE;
        }
    }

    public interface MemoryListener {
        void onMemoryChange(int i5);
    }

    public interface NetworkListener {
        void onNetworkChange(int i5, int i11, int i12, int i13, int i14);
    }

    public interface NextTimeFlushListener {
        void thresholdLeft(int i5, int i11);

        void timeLeft(int i5);
    }

    public interface TTInitCallback {
        void fail(int i5, String str);

        void success();
    }

    private TikTokBusinessSdk(TTConfig tTConfig) {
        LogLevel logLevel2 = tTConfig.logLevel;
        logLevel = logLevel2;
        logger = new TTLogger(TAG, logLevel2);
        if (TextUtils.isEmpty(tTConfig.appId) || !RegexUtil.validateAppId(tTConfig.appId)) {
            tTConfig.appId = b.f42142b;
            logger.warn("Invalid App Id!", new Object[0]);
        }
        if (tTConfig.ttAppId == null || !RegexUtil.validateTTAppId(tTConfig.ttAppId)) {
            tTConfig.ttAppId = b.f42142b;
            tTConfig.ttAppIds = new String[]{b.f42142b};
            tTConfig.ttFirstAppId = new BigInteger("0");
            logger.warn("Invalid TikTok App Id!", new Object[0]);
        }
        if (tTConfig.accessToken != null) {
            tTConfig.accessToken = tTConfig.accessToken.trim();
        }
        logger.info("appId: %s, TTAppId: %s, autoIapTrack: %s", tTConfig.appId, tTConfig.ttAppId, Integer.valueOf(tTConfig.autoIapTrack));
        config = tTConfig;
        TTActivityLifecycleCallbacks tTActivityLifecycleCallbacks = ttActivityLifecycleCallbacks;
        if (tTActivityLifecycleCallbacks != null) {
            tTActivityLifecycleCallbacks.registerFirstActivity();
        }
        registerEDPLifecycleCallback(config.application);
        networkSwitch = new AtomicBoolean(tTConfig.autoStart);
        sdkDebugModeSwitch.set(tTConfig.debugModeSwitch);
        if (sdkDebugModeSwitch.get()) {
            testEventCode = createTestEventCode(tTConfig);
        }
        sdkLDUModeSwitch.set(tTConfig.lduModeSwitch);
        TTInAppPurchaseWrapper.devAutoTrack = config.autoIapTrack;
    }

    public static boolean bothIdsProvided() {
        return !onlyAppIdProvided();
    }

    public static void clearAll() {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.clearAll();
    }

    public static void crashSDK() {
        throw new RuntimeException("force crash from sdk");
    }

    private String createTestEventCode(TTConfig tTConfig) {
        return (tTConfig == null || tTConfig.ttAppId == null) ? b.f42142b : tTConfig.ttAppId.toString();
    }

    public static void destroy() {
        ttSdk = null;
        memoryListener = null;
        diskListener = null;
        networkListener = null;
        nextTimeFlushListener = null;
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger != null) {
            tTAppEventLogger.destroy();
        }
    }

    public static void disableDebugMode() {
        enableDebugMode.set(false);
    }

    public static boolean enableAutoIapTrack() {
        TTConfig tTConfig = config;
        return tTConfig == null || tTConfig.isAutoIapTrack();
    }

    public static void enableDebugMode() {
        enableDebugMode.set(true);
    }

    public static void fetchDeferredDeeplinkWithCompletion(FetchDeferredDeeplinkCompletion fetchDeferredDeeplinkCompletion) {
        if (fetchDeferredDeeplinkCompletion == null) {
            return;
        }
        try {
            if (appEventLogger != null && isSystemActivated()) {
                appEventLogger.fetchDeferredDeeplinkWithCompletion(fetchDeferredDeeplinkCompletion);
                return;
            }
            fetchDeferredDeeplinkCompletion.completion(null, new ErrorData(-1, ErrorData.TT_DDL_MSG_NOT_INIT));
        } catch (Throwable unused) {
        }
    }

    public static void flush() {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.forceFlush();
    }

    public static String getAccessToken() {
        return config.accessToken;
    }

    public static String getApiAvailableVersion() {
        return apiAvailableVersion;
    }

    public static String getApiTrackDomain() {
        return apiTrackDomain;
    }

    public static TTAppEventLogger getAppEventLogger() {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (TTCrashHandler.isTTSDKRelatedException((StackTraceElement[]) Arrays.copyOfRange(stackTrace, 3, stackTrace.length))) {
            return appEventLogger;
        }
        return null;
    }

    public static String getAppId() {
        TTConfig tTConfig = config;
        return tTConfig == null ? b.f42142b : tTConfig.appId;
    }

    public static Application getApplicationContext() {
        if (ttSdk == null) {
            return null;
        }
        return config.application;
    }

    public static CrashListener getCrashListener() {
        return onCrashListener;
    }

    public static BigInteger getFirstTTAppIds() {
        TTConfig tTConfig = config;
        return tTConfig == null ? new BigInteger("0") : tTConfig.ttFirstAppId;
    }

    public static LogLevel getLogLevel() {
        return logLevel;
    }

    public static boolean getNetworkSwitch() {
        return networkSwitch.get();
    }

    public static Boolean getSdkGlobalSwitch() {
        return sdkGlobalSwitch;
    }

    public static String getSessionID() {
        return sessionID;
    }

    public static String getTTAppId() {
        TTConfig tTConfig = config;
        return tTConfig == null ? b.f42142b : tTConfig.ttAppId;
    }

    public static String[] getTTAppIds() {
        TTConfig tTConfig = config;
        return tTConfig == null ? new String[0] : tTConfig.ttAppIds;
    }

    public static String getTestEventCode() {
        return testEventCode;
    }

    public static void identify(String str, String str2, String str3, String str4) {
        try {
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (appEventLogger.identify(str, str2, str3, str4)) {
                long jCurrentTimeMillis2 = System.currentTimeMillis();
                JSONObject metaWithTS = TTUtil.getMetaWithTS(Long.valueOf(jCurrentTimeMillis));
                JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis2 - jCurrentTimeMillis);
                JSON.putBoolean(metaWithTS, "extid", str != null);
                JSON.putBoolean(metaWithTS, "username", str2 != null);
                JSON.putBoolean(metaWithTS, "phone", str3 != null);
                JSON.putBoolean(metaWithTS, ActionCategory.EMAIL, str4 != null);
                appEventLogger.monitorMetric("identify", metaWithTS, null);
            }
        } catch (Throwable unused) {
        }
    }

    public static void initializeSdk(TTConfig tTConfig) {
        initializeSdk(tTConfig, null);
    }

    public static boolean isEdpEnable() {
        TTConfig tTConfig = config;
        return tTConfig != null && tTConfig.autoEDPEvent;
    }

    public static Boolean isEnableDebugMode() {
        return Boolean.valueOf(enableDebugMode.get());
    }

    public static boolean isGaidCollectionEnabled() {
        TTConfig tTConfig = config;
        if (tTConfig == null) {
            return false;
        }
        return tTConfig.advertiserIDCollectionEnable;
    }

    public static Boolean isGlobalConfigFetched() {
        return Boolean.valueOf(globalConfigFetched.get());
    }

    public static Boolean isInSdkDebugMode() {
        return Boolean.valueOf(sdkDebugModeSwitch.get());
    }

    public static Boolean isInSdkLDUMode() {
        return Boolean.valueOf(sdkLDUModeSwitch.get());
    }

    public static boolean isInitialized() {
        return ttSdk != null && sdkInitialized.get();
    }

    public static boolean isSystemActivated() {
        if (logger == null) {
            return false;
        }
        Boolean sdkGlobalSwitch2 = getSdkGlobalSwitch();
        if (!sdkGlobalSwitch2.booleanValue()) {
            logger.info("Global switch is off, ignore all operations", new Object[0]);
        }
        return sdkGlobalSwitch2.booleanValue();
    }

    public static void logout() {
        try {
            long jCurrentTimeMillis = System.currentTimeMillis();
            appEventLogger.logout();
            long jCurrentTimeMillis2 = System.currentTimeMillis();
            JSONObject metaWithTS = TTUtil.getMetaWithTS(Long.valueOf(jCurrentTimeMillis));
            JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis2 - jCurrentTimeMillis);
            appEventLogger.monitorMetric("logout", metaWithTS, null);
        } catch (Throwable unused) {
        }
    }

    public static boolean onlyAppIdProvided() {
        TTConfig tTConfig = config;
        return tTConfig == null || tTConfig.ttAppId == null;
    }

    public static void registerEDPLifecycleCallback(Application application) {
        if (application == null || ttActivityLifecycleCallbacks != null) {
            return;
        }
        TTActivityLifecycleCallbacks tTActivityLifecycleCallbacks = new TTActivityLifecycleCallbacks();
        ttActivityLifecycleCallbacks = tTActivityLifecycleCallbacks;
        application.registerActivityLifecycleCallbacks(tTActivityLifecycleCallbacks);
    }

    public static void setApiAvailableVersion(String str) {
        apiAvailableVersion = str;
    }

    public static void setApiTrackDomain(String str) {
        apiTrackDomain = str;
    }

    public static void setGlobalConfigFetched() {
        globalConfigFetched.set(true);
    }

    public static void setOnCrashListener(CrashListener crashListener) {
        onCrashListener = crashListener;
    }

    public static void setSdkGlobalSwitch(Boolean bool) {
        sdkGlobalSwitch = bool;
    }

    public static void setUpSdkListeners(MemoryListener memoryListener2, DiskStatusListener diskStatusListener, NetworkListener networkListener2, NextTimeFlushListener nextTimeFlushListener2) {
        if (memoryListener2 != null) {
            memoryListener = memoryListener2;
        }
        if (diskStatusListener != null) {
            diskListener = diskStatusListener;
        }
        if (networkListener2 != null) {
            networkListener = networkListener2;
        }
        if (nextTimeFlushListener2 != null) {
            nextTimeFlushListener = nextTimeFlushListener2;
        }
        flush();
    }

    public static void startTrack() {
        if (appEventLogger == null || networkSwitch.get()) {
            return;
        }
        networkSwitch.set(true);
        appEventLogger.forceFlush();
    }

    @Deprecated
    public static void trackEvent(String str) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.track(str, null);
    }

    public static void trackGooglePlayPurchase(List<TTPurchaseInfo> list) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.trackPurchase(list);
    }

    public static void trackTTEvent(TTBaseEvent tTBaseEvent) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.track(tTBaseEvent.eventName, tTBaseEvent.properties, tTBaseEvent.eventId);
    }

    public static void updateAccessToken(String str) {
        if (isInitialized() && !TextUtils.isEmpty(str)) {
            config.accessToken = str.trim();
        }
    }

    public static void initializeSdk(TTConfig tTConfig, TTInitCallback tTInitCallback) {
        if (ttSdk != null || tTConfig == null) {
            return;
        }
        if (TextUtils.isEmpty(tTConfig.ttAppId) || TextUtils.isEmpty(tTConfig.appId)) {
            if (tTInitCallback != null) {
                tTInitCallback.fail(-2, TTConst.ERROR_MESSAGE_INVALID_ID);
                return;
            }
            return;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        try {
            final Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.tiktok.TikTokBusinessSdk.1
                @Override // java.lang.Thread.UncaughtExceptionHandler
                public void uncaughtException(Thread thread, Throwable th2) {
                    if (TTCrashHandler.isTTSDKRelatedException(th2)) {
                        TTCrashHandler.handleCrash(TikTokBusinessSdk.TAG, th2, 3);
                    }
                    if (TikTokBusinessSdk.getCrashListener() != null) {
                        TikTokBusinessSdk.getCrashListener().onCrash(thread, th2);
                    }
                    Thread.UncaughtExceptionHandler uncaughtExceptionHandler = defaultUncaughtExceptionHandler;
                    if (uncaughtExceptionHandler != null) {
                        uncaughtExceptionHandler.uncaughtException(thread, th2);
                    }
                }
            });
        } catch (Throwable unused) {
        }
        ttSdk = new TikTokBusinessSdk(tTConfig);
        TTUserInfo.reset(getApplicationContext(), false);
        TTAppEventLogger tTAppEventLogger = new TTAppEventLogger(tTConfig.autoEvent, tTConfig.disabledEvents, tTConfig.flushTime, tTConfig.disableMetrics);
        appEventLogger = tTAppEventLogger;
        tTAppEventLogger.initConfig(jCurrentTimeMillis, tTInitCallback, sdkInitialized);
        try {
            long jCurrentTimeMillis2 = System.currentTimeMillis();
            JSONObject metaWithTS = TTUtil.getMetaWithTS(null);
            JSON.putLong(metaWithTS, "latency", jCurrentTimeMillis2 - jCurrentTimeMillis);
            appEventLogger.monitorMetric("init_end", metaWithTS, null);
        } catch (Throwable unused2) {
        }
    }

    @Deprecated
    public static void trackEvent(String str, String str2) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.track(str, null, str2);
    }

    public static void trackGooglePlayPurchase(TTPurchaseInfo tTPurchaseInfo) {
        trackGooglePlayPurchase((List<TTPurchaseInfo>) Collections.singletonList(tTPurchaseInfo));
    }

    public static void trackTTEvent(EventName eventName) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.track(eventName.toString(), null);
    }

    @Deprecated
    public static void trackEvent(String str, JSONObject jSONObject) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.track(str, jSONObject, b.f42142b);
    }

    public static void trackTTEvent(EventName eventName, String str) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.track(eventName.toString(), null, str);
    }

    @Deprecated
    public static void trackEvent(String str, JSONObject jSONObject, String str2) {
        TTAppEventLogger tTAppEventLogger = appEventLogger;
        if (tTAppEventLogger == null) {
            return;
        }
        tTAppEventLogger.track(str, jSONObject, str2);
    }

    public static class TTConfig {
        private String accessToken;
        private boolean advertiserIDCollectionEnable;
        private String appId;
        private final Application application;
        private boolean autoEDPEvent;
        private boolean autoEvent;
        private int autoIapTrack;
        private boolean autoStart;
        private boolean debugModeSwitch;
        private boolean disableMetrics;
        private final List<TTConst.AutoEvents> disabledEvents;
        private int flushTime;
        private boolean lduModeSwitch;
        private LogLevel logLevel;
        private String ttAppId;
        private String[] ttAppIds;
        private BigInteger ttFirstAppId;

        @Deprecated
        public TTConfig(Context context) {
            this.appId = b.f42142b;
            this.ttAppId = b.f42142b;
            this.ttAppIds = new String[]{b.f42142b};
            this.ttFirstAppId = new BigInteger("0");
            this.flushTime = 15;
            this.logLevel = LogLevel.NONE;
            this.autoEvent = true;
            this.advertiserIDCollectionEnable = true;
            this.autoStart = true;
            this.disableMetrics = false;
            this.debugModeSwitch = false;
            this.lduModeSwitch = false;
            this.autoIapTrack = 0;
            this.autoEDPEvent = true;
            if (context == null) {
                throw new IllegalArgumentException("Context must not be null");
            }
            this.application = (Application) context.getApplicationContext();
            this.disabledEvents = new ArrayList();
        }

        public TTConfig disableAdvertiserIDCollection() {
            this.advertiserIDCollectionEnable = false;
            return this;
        }

        public TTConfig disableAutoEnhancedDataPostbackEvent() {
            this.autoEDPEvent = false;
            return this;
        }

        public TTConfig disableAutoEvents() {
            this.autoEvent = false;
            return this;
        }

        public TTConfig disableAutoIapTrack() {
            this.autoIapTrack = 2;
            return this;
        }

        public TTConfig disableAutoStart() {
            this.autoStart = false;
            return this;
        }

        public TTConfig disableInstallLogging() {
            this.disabledEvents.add(TTConst.AutoEvents.InstallApp);
            return this;
        }

        public TTConfig disableLaunchLogging() {
            this.disabledEvents.add(TTConst.AutoEvents.LaunchAPP);
            return this;
        }

        public TTConfig disableMonitor() {
            this.disableMetrics = true;
            return this;
        }

        public TTConfig disableRetentionLogging() {
            this.disabledEvents.add(TTConst.AutoEvents.SecondDayRetention);
            return this;
        }

        public TTConfig enableAutoIapTrack() {
            this.autoIapTrack = 1;
            return this;
        }

        public TTConfig enableLimitedDataUse() {
            this.lduModeSwitch = true;
            return this;
        }

        public boolean isAutoIapTrack() {
            int i5 = this.autoIapTrack;
            return i5 == 0 || i5 == 1;
        }

        public TTConfig openDebugMode() {
            this.debugModeSwitch = true;
            return this;
        }

        public TTConfig setAppId(String str) {
            if (!TextUtils.isEmpty(str)) {
                this.appId = str;
            }
            return this;
        }

        public TTConfig setFlushTimeInterval(int i5) {
            if (i5 < 0) {
                throw new RuntimeException("Invalid Flush interval");
            }
            this.flushTime = i5;
            return this;
        }

        public TTConfig setIsLowPerformanceDevice(boolean z11) {
            this.autoEDPEvent = this.autoEDPEvent && !z11;
            return this;
        }

        public TTConfig setLogLevel(LogLevel logLevel) {
            this.logLevel = logLevel;
            return this;
        }

        public TTConfig setTTAppId(String str) {
            this.ttAppId = str;
            try {
                this.ttAppIds = str.replace(" ", b.f42142b).split(",");
                this.ttFirstAppId = new BigInteger(this.ttAppIds[0]);
            } catch (Throwable unused) {
            }
            return this;
        }

        public TTConfig(Context context, String str) {
            this(context);
            this.accessToken = str;
        }
    }
}
