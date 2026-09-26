package app.plyrs1.patches.com_garnesapps_strukpom

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint matching MyApplication.preloadAd(String, AdFormat)
 */
object AdPreloadFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/MyApplication;",
    name = "preloadAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/google/android/libraries/ads/mobile/sdk/common/AdFormat;")
)

/**
 * Fingerprint matching PomActivity.showInter(int, String, String)
 */
object PomActivityShowInterFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/PomActivity;",
    name = "showInter",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;")
)

/**
 * Fingerprint matching StrukActivity.showInter(int)
 */
object StrukActivityShowInterFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/StrukActivity;",
    name = "showInter",
    returnType = "V",
    parameters = listOf("I")
)

/**
 * Fingerprint matching HistoriActivity.showInter(int, int)
 */
object HistoriActivityShowInterFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/HistoriActivity;",
    name = "showInter",
    returnType = "V",
    parameters = listOf("I", "I")
)

/**
 * Fingerprint matching PomActivity.goAs(int, String, String, String)
 */
object PomActivityGoAsFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/PomActivity;",
    name = "goAs",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
)

/**
 * Fingerprint matching StrukActivity.goAs(int, String)
 */
object StrukActivityGoAsFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/StrukActivity;",
    name = "goAs",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;")
)

/**
 * Fingerprint matching HistoriActivity.goAs(int, int, String)
 */
object HistoriActivityGoAsFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/HistoriActivity;",
    name = "goAs",
    returnType = "V",
    parameters = listOf("I", "I", "Ljava/lang/String;")
)

/**
 * Fingerprint matching loadRewardedAd() across all receipt activities.
 * Uses no definingClass so it matches any class containing this method signature.
 */
object LoadRewardedAdFingerprint : Fingerprint(
    name = "loadRewardedAd",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching loadBanner() across all activities.
 * Called from onCreate() after binding is initialized — ideal injection
 * point for auto-hiding the watermark on receipt activities.
 */
object LoadBannerFingerprint : Fingerprint(
    name = "loadBanner",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching MenuActivity.onCreateOptionsMenu(Menu)
 * Inflates menu_hadiah containing the gift action button.
 */
object MenuActivityCreateOptionsMenuFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/MenuActivity;",
    name = "onCreateOptionsMenu",
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;")
)

/**
 * Fingerprint matching MenuActivity.kalem()
 * Called at the end of MenuActivity.onCreate after views and navigation drawer are initialized.
 */
object MenuActivityKalemFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/MenuActivity;",
    name = "kalem",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching MenuActivity constructor <init>()
 * Initializes permissionLauncherMultiple and other ActivityResultLaunchers.
 */
object MenuActivityInitFingerprint : Fingerprint(
    definingClass = "Lcom/garnesapps/strukpom/MenuActivity;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList()
)
