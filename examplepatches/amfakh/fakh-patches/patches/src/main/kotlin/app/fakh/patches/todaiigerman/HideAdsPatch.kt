/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiigerman

import app.fakh.patches.shared.disableProviders
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch

/**
 * AdMob, AppLovin, Yandex Ads, and Meta Audience Network initialize via content providers before Application.onCreate.
 */
private val adSdkManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "com.applovin.sdk.AppLovinInitProvider",
                "com.yandex.mobile.ads.core.initializer.MobileAdsInitializeProvider",
                "com.facebook.ads.AudienceNetworkContentProvider",
            )
        }
    }
}

/** MobileAdsState.d: starts a coroutine that calls MobileAds.initialize. */
private object MobileAdsStateInitFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/easygerman/google/admob/s;",
    name = "d",
    returnType = "V",
    parameters = listOf(),
)

/** AnalyticsApp.u: sets AppLovinPrivacySettings consent flags on startup. */
private object AnalyticsAppLovinInitFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/easygerman/google/admob/AnalyticsApp;",
    name = "u",
    returnType = "V",
    parameters = listOf(),
)

/** AdsInterval.g: preloads an interstitial ad. */
private object AdsIntervalPreloadFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/easygerman/google/admob/d;",
    name = "g",
    returnType = "V",
    parameters = listOf(),
)

/** AdsReward.i: preloads a rewarded ad. */
private object AdsRewardPreloadFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/easygerman/google/admob/f;",
    name = "i",
    returnType = "V",
    parameters = listOf(),
)

/** Ad removal that the Premium unlock pulls in: Premium alone leaves the ad SDKs initialized and preloading. */
internal val hideAdsPatch = patch {
    dependsOn(adSdkManifestPatch)

    execute {
        MobileAdsStateInitFingerprint.method.addInstructions(0, "return-void")
        AnalyticsAppLovinInitFingerprint.method.addInstructions(0, "return-void")

        AdsIntervalPreloadFingerprint.method.addInstructions(0, "return-void")
        AdsRewardPreloadFingerprint.method.addInstructions(0, "return-void")
    }
}
