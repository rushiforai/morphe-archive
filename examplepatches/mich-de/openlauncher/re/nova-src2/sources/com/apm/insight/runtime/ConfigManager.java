package com.apm.insight.runtime;

import android.content.Context;
import android.text.TextUtils;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.apm.insight.ICommonParams;
import com.apm.insight.b.i;
import java.util.Set;
import java.util.concurrent.ThreadPoolExecutor;

/* loaded from: classes.dex */
public class ConfigManager {
    public static final long BLOCK_MONITOR_INTERVAL = 1000;
    private static final long BLOCK_MONITOR_MIN_INTERVAL = 10;
    public static final String CONFIG_URL_SUFFIX = "/settings/get";
    public static final String EXCEPTION_URL_SUFFIX = "/monitor/collect/c/exception";
    public static final String JAVA_URL_SUFFIX = "/monitor/collect/c/crash";
    private static final long LAUNCH_CRASH_INTERVAL = 8000;
    public static final String LAUNCH_URL_SUFFIX = "/monitor/collect/c/exception/dump_collection";
    public static final String LOG_TYPE_ALL_STACK = "npth_enable_all_thread_stack";
    public static final String NATIVE_URL_SUFFIX = "/monitor/collect/c/native_bin_crash";
    private ThreadPoolExecutor mThreadPoolExecutor;
    private boolean reportErrorEnable = true;
    private String mNativeMemUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mCoreDumpUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mJavaCrashUploadUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mLaunchCrashUploadUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mExceptionUploadUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mConfigUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mNativeCrashUploadUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mAlogUploadUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String mAsanReportUploadUrl = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long mLaunchCrashInterval = LAUNCH_CRASH_INTERVAL;
    private i.a mEncryptImpl$1c14659d = new i.a() { // from class: com.apm.insight.runtime.ConfigManager.1
    };
    private int mLogcatDumpCount = EventBridgeChannel.QUEUE_CAPACITY;
    private int mLogcatLevel = 1;
    private boolean mNativeCrashMiniDump = true;
    private boolean mEnsureEnable = true;
    private boolean mEnsureWithLogcat = false;
    private long mBlockMonitorInterval = 1000;
    private boolean mBlockMonitorEnable = false;
    private boolean mIsDebugMode = false;

    public static void setDefaultCommonParams(ICommonParams iCommonParams, Context context) {
        com.apm.insight.e.a(new com.apm.insight.nativecrash.b(context, iCommonParams));
    }

    public static void updateDid(final String str) {
        m.a().a(new Runnable() { // from class: com.apm.insight.runtime.ConfigManager.2
            @Override // java.lang.Runnable
            public final void run() {
                com.apm.insight.e.c().a(str);
                com.apm.insight.j.b.c();
            }
        });
    }

    public String getAlogUploadUrl() {
        return this.mAlogUploadUrl;
    }

    public String getAsanReportUploadUrl() {
        return this.mAsanReportUploadUrl;
    }

    public long getBlockInterval() {
        return this.mBlockMonitorInterval;
    }

    public String getConfigUrl() {
        return this.mConfigUrl;
    }

    public String getCoreDumpUrl() {
        return this.mCoreDumpUrl;
    }

    public i.a getEncryptImpl$1546c4a2() {
        return this.mEncryptImpl$1c14659d;
    }

    public String getExceptionUploadUrl() {
        return this.mExceptionUploadUrl;
    }

    public Set<String> getFilterThreadSet() {
        return com.apm.insight.l.g.a();
    }

    public String getJavaCrashUploadUrl() {
        return this.mJavaCrashUploadUrl;
    }

    public long getLaunchCrashInterval() {
        return this.mLaunchCrashInterval;
    }

    public String getLaunchCrashUploadUrl() {
        return this.mLaunchCrashUploadUrl;
    }

    public int getLogcatDumpCount() {
        return this.mLogcatDumpCount;
    }

    public int getLogcatLevel() {
        return this.mLogcatLevel;
    }

