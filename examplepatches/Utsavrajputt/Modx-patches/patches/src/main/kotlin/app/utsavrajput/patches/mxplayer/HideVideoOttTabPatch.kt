package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER

@Suppress("unused")
val hideVideoOttTabPatch = bytecodePatch(
    name = "Hide Video/OTT tab",
    description = "Hides the Video/OTT download tab from the home screen by " +
        "forcing its visibility flag to always report disabled.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)

    execute {
        // Force the flag method to return false immediately, regardless of
        // remote config or its own cached state. The original body is left
        // in place below the inserted return, so it becomes unreachable
        // dead code rather than being deleted - this keeps the edit minimal
        // and avoids any instruction-alignment/verifier issues.
        VideoTabEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
