package patches.dynamicspot

import app.morphe.patcher.Fingerprint

/**
 * dynamicSpot keeps its Pro state in one default-SharedPreferences boolean under the key "100".
 * Every reader is a small ()Ljava/lang/Boolean; wrapper that loads that key; the writers only
 * run from the Google Play billing callbacks. One wrapper exists per surface that asks:
 * home dashboard, paywall screens, notification listener, the three app-picker screens.
 */

/** Home dashboard: hides the Pro card, ads and promo dialogs when true. */
internal object HomeIsProFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/SettingsHome;",
    name = "G",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
    strings = listOf("100"),
)

/** Legacy buy screen state. */
internal object OptionsIsProFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/SettingsOptions;",
    name = "f",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
    strings = listOf("100"),
)

/** Notification listener: gates the promo notification. */
internal object ObserverIsProFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/NotificationObserverSpot;",
    name = "C",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
    strings = listOf("100"),
)

/** Tap-action app picker. */
internal object AppsListIsProFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/AppsListSelection;",
    name = "f",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
    strings = listOf("100"),
)

/** Shortcut picker. */
internal object MyAppsIsProFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/MyAppsList;",
    name = "h",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
    strings = listOf("100"),
)

/** App selection list: unlocks the grayed-out battery-event rows. */
internal object NotifAppsIsProFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/SettingsNotificationApps;",
    name = "o",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
    strings = listOf("100"),
)

/** Modern settings' uj0 entitlement provider, shared by all preference fragments. */
internal object SettingsIsProFingerprint : Fingerprint(
    definingClass = "Lny0;",
    name = "b",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("100"),
)

internal object TutorialCompletionFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/Tutorial\$o;",
    name = "onTouch",
    returnType = "Z",
    parameters = listOf("Landroid/view/View;", "Landroid/view/MotionEvent;"),
    strings = listOf("tut_4", "prefAlwaysOn", "prefGlowScreen"),
)

internal object OfferDialogFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/b;",
    name = "T",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object RatingDialogFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/b;",
    name = "W",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Landroid/content/Context;", "Z"),
    strings = listOf("prefRatingValue"),
)

internal object HomeOfferFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/SettingsHome;",
    name = "p",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("prefPromoShown_3"),
)

internal object PromoNotificationFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/NotificationObserverSpot;",
    name = "T",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("prefPromoNotifShown_4"),
)

/**
 * PairIP ("automatic integrity protection"). Both checks run from
 * com.pairip.application.Application.attachBaseContext before the app starts:
 * a re-signed patched build trips the pinned-signature check immediately and the
 * license check would schedule its "get it from Play" shutdown.
 */
internal object VerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** Runs the VM startup program from MyApp's static initializer; replaced by the baked restore. */
internal object StartupLauncherLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = emptyList(),
)

/** Loads libpairipcore; neutralised so the native VM never loads. */
internal object VmRunnerClinitFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("pairipcore"),
)

internal object VmRunnerInvokeFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;"),
    strings = listOf("Executing "),
)

/**
 * The notification listener registers this receiver for PACKAGE_ADDED; it silently appends
 * every newly installed package to the "prefNotifApps" allow-list so the island starts
 * showing those apps' notifications without asking.
 */
internal object AutoEnrollReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/jamworks/dynamicspot/NotificationObserverSpot\$b;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
    strings = listOf("android.intent.action.PACKAGE_ADDED", "prefNotifApps"),
)
