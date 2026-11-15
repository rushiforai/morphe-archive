/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.returnEarly

private object OnStoryTimeoutActionFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "V",
    strings = listOf("userSession"),
    custom = { _, classDef -> classDef.type.endsWith("/ReelViewerFragment;") },
)

@Suppress("unused")
val instagramDisableStoryAutoFlippingPatch = bytecodePatch(
    name = "Disable story auto flipping",
    description = "Disable stories automatically flipping/skipping after some seconds.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        OnStoryTimeoutActionFingerprint.method.returnEarly()
    }
}
