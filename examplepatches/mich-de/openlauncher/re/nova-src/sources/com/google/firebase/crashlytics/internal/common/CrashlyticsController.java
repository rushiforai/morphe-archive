package com.google.firebase.crashlytics.internal.common;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.ProfilingManager;
import android.os.ProfilingResult;
import android.os.StatFs;
import android.util.Base64;
import b.c0;
import b.d9;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.crashlytics.internal.CrashlyticsNativeComponent;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.NativeSessionFileProvider;
import com.google.firebase.crashlytics.internal.analytics.AnalyticsEventLogger;
import com.google.firebase.crashlytics.internal.common.CrashlyticsUncaughtExceptionHandler;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsTasks;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorkers;
import com.google.firebase.crashlytics.internal.metadata.EventMetadata;
import com.google.firebase.crashlytics.internal.metadata.LogFileManager;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;
import com.google.firebase.crashlytics.internal.model.StaticSessionData;
import com.google.firebase.crashlytics.internal.persistence.FileStore;
import com.google.firebase.crashlytics.internal.settings.Settings;
import com.google.firebase.crashlytics.internal.settings.SettingsProvider;
import cw.l2;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.lang.Thread;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.SortedSet;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/* loaded from: classes.dex */
class CrashlyticsController {
    static final String APP_EXCEPTION_MARKER_PREFIX = ".ae";
    static final String FIREBASE_APPLICATION_EXCEPTION = "_ae";
    static final String FIREBASE_CRASH_TYPE = "fatal";
    static final int FIREBASE_CRASH_TYPE_FATAL = 1;
    static final String FIREBASE_TIMESTAMP = "timestamp";
    private static final String GENERATOR_FORMAT = "Crashlytics Android SDK/%s";
    private static final String META_INF_FOLDER = "META-INF/";
    private static final String TRIGGER_TYPE_ANOMALY_FILENAME = "trigger-type-anomaly";
    private static final String TRIGGER_TYPE_OOM_FILENAME = "trigger-type-oom";
    private static final String VERSION_CONTROL_INFO_FILE = "version-control-info.textproto";
    private static final String VERSION_CONTROL_INFO_KEY = "com.crashlytics.version-control-info";
    private final AnalyticsEventLogger analyticsEventLogger;
    private final AppData appData;
    private final Context context;
    private CrashlyticsUncaughtExceptionHandler crashHandler;
    private final CrashlyticsFileMarker crashMarker;
    private final CrashlyticsWorkers crashlyticsWorkers;
    private final DataCollectionArbiter dataCollectionArbiter;
    private final FileStore fileStore;
    private final IdManager idManager;
    private final LogFileManager logFileManager;
    private final CrashlyticsNativeComponent nativeComponent;
    private final SessionReportingCoordinator reportingCoordinator;
    private final CrashlyticsAppQualitySessionsSubscriber sessionsSubscriber;
    private final UserMetadata userMetadata;
    static final FilenameFilter APP_EXCEPTION_MARKER_FILTER = new a(1);
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    private SettingsProvider settingsProvider = null;
    final fi.j unsentReportsAvailable = new fi.j();
    final fi.j reportActionProvided = new fi.j();
    final fi.j unsentReportsHandled = new fi.j();
    final AtomicBoolean checkForUnsentReportsCalled = new AtomicBoolean(false);

    public CrashlyticsController(Context context, IdManager idManager, DataCollectionArbiter dataCollectionArbiter, FileStore fileStore, CrashlyticsFileMarker crashlyticsFileMarker, AppData appData, UserMetadata userMetadata, LogFileManager logFileManager, SessionReportingCoordinator sessionReportingCoordinator, CrashlyticsNativeComponent crashlyticsNativeComponent, AnalyticsEventLogger analyticsEventLogger, CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber, CrashlyticsWorkers crashlyticsWorkers) {
        this.context = context;
        this.idManager = idManager;
        this.dataCollectionArbiter = dataCollectionArbiter;
        this.fileStore = fileStore;
        this.crashMarker = crashlyticsFileMarker;
        this.appData = appData;
        this.userMetadata = userMetadata;
        this.logFileManager = logFileManager;
        this.nativeComponent = crashlyticsNativeComponent;
        this.analyticsEventLogger = analyticsEventLogger;
        this.sessionsSubscriber = crashlyticsAppQualitySessionsSubscriber;
        this.reportingCoordinator = sessionReportingCoordinator;
        this.crashlyticsWorkers = crashlyticsWorkers;
    }

