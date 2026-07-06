package app.paresh.patches.jiohotstar.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val enableScreenshotPatch = bytecodePatch(
    name = "Enable screenshots",
    description = "Removes screenshot and screen recording restrictions."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // ABConfig.getUseSecureView() → false (disables SurfaceView.setSecure)
        UseSecureViewFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Compose FLAG_SECURE → return early (skips Window.addFlags(0x2000))
        ComposeFlagSecureFingerprint.method.addInstructions(0, """
            return-void
        """)
    }
}
