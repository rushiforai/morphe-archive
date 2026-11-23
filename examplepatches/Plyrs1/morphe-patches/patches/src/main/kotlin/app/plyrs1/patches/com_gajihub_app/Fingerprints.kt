package app.plyrs1.patches.com_gajihub_app

import app.morphe.patcher.Fingerprint

/**
 * Matches LocationSerializationHelper.toWritableMap(Location)
 * Serializes Android Location into React Native WritableMap with coordinates and "mocked" flag.
 * - v2.0.4: Li3/i;->i(Location)
 * - v2.0.14: LU4/j;->i(Location)
 */
object LocationSerializationFingerprint : Fingerprint(
    returnType = "Lcom/facebook/react/bridge/WritableMap;",
    parameters = listOf("Landroid/location/Location;"),
    strings = listOf("latitude", "longitude", "coords", "provider", "timestamp", "mocked")
)

/**
 * Matches MapView location change callback
 * Serializes location for react-native-maps with "isFromMockProvider" flag.
 * - v2.0.4: Lcom/rnmaps/maps/z$k;->a(Location)
 * - v2.0.14: Lcom/rnmaps/maps/c0$e;->a(Location)
 */
object MapViewLocationChangeFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/location/Location;"),
    strings = listOf("coordinate", "isFromMockProvider")
)

/**
 * Matches Google Play Services / Android client check for User build type
 * Checks if Build.TYPE equals "user".
 * - v2.0.4: LC6/h;->b()Z
 * - v2.0.14: Lcom/google/android/gms/common/util/g;->b()Z
 */
object BuildTypeCheckFingerprint : Fingerprint(
    name = "b",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("user")
)

/**
 * Matches OfflineLocationModule.isMock(Location) [com/gajihub/app/OfflineLocationModule;->isMock(Location)Z]
 * Checks if Location is mock via isMock() (API 31+) or isFromMockProvider() (API <31).
 * Introduced in v2.0.14.
 */
object OfflineLocationIsMockFingerprint : Fingerprint(
    definingClass = "Lcom/gajihub/app/OfflineLocationModule;",
    name = "isMock",
    returnType = "Z",
    parameters = listOf("Landroid/location/Location;")
)
/**
 * Matches RNDeviceModule.isEmulatorSync()
 * Detects emulator environment based on Build fingerprints, models, and hardware strings.
 */
object RNDeviceModuleIsEmulatorSyncFingerprint : Fingerprint(
    definingClass = "Lcom/learnium/RNDeviceInfo/RNDeviceModule;",
    name = "isEmulatorSync",
    returnType = "Z",
    strings = listOf("generic", "google_sdk", "Emulator")
)

/**
 * Matches RNDeviceModule.isEmulator(Promise)
 * Asynchronous React Native bridge method for emulator check.
 */
object RNDeviceModuleIsEmulatorFingerprint : Fingerprint(
    definingClass = "Lcom/learnium/RNDeviceInfo/RNDeviceModule;",
    name = "isEmulator",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches OneSignal root detection helper [com/onesignal/common/i;->isRooted()]
 * Checks for presence of "su" binary across standard paths.
 */
object OneSignalIsRootedFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/common/i;",
    name = "isRooted",
    returnType = "Z",
    strings = listOf("su", "/sbin/", "/system/bin/")
)

/**
 * Matches SoLoader SysUtil.j() returning supported ABIs [com/facebook/soloader/SysUtil;->j()[Ljava/lang/String;]
 * Overridden to return ["arm64-v8a"] so DirectApkSoSource finds native libraries on x86_64 emulators.
 */
object SoLoaderGetSupportedAbisFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/soloader/SysUtil\$MarshmallowSysdeps;",
    name = "getSupportedAbis",
    returnType = "[Ljava/lang/String;"
)

/**
 * Matches RNSentryModule.initNativeSdk(ReadableMap, Promise)
 * Neutralized to prevent Sentry React Native bridge from initializing native crash/event reporting.
 */
object RNSentryInitNativeSdkFingerprint : Fingerprint(
    definingClass = "Lio/sentry/react/RNSentryModule;",
    name = "initNativeSdk",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;", "Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches RNSentryModule.captureEnvelope(String, ReadableMap, Promise)
 * Suppresses JS crash and error envelope submission to Sentry.
 */
object RNSentryCaptureEnvelopeFingerprint : Fingerprint(
    definingClass = "Lio/sentry/react/RNSentryModule;",
    name = "captureEnvelope",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;", "Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches RNSentryModule.captureScreenshot(Promise)
 * Suppresses Sentry automatic screenshot capture on error.
 */
object RNSentryCaptureScreenshotFingerprint : Fingerprint(
    definingClass = "Lio/sentry/react/RNSentryModule;",
    name = "captureScreenshot",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches RNSentryModule.fetchViewHierarchy(Promise)
 * Suppresses Sentry UI view tree scraping on error.
 */
object RNSentryFetchViewHierarchyFingerprint : Fingerprint(
    definingClass = "Lio/sentry/react/RNSentryModule;",
    name = "fetchViewHierarchy",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches OneSignal location sharing flag [com/onesignal/location/internal/a;->isShared()Z]
 * Forced to false so OneSignal never collects or beacons GPS coordinates.
 */
object OneSignalLocationIsSharedFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/location/internal/a;",
    name = "isShared",
    returnType = "Z"
)

/**
 * Matches OneSignal location tracker startup [com/onesignal/location/internal/a;->start()V]
 * Neutralized so OneSignal does not subscribe to location permissions.
 */
object OneSignalLocationStartFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/location/internal/a;",
    name = "start",
    returnType = "V"
)

/**
 * Matches OneSignal location sharing setter [com/onesignal/location/internal/a;->setShared(Z)V]
 * Neutralized so location sharing cannot be enabled.
 */
object OneSignalLocationSetSharedFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/location/internal/a;",
    name = "setShared",
    returnType = "V",
    parameters = listOf("Z")
)

/**
 * Matches RNOneSignal.addOutcome(String)
 * Suppresses user engagement outcome telemetry to OneSignal.
 */
object RNOneSignalAddOutcomeFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/rnonesignalandroid/RNOneSignal;",
    name = "addOutcome",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Matches RNOneSignal.addOutcomeWithValue(String, float)
 * Suppresses user conversion value telemetry to OneSignal.
 */
object RNOneSignalAddOutcomeWithValueFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/rnonesignalandroid/RNOneSignal;",
    name = "addOutcomeWithValue",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "F")
)

