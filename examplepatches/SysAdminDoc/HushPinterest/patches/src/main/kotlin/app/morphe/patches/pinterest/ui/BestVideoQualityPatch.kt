/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Pinterest's own lift of the cap it puts on a video's size, which its servers give only some
 * accounts (#48). Without it Pinterest's player picks from video sizes up to 720, or 540 in the grid,
 * and with it up to 7680.
 */
@Suppress("unused")
val bestVideoQualityPatch = bytecodePatch(
    name = "Best video quality",
    description = "Plays videos at the largest size Pinterest has instead of capping them, the way Pinterest " +
        "already does for some accounts. Uses more data. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch, experimentHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("bestVideoQuality")
        requireStatusMethod("videoSizeCap")
        requireExperiment("Best video quality", VIDEO_SIZE_EXPERIMENT)
        enableCapability("videoSizeCap")
        enableStatus("bestVideoQuality")
    }
}
