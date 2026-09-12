package app.kanup4m.patches.seven.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.kanup4m.patches.seven.shared.Constants.COMPATIBILITY_SEVEN

// Forces the local Realm membership gate to true. Covers workout unlocks,
// all-exercises unlocks, freestyle paywall and reminder scheduling —
// every consumer routes through MembershipStatus.isUserMember().
@Suppress("unused")
val sevenPremiumPatch = bytecodePatch(
    name = "Seven Premium",
    description = "Unlocks 7 Club premium by forcing the membership check to true. No root required."
) {
    compatibleWith(COMPATIBILITY_SEVEN)

    execute {
        IsUserMemberFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
        IsUserMemberRealmFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
