package app.template.patches.everythingwidgets.privacy

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Everything Widgets 2.1.014 (versionCode 63) — telemetry
 * stack. All class pins verified in a full apktool decompile of the official
 * 2.1.014 APK; the app is additionally locked to version+cert via
 * EVERYTHING_WIDGETS_COMPATIBILITY.
 *
 * Telemetry inventory of this build (all verifiable in smali):
 *   - Facebook SDK bootstraps itself via com.facebook.internal.FacebookInitProvider
 *     (merged manifest provider); obfuscated FB attribution/advertising-id
 *     collector lives at smali_classes2/w5/f ("limit_tracking"/"androidid"/
 *     katana+wakizashi AttributionIdProvider URIs).
 *   - OneSignal push/analytics SDK boots from
 *     com/jndapp/nothing/widgets/pack/ApplicationClass.onCreate via
 *     OneSignal.initWithContext(Context, ONESIGNAL_APP_ID).
 *   - Firebase Analytics / Crashlytics / Performance / Messaging auto-register
 *     via ComponentDiscoveryService metas; weather/speed-test widgets call
 *     FirebasePerfUrlConnection.instrument() — so Firebase INIT must survive
 *     (killing it would break weather widgets); opt-out at source instead.
 */

/**
 * Facebook SDK auto-init seam — provider onCreate returns boolean; killing it
 * silences all implicit Facebook collection (attribution, install/activate
 * pings, activity callbacks) by preventing the SDK from bootstrapping.
 */
object EwFacebookInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/internal/FacebookInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * OneSignal.initWithContext(Context, String) — 0-telemetry kill for the push
 * vendor's whole pipeline (device tag sync, analytics). It is the only boot
 * entry the app uses (ApplicationClass.onCreate, verified call site).
 * Side effect accepted by design: OneSignal push notifications stop.
 */
object EwOneSignalInitFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/OneSignal;",
    name = "initWithContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;")
)

/**
 * ApplicationClass.onCreate — injection point for the four SDK opt-outs.
 * Verified on 2.1.014: `.locals 5` + super.onCreate at top; v0/v1 are free.
 * ContentProviders (incl. FirebaseInitProvider) initialize BEFORE
 * Application.onCreate per contract, so FirebaseX.getInstance() is safe here.
 */
object EwApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/jndapp/nothing/widgets/pack/ApplicationClass;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList()
)
