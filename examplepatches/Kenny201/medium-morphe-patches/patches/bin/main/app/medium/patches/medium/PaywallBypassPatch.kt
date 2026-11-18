package app.medium.patches.medium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.patch
import app.medium.patches.shared.Constants.COMPATIBILITY_MEDIUM

@Suppress("unused")
val paywallBypassPatch = patch(
    name = "Bypass paywall",
    description = "Unlocks full articles natively by mocking user's MembershipTier to MEMBER.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MEDIUM)

    execute {
        MembershipTierFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.removeInstructions(0)
            match.method.addInstructions(
                0,
                """
                    sget-object v0, Lcom/medium/android/graphql/type/MembershipTier;->MEMBER:Lcom/medium/android/graphql/type/MembershipTier;
                    return-object v0
                """
            )
        }
    }
}