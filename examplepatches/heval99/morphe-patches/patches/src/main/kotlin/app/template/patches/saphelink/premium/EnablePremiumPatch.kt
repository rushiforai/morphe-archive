package app.template.patches.saphelink.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SAPHELINK
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks all features locked behind the Saphe subscription paywall " +
        "(navigation, car integration, speed limits, voice alarms, roadwork detection, " +
        "animal nearby, slow-moving traffic, emergency vehicle, etc.).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SAPHELINK)

    execute {
        // userHasFeature is the single private gate that every is*Enabled()
        // check on FeatureToggleRouter delegates to. Returning true here
        // flips every feature flag on without touching the 20+ public wrappers.
        UserHasFeatureFingerprint.methodOrNull?.returnEarly(true)

        // Secondary gate: some builds also consult the subscription state directly
        // via SubscriptionManager.isPremium() before calling the feature router.
        // Force it true so the paywall UI never shows even if userHasFeature is
        // bypassed server-side in a future build.
        IsPremiumFingerprint.methodOrNull?.returnEarly(true)
    }
}