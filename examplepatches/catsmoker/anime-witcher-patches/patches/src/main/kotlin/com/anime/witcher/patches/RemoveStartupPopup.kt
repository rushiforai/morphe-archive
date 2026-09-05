package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Removes the update/changelog popup that appears every time the app starts.
 *
 * HomeActivity.onCreate() calls checkCurrentVersion() which, after fetching the remote
 * version settings, calls [handleVersionSettings]. That method shows two dialogs:
 *  - showUpdateDialog(...) when the remote last_version is newer than the installed version
 *  - WitcherDialog.openAlertDialog(..., "تنبيه", ...) notify dialog
 *
 * Making handleVersionSettings return immediately is enough to suppress both popups.
 */
val removeStartupPopupPatch = bytecodePatch(
    name = "Remove startup popup",
    description = "Removes the update/changelog popup that appears when the app starts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    execute {
        HandleVersionSettingsFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}