package app.arylive.patches.arylive.ads

import app.arylive.patches.shared.Constants.ARY_PLUS
import app.arylive.util.returnEarly
import app.arylive.util.returnEarlyNull
import app.arylive.util.returnFirstParameter
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Client-side ad strip for ARY PLUS (phone).
 *
 * Covers the same surfaces as the lab APK:
 * - Homepage interstitial load/show
 * - Banner / native loaders (AdMob + GAM helpers)
 * - Revive (aryzap) banner loader
 * - Home feed row / banner injectors
 * - Media3 IMA AdsLoader providers (preroll)
 *
 * Does not unlock paid / TVOD / DRM content.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Disables interstitials, banners, native ads, Revive ads, home feed ad injectors, and IMA video ads. Shows Video ads skipped when drama/player ads are blocked.",
    default = true,
) {
    compatibleWith(ARY_PLUS)

    dependsOn(
        standaloneApkResourcePatch,
        pairIpBypassPatch,
    )

    extendWith("extensions/extension.mpe")

    execute {
        // --- Interstitials ---
        LoadHomepageInterstitialFingerprint.method.returnEarly()

        // Never show interstitial; still fire onAdClosed so callers continue.
        ShowHomepageInterstitialFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lapp/arylive/extension/AdSkipNotifier;->notifySkipped()V
                if-eqz p1, :skip
                invoke-interface {p1}, Lcom/material/components/aryzap/Helpers/InterstitialAdHelper${'$'}OnAdClosedListener;->onAdClosed()V
                :skip
                return-void
            """.trimIndent(),
        )

        // --- Banners / native (AdLoaderHelper) ---
        LoadBannerAdFingerprint.method.returnEarly(notify = true)
        LoadBannerAdInternalFingerprint.method.returnEarly()
        LoadBannerAdHorizontalFingerprint.method.returnEarly(notify = true)
        LoadNativeAdFingerprint.method.returnEarly(notify = true)
        LoadNativeAdInternalFingerprint.method.returnEarly()
        LoadNativeAdForPosterGridFingerprint.method.returnEarly(notify = true)
        LoadNativeAdHorizontalFingerprint.method.returnEarly(notify = true)

        // --- Revive (Kotlin helper; absent on some builds) ---
        ReviveLoadAdFingerprint.methodOrNull?.returnEarly(notify = true)
            ?: mutableClassDefByOrNull("Lcom/material/components/aryzap/Helpers/ReviveAdLoader;")
                ?.methods
                ?.filter { it.name == "loadAd" && it.returnType == "V" }
                ?.forEach { it.returnEarly(notify = true) }

        // --- Home feed injectors (return original list, silent) ---
        HomeBannerInjectFingerprint.method.returnFirstParameter()
        HomeRowInjectAds3Fingerprint.method.returnFirstParameter()
        HomeRowInjectAds4Fingerprint.method.returnFirstParameter()
        HomeRowInjectAdsCoreFingerprint.method.returnFirstParameter()
        HomeRowInjectEpisodeAdsFingerprint.method.returnFirstParameter()

        // --- Player IMA (PlayerActivity + CdnPlayer dramas + live): null AdsLoader ---
        listOf(
            PlayerAdsLoaderProviderFingerprint,
            CdnPlayerAdsLoaderProviderFingerprint,
            LiveChannelAdsLoaderProviderFingerprint,
        ).forEach { fingerprint ->
            val matches = fingerprint.matchAllOrNull()
            if (matches.isNullOrEmpty()) {
                fingerprint.methodOrNull?.returnEarlyNull(notify = true, video = true)
            } else {
                matches.forEach { match ->
                    match.method.returnEarlyNull(notify = true, video = true)
                }
            }
        }
    }
}
