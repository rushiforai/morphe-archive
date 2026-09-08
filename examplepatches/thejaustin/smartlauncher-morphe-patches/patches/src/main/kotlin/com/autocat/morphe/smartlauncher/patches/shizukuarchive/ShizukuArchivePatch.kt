package com.autocat.morphe.smartlauncher.patches.shizukuarchive

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.autocat.morphe.smartlauncher.shared.Constants

/**
 * Shizuku permission declaration patch for Smart Launcher 6.
 * Injects moe.shizuku.manager.permission.API_V23 and af.shizuku.plus.permission.API_V23
 * directly into AndroidManifest.xml so Smart Launcher is recognized in Android Settings
 * and authorized directly by Shizuku / ShizukuPlus.
 */
@Suppress("unused")
val shizukuPermissionPatch = resourcePatch(
    name = "Shizuku permission declaration",
    description = "Declares moe.shizuku.manager.permission.API_V23 and af.shizuku.plus.permission.API_V23 in AndroidManifest.xml so Smart Launcher is recognized in Android Settings and Shizuku Manager.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement

            val p1 = doc.createElement("uses-permission")
            p1.setAttribute("android:name", "moe.shizuku.manager.permission.API_V23")
            manifest.appendChild(p1)

            val p2 = doc.createElement("uses-permission")
            p2.setAttribute("android:name", "af.shizuku.plus.permission.API_V23")
            manifest.appendChild(p2)
        }
    }
}

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
