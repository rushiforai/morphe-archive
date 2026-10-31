package com.google.firebase.crashlytics;

import android.content.Context;
import android.content.pm.PackageManager;
import b.c0;
import cn.c;
import cn.d;
import com.google.android.gms.tasks.Task;
import com.google.firebase.crashlytics.internal.CrashlyticsNativeComponentDeferredProxy;
import com.google.firebase.crashlytics.internal.DevelopmentPlatformProvider;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.RemoteConfigDeferredProxy;
import com.google.firebase.crashlytics.internal.common.AppData;
import com.google.firebase.crashlytics.internal.common.BuildIdInfo;
import com.google.firebase.crashlytics.internal.common.CommonUtils;
import com.google.firebase.crashlytics.internal.common.CrashlyticsAppQualitySessionsSubscriber;
import com.google.firebase.crashlytics.internal.common.CrashlyticsCore;
import com.google.firebase.crashlytics.internal.common.DataCollectionArbiter;
import com.google.firebase.crashlytics.internal.common.IdManager;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorkers;
import com.google.firebase.crashlytics.internal.network.HttpRequestFactory;
import com.google.firebase.crashlytics.internal.persistence.FileStore;
import com.google.firebase.crashlytics.internal.settings.SettingsController;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import nm.b;
import om.e;
import ul.g;

/* loaded from: classes.dex */
public class FirebaseCrashlytics {
    static final int APP_EXCEPTION_CALLBACK_TIMEOUT_MS = 500;
    static final String FIREBASE_CRASHLYTICS_ANALYTICS_ORIGIN = "clx";
    static final String LEGACY_CRASH_ANALYTICS_ORIGIN = "crash";
    final CrashlyticsCore core;

    private FirebaseCrashlytics(CrashlyticsCore crashlyticsCore) {
        this.core = crashlyticsCore;
    }

    public static FirebaseCrashlytics getInstance() {
        FirebaseCrashlytics firebaseCrashlytics = (FirebaseCrashlytics) g.c().b(FirebaseCrashlytics.class);
        if (firebaseCrashlytics != null) {
            return firebaseCrashlytics;
        }
        throw new NullPointerException("FirebaseCrashlytics component is not present.");
    }

