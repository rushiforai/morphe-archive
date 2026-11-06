/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3291
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Ported to RVX by lavinhoque33, 2026-10-16.
 */

package app.morphe.patches.music.general.orientation

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.GENERAL_PATH
import app.morphe.patches.music.utils.mainactivity.mainActivityResolvePatch
import app.morphe.patches.music.utils.patch.PatchList.FORCE_PORTRAIT_ORIENTATION
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.mainactivity.injectOnCreateMethodCall

private const val EXTENSION_CLASS_DESCRIPTOR =
    "$GENERAL_PATH/ForcePortraitOrientationPatch;"

@Suppress("unused")
val forcePortraitOrientationPatch = bytecodePatch(
    FORCE_PORTRAIT_ORIENTATION.title,
    FORCE_PORTRAIT_ORIENTATION.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(
        mainActivityResolvePatch,
        settingsPatch,
    )

    execute {
        // The hook runs at the start of MusicActivity.onCreate, in front of the settings hook.
        injectOnCreateMethodCall(EXTENSION_CLASS_DESCRIPTOR, "setRequestedOrientation")

        addSwitchPreference(
            CategoryType.GENERAL,
            "revanced_force_portrait_orientation",
            "false"
        )

        updatePatchStatus(FORCE_PORTRAIT_ORIENTATION)
    }
}
