package app.template.patches.blescanner.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BLE_SCANNER
import app.template.patches.shared.addInstructionsChecked

/**
 * BLE Scanner shows next-gen GMA banners through AdmobBanner and one interstitial through
 * AdmobInterstitial. The interstitial's show paths (HomeActivity showAd, showAdForHelp,
 * showAdHistoryData and AdmobInterstitial.showInterstitialAds) are left alone: with no ad they
 * open the radar, help or export screen directly. MobileAds initialization, UMP consent and
 * billing are untouched.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_BLE_SCANNER)

    execute {
        // 1. Every banner container hides itself and no banner is requested (6 screens).
        AdmobBannerLoadFingerprint.method.addInstructionsChecked(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V
                return-void
            """,
        )

        // 2. The interstitial loader returns at once, so no InterstitialAd is ever loaded,
        // including the reload after a shown ad.
        val loadInterstitial = AdmobInterstitialLoadFingerprint.method
        val loadInterstitialFingerprint = Fingerprint(
            definingClass = "/HomeActivity;",
            returnType = "V",
            parameters = listOf(),
            filters = listOf(
                methodCall(
                    definingClass = loadInterstitial.definingClass,
                    name = loadInterstitial.name,
                    parameters = listOf("Landroid/content/Context;"),
                    returnType = "V",
                ),
            ),
        )
        loadInterstitial.returnEarly()

        // 3. HomeActivity.loadInterADS() returns before it creates the AdmobInterstitial, so its
        // field stays null and the show paths go straight to the radar, help or export screen.
        loadInterstitialFingerprint.method.returnEarly()
    }
}
