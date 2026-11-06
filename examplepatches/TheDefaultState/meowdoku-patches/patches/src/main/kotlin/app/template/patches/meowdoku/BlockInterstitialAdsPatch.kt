package app.template.patches.meowdoku

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val HELPER = "Lapp/template/extension/RewardAdSkipper;"

/**
 * Skips the full-screen ads between levels and on launch.
 *
 * Same mechanism as the rewarded ad: the show call is cut short and the app is handed the
 * callbacks a finished ad would produce, so its level flow resumes instead of stalling.
 * Interstitials need a real `Activity`, app-open ads are shown without one.
 */
val blockInterstitialAdsPatch = bytecodePatch(
    name = "Block interstitial and app-open ads",
    description = "Skips the full-screen ads between levels and the ones shown when the app opens.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MEOWDOKU)

    extendWith("extensions/extension.mpe")

    val blockInterstitialAds by booleanOption(
        key = "Block interstitial ads",
        description = "Skip the ad between levels and continue right away.",
        default = true
    )

    execute {
        if (blockInterstitialAds != true) return@execute

        val interstitial = MaxInterstitialShowFingerprint.matchOrNull()
            ?: throw PatchException(
                "MaxInterstitialAd.showAd(Activity) was not found. The AppLovin MAX version in " +
                    "this build probably changed; re-check how the app shows interstitials."
            )
        interstitial.method.addInstructions(
            0,
            """
                invoke-static {p0}, $HELPER->maxAd(Ljava/lang/Object;)V
                return-void
            """
        )

        // App-open is optional: a build without it keeps working, so no hard failure here.
        MaxAppOpenShowFingerprint.matchOrNull()?.let {
            it.method.addInstructions(
                0,
                """
                    invoke-static {p0}, $HELPER->maxAd(Ljava/lang/Object;)V
                    return-void
                """
            )
        }

        println("Block interstitial ads: hooked the interstitial and app-open show calls.")
    }
}
