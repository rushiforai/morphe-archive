package app.template.patches.scannerradio

import app.morphe.patcher.Fingerprint

// ── Premium Bypass ──────────────────────────────────────────────────────────

object IsProVersionFingerprint : Fingerprint(
    definingClass = "Lhm0;",
    name = "a0",
    returnType = "Z",
    parameters = emptyList()
)

// ── Telemetry Kill ──────────────────────────────────────────────────────────

object InMobiInitFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/sdk/InMobiSdk;",
    name = "init",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lorg/json/JSONObject;",
        "Lcom/inmobi/sdk/SdkInitializationListener;"
    )
)

object FairBidInitFingerprint : Fingerprint(
    definingClass = "Lcom/fyber/a;",
    name = "start",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/content/Context;")
)

// ── Pairip DRM Bypass ──────────────────────────────────────────────────────

/**
 * Entry point 1: CoreComponentFactory.<clinit>() calls StartupLauncher.launch()
 * which triggers VMRunner → System.loadLibrary("pairipcore") → native SIGSEGV.
 * No-op launch() to prevent the chain from starting.
 */
object StartupLauncherFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Entry point 2: com.pairip.application.Application.attachBaseContext() calls:
 *   VMRunner.setContext(context)       → loads native lib → CRASH
 *   SignatureCheck.verifyIntegrity()   → throws on re-sign
 *   LicenseClient.checkLicense()       → Play Store license check
 * Replace entire body with just super.attachBaseContext(context).
 */
object PairipApplicationFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Entry point 3: MyApplication.onCreate() has pairip-injected IronSource reflection:
 *   TTvRdCYPAWUKRE.ztV.invoke(null, this)
 * ztV is null because VMRunner never initialized → NPE crash.
 * No-op the entire method — app init happens via attachBaseContext + idle handlers.
 */
object MyApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/MyApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList()
)

// ── Pairip Injected Lifecycle Methods (TTvRdCYPAWUKRE) ─────────────────────
// Pairip replaces these method bodies with reflection dispatch through
// TTvRdCYPAWUKRE/ztcicW static Method fields. Without VMRunner those fields
// are null → NPE. Patch each to invoke-super to parent class.

object FavoritesPickerOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/activities/FavoritesPickerActivity;",
    name = "onStart",
    returnType = "V",
    parameters = emptyList()
)

object LocaleEditOnDestroyFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/activities/LocaleEditActivity;",
    name = "onDestroy",
    returnType = "V",
    parameters = emptyList()
)

object LocaleEditOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/activities/LocaleEditActivity;",
    name = "onStart",
    returnType = "V",
    parameters = emptyList()
)

object MyMediaBrowserServiceOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/services/MyMediaBrowserService;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList()
)

object WidgetConfigure4x1FavoritesOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/widgets/WidgetConfigure_4x1_favorites;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// ── Pairip Injected Lifecycle Methods (qtcicW) ─────────────────────────────

object FavoritesPickerOnDestroyFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/activities/FavoritesPickerActivity;",
    name = "onDestroy",
    returnType = "V",
    parameters = emptyList()
)

object FavoritesPickerOnStopFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/activities/FavoritesPickerActivity;",
    name = "onStop",
    returnType = "V",
    parameters = emptyList()
)

object MainActivityOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/ui/main/MainActivity;",
    name = "onStart",
    returnType = "V",
    parameters = emptyList()
)

object MainActivityOnStopFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/ui/main/MainActivity;",
    name = "onStop",
    returnType = "V",
    parameters = emptyList()
)

object MyMediaBrowserServiceOnDestroyFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/services/MyMediaBrowserService;",
    name = "onDestroy",
    returnType = "V",
    parameters = emptyList()
)

object WidgetConfigure4x2FavoritesOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/widgets/WidgetConfigure_4x2_favorites;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

object LinkActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scannerradio/activities/LinkActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// ── Ad Kill ─────────────────────────────────────────────────────────────────

object ShowBannerAdsFingerprint : Fingerprint(
    definingClass = "Lj8;",
    name = "i",
    returnType = "V",
    parameters = emptyList()
)

object ShowInterstitialAdsFingerprint : Fingerprint(
    definingClass = "Lj8;",
    name = "j",
    returnType = "V",
    parameters = emptyList()
)
