package app.template.patches.playz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal const val PLAYZ_DATA_HELPER_CLASS = "Lwc/d;"
internal const val PLAYZ_CONFIG_CLASS = "Lqc/a;"
internal const val PLAYZ_APPLICATION_CLASS = "Lcom/playz/tv/app/ProApplication;"
internal const val PLAYZ_TELEGRAM_DIALOG_CLASS = "Llc/n;"
internal const val PLAYZ_PX_CLASS = "Lcom/playz/tv/utils/Px;"

/**
 * Matches `Px.<clinit>()V`, whose stock body loads `libnative-lib.so`.
 */
internal object PlayZPxClinitFingerprint : Fingerprint(
    definingClass = PLAYZ_PX_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("native-lib"),
    ),
)

/**
 * Matches the native declaration `Px.check(Context)V`. The native implementation performs the
 * signer-certificate self-test that aborts a Morphe-re-signed build in `ProApplication.onCreate`.
 */
internal object PlayZPxCheckFingerprint : Fingerprint(
    definingClass = PLAYZ_PX_CLASS,
    name = "check",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Matches the native declaration `Px.app(Context, String)[B`. The native implementation is the
 * signer-pinned response decoder called by `q4.a0.j` before its Java AES fallbacks.
 */
internal object PlayZPxAppFingerprint : Fingerprint(
    definingClass = PLAYZ_PX_CLASS,
    name = "app",
    returnType = "[B",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
    ),
)

/**
 * Matches `wc.d.u(Context, ProApplication, JSONObject)qc.a`, the central `app.txt` JSON parser
 * that populates the remote-config fields used for banner/start/support/external ads.
 */
internal object PlayZParseAppConfigFingerprint : Fingerprint(
    definingClass = PLAYZ_DATA_HELPER_CLASS,
    name = "u",
    returnType = PLAYZ_CONFIG_CLASS,
    parameters = listOf(
        "Landroid/content/Context;",
        PLAYZ_APPLICATION_CLASS,
        "Lorg/json/JSONObject;",
    ),
    filters = listOf(
        string("start_ad"),
        string("banner_ad"),
        string("supportAd"),
        string("external_ad_enbled"),
        string("external_ad_repeat_after"),
    ),
)

/**
 * Matches `wc.d.y(Context)V`, the timed external/support popunder trigger that starts
 * `CustomBrowserActivity` with `external_ad_url` after repeated player opens.
 */
internal object PlayZLaunchExternalAdFingerprint : Fingerprint(
    definingClass = PLAYZ_DATA_HELPER_CLASS,
    name = "y",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("tv_external_ad_enabled"),
        string("external_ad_enabled"),
        string("external_ad_repeat_after"),
        string("player_called"),
        string("support_ad_clicked"),
        string("external_ad_url"),
    ),
)

/**
 * Matches `lc.n.a(Context, String)V`, the helper that shows the `dialog_telegram` promo dialog
 * when the `tg_dialog` preference allows it.
 */
internal object PlayZTelegramDialogFingerprint : Fingerprint(
    definingClass = PLAYZ_TELEGRAM_DIALOG_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        string("DataPreferences"),
        string("tg_dialog"),
        string("is_tv"),
    ),
)
