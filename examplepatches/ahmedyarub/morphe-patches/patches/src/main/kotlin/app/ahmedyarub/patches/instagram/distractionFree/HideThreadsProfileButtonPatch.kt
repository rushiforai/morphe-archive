/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * Compatibility widened to Instagram 446.0.0.49.77; patch logic unchanged.
 */
package app.ahmedyarub.patches.instagram.distractionFree

import app.morphe.library.instagram.patches.overrideMobileConfigBooleanFlag
import app.morphe.patcher.patch.bytecodePatch
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM

@Suppress("unused")
val hideThreadsProfileButtonPatch = bytecodePatch(
    name = "Hide Threads profile button",
    description = "Hides the Threads button from the profile page action bar (top right of the profile page).",
    default = false
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(
        overrideMobileConfigBooleanFlag(
            override = "58467::20" to false // ig_channels_4th_ufi::is_ig_to_p92_app_switcher_enabled_android
        )
    )
}
