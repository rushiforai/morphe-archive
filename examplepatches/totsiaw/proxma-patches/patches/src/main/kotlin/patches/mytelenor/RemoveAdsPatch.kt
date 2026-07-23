package patches.mytelenor

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * My Telenor ships Google Ad Manager banners + interstitials (no other ad SDK). Ad delivery is
 * remote-config driven: the backend returns an AdMobResponseModel that the obfuscated ad controller
 * (Lyq/b;) parses into an AdmobScreens config, and only exposes it while AdmobConfig.getAdmobEnabled()
 * is true. Every per-surface getter (Daily Rewards / Home / Test Your Skills / Explore) funnels through
 * the single controller method c() -> AdmobScreens.
 *
 * Forcing c() to return null is the one upstream chokepoint: both consuming fragments then take their
 * "flAdViewContainer.removeAllViews() + clRootGoogleAds.setVisibility(GONE)" branch and never reach
 * AdManagerInterstitialAd.load(...) (interstitials are guarded on adsData != null). This neutralizes
 * banners AND interstitials on all four surfaces without touching the banner builder (which would risk
 * a null-view addView) or the obfuscated Lyq/a; toggle getters (ten indistinguishable ()Z accessors
 * with no name-agnostic anchor — this gate makes them redundant anyway).
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes every Google Ad Manager ad (banners + interstitials) across Daily Rewards, " +
        "Home, Test Your Skills and Explore by nulling the remote ad-config chokepoint, so each " +
        "surface renders its no-ads layout and never requests an interstitial.",
) {
    compatibleWith(COMPATIBILITY_MYTELENOR)

    execute {
        // return null -> AdmobScreens config is never handed out -> all ad surfaces hide themselves.
        adConfigScreensFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )
    }
}
