package app.template.patches.multitimer.drm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MULTITIMER

@Suppress("unused")
val bypassDrmPatch = bytecodePatch(
    name = "Bypass DRM",
    description = "Prevents PairIP license check from running so the app does not redirect to the Play Store paywall on launch.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MULTITIMER)

    execute {
        LicenseContentProviderOnCreateFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
