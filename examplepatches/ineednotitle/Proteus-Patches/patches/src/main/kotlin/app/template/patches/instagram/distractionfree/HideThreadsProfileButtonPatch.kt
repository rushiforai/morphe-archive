/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

@Suppress("unused")
val instagramHideThreadsProfileButtonPatch = bytecodePatch(
    name = "Hide Threads profile button",
    description = "Hides the Threads button from the profile page action bar (top right of the profile page).",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    dependsOn(
        overrideInstagramMobileConfigBooleanFlag(
            override = "58467::20" to false, // ig_channels_4th_ufi::is_ig_to_p92_app_switcher_enabled_android
        ),
    )
}