    public static FirebaseCrashlytics init(g gVar, e eVar, b bVar, b bVar2, b bVar3, ExecutorService executorService, ExecutorService executorService2, ExecutorService executorService3) {
        gVar.a();
        Context context = gVar.f91320a;
        String packageName = context.getPackageName();
        Logger.getLogger().i("Initializing Firebase Crashlytics " + CrashlyticsCore.getVersion() + " for " + packageName);
        CrashlyticsWorkers crashlyticsWorkers = new CrashlyticsWorkers(executorService, executorService2);
        FileStore fileStore = new FileStore(context);
        DataCollectionArbiter dataCollectionArbiter = new DataCollectionArbiter(gVar);
        IdManager idManager = new IdManager(context, packageName, eVar, dataCollectionArbiter);
        CrashlyticsNativeComponentDeferredProxy crashlyticsNativeComponentDeferredProxy = new CrashlyticsNativeComponentDeferredProxy(bVar);
        AnalyticsDeferredProxy analyticsDeferredProxy = new AnalyticsDeferredProxy(bVar2);
        CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber = new CrashlyticsAppQualitySessionsSubscriber(dataCollectionArbiter, fileStore);
        c cVar = c.f20140a;
        d sessionSubscriberName = crashlyticsAppQualitySessionsSubscriber.getSessionSubscriberName();
        c cVar2 = c.f20140a;
        cn.a aVarA = c.a(sessionSubscriberName);
        if (aVarA.f20132b != null) {
            Objects.toString(sessionSubscriberName);
        } else {
            aVarA.f20132b = crashlyticsAppQualitySessionsSubscriber;
            Objects.toString(sessionSubscriberName);
            aVarA.f20131a.countDown();
        }
        CrashlyticsCore crashlyticsCore = new CrashlyticsCore(gVar, idManager, crashlyticsNativeComponentDeferredProxy, dataCollectionArbiter, analyticsDeferredProxy.getDeferredBreadcrumbSource(), analyticsDeferredProxy.getAnalyticsEventLogger(), fileStore, crashlyticsAppQualitySessionsSubscriber, new RemoteConfigDeferredProxy(bVar3), crashlyticsWorkers);
        gVar.a();
        String str = gVar.f91322c.f91336b;
        String mappingFileId = CommonUtils.getMappingFileId(context);
        List<BuildIdInfo> buildIdInfo = CommonUtils.getBuildIdInfo(context);
        Logger.getLogger().d("Mapping file ID is: " + mappingFileId);
        for (BuildIdInfo buildIdInfo2 : buildIdInfo) {
            Logger logger = Logger.getLogger();
            String libraryName = buildIdInfo2.getLibraryName();
            String arch = buildIdInfo2.getArch();
            String buildId = buildIdInfo2.getBuildId();
            String str2 = mappingFileId;
            StringBuilder sbW = c0.w("Build id for ", libraryName, " on ", arch, ": ");
            sbW.append(buildId);
            logger.d(sbW.toString());
            mappingFileId = str2;
        }
        try {
            AppData appDataCreate = AppData.create(context, idManager, str, mappingFileId, buildIdInfo, new DevelopmentPlatformProvider(context));
            Logger.getLogger().v("Installer package name is: " + appDataCreate.installerPackageName);
            SettingsController settingsControllerCreate = SettingsController.create(context, str, idManager, new HttpRequestFactory(), appDataCreate.versionCode, appDataCreate.versionName, fileStore, dataCollectionArbiter);
            settingsControllerCreate.loadSettingsData(crashlyticsWorkers).e(executorService3, new bb.a(11));
            if (crashlyticsCore.onPreExecute(appDataCreate, settingsControllerCreate)) {
                crashlyticsCore.doBackgroundInitializationAsync(settingsControllerCreate);
            }
            return new FirebaseCrashlytics(crashlyticsCore);
        } catch (PackageManager.NameNotFoundException e3) {
            Logger.getLogger().e("Error retrieving app package info.", e3);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ void lambda$init$0(Exception exc) {
        Logger.getLogger().e("Error fetching settings.", exc);
    }

    public Task<Boolean> checkForUnsentReports() {
        return this.core.checkForUnsentReports();
    }

    public void deleteUnsentReports() {
        this.core.deleteUnsentReports();
    }

    public boolean didCrashOnPreviousExecution() {
        return this.core.didCrashOnPreviousExecution();
    }

    public boolean isCrashlyticsCollectionEnabled() {
        return this.core.isCrashlyticsCollectionEnabled();
    }

    public void log(String str) {
        this.core.log(str);
    }

    public void recordException(Throwable th2) {
        if (th2 == null) {
            Logger.getLogger().w("A null value was passed to recordException. Ignoring.");
        } else {
            this.core.logException(th2, Collections.EMPTY_MAP);
        }
    }

    public void sendUnsentReports() {
        this.core.sendUnsentReports();
    }

    public void setCrashlyticsCollectionEnabled(boolean z11) {
        this.core.setCrashlyticsCollectionEnabled(Boolean.valueOf(z11));
    }

    public void setCustomKey(String str, boolean z11) {
        this.core.setCustomKey(str, Boolean.toString(z11));
    }

    public void setCustomKeys(CustomKeysAndValues customKeysAndValues) {
        this.core.setCustomKeys(customKeysAndValues.keysAndValues);
    }

    public void setUserId(String str) {
        this.core.setUserId(str);
    }

    public void setCrashlyticsCollectionEnabled(Boolean bool) {
        this.core.setCrashlyticsCollectionEnabled(bool);
    }

    public void setCustomKey(String str, double d5) {
        this.core.setCustomKey(str, Double.toString(d5));
    }

    public void setCustomKey(String str, float f11) {
        this.core.setCustomKey(str, Float.toString(f11));
    }

    public void setCustomKey(String str, int i5) {
        this.core.setCustomKey(str, Integer.toString(i5));
    }

    public void recordException(Throwable th2, CustomKeysAndValues customKeysAndValues) {
        if (th2 == null) {
            Logger.getLogger().w("A null value was passed to recordException. Ignoring.");
        } else {
            this.core.logException(th2, customKeysAndValues.keysAndValues);
        }
    }

    public void setCustomKey(String str, long j11) {
        this.core.setCustomKey(str, Long.toString(j11));
    }

    public void setCustomKey(String str, String str2) {
        this.core.setCustomKey(str, str2);
    }
}
