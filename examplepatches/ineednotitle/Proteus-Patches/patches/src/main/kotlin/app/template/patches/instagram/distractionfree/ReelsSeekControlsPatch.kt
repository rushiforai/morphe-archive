/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

@Suppress("unused")
val instagramReelsSeekControlsPatch = bytecodePatch(
    name = "Reels double-tap seek",
    description = "Enables double-tap skip/rewind controls in Reels. " +
        "The controls can be disabled at runtime from the Proteus settings button.",
    default = true,
) {
    dependsOn(
        // ig_android_reels_video_controls
        overrideInstagramMobileConfigBooleanFlag(override = "118405::1" to true),
        overrideInstagramMobileConfigBooleanFlag(override = "118405::5" to true),
        overrideInstagramMobileConfigBooleanFlag(override = "118405::6" to true),
    )

    compatibleWith(INSTAGRAM_COMPATIBILITY)
}
