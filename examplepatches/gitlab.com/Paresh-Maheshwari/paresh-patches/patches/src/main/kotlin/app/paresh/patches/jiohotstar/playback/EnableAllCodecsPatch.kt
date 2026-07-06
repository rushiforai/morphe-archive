package app.paresh.patches.jiohotstar.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val enableAllCodecsPatch = bytecodePatch(
    name = "Enable all codecs",
    description = "Enables all video codecs (H265, VP9, AV1) and 4K resolution by bypassing blacklist and capability checks."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // Force 4K support to true
        Is4kSupportedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Force all codec support checks to true
        IsCodecSupportedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
