/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

@Suppress("unused")
val instagramHideReelsSaveButtonPatch = bytecodePatch(
    name = "Hide Reels save button",
    description = "Hides the save button from Reels.",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    dependsOn(
        overrideInstagramMobileConfigBooleanFlag(
            override = "81702::5" to true, // ig_channels_4th_ufi::android_hide_save_button
        ),
    )
}
