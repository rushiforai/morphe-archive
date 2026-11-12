package app.mitrosoft.patches.bergfex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BERGFEX

@Suppress("unused")
val forceLiveTrackingPatch = bytecodePatch(
    name = "Force live tracking",
    description = "Enables live tracking and the share link for all users.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BERGFEX)

    execute {
        // Constructor params are 1-based after p0 (this): p5 = isLiveTrackingEnabled, p7 = isLiveTrackingShareLinkAvailable.
        LiveTrackingStateFingerprint.method.addInstructions(
            0,
            """
                const/4 p5, 0x1
                const/4 p7, 0x1
            """,
        )
    }
}
