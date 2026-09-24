package eh.premom.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import eh.premom.patches.shared.Constants.COMPATIBILITY_PREMOM

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks all premium membership features in the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PREMOM)

    execute {
        // Core gate: never treat the user as free/bronze.
        MembershipIsNoneOrBronzeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // H5 web view premium checks.
        H5IsPaidMemberFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        H5IsPaidMemberForUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // OPK history analysis premium check.
        OpkIsPaidMemberFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
