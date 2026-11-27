package dev.brave.patches.perf

import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

@Suppress("unused")
val removeUnusedArXrPatch = patch(
    name = "Remove Unused AR & XR",
    description = "Deletes unused ARCore native libraries from the APK to reduce install size."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        listApkEntries("lib/").forEach { entry ->
            if (entry.contains("libarcore_sdk_", ignoreCase = true)) {
                deleteResource(entry)
            }
        }
    }
}
