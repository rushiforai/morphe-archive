/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3337
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Ported to RVX by lavinhoque33, 2026-10-16.
 */

package app.morphe.patches.youtube.layout.statusbar

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.mainactivity.injectOnCreateMethodCall
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.mainactivity.mainActivityResolvePatch
import app.morphe.patches.youtube.utils.patch.PatchList.HIDE_STATUS_BAR
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/HideStatusBarPatch;"

@Suppress("unused")
val hideStatusBarPatch = bytecodePatch(
    name = HIDE_STATUS_BAR.title,
    description = HIDE_STATUS_BAR.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        mainActivityResolvePatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: GENERAL",
                "SETTINGS: HIDE_STATUS_BAR"
            ),
            HIDE_STATUS_BAR
        )

        injectOnCreateMethodCall(EXTENSION_CLASS, "initialize")
    }
}
