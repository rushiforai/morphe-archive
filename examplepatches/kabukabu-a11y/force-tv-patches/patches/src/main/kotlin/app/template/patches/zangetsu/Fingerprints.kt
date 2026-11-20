package app.template.patches.zangetsu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The device MethodChannel handler in MainActivity. It answers the Dart
 * side's "isTv" call by checking UiModeManager's current mode type and
 * the leanback system features, and returns the result as a boolean.
 *
 * The handler is one large method covering many channel methods, so it
 * is located through the two stable string literals its isTv branch
 * uses: the method name itself and the leanback_only feature string.
 * Filter order matters: "isTv" appears in the branch before the
 * "android.software.leanback_only" check.
 */
object IsTvChannelFingerprint : Fingerprint(
    definingClass = "Lcom/spyou/watch_app/MainActivity;",
    filters = listOf(
        string("isTv"),
        string("android.software.leanback_only")
    )
)

/**
 * Globals.isAutoTv in the vendored CloudStream plugin host. Together
 * with the leanback feature check in Globals.resolveFrom it decides
 * whether plugins see the TV or the PHONE layout.
 *
 * Located by its exact class, name and signature (Zangetsu is not
 * obfuscated), with the Fire TV model strings it checks as extra
 * confirmation.
 */
object IsAutoTvFingerprint : Fingerprint(
    definingClass = "Lcom/lagradost/cloudstream3/ui/settings/Globals;",
    name = "isAutoTv",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("firestick"),
        string("chromecast")
    )
)
