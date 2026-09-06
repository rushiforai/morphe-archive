package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Removes the popups that appear on app start.
 *
 * HomeActivity.onCreate() does two things that show dialogs:
 *  - calls checkCurrentVersion() which, after fetching the remote version settings, calls
 *    [handleVersionSettings]. That method shows two dialogs:
 *     - showUpdateDialog(...) when the remote last_version is newer than the installed version
 *     - WitcherDialog.openAlertDialog(..., "تنبيه", ...) notify dialog
 *  - calls openAppAppearanceDialog() the first time the app opens (first_open flag), which
 *    shows the "choose appearance / server" chooser.
 *
 * Making both methods return immediately is enough to suppress every startup popup.
 */
val removeStartupPopupPatch = bytecodePatch(
    name = "Remove startup popup",
    description = "Removes the update/changelog and appearance popups that appear when the app starts. Original APK: https://www.animewitcher.com/",
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

        HomeOpenAppAppearanceDialogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}