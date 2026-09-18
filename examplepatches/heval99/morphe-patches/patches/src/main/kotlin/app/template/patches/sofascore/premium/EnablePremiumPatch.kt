package app.template.patches.sofascore.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.util.returnBoxedBooleanEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks AI insights and premium features locked behind the Sofascore Plus/Pro subscription."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Session premium flag (UserAccount) - read by the feature gates.
        UserAccountHasPremiumFingerprint.methodOrNull?.returnBoxedBooleanEarly(true)

        // Server profile premium flag (ProfileData) - read by the profile/subscription UI.
        ProfileDataHasPremiumFingerprint.methodOrNull?.returnBoxedBooleanEarly(true)
    }
}
