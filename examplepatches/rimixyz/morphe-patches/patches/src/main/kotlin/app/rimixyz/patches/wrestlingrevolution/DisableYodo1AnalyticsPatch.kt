package app.rimixyz.patches.wrestlingrevolution

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_WRESTLINGREVOLUTION

/**
 * Stops the ThinkingData tracker that ships inside Yodo1 MAS.
 *
 * Yodo1MasHelper.initSDK() -> Yodo1MasDataAnalytics.initWithAppKey() ->
 * Yodo1MasThinkingData.initWithAppKey() creates a ThinkingAnalyticsSDK with
 * endpoint https://c1.yodo1.com and enables APP_INSTALL/APP_START/APP_END/
 * APP_VIEW_SCREEN/APP_CLICK/APP_CRASH auto-tracking.
 *
 * Every other method of Yodo1MasThinkingData null-checks the SDK field, and
 * Yodo1MasDataAnalytics only calls trackEvent("AppStart") afterwards, so an
 * early return disables the tracker without breaking the ad mediation.
 */
@Suppress("unused")
val disableYodo1AnalyticsPatch = patch(
    name = "Disable Yodo1 analytics",
    description = "Stops the ThinkingData behavioural tracker bundled with Yodo1 MAS (endpoint c1.yodo1.com), including automatic app/screen/click/crash events.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WRESTLINGREVOLUTION)

    execute {
        ThinkingDataInitFingerprint.method.addInstructions(0, "return-void")
    }
}
