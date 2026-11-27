package app.tvpatches.patches.youtubetv.misc.boot

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml
import app.tvpatches.patches.youtubetv.shared.Constants.COMPATIBILITY_YOUTUBE_TV

/**
 * YouTube TV listens for BOOT_COMPLETED (home screen recommendations, WorkManager reschedule), so
 * every time the TV is switched on Android starts the app, and with it MicroG-RE, in the
 * background while the TV is still starting up. On TVs with 1 GB of RAM this slows the start and
 * the process is usually killed by the TV's memory manager a few seconds later anyway.
 * Removing the BOOT_COMPLETED filters keeps the app closed until the user opens it.
 */
@Suppress("unused")
val disableStartOnBootPatch = resourcePatch(
    name = "Disable start on boot",
    description = "Keeps the app (and MicroG-RE) from starting in the background when the TV is switched on.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val bootActions = setOf(
                "android.intent.action.BOOT_COMPLETED",
                "android.intent.action.LOCKED_BOOT_COMPLETED",
                "android.intent.action.QUICKBOOT_POWERON",
            )
            manifest.elements("action")
                .filter { it.attribute("android:name") in bootActions }
                .toList()
                .forEach { it.remove() }
            manifest.elements("uses-permission")
                .filter { it.attribute("android:name") == "android.permission.RECEIVE_BOOT_COMPLETED" }
                .toList()
                .forEach { it.remove() }
        }
    }
}
