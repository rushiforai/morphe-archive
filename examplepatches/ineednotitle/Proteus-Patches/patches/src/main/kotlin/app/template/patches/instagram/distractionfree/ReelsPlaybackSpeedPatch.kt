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
val instagramReelsPlaybackSpeedPatch = bytecodePatch(
    name = "Reels playback speed menu",
    description = "Adds Instagram's playback-speed menu to the Reels overflow menu. " +
        "The speed can be changed at runtime from the Proteus settings button.",
    default = true,
) {
    dependsOn(
        // ig_android_reels_overflow_menu_playback_speed
        overrideInstagramMobileConfigBooleanFlag(override = "109947::0" to true),
        overrideInstagramMobileConfigBooleanFlag(override = "109947::2" to true),
    )

    compatibleWith(INSTAGRAM_COMPATIBILITY)
}
