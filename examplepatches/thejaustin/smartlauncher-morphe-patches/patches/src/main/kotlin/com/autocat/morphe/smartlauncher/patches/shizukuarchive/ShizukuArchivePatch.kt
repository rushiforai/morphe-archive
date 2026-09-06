package com.autocat.morphe.smartlauncher.patches.shizukuarchive

import app.morphe.patcher.patch.bytecodePatch
import com.autocat.morphe.smartlauncher.shared.Constants

/**
 * Shizuku-based privileged app archiving patch for Smart Launcher 6.
 * Bundles Shizuku binder-level privileged execution for app archiving.
 */
@Suppress("unused")
val shizukuArchivePatch = bytecodePatch(
    name = "Shizuku app archiving",
    description = "Enables Shizuku binder-level privileged app archiving execution in Smart Launcher 6.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // ShizukuArchiveHelper is bundled into the .mpp extension layer and available
        // to Smart Launcher components and action hooks at runtime.
    }
}
