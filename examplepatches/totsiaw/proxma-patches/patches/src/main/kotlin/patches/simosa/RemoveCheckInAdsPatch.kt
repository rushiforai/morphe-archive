package patches.simosa

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * SocialPlus feed / daily check-in ads — a separate ad system (com.jazz.socialplus) from the
 * jazzworld daily-reward ads handled by "Remove ads & tracking", with its own AdManager banner +
 * native loader (`FeedAdsManager`). The two public entry points are stubbed so the feed/top-banner
 * state flows stay empty and nothing renders (the app ships with ADS_FEATURE_ENABLED = false, so
 * no-ads is a valid state). loadTopBanner() is the banner on the daily check-in screen; loadAd(int)
 * fills the in-feed ad slots.
 *
 * Kept as a SEPARATE patch (not folded into "Remove ads & tracking") on purpose: adding this class
 * pushes the number of modified classes from 13 to 14, which tips Morphe Manager's on-device dex
 * writer past its segmentation threshold and triggers the empty/duplicate-DEX bug (morphe-manager#616),
 * crashing the app with ClassNotFoundException on the Application class. Splitting it out keeps the
 * main patch Manager-safe; enable this one too when patching with the morphe-desktop CLI (which is
 * not affected by #616).
 */
private const val SOCIALPLUS_FEED_ADS_MANAGER = "Lcom/jazz/socialplus/core/ads/FeedAdsManager;"

internal val feedAdsLoadTopBannerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { m, c -> c.type == SOCIALPLUS_FEED_ADS_MANAGER && m.name == "loadTopBanner" },
)
internal val feedAdsLoadAdFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    custom = { m, c -> c.type == SOCIALPLUS_FEED_ADS_MANAGER && m.name == "loadAd" },
)

@Suppress("unused")
val removeCheckInAdsPatch = bytecodePatch(
    name = "Remove daily check-in ads",
    description = "Removes the SocialPlus daily check-in / in-feed ads (FeedAdsManager banner + " +
        "native loaders). Separate from \"Remove ads & tracking\" to keep that patch Morphe-Manager-" +
        "safe; enable this one when patching with the desktop CLI.",
) {
    compatibleWith(COMPATIBILITY_SIMOSA)

    execute {
        fun stub(fingerprint: Fingerprint) {
            try {
                fingerprint.method.addInstructions(0, "return-void")
            } catch (_: Exception) {
                // fingerprint didn't resolve — skip
            }
        }
        stub(feedAdsLoadTopBannerFingerprint)
        stub(feedAdsLoadAdFingerprint)
    }
}
