package app.template.patches.truecaller.misc.nags

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

private const val FEATURE = "truecaller.disable_nags"

// A Heval Controls feature: the overrides apply only while it is on.
@Suppress("unused")
val disableNagsPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Disable nags",
        description = "Disables default dialer, permission and survey prompts.",
        category = TruecallerControlsCategory.PROMOTIONS,
    ),
) {
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
        FEATURE,
    )
}
