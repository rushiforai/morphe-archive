package app.non7043.patches.score365.ads

import app.non7043.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private object BaseActionBarShowAdsFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActionBarActivity;",
    name = "showAdsForContext",
    returnType = "Z",
)

private object SingleEntityDashboardShowAdsFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/dashboard/singleEntity/SingleEntityDashboardActivity;",
    name = "showAdsForContext",
    returnType = "Z",
)

private object GameCenterBaseShowAdsFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/gameCenter/GameCenterBaseActivity;",
    name = "showAdsForContext",
    returnType = "Z",
)

private object WebViewShowAdsFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/ui/WebViewActivity;",
    name = "showAdsForContext",
    returnType = "Z",
)

private object BaseActionBarIsBannerNeededFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActionBarActivity;",
    name = "isBannerNeedToBeShown",
    returnType = "Z",
)

private object BottomNavigationIsBannerNeededFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BottomNavigationActivity;",
    name = "isBannerNeedToBeShown",
    returnType = "Z",
)

/**
 * Disables ads across all 365Score activities by forcing showAdsForContext()
 * and isBannerNeedToBeShown() to return false.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes banner and interstitial advertisements from 365Score.",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
        val targets = listOf(
            BaseActionBarShowAdsFingerprint,
            SingleEntityDashboardShowAdsFingerprint,
            GameCenterBaseShowAdsFingerprint,
            WebViewShowAdsFingerprint,
            BaseActionBarIsBannerNeededFingerprint,
            BottomNavigationIsBannerNeededFingerprint,
        )

        for (target in targets) {
            val method = target.methodOrNull ?: continue
            if (method.implementation != null) {
                method.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    return v0
                    """.trimIndent(),
                )
            }
        }
    }
}
