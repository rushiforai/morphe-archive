package app.kecerim24.patches.dreamplayer

import app.kecerim24.patches.shared.Constants.COMPATIBILITY_DREAM_PLAYER
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks all premium features, removes ads and disables the online license check.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DREAM_PLAYER)

    execute {
        // region Force every read of the premium flag to return true.

        // The generic boolean preference getter, Ly1/P;->e(Ljava/lang/String;Z)Z in 14.1.0,
        // resolved from the isPremium() body so both always stay in sync.
        //
        // Hooking the getter rather than only isPremium() also covers the few screens that
        // read the preference directly, and the AdMob code path which decides whether to
        // inflate a banner.
        val preferenceGetter = PremiumStatusFingerprint.instructionMatches[1].getMethodCalled()

        // "equals" is called on the constant with the key as its argument,
        // so a null key cannot throw.
        preferenceGetter.addInstructionsWithLabels(
            0,
            """
                const-string v0, "$PREMIUM_PREFERENCE_KEY"
                invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :not_premium_key
                const/4 v0, 0x1
                return v0
            """,
            ExternalLabel("not_premium_key", preferenceGetter.getInstruction(0))
        )

        // Short circuit isPremium() itself as well, so its callers never hit preferences.
        PremiumStatusFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // endregion

        // region Never contact the license server.

        // Returning null is a no-op: the caller null checks the status code before acting on
        // "purchase revoked", "purchase removed" or "device blocked".
        LicenseValidationFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // endregion
    }
}
