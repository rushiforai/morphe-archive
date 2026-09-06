package com.autocat.morphe.smartlauncher.patches.nativearchive

import app.morphe.patcher.patch.bytecodePatch
import com.autocat.morphe.smartlauncher.shared.Constants

/**
 * Official system device app archiving patch for Smart Launcher 6.
 * Integrates Android 15+ / Samsung One UI 7 PackageInstaller native archiving runtime.
 */
@Suppress("unused")
val nativeArchivePatch = bytecodePatch(
    name = "Native app archiving",
    description = "Enables system PackageInstaller/LauncherApps native archiving runtime on Android 15+ / One UI 7.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // NativeArchiveHelper is bundled into the .mpp extension layer and available
        // to Smart Launcher components and action hooks at runtime.
    }
}
