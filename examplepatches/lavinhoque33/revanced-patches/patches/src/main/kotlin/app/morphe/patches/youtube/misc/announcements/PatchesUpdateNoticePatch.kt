/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12
 */

package app.morphe.patches.youtube.misc.announcements

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.mainactivity.injectOnCreateMethodCall
import app.morphe.patches.shared.misc.announcements.PATCHES_UPDATE_NOTICE_EXTENSION_CLASS
import app.morphe.patches.shared.misc.announcements.patchesUpdateNoticeResourcePatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.mainactivity.mainActivityResolvePatch
import app.morphe.patches.youtube.utils.patch.PatchList.PATCHES_UPDATE_NOTICE
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch

@Suppress("unused")
val patchesUpdateNoticePatch = bytecodePatch(
    name = PATCHES_UPDATE_NOTICE.title,
    description = PATCHES_UPDATE_NOTICE.summary
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(sharedExtensionPatch, settingsPatch, mainActivityResolvePatch, patchesUpdateNoticeResourcePatch)

    execute {
        injectOnCreateMethodCall(PATCHES_UPDATE_NOTICE_EXTENSION_CLASS, "showNoticeIfNeeded")
        addPreference(arrayOf("SETTINGS: PATCHES_UPDATE_NOTICE"), PATCHES_UPDATE_NOTICE)
    }
}
