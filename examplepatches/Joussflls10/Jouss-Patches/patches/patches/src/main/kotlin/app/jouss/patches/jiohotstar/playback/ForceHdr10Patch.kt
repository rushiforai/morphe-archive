package app.jouss.patches.jiohotstar.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val forceHdr10Patch = bytecodePatch(
    name = "Force HDR10",
    description = "Forces HDR10 and HDR10+ playback on compatible devices by bypassing blacklist and capability checks."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // Force Dolby Vision / HDR support to true — bypasses blacklist check
        IsDolbyVisionSupportedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
