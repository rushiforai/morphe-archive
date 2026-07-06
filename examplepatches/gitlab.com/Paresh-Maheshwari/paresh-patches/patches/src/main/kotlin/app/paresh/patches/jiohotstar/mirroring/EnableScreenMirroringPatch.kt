package app.paresh.patches.jiohotstar.mirroring

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val enableScreenMirroringPatch = bytecodePatch(
    name = "Enable screen mirroring",
    description = "Allows playback while screen mirroring or HDMI is connected."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // NOP the multiple display detection — skips "Multiple screens detected" error
        MultipleDisplayCheckFingerprint.method.addInstructions(0, """
            return-void
        """)
    }
}
