/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12
 */

package app.morphe.patches.music.misc.announcements

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.mainactivity.mainActivityResolvePatch
import app.morphe.patches.music.utils.patch.PatchList.PATCHES_UPDATE_NOTICE
import app.morphe.patches.music.utils.settings.ResourceUtils
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addCustomPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.mainactivity.injectOnCreateMethodCall
import app.morphe.patches.shared.misc.announcements.PATCHES_UPDATE_NOTICE_EXTENSION_CLASS
import app.morphe.patches.shared.misc.announcements.patchesUpdateNoticeResourcePatch

@Suppress("unused")
val patchesUpdateNoticePatch = bytecodePatch(
    name = PATCHES_UPDATE_NOTICE.title,
    description = PATCHES_UPDATE_NOTICE.summary
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    dependsOn(sharedExtensionPatch, settingsPatch, mainActivityResolvePatch, patchesUpdateNoticeResourcePatch)

    execute {
        injectOnCreateMethodCall(PATCHES_UPDATE_NOTICE_EXTENSION_CLASS, "showNoticeIfNeeded")
        addCustomPreference(
            CategoryType.MISC,
            "revanced_patches_update_notice",
            "app.morphe.extension.shared.settings.preference.PatchesUpdateChannelPreference",
            setSummary = false
        )
        addCustomPreference(
            CategoryType.MISC,
            "revanced_patches_update_check",
            "app.morphe.extension.shared.settings.preference.PatchesUpdateCheckPreference"
        )
        ResourceUtils.updatePatchStatus(PATCHES_UPDATE_NOTICE)
    }
}