    private static StaticSessionData.AppData createAppData(IdManager idManager, AppData appData) {
        return StaticSessionData.AppData.create(idManager.getAppIdentifier(), appData.versionCode, appData.versionName, idManager.getInstallIds().getCrashlyticsInstallId(), DeliveryMechanism.determineFrom(appData.installerPackageName).getId(), appData.developmentPlatformProvider);
    }

    private static StaticSessionData.DeviceData createDeviceData(Context context) {
        StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
        return StaticSessionData.DeviceData.create(CommonUtils.getCpuArchitectureInt(), Build.MODEL, Runtime.getRuntime().availableProcessors(), CommonUtils.calculateTotalRamInBytes(context), statFs.getBlockCount() * statFs.getBlockSize(), CommonUtils.isEmulator(), CommonUtils.getDeviceState(), Build.MANUFACTURER, Build.PRODUCT);
    }

    private static StaticSessionData.OsData createOsData() {
        return StaticSessionData.OsData.create(Build.VERSION.RELEASE, Build.VERSION.CODENAME, CommonUtils.isRooted());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void deleteFiles(List<File> list) {
        Iterator<File> it = list.iterator();
        while (it.hasNext()) {
            it.next().delete();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doOpenSession(String str, Boolean bool) {
        long currentTimestampSeconds = getCurrentTimestampSeconds();
        Logger.getLogger().d("Opening a new session with ID " + str);
        Locale locale = Locale.US;
        this.nativeComponent.prepareNativeSession(str, c0.k("Crashlytics Android SDK/", CrashlyticsCore.getVersion()), currentTimestampSeconds, StaticSessionData.create(createAppData(this.idManager, this.appData), createOsData(), createDeviceData(this.context)));
        if (bool.booleanValue() && str != null) {
            this.userMetadata.setNewSession(str);
        }
        this.logFileManager.setCurrentSession(str);
        this.sessionsSubscriber.setSessionId(str);
        this.reportingCoordinator.onBeginSession(str, currentTimestampSeconds);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doWriteAppExceptionMarker(long j11) throws IOException {
        try {
            if (this.fileStore.getCommonFile(APP_EXCEPTION_MARKER_PREFIX + j11).createNewFile()) {
            } else {
                throw new IOException("Create new file failed.");
            }
        } catch (IOException e3) {
            Logger.getLogger().w("Could not create app exception marker file.", e3);
        }
    }

    private void finalizePreviousNativeSession(String str) throws IOException {
        Logger.getLogger().v("Finalizing native report for session " + str);
        NativeSessionFileProvider sessionFileProvider = this.nativeComponent.getSessionFileProvider(str);
        File minidumpFile = sessionFileProvider.getMinidumpFile();
        CrashlyticsReport.ApplicationExitInfo applicationExitInto = sessionFileProvider.getApplicationExitInto();
        if (nativeCoreAbsent(str, minidumpFile, applicationExitInto)) {
            Logger.getLogger().w("No native core present");
            return;
        }
        long jLastModified = minidumpFile.lastModified();
        LogFileManager logFileManager = new LogFileManager(this.fileStore, str);
        File nativeSessionDir = this.fileStore.getNativeSessionDir(str);
        if (!nativeSessionDir.isDirectory()) {
            Logger.getLogger().w("Couldn't create directory to store native session files, aborting.");
            return;
        }
        doWriteAppExceptionMarker(jLastModified);
        List<NativeSessionFile> nativeSessionFiles = getNativeSessionFiles(sessionFileProvider, str, this.fileStore, logFileManager.getBytesForLog());
        NativeSessionFileGzipper.processNativeSessions(nativeSessionDir, nativeSessionFiles);
        Logger.getLogger().d("CrashlyticsController#finalizePreviousNativeSession");
        this.reportingCoordinator.finalizeSessionWithNativeEvent(str, nativeSessionFiles, applicationExitInto);
        logFileManager.clearLog();
    }

    private static boolean firebaseCrashExists() throws ClassNotFoundException {
        try {
            Class.forName("com.google.firebase.crash.FirebaseCrash");
            return true;
        } catch (ClassNotFoundException unused) {
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getCurrentSessionId() {
        SortedSet<String> sortedSetListSortedOpenSessionIds = this.reportingCoordinator.listSortedOpenSessionIds();
        if (sortedSetListSortedOpenSessionIds.isEmpty()) {
            return null;
        }
        return sortedSetListSortedOpenSessionIds.first();
    }

    private static long getCurrentTimestampSeconds() {
        return getTimestampSeconds(System.currentTimeMillis());
    }

    public static List<NativeSessionFile> getNativeSessionFiles(NativeSessionFileProvider nativeSessionFileProvider, String str, FileStore fileStore, byte[] bArr) {
        File sessionFile = fileStore.getSessionFile(str, UserMetadata.USERDATA_FILENAME);
        File sessionFile2 = fileStore.getSessionFile(str, UserMetadata.KEYDATA_FILENAME);
        File sessionFile3 = fileStore.getSessionFile(str, UserMetadata.ROLLOUTS_STATE_FILENAME);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BytesBackedNativeSessionFile("logs_file", "logs", bArr));
        arrayList.add(new FileBackedNativeSessionFile("crash_meta_file", "metadata", nativeSessionFileProvider.getMetadataFile()));
        arrayList.add(new FileBackedNativeSessionFile("session_meta_file", "session", nativeSessionFileProvider.getSessionFile()));
        arrayList.add(new FileBackedNativeSessionFile("app_meta_file", "app", nativeSessionFileProvider.getAppFile()));
        arrayList.add(new FileBackedNativeSessionFile("device_meta_file", "device", nativeSessionFileProvider.getDeviceFile()));
        arrayList.add(new FileBackedNativeSessionFile("os_meta_file", "os", nativeSessionFileProvider.getOsFile()));
        arrayList.add(nativeCoreFile(nativeSessionFileProvider));
        arrayList.add(new FileBackedNativeSessionFile("user_meta_file", "user", sessionFile));
        arrayList.add(new FileBackedNativeSessionFile("keys_file", UserMetadata.KEYDATA_FILENAME, sessionFile2));
        arrayList.add(new FileBackedNativeSessionFile("rollouts_file", "rollouts", sessionFile3));
        return arrayList;
    }

    private InputStream getResourceAsStream(String str) {
        ClassLoader classLoader = getClass().getClassLoader();
        if (classLoader != null) {
            return classLoader.getResourceAsStream(str);
        }
        Logger.getLogger().w("Couldn't get Class Loader");
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static long getTimestampSeconds(long j11) {
        return j11 / 1000;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$openSession$1(String str) {
        doOpenSession(str, Boolean.FALSE);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$registerProfilingManagerListener$5(String str, ProfilingResult profilingResult) {
        writeTriggerTypeFile(str, profilingResult.getTriggerType());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ boolean lambda$static$0(File file, String str) {
        return str.startsWith(APP_EXCEPTION_MARKER_PREFIX);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ boolean lambda$writeProfilingManagerInfo$2(File file, String str) {
        return k2.l().contains(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Integer lambda$writeProfilingManagerInfo$3(File file) {
        String name = file.getName();
        name.getClass();
        if (name.equals(TRIGGER_TYPE_ANOMALY_FILENAME)) {
            return 8;
        }
        return !name.equals(TRIGGER_TYPE_OOM_FILENAME) ? 0 : 7;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ boolean lambda$writeProfilingManagerInfo$4(Integer num) {
        return num.intValue() != 0;
    }

    private Task<Void> logAnalyticsAppExceptionEvent(final long j11) {
        if (firebaseCrashExists()) {
            Logger.getLogger().w("Skipping logging Crashlytics event to Firebase, FirebaseCrash exists");
            return Tasks.d(null);
        }
        Logger.getLogger().d("Logging app exception event to Firebase Analytics");
        return Tasks.b(new Callable<Void>() { // from class: com.google.firebase.crashlytics.internal.common.CrashlyticsController.5
            @Override // java.util.concurrent.Callable
            public Void call() throws Exception {
                Bundle bundle = new Bundle();
                bundle.putInt(CrashlyticsController.FIREBASE_CRASH_TYPE, 1);
                bundle.putLong(CrashlyticsController.FIREBASE_TIMESTAMP, j11);
                CrashlyticsController.this.analyticsEventLogger.logEvent(CrashlyticsController.FIREBASE_APPLICATION_EXCEPTION, bundle);
                return null;
            }
        }, new ScheduledThreadPoolExecutor(1));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Task<Void> logAnalyticsAppExceptionEvents() {
        ArrayList arrayList = new ArrayList();
        for (File file : listAppExceptionMarkerFiles()) {
            try {
                arrayList.add(logAnalyticsAppExceptionEvent(Long.parseLong(file.getName().substring(3))));
            } catch (NumberFormatException unused) {
                Logger.getLogger().w("Could not parse app exception timestamp from file " + file.getName());
            }
            file.delete();
        }
        return Tasks.e(arrayList);
    }

    private static boolean nativeCoreAbsent(String str, File file, CrashlyticsReport.ApplicationExitInfo applicationExitInfo) {
        if (file == null || !file.exists()) {
            Logger.getLogger().w("No minidump data found for session " + str);
        }
        if (applicationExitInfo == null) {
            Logger.getLogger().i("No Tombstones data found for session " + str);
        }
        return (file == null || !file.exists()) && applicationExitInfo == null;
    }

    private static NativeSessionFile nativeCoreFile(NativeSessionFileProvider nativeSessionFileProvider) {
        File minidumpFile = nativeSessionFileProvider.getMinidumpFile();
        return (minidumpFile == null || !minidumpFile.exists()) ? new BytesBackedNativeSessionFile("minidump_file", "minidump", new byte[]{0}) : new FileBackedNativeSessionFile("minidump_file", "minidump", minidumpFile);
    }

    private static byte[] readResource(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            byte[] bArr = new byte[1024];
            while (true) {
                int i5 = inputStream.read(bArr);
                if (i5 == -1) {
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    byteArrayOutputStream.close();
                    return byteArray;
                }
                byteArrayOutputStream.write(bArr, 0, i5);
            }
        } catch (Throwable th2) {
            try {
                byteArrayOutputStream.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    /* JADX WARN: Type inference failed for: r1v4, types: [com.google.firebase.crashlytics.internal.common.d] */
    @SuppressLint({"WrongConstant"})
    private void registerProfilingManagerListener(final String str, @am.a Executor executor) {
        ProfilingManager profilingManagerB = d9.b(this.context.getSystemService(d9.c()));
        profilingManagerB.addProfilingTriggers(k2.n(c.b().build(), c.e().build()));
        profilingManagerB.registerForAllProfilingResults(executor, new Consumer() { // from class: com.google.firebase.crashlytics.internal.common.d
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                this.f34700a.lambda$registerProfilingManagerListener$5(str, (ProfilingResult) obj);
            }
        });
    }

    private Task<Boolean> waitForReportAction() {
        if (this.dataCollectionArbiter.isAutomaticDataCollectionEnabled()) {
            Logger.getLogger().d("Automatic data collection is enabled. Allowing upload.");
            this.unsentReportsAvailable.c(Boolean.FALSE);
            return Tasks.d(Boolean.TRUE);
        }
        Logger.getLogger().d("Automatic data collection is disabled.");
        Logger.getLogger().v("Notifying that unsent reports are available.");
        this.unsentReportsAvailable.c(Boolean.TRUE);
        Task taskR = this.dataCollectionArbiter.waitForAutomaticDataCollectionEnabled().r(new fi.i() { // from class: com.google.firebase.crashlytics.internal.common.CrashlyticsController.3
            @Override // fi.i
            public Task<Boolean> then(Void r12) throws Exception {
                return Tasks.d(Boolean.TRUE);
            }
        });
        Logger.getLogger().d("Waiting for send/deleteUnsentReports to be called.");
        return CrashlyticsTasks.race(taskR, this.reportActionProvided.f55135a);
    }

    private void writeApplicationExitInfoEventIfRelevant(String str) {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 < 30) {
            Logger.getLogger().v("ANR feature enabled, but device is API " + i5);
            return;
        }
        List<ApplicationExitInfo> historicalProcessExitReasons = ((ActivityManager) this.context.getSystemService("activity")).getHistoricalProcessExitReasons(null, 0, 0);
        if (historicalProcessExitReasons.size() != 0) {
            this.reportingCoordinator.persistRelevantAppExitInfoEvent(str, historicalProcessExitReasons, new LogFileManager(this.fileStore, str), UserMetadata.loadFromExistingSession(str, this.fileStore, this.crashlyticsWorkers));
        } else {
            Logger.getLogger().v("No ApplicationExitInfo available. Session: " + str);
        }
    }

    private void writeProfilingManagerInfo(String str) {
        ActivityManager activityManager = (ActivityManager) this.context.getSystemService("activity");
        this.reportingCoordinator.persistProfilingManagerInfo(str, (List) this.fileStore.getSessionFiles(str, new FilenameFilter() { // from class: com.google.firebase.crashlytics.internal.common.f
            @Override // java.io.FilenameFilter
            public final boolean accept(File file, String str2) {
                return CrashlyticsController.lambda$writeProfilingManagerInfo$2(file, str2);
            }
        }).stream().map(new Function() { // from class: com.google.firebase.crashlytics.internal.common.g
            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return CrashlyticsController.lambda$writeProfilingManagerInfo$3((File) obj);
            }
        }).filter(new Predicate() { // from class: com.google.firebase.crashlytics.internal.common.h
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return CrashlyticsController.lambda$writeProfilingManagerInfo$4((Integer) obj);
            }
        }).collect(Collectors.toList()), activityManager.getHistoricalProcessExitReasons(null, 0, 0));
    }

    public Task<Boolean> checkForUnsentReports() {
        if (this.checkForUnsentReportsCalled.compareAndSet(false, true)) {
            return this.unsentReportsAvailable.f55135a;
        }
        Logger.getLogger().w("checkForUnsentReports should only be called once per execution.");
        return Tasks.d(Boolean.FALSE);
    }

    public Task<Void> deleteUnsentReports() {
        this.reportActionProvided.c(Boolean.FALSE);
        return this.unsentReportsHandled.f55135a;
    }

    public boolean didCrashOnPreviousExecution() {
        CrashlyticsWorkers.checkBackgroundThread();
        if (!this.crashMarker.isPresent()) {
            String currentSessionId = getCurrentSessionId();
            return currentSessionId != null && this.nativeComponent.hasCrashDataForSession(currentSessionId);
        }
        Logger.getLogger().v("Found previous crash marker.");
        this.crashMarker.remove();
        return true;
    }

    public void doCloseSessions(SettingsProvider settingsProvider) throws IOException {
        doCloseSessions(false, settingsProvider, false);
    }

    public void enableExceptionHandling(String str, Thread.UncaughtExceptionHandler uncaughtExceptionHandler, SettingsProvider settingsProvider) {
        this.settingsProvider = settingsProvider;
        openSession(str);
        CrashlyticsUncaughtExceptionHandler crashlyticsUncaughtExceptionHandler = new CrashlyticsUncaughtExceptionHandler(new CrashlyticsUncaughtExceptionHandler.CrashListener() { // from class: com.google.firebase.crashlytics.internal.common.CrashlyticsController.1
            @Override // com.google.firebase.crashlytics.internal.common.CrashlyticsUncaughtExceptionHandler.CrashListener
            public void onUncaughtException(SettingsProvider settingsProvider2, Thread thread, Throwable th2) throws Throwable {
                CrashlyticsController.this.handleUncaughtException(settingsProvider2, thread, th2);
            }
        }, settingsProvider, uncaughtExceptionHandler, this.nativeComponent);
        this.crashHandler = crashlyticsUncaughtExceptionHandler;
        Thread.setDefaultUncaughtExceptionHandler(crashlyticsUncaughtExceptionHandler);
    }

    public void enableProfilingManagerListener(String str) {
        registerProfilingManagerListener(str, this.crashlyticsWorkers.diskWrite.getExecutor());
    }

    public boolean finalizeSessions(SettingsProvider settingsProvider) {
        CrashlyticsWorkers.checkBackgroundThread();
        if (isHandlingException()) {
            Logger.getLogger().w("Skipping session finalization because a crash has already occurred.");
            return false;
        }
        Logger.getLogger().v("Finalizing previously open sessions.");
        try {
            doCloseSessions(true, settingsProvider, true);
            Logger.getLogger().v("Closed all previously open sessions.");
            return true;
        } catch (Exception e3) {
            Logger.getLogger().e("Unable to finalize previously open sessions.", e3);
            return false;
        }
    }

    public String getLogString() {
        return this.logFileManager.getLogString();
    }

    public UserMetadata getUserMetadata() {
        return this.userMetadata;
    }

    public String getVersionControlInfo() throws IOException {
        String versionControlInfo = CommonUtils.getVersionControlInfo(this.context);
        if (versionControlInfo != null) {
            Logger.getLogger().d("Read version control info from string resource");
            return Base64.encodeToString(versionControlInfo.getBytes(UTF_8), 0);
        }
        InputStream resourceAsStream = getResourceAsStream("META-INF/version-control-info.textproto");
        if (resourceAsStream == null) {
            if (resourceAsStream != null) {
                resourceAsStream.close();
            }
            Logger.getLogger().i("No version control information found");
            return null;
        }
        try {
            Logger.getLogger().d("Read version control info from file");
            String strEncodeToString = Base64.encodeToString(readResource(resourceAsStream), 0);
            resourceAsStream.close();
            return strEncodeToString;
        } catch (Throwable th2) {
            try {
                resourceAsStream.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public void handleUncaughtException(SettingsProvider settingsProvider, Thread thread, Throwable th2) throws Throwable {
        handleUncaughtException(settingsProvider, thread, th2, false);
    }

    public boolean isHandlingException() {
        CrashlyticsUncaughtExceptionHandler crashlyticsUncaughtExceptionHandler = this.crashHandler;
        return crashlyticsUncaughtExceptionHandler != null && crashlyticsUncaughtExceptionHandler.isHandlingException();
    }

    public List<File> listAppExceptionMarkerFiles() {
        return this.fileStore.getCommonFiles(APP_EXCEPTION_MARKER_FILTER);
    }

    public void logFatalException(Thread thread, Throwable th2) throws Throwable {
        SettingsProvider settingsProvider = this.settingsProvider;
        if (settingsProvider == null) {
            Logger.getLogger().w("settingsProvider not set");
        } else {
            handleUncaughtException(settingsProvider, thread, th2, true);
        }
    }

    public void openSession(String str) {
        this.crashlyticsWorkers.common.submit(new e(0, this, str));
    }

    public void saveVersionControlInfo() {
        try {
            String versionControlInfo = getVersionControlInfo();
            if (versionControlInfo != null) {
                setInternalKey(VERSION_CONTROL_INFO_KEY, versionControlInfo);
                Logger.getLogger().i("Saved version control info");
            }
        } catch (IOException e3) {
            Logger.getLogger().w("Unable to save version control info", e3);
        }
    }

    public Task<Void> sendUnsentReports() {
        this.reportActionProvided.c(Boolean.TRUE);
        return this.unsentReportsHandled.f55135a;
    }

    public void setCustomKey(String str, String str2) {
        try {
            this.userMetadata.setCustomKey(str, str2);
        } catch (IllegalArgumentException e3) {
            Context context = this.context;
            if (context != null && CommonUtils.isAppDebuggable(context)) {
                throw e3;
            }
            Logger.getLogger().e("Attempting to set custom attribute with null key, ignoring.");
        }
    }

    public void setCustomKeys(Map<String, String> map) {
        this.userMetadata.setCustomKeys(map);
    }

    public void setInternalKey(String str, String str2) {
        try {
            this.userMetadata.setInternalKey(str, str2);
        } catch (IllegalArgumentException e3) {
            Context context = this.context;
            if (context != null && CommonUtils.isAppDebuggable(context)) {
                throw e3;
            }
            Logger.getLogger().e("Attempting to set custom attribute with null key, ignoring.");
        }
    }

    public void setUserId(String str) {
        this.userMetadata.setUserId(str);
    }

    public void submitAllReports(final Task<Settings> task) {
        if (this.reportingCoordinator.hasReportsToSend()) {
            Logger.getLogger().v("Crash reports are available to be sent.");
            waitForReportAction().s(this.crashlyticsWorkers.common, new fi.i() { // from class: com.google.firebase.crashlytics.internal.common.CrashlyticsController.4
                @Override // fi.i
                public Task<Void> then(Boolean bool) throws Exception {
                    if (bool.booleanValue()) {
                        Logger.getLogger().d("Sending cached crash reports...");
                        CrashlyticsController.this.dataCollectionArbiter.grantDataCollectionPermission(bool.booleanValue());
                        return task.s(CrashlyticsController.this.crashlyticsWorkers.common, new fi.i() { // from class: com.google.firebase.crashlytics.internal.common.CrashlyticsController.4.1
                            @Override // fi.i
                            public Task<Void> then(Settings settings) throws Exception {
                                if (settings == null) {
                                    Logger.getLogger().w("Received null app settings at app startup. Cannot send cached reports");
                                    return Tasks.d(null);
                                }
                                CrashlyticsController.this.logAnalyticsAppExceptionEvents();
                                CrashlyticsController.this.reportingCoordinator.sendReports(CrashlyticsController.this.crashlyticsWorkers.common);
                                CrashlyticsController.this.unsentReportsHandled.c(null);
                                return Tasks.d(null);
                            }
                        });
                    }
                    Logger.getLogger().v("Deleting cached crash reports...");
                    CrashlyticsController.deleteFiles(CrashlyticsController.this.listAppExceptionMarkerFiles());
                    CrashlyticsController.this.reportingCoordinator.removeAllReports();
                    CrashlyticsController.this.unsentReportsHandled.c(null);
                    return Tasks.d(null);
                }
            });
        } else {
            Logger.getLogger().v("No crash reports are available to be sent.");
            this.unsentReportsAvailable.c(Boolean.FALSE);
        }
    }

    public void writeNonFatalException(Thread thread, Throwable th2, Map<String, String> map) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (isHandlingException()) {
            return;
        }
        long timestampSeconds = getTimestampSeconds(jCurrentTimeMillis);
        String currentSessionId = getCurrentSessionId();
        if (currentSessionId == null) {
            Logger.getLogger().w("Tried to write a non-fatal exception while no session was open.");
        } else {
            this.reportingCoordinator.persistNonFatalEvent(th2, thread, new EventMetadata(currentSessionId, timestampSeconds, map));
        }
    }

    public void writeToLog(long j11, String str) {
        if (isHandlingException()) {
            return;
        }
        this.logFileManager.writeToLog(j11, str);
    }

    public void writeTriggerTypeFile(String str, int i5) {
        String str2 = i5 == 8 ? TRIGGER_TYPE_ANOMALY_FILENAME : i5 == 7 ? TRIGGER_TYPE_OOM_FILENAME : "trigger-type-unknown";
        try {
            if (this.fileStore.getSessionFile(str, str2).createNewFile()) {
                return;
            }
            Logger.getLogger().d("Trigger file " + str2 + " exists for session: " + str);
        } catch (IOException unused) {
            Logger.getLogger().e("Unable to touch trigger file ".concat(str2));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void doCloseSessions(boolean z11, SettingsProvider settingsProvider, boolean z12) throws IOException {
        String str;
        CrashlyticsWorkers.checkBackgroundThread();
        ArrayList arrayList = new ArrayList(this.reportingCoordinator.listSortedOpenSessionIds());
        if (arrayList.size() <= z11) {
            Logger.getLogger().v("No open sessions to be closed.");
            return;
        }
        String str2 = (String) arrayList.get(z11 ? 1 : 0);
        if (z12 && settingsProvider.getSettingsSync().featureFlagData.collectAnrs) {
            writeApplicationExitInfoEventIfRelevant(str2);
        } else {
            Logger.getLogger().v("ANR feature disabled.");
        }
        if (z12 && this.nativeComponent.hasCrashDataForSession(str2)) {
            finalizePreviousNativeSession(str2);
        }
        if (Build.VERSION.SDK_INT >= 37) {
            writeProfilingManagerInfo(str2);
        }
        if (z11 != 0) {
            str = (String) arrayList.get(0);
        } else {
            this.sessionsSubscriber.setSessionId(null);
            str = null;
        }
        this.reportingCoordinator.finalizeSessions(getCurrentTimestampSeconds(), str);
    }

    public synchronized void handleUncaughtException(final SettingsProvider settingsProvider, final Thread thread, final Throwable th2, final boolean z11) throws Throwable {
        Throwable th3;
        try {
            try {
                Logger.getLogger().d("Handling uncaught exception \"" + th2 + "\" from thread " + thread.getName());
                if (!z11) {
                    try {
                        l2.D();
                    } catch (Throwable th4) {
                        th3 = th4;
                        throw th3;
                    }
                }
                final long jCurrentTimeMillis = System.currentTimeMillis();
                Task taskSubmitTask = this.crashlyticsWorkers.common.submitTask(new Callable<Task<Void>>() { // from class: com.google.firebase.crashlytics.internal.common.CrashlyticsController.2
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // java.util.concurrent.Callable
                    public Task<Void> call() throws Exception {
                        long timestampSeconds = CrashlyticsController.getTimestampSeconds(jCurrentTimeMillis);
                        final String currentSessionId = CrashlyticsController.this.getCurrentSessionId();
                        if (currentSessionId == null) {
                            Logger.getLogger().e("Tried to write a fatal exception while no session was open.");
                            return Tasks.d(null);
                        }
                        CrashlyticsController.this.crashMarker.create();
                        CrashlyticsController.this.reportingCoordinator.persistFatalEvent(th2, thread, currentSessionId, timestampSeconds);
                        CrashlyticsController.this.doWriteAppExceptionMarker(jCurrentTimeMillis);
                        CrashlyticsController.this.doCloseSessions(settingsProvider);
                        CrashlyticsController.this.doOpenSession(new CLSUUID().getSessionId(), Boolean.valueOf(z11));
                        return !CrashlyticsController.this.dataCollectionArbiter.isAutomaticDataCollectionEnabled() ? Tasks.d(null) : settingsProvider.getSettingsAsync().s(CrashlyticsController.this.crashlyticsWorkers.common, new fi.i() { // from class: com.google.firebase.crashlytics.internal.common.CrashlyticsController.2.1
                            @Override // fi.i
                            public Task<Void> then(Settings settings) throws Exception {
                                if (settings != null) {
                                    return Tasks.e(Arrays.asList(CrashlyticsController.this.logAnalyticsAppExceptionEvents(), CrashlyticsController.this.reportingCoordinator.sendReports(CrashlyticsController.this.crashlyticsWorkers.common, z11 ? currentSessionId : null)));
                                }
                                Logger.getLogger().w("Received null app settings, cannot send reports at crash time.");
                                return Tasks.d(null);
                            }
                        });
                    }
                });
                if (!z11) {
                    try {
                        Utils.awaitEvenIfOnMainThread(taskSubmitTask);
                    } catch (TimeoutException unused) {
                        Logger.getLogger().e("Cannot send reports. Timed out while fetching settings.");
                    } catch (Exception e3) {
                        Logger.getLogger().e("Error handling uncaught exception", e3);
                    }
                }
            } catch (Throwable th5) {
                th = th5;
                th3 = th;
                throw th3;
            }
        } catch (Throwable th6) {
            th = th6;
        }
    }
}
