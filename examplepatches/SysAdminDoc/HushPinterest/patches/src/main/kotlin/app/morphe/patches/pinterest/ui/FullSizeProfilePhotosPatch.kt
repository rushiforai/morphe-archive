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

/** Pinterest's full-size sheet for someone else's profile photo, which its servers give only some accounts (#48). */
@Suppress("unused")
val fullSizeProfilePhotosPatch = bytecodePatch(
    name = "Full-size profile photos",
    description = "Opens someone's profile photo full size when you tap it on their profile, the way Pinterest " +
        "already does for some accounts. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch, experimentHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("fullSizeProfilePhotos")
        requireStatusMethod("profilePhotoSheet")
        requireExperiment("Full-size profile photos", PROFILE_PHOTO_EXPERIMENT)
        enableCapability("profilePhotoSheet")
        enableStatus("fullSizeProfilePhotos")
    }
}
