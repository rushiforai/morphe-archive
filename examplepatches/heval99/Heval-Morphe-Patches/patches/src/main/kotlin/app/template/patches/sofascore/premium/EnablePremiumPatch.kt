package app.template.patches.sofascore.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.util.returnBoxedBooleanEarly
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks AI insights and premium features locked behind subscription."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // AI insights
        AiInsightsEnabledFingerprint.methodOrNull?.returnBoxedBooleanEarly(true)

        // Remove ads subscription gates
        RemoveAdsSubscriptionFingerprint.methodOrNull?.returnBoxedBooleanEarly(true)

        // Premium token validation
        PremiumTokenValidFingerprint.methodOrNull?.returnEarly(true)

        // Generic premium feature gates
        IsPremiumFeatureFingerprint.methodOrNull?.returnBoxedBooleanEarly(true)

        // Premium required error checks
        PremiumRequiredErrorFingerprint.methodOrNull?.returnEarly(false)
    }
}
