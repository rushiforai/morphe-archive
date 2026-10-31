package io.sentry.android.core;

import io.sentry.e3;
import io.sentry.w3;
import java.util.concurrent.CopyOnWriteArraySet;
import org.jetbrains.annotations.ApiStatus;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.TestOnly;

/* loaded from: classes4.dex */
public final class SentryAndroidOptions extends w3 {
    private boolean anrEnabled;
    private boolean anrReportInDebug;
    private long anrTimeoutIntervalMillis;
    private boolean attachAnrThreadDump;
    private boolean attachScreenshot;
    private boolean attachViewHierarchy;

    @Nullable
    private w0 beforeScreenshotCaptureCallback;

    @Nullable
    private w0 beforeViewHierarchyCaptureCallback;
    private boolean collectAdditionalContext;

    @NotNull
    private j0 debugImagesLoader;
    private boolean enableActivityLifecycleBreadcrumbs;
    private boolean enableActivityLifecycleTracingAutoFinish;
    private boolean enableAppComponentBreadcrumbs;
    private boolean enableAppLifecycleBreadcrumbs;
    private boolean enableAutoActivityLifecycleTracing;
    private boolean enableFramesTracking;
    private boolean enableNdk;
    private boolean enableNetworkEventBreadcrumbs;
    private boolean enablePerformanceV2;
    private boolean enableRootCheck;
    private boolean enableScopeSync;
    private boolean enableSystemEventBreadcrumbs;

    @Nullable
    private io.sentry.android.core.internal.util.o frameMetricsCollector;

    @Nullable
    private String nativeSdkName;
    private boolean reportHistoricalAnrs;
    private final long startupCrashDurationThresholdMillis;
    private long startupCrashFlushTimeoutMillis;

    public SentryAndroidOptions() {
        super(false);
        this.anrEnabled = true;
        this.anrTimeoutIntervalMillis = 5000L;
        this.anrReportInDebug = false;
        this.enableActivityLifecycleBreadcrumbs = true;
        this.enableAppLifecycleBreadcrumbs = true;
        this.enableSystemEventBreadcrumbs = true;
        this.enableAppComponentBreadcrumbs = true;
        this.enableNetworkEventBreadcrumbs = true;
        this.enableAutoActivityLifecycleTracing = true;
        this.enableActivityLifecycleTracingAutoFinish = true;
        this.debugImagesLoader = q0.f67062a;
        this.collectAdditionalContext = true;
        this.startupCrashFlushTimeoutMillis = 5000L;
        this.startupCrashDurationThresholdMillis = 2000L;
        this.enableFramesTracking = true;
        this.nativeSdkName = null;
        this.enableRootCheck = true;
        this.enableNdk = true;
        this.enableScopeSync = true;
        this.reportHistoricalAnrs = false;
        this.attachAnrThreadDump = false;
        this.enablePerformanceV2 = false;
        setSentryClientName("sentry.java.android/7.18.0");
        setSdkVersion(createSdkVersion());
        setAttachServerName(false);
    }

    @NotNull
    private io.sentry.protocol.s createSdkVersion() {
        io.sentry.protocol.s sdkVersion = getSdkVersion();
        if (sdkVersion == null) {
            sdkVersion = new io.sentry.protocol.s("sentry.java.android", "7.18.0");
        } else {
            sdkVersion.f67608a = "sentry.java.android";
            sdkVersion.f67609b = "7.18.0";
        }
        e3 e3VarM = e3.m();
        e3VarM.getClass();
        ((CopyOnWriteArraySet) e3VarM.f67209c).add(new io.sentry.protocol.v("maven:io.sentry:sentry-android-core", "7.18.0"));
        return sdkVersion;
    }

    public void enableAllAutoBreadcrumbs(boolean z11) {
        this.enableActivityLifecycleBreadcrumbs = z11;
        this.enableAppComponentBreadcrumbs = z11;
        this.enableSystemEventBreadcrumbs = z11;
        this.enableAppLifecycleBreadcrumbs = z11;
        this.enableNetworkEventBreadcrumbs = z11;
        setEnableUserInteractionBreadcrumbs(z11);
    }

    public long getAnrTimeoutIntervalMillis() {
        return this.anrTimeoutIntervalMillis;
    }

    @Nullable
    public w0 getBeforeScreenshotCaptureCallback() {
        return null;
    }

    @Nullable
    public w0 getBeforeViewHierarchyCaptureCallback() {
        return null;
    }

    @NotNull
    public j0 getDebugImagesLoader() {
        return this.debugImagesLoader;
    }

    @ApiStatus.Internal
    @Nullable
    public io.sentry.android.core.internal.util.o getFrameMetricsCollector() {
        return this.frameMetricsCollector;
    }

    @ApiStatus.Internal
    @Nullable
    public String getNativeSdkName() {
        return this.nativeSdkName;
    }

    @Deprecated
    public int getProfilingTracesIntervalMillis() {
        return 0;
    }

    @ApiStatus.Internal
    public long getStartupCrashDurationThresholdMillis() {
        return 2000L;
    }

    @ApiStatus.Internal
    public long getStartupCrashFlushTimeoutMillis() {
        return this.startupCrashFlushTimeoutMillis;
    }

    public boolean isAnrEnabled() {
        return this.anrEnabled;
    }

