package app.thefit.patches.dafit.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.thefit.patches.shared.Constants.COMPATIBILITY_DAFIT

@Suppress("unused")
val removeAdsPatch = patch(
    name = "Remove ads",
    description = "Removes in-app open ads, banner ads, watch face store ads, and promotional banners from Da Fit.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DAFIT)

    execute {
        // 1. Prevent BandExtendProvider from returning any ExtendMenuModel ad/promotional items (v2.8.4 & v2.9.25+).
        BandExtendListFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // 2. Disable centralized AdConfig flags and open-ad preparation (v2.9.25+).
        listOf(
            AdConfigIsShowAdFingerprint,
            AdConfigShowOpenAdFingerprint,
            AdConfigShowColdOpenAdFingerprint,
            AdConfigShowDeviceBannerFingerprint,
            AdConfigShowTodayBannerFingerprint,
            AdConfigShowWatchFaceBannerFingerprint,
            AdConfigUseAdquantaFingerprint,
            AdInitializationCanLoadFingerprint
        ).forEach { fingerprint ->
            fingerprint.methodOrNull?.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // 3. Disable Google MobileAds & mediation SDK initialization and ad config network fetches (v2.9.25+).
        listOf(
            AdConfigPrepareOpenAdFingerprint,
            AdConfigUpdateConfigFingerprint,
            AdInitializationInitFingerprint,
            AdInitializationDelayFingerprint,
            AdInitializationStartMobileAdsFingerprint,
            BandSettingRenderAdViewFingerprint,
            StoreWatchFaceRenderAdViewFingerprint
        ).forEach { fingerprint ->
            fingerprint.methodOrNull?.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // 4. Force Device and Today banner ad view renderers to always take the false (collapse/hide) branch (v2.9.25+).
        listOf(
            BandSettingRenderGoogleAdViewFingerprint,
            BandTodayRenderAdViewFingerprint
        ).forEach { fingerprint ->
            fingerprint.methodOrNull?.addInstructions(
                0,
                """
                    const/4 p1, 0x0
                """
            )
        }

        // 5. Legacy v2.8.4 presenter and view ad callbacks.
        BandSettingPresenterAdFingerprint.methodOrNull?.addInstructions(
            0,
            """
                return-void
            """
        )

        BandSettingShowAdFingerprint.methodOrNull?.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivAdPreview:Landroid/widget/ImageView;
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V
                return-void
            """
        )
    }
}
