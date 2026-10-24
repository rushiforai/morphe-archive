package app.template.patches.mydialog

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for MyDialog v18.6.5 (versionCode 1130100213).
 *
 * The app's own classes keep their names (`net.omobio.dialogsc.*`), but the
 * security helper methods inside MainActivity are R8-shortened (A1/B1/Z1/a2/c2),
 * so those names are pinned to this target version and re-verified on every
 * upgrade. Library-class methods (CleverTap/AppsFlyer RN bridges) are also
 * renamed; the same pin applies.
 */

/** MainActivity.A1(int) — security-warning toast + `finish()` (kills the app). */
val MainActivityKillA1 = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/MainActivity;",
    name = "A1",
    returnType = "V",
    parameters = listOf("I"),
)

/** MainActivity.B1(int, boolean) — onResume-variant of the kill toast + `finish()`. */
val MainActivityKillB1 = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/MainActivity;",
    name = "B1",
    returnType = "V",
    parameters = listOf("I", "Z"),
)

/** MainActivity.Z1() — one-shot background security-check thread (root/frida/emulator/…). */
val MainActivitySecurityThreadZ1 = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/MainActivity;",
    name = "Z1",
    returnType = "V",
    parameters = emptyList(),
)

/** MainActivity.a2(boolean) — same checks re-run from onResume. */
val MainActivitySecurityThreadA2 = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/MainActivity;",
    name = "a2",
    returnType = "V",
    parameters = listOf("Z"),
)

/** MainActivity.c2() — starts the continuous 3s Frida-monitor thread. */
val MainActivityContinuousMonitorC2 = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/MainActivity;",
    name = "c2",
    returnType = "V",
    parameters = emptyList(),
)

/** SecurityManager.performComprehensiveSecurityCheck(Context) — the aggregate "is this device clean". */
val ComprehensiveSecurityCheck = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/security/SecurityManager;",
    name = "performComprehensiveSecurityCheck",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** SecurityManager.verifyAppSignature(Context) — expected cert sha256 baked into BuildConfig. */
val VerifyAppSignature = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/security/SecurityManager;",
    name = "verifyAppSignature",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** SecurityManager.isSSLPinningBypassed() — probed from the OkHttp interceptor on every request. */
val IsSslPinningBypassed = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/security/SecurityManager;",
    name = "isSSLPinningBypassed",
    returnType = "Z",
    parameters = emptyList(),
)

/** SecurityValidator.isSecure(Context) — continuous-check wrapper. */
val SecurityValidatorIsSecure = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/security/SecurityValidator;",
    name = "isSecure",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** CustomCertificatePinner.d(X509Certificate[]) — the actual pin comparison. */
val CertificatePinCheck = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/security/CustomCertificatePinner;",
    name = "d",
    returnType = "V",
    parameters = listOf("[Ljava/security/cert/X509Certificate;"),
)

/** RNAppsFlyerModule.callSdkInternal(ReadableMap) — the single AppsFlyer init/start path. */
val AppsFlyerCallSdkInternal = Fingerprint(
    definingClass = "Lcom/appsflyer/reactnative/RNAppsFlyerModule;",
    name = "callSdkInternal",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;"),
)

/** CleverTap lifecycle auto-init (called from MainApplication.onCreate). */
val CleverTapLifecycleInit = Fingerprint(
    definingClass = "Lcom/clevertap/android/sdk/ActivityLifecycleCallback;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;"),
)

/** CleverTap RN bridge init (called from MainApplication.onCreate). */
val CleverTapRnInit = Fingerprint(
    definingClass = "Lcom/clevertap/react/CleverTapRnAPI;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** CleverTapAPI.H2(Bundle) — push-notification-click tracking (onCreate / onNewIntent). */
val CleverTapPushTracking = Fingerprint(
    definingClass = "Lcom/clevertap/android/sdk/CleverTapAPI;",
    name = "H2",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** FirebasePerfUrlConnection.instrument(Object) — perf tracing wrapper (URLConnection in, out). */
val FirebasePerfInstrument = Fingerprint(
    definingClass = "Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;",
    name = "instrument",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

/** NativeUtilsModule.verifyInstallerId(Promise) — resolves whether the app came from Play. */
val VerifyInstallerId = Fingerprint(
    definingClass = "Lnet/omobio/dialogsc/utils/NativeUtilsModule;",
    name = "verifyInstallerId",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
)