    public boolean isAnrReportInDebug() {
        return this.anrReportInDebug;
    }

    public boolean isAttachAnrThreadDump() {
        return this.attachAnrThreadDump;
    }

    public boolean isAttachScreenshot() {
        return this.attachScreenshot;
    }

    public boolean isAttachViewHierarchy() {
        return this.attachViewHierarchy;
    }

    public boolean isCollectAdditionalContext() {
        return this.collectAdditionalContext;
    }

    public boolean isEnableActivityLifecycleBreadcrumbs() {
        return this.enableActivityLifecycleBreadcrumbs;
    }

    public boolean isEnableActivityLifecycleTracingAutoFinish() {
        return this.enableActivityLifecycleTracingAutoFinish;
    }

    public boolean isEnableAppComponentBreadcrumbs() {
        return this.enableAppComponentBreadcrumbs;
    }

    public boolean isEnableAppLifecycleBreadcrumbs() {
        return this.enableAppLifecycleBreadcrumbs;
    }

    public boolean isEnableAutoActivityLifecycleTracing() {
        return this.enableAutoActivityLifecycleTracing;
    }

    public boolean isEnableFramesTracking() {
        return this.enableFramesTracking;
    }

    public boolean isEnableNdk() {
        return this.enableNdk;
    }

    public boolean isEnableNetworkEventBreadcrumbs() {
        return this.enableNetworkEventBreadcrumbs;
    }

    @ApiStatus.Experimental
    public boolean isEnablePerformanceV2() {
        return this.enablePerformanceV2;
    }

    public boolean isEnableRootCheck() {
        return this.enableRootCheck;
    }

    public boolean isEnableScopeSync() {
        return this.enableScopeSync;
    }

    public boolean isEnableSystemEventBreadcrumbs() {
        return this.enableSystemEventBreadcrumbs;
    }

    public boolean isReportHistoricalAnrs() {
        return this.reportHistoricalAnrs;
    }

    public void setAnrEnabled(boolean z11) {
        this.anrEnabled = z11;
    }

    public void setAnrReportInDebug(boolean z11) {
        this.anrReportInDebug = z11;
    }

    public void setAnrTimeoutIntervalMillis(long j11) {
        this.anrTimeoutIntervalMillis = j11;
    }

    public void setAttachAnrThreadDump(boolean z11) {
        this.attachAnrThreadDump = z11;
    }

    public void setAttachScreenshot(boolean z11) {
        this.attachScreenshot = z11;
    }

    public void setAttachViewHierarchy(boolean z11) {
        this.attachViewHierarchy = z11;
    }

    public void setBeforeScreenshotCaptureCallback(@NotNull w0 w0Var) {
    }

    public void setBeforeViewHierarchyCaptureCallback(@NotNull w0 w0Var) {
    }

    public void setCollectAdditionalContext(boolean z11) {
        this.collectAdditionalContext = z11;
    }

    public void setDebugImagesLoader(@NotNull j0 j0Var) {
        if (j0Var == null) {
            j0Var = q0.f67062a;
        }
        this.debugImagesLoader = j0Var;
    }

    public void setEnableActivityLifecycleBreadcrumbs(boolean z11) {
        this.enableActivityLifecycleBreadcrumbs = z11;
    }

    public void setEnableActivityLifecycleTracingAutoFinish(boolean z11) {
        this.enableActivityLifecycleTracingAutoFinish = z11;
    }

    public void setEnableAppComponentBreadcrumbs(boolean z11) {
        this.enableAppComponentBreadcrumbs = z11;
    }

    public void setEnableAppLifecycleBreadcrumbs(boolean z11) {
        this.enableAppLifecycleBreadcrumbs = z11;
    }

    public void setEnableAutoActivityLifecycleTracing(boolean z11) {
        this.enableAutoActivityLifecycleTracing = z11;
    }

    public void setEnableFramesTracking(boolean z11) {
        this.enableFramesTracking = z11;
    }

    public void setEnableNdk(boolean z11) {
        this.enableNdk = z11;
    }

    public void setEnableNetworkEventBreadcrumbs(boolean z11) {
        this.enableNetworkEventBreadcrumbs = z11;
    }

    @ApiStatus.Experimental
    public void setEnablePerformanceV2(boolean z11) {
        this.enablePerformanceV2 = z11;
    }

    public void setEnableRootCheck(boolean z11) {
        this.enableRootCheck = z11;
    }

    public void setEnableScopeSync(boolean z11) {
        this.enableScopeSync = z11;
    }

    public void setEnableSystemEventBreadcrumbs(boolean z11) {
        this.enableSystemEventBreadcrumbs = z11;
    }

    @ApiStatus.Internal
    public void setFrameMetricsCollector(@Nullable io.sentry.android.core.internal.util.o oVar) {
        this.frameMetricsCollector = oVar;
    }

    @ApiStatus.Internal
    public void setNativeSdkName(@Nullable String str) {
        this.nativeSdkName = str;
    }

    @Deprecated
    public void setProfilingTracesIntervalMillis(int i5) {
    }

    public void setReportHistoricalAnrs(boolean z11) {
        this.reportHistoricalAnrs = z11;
    }

    @TestOnly
    public void setStartupCrashFlushTimeoutMillis(long j11) {
        this.startupCrashFlushTimeoutMillis = j11;
    }
}