/**
 * Matches RNOneSignal.addUniqueOutcome(String)
 * Suppresses unique outcome telemetry to OneSignal.
 */
object RNOneSignalAddUniqueOutcomeFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/rnonesignalandroid/RNOneSignal;",
    name = "addUniqueOutcome",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Matches CodePushNativeModule.recordStatusReported(ReadableMap)
 * Suppresses OTA deployment status reporting to Microsoft AppCenter.
 */
object CodePushRecordStatusReportedFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "recordStatusReported",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;")
)

/**
 * Matches CodePushNativeModule.saveStatusReportForRetry(ReadableMap)
 * Suppresses OTA deployment retry telemetry to Microsoft AppCenter.
 */
object CodePushSaveStatusReportForRetryFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "saveStatusReportForRetry",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;")
)

/**
 * Matches CodePush bundle file path resolver:
 * - v2.0.4: com/microsoft/codepush/react/a;->m(String)String
 * - v2.0.14: com/microsoft/codepush/react/d;->n(String)String
 * Forces runtime to load solely from assets://index.android.bundle.
 */
object CodePushGetJSBundleFileFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("assets://"),
    custom = { method, _ ->
        method.definingClass.startsWith("Lcom/microsoft/codepush/react/")
    }
)

/**
 * Matches CodePushNativeModule.setJSBundle(...) methods which dynamically switch
 * React Native's JSBundleLoader to filesystem files.
 */
object CodePushSetJSBundleFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "setJSBundle",
    returnType = "V"
)

/**
 * Matches CodePushNativeModule.downloadUpdate(ReadableMap, boolean, Promise)
 * Neutralized so remote bundles or diffs are never downloaded.
 */
object CodePushDownloadUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "downloadUpdate",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;", "Z", "Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches CodePushNativeModule.installUpdate(ReadableMap, int, int, Promise)
 * Neutralized so downloaded updates can never be installed.
 */
object CodePushInstallUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "installUpdate",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;", "I", "I", "Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches CodePushNativeModule.downloadAndReplaceCurrentBundle(String)
 * Neutralized so full bundle replacement never executes.
 */
object CodePushDownloadAndReplaceBundleFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "downloadAndReplaceCurrentBundle",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Matches CodePushNativeModule.getUpdateMetadata(int, Promise)
 * Forces result to null so JS assumes no pending/current update package exists.
 */
object CodePushGetUpdateMetadataFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "getUpdateMetadata",
    returnType = "V",
    parameters = listOf("I", "Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches CodePushNativeModule.getLatestRollbackInfo(Promise)
 * Resolves null so no rollback packages are queried.
 */
object CodePushGetLatestRollbackInfoFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "getLatestRollbackInfo",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches CodePushNativeModule.isFailedUpdate(String, Promise)
 * Resolves false.
 */
object CodePushIsFailedUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "isFailedUpdate",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches CodePushNativeModule.isFirstRun(String, Promise)
 * Resolves false.
 */
object CodePushIsFirstRunFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushNativeModule;",
    name = "isFirstRun",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
)

/**
 * Matches CodePushDialog.showDialog(...)
 * Neutralized with return-void so OTA update popups are never displayed.
 */
object CodePushShowDialogFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushDialog;",
    name = "showDialog",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/Callback;",
        "Lcom/facebook/react/bridge/Callback;"
    )
)

/**
 * Matches RevopushPatch.a(String, String, String)I [org/revopush/ota/RevopushPatch;->a]
 * Neutralized to return -1 (error) so differential JS bundle patching never succeeds.
 * Introduced in v2.0.14.
 */
object RevopushPatchApplyFingerprint : Fingerprint(
    definingClass = "Lorg/revopush/ota/RevopushPatch;",
    name = "a",
    returnType = "I",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
)

/**
 * Matches SentryInitProvider.onCreate()Z
 * Neutralized in bytecode so Sentry never auto-initializes on cold start without touching AndroidManifest.xml.
 */
object SentryInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lio/sentry/android/core/SentryInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Matches SentryPerformanceProvider.onCreate()Z
 * Neutralized in bytecode so Sentry never starts app-start/frame performance tracking on cold start.
 */
object SentryPerformanceProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lio/sentry/android/core/SentryPerformanceProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)
