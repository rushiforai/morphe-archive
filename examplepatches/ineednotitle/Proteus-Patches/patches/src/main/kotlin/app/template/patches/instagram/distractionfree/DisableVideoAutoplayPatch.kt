/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.returnEarly

private object DisableVideoAutoPlayFingerprint : Fingerprint(
    strings = listOf("ig_disable_video_autoplay"),
    returnType = "Z",
)

@Suppress("unused")
val instagramDisableVideoAutoplayPatch = bytecodePatch(
    name = "Disable video autoplay",
    description = "Disable video autoplay from feed.",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        DisableVideoAutoPlayFingerprint.method.returnEarly(true)
    }
}
