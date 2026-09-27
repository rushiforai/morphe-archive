package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Hides upgrade upsell UI (nav-bar upgrade entry, restricted-queue prompts,
 * flyer popup).
 *
 * Why a separate patch from the Plus spoof: isPlus=true does not remove
 * this UI because it is server-driven (plusTab flag, DisplayAds payload),
 * not gated on isPlusUser. Each hook verified LIVE in 8.0.28 smali — see
 * UpsellFingerprints.kt.
 *
 * Deliberately NOT hooked (crash, 2026-09-25, logcat NPE in
 * BlueBarItem.getItem <- NavigationActivity): BlueBarItem.fillMemCache.
 * getItem() calls fillMemCache() then reads the static cache map; no-op'ing
 * it leaves the map null and every MainActivity.onResume crashes. The header
 * bar itself IS safe to hide (see below) — only the cache fill is untouchable.
 *
 * In-feed subscribe cards (ButtonModel/LinkModel) are NOT handled here —
 * they moved to the "Remove ads" patch (regex deeplink match + LinkModel
 * coverage).
 *
 * If banners persist after applying, the remaining source is server payloads
 * (UpgradeModel/UpgradeRow in settings-subscriptions, DisplayAdsWorker
 * response), not a missed client gate.
 */
@Suppress("unused")
val hideUpsellPatch = bytecodePatch(
    name = "Hide upgrade upsell",
    description = "Forces getPlusTab/getHasRestrictedQueue=false, collapses the HeaderBar promo banner (GONE), and no-ops flyer onAdLoaded.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        GetPlusTabFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        GetHasRestrictedQueueFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        // Top promo banner (Explore/Search header): collapse it. fillMemCache
        // stays intact so BlueBarItem.getItem keeps working (see kdoc).
        HeaderBarSetDataFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Lcom/anghami/ui/bar/HeaderBar;->setVisibility(I)V
                return-void
            """
        )
        // In-feed subscribe cards moved to the "Remove ads" patch
        // (RemoveAdsPatch.kt) — regex deeplink match on ButtonModel +
        // LinkModel. Kept out of here so all ad removal is one toggle.
        FlyerOnAdLoadedFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
