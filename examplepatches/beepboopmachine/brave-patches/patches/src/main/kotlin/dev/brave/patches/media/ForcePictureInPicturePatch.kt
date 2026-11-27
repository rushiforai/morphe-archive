package dev.brave.patches.media

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import dev.brave.patches.core.braveCorePatch
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

@Suppress("unused")
val forcePictureInPicturePatch = patch(
    name = "Force Picture-in-Picture",
    description = "Automatically removes disablePictureInPicture restrictions on all HTML5 videos so PiP is always allowed."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    dependsOn(braveCorePatch)

    extendWith("extensions/brave.mpe")

    execute {
        ActiveTabSwitchFingerprint.method.apply {
            addInstructions(
                0,
                "invoke-static {}, Ldev/brave/extension/tools/ForcePictureInPictureJs;->ensureRegistered()V"
            )
        }
    }
}
