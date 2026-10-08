package app.template.patches.sofascore.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.util.returnBoxedBooleanEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Marks the account as premium in the app. Note: AI insights and other premium " +
        "content are served by Sofascore's servers for paying accounts and are not unlocked; " +
        "use \"Disable ads\" for an ad-free app."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Session premium flag (UserAccount) - read by the feature gates.
        UserAccountHasPremiumFingerprint.method.returnBoxedBooleanEarly(true)

        // Server profile premium flag (ProfileData) - read by the profile/subscription UI.
        ProfileDataHasPremiumFingerprint.method.returnBoxedBooleanEarly(true)
    }
}
