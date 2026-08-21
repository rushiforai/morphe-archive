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
