package app.template.patches.truecaller.misc.nags

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

@Suppress("unused")
val disableNagsPatch = bytecodePatch(
    name = "Disable nags",
    description = "Disables default dialer, permission and survey prompts.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Each toggle is read through the toggle resolver and now reads as off. The patch fails if
        // a key is no longer read there.
        // - "featureDefaultDialerInterstitial" / "featureDefaultDialerPermanentSpace": the
        //   set-as-default-dialer interstitial and its permanent slot.
        // - "featureNotificationsPermissionBanner" (3 reads), "featureDOOABanner" (display over
        //   other apps) and "featureDisableBatteryOptimizationBanner": the permission banners.
        // - "featurePeriodicallyCheckPermissions": the periodic permission re-check prompts.
        // - "featureRatingsAndReviewsSurveys", "featureBlockSurveyFlow" and "featureFeedbackSurvey"
        //   (Family Protection): the surveys.
        // "featureReduceValueForNonDd" is left alone.
        overrideReadFeatureToggles(
            listOf(
                "featureDefaultDialerInterstitial",
                "featureDefaultDialerPermanentSpace",
                "featureNotificationsPermissionBanner",
                "featureDOOABanner",
                "featureDisableBatteryOptimizationBanner",
                "featurePeriodicallyCheckPermissions",
                "featureRatingsAndReviewsSurveys",
                "featureBlockSurveyFlow",
                "featureFeedbackSurvey",
            ),
            false,
        )
    }
}
