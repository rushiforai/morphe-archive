package com.anime.witcher.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprint for AdsManager.shouldShowAd(Context)Z
 *
 * The method contains "ads_pref" then "servers_open_count" as const-string instructions.
 */
object ShouldShowAdFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(
        string("servers_open_count"),
    )
)

/**
 * Fingerprint for AdsConfig.getFrequency(Context)I
 *
 * The method contains "ads_pref" then "ad_frequency" as const-string instructions.
 */
object GetFrequencyFingerprint : Fingerprint(
    returnType = "I",
    filters = listOf(
        string("ad_frequency"),
    )
)

/**
 * Fingerprint for ApplicationClass.onCreate()V
 *
 * Matches on the hardcoded OneSignal app ID string.
 */
object ApplicationClassOnCreateFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("ddb0823e-c7f4-4aec-b10b-09867ba74f38"),
    )
)

/**
 * Fingerprint for ServersActivity.openStreamActivity(String)V
 *
 * Matches on the unique custom URI scheme.
 */
object OpenStreamActivityFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("anime_witcher://play?url="),
    )
)

/**
 * Fingerprint for ServersActivity$5.onConfirmClicked()V
 *
 * Matches on the "com.awystudio.awplayer" string passed to openPlayStore.
 */
object OnConfirmClickedFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.awystudio.awplayer"),
    )
)

/**
 * Fingerprint for HomeActivity.handleVersionSettings(VersionSettings)V
 *
 * Matches on the "تنبيه" (Alert) string used as the title of the
 * update/changelog popup dialog that appears when the app starts.
 */
object HandleVersionSettingsFingerprint : Fingerprint(
    definingClass = "Lcom/anime/witcher/HomeActivity;",
    name = "handleVersionSettings",
    returnType = "V",
    filters = listOf(
        string("\u062a\u0646\u0628\u064a\u0647"),
    )
)

/**
 * Fingerprint for HomeActivity.showVpnAlertDialog()V
 *
 * Matches on the "تنبيه!" header string of the VPN alert dialog.
 */
object HomeShowVpnAlertDialogFingerprint : Fingerprint(
    definingClass = "Lcom/anime/witcher/HomeActivity;",
    returnType = "V",
    filters = listOf(
        string("\u062a\u0646\u0628\u064a\u0647!"),
    )
)

/**
 * Fingerprint for AnimeDetailsActivity.showVpnAlertDialog()V
 *
 * Matches on the "تنبيه!" header string of the VPN alert dialog.
 */
object AnimeDetailsShowVpnAlertDialogFingerprint : Fingerprint(
    definingClass = "Lcom/anime/witcher/activites/AnimeDetailsActivity;",
    returnType = "V",
    filters = listOf(
        string("\u062a\u0646\u0628\u064a\u0647!"),
    )
)

/**
 * Fingerprint for ServersActivity.checkDNS()V
 *
 * Matches on the "block_dns" shared preferences key string.
 */
object CheckDnsFingerprint : Fingerprint(
    definingClass = "Lcom/anime/witcher/activites/ServersActivity;",
    returnType = "V",
    filters = listOf(
        string("block_dns"),
    )
)

/**
 * Fingerprint for AppCompatActivity.dispatchKeyEvent(KeyEvent)Z
 *
 * The entry point through which every activity-level D-pad press flows.
 */
object AppCompatActivityDispatchKeyEventFingerprint : Fingerprint(
    definingClass = "Landroidx/appcompat/app/AppCompatActivity;",
    name = "dispatchKeyEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/KeyEvent;"),
)

/**
 * Fingerprint for HomeActivity.openAppAppearanceDialog()V
 *
 * Shows the "choose appearance / server" popup on the first app open.
 */
object HomeOpenAppAppearanceDialogFingerprint : Fingerprint(
    definingClass = "Lcom/anime/witcher/HomeActivity;",
    name = "openAppAppearanceDialog",
    returnType = "V",
)