    public String getNativeCrashUploadUrl() {
        return this.mNativeCrashUploadUrl;
    }

    public String getNativeMemUrl() {
        return this.mNativeMemUrl;
    }

    public ThreadPoolExecutor getThreadPoolExecutor() {
        return this.mThreadPoolExecutor;
    }

    public boolean isApmExists() {
        return com.apm.insight.k.a.c();
    }

    public boolean isBlockMonitorEnable() {
        return this.mBlockMonitorEnable;
    }

    public boolean isCrashIgnored(final String str) {
        try {
            e eVar = new e() { // from class: com.apm.insight.runtime.ConfigManager.3
                @Override // com.apm.insight.runtime.e
                public final Object a(String str2) {
                    return str2.equals("md5") ? str : super.a(str2);
                }
            };
            if (k.a("java_crash_ignore", eVar)) {
                return true;
            }
            if (!com.apm.insight.l.k.b(com.apm.insight.e.g())) {
                return false;
            }
            com.apm.insight.k.a.d();
            return k.a("java_crash_ignore", eVar);
        } catch (Throwable unused) {
            return false;
        }
    }

    public boolean isDebugMode() {
        return this.mIsDebugMode;
    }

    public boolean isEnsureEnable() {
        return this.mEnsureEnable;
    }

    public boolean isEnsureWithLogcat() {
        return this.mEnsureWithLogcat;
    }

    public boolean isNativeCrashMiniDump() {
        return this.mNativeCrashMiniDump;
    }

    public boolean isReportErrorEnable() {
        return this.reportErrorEnable;
    }

    public void setAlogUploadUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mAlogUploadUrl = str;
    }

    public void setBlockMonitorEnable(boolean z11) {
        this.mBlockMonitorEnable = z11;
    }

    public void setBlockMonitorInterval(long j11) {
        this.mBlockMonitorInterval = j11;
    }

    public void setConfigUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mConfigUrl = str;
    }

    public void setCurrentProcessName(String str) {
        com.apm.insight.l.a.a(str);
    }

    public void setDebugMode(boolean z11) {
        this.mIsDebugMode = z11;
    }

    public void setEncryptImpl$22f2d42e(i.a aVar) {
        if (aVar != null) {
            this.mEncryptImpl$1c14659d = aVar;
        }
    }

    public void setEnsureEnable(boolean z11) {
        this.mEnsureEnable = z11;
    }

    public void setEnsureWithLogcat(boolean z11) {
        this.mEnsureWithLogcat = z11;
    }

    public void setJavaCrashUploadUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mJavaCrashUploadUrl = str;
    }

    public void setLaunchCrashInterval(long j11) {
        if (j11 > 0) {
            this.mLaunchCrashInterval = j11;
        }
    }

    public void setLaunchCrashUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mExceptionUploadUrl = str;
        int iIndexOf = str.indexOf("//");
        if (iIndexOf == -1) {
            this.mLaunchCrashUploadUrl = str.substring(0, str.indexOf("/") + 1) + "monitor/collect/c/exception/dump_collection";
            return;
        }
        this.mLaunchCrashUploadUrl = str.substring(0, str.indexOf("/", iIndexOf + 2) + 1) + "monitor/collect/c/exception/dump_collection";
    }

    public void setLogcatDumpCount(int i5) {
        if (i5 > 0) {
            this.mLogcatDumpCount = i5;
        }
    }

    public void setLogcatLevel(int i5) {
        if (i5 < 0 || i5 > 4) {
            return;
        }
        this.mLogcatLevel = i5;
    }

    public void setNativeCrashUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mNativeCrashUploadUrl = str;
    }

    public void setReportErrorEnable(boolean z11) {
        this.reportErrorEnable = z11;
    }

    public void setThreadPoolExecutor(ThreadPoolExecutor threadPoolExecutor) {
        this.mThreadPoolExecutor = threadPoolExecutor;
    }
}
