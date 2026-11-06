package app.template.patches.shared.manifest

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.forEachManifestElement
import app.template.patches.shared.logUniversal

// Universal "Disable backup" patch: sets android:allowBackup="false" so the
// app's private data is excluded from ADB/cloud backups and device transfers.
// Default = false (users lose backup/restore). Single-pass DOM traversal.

@Suppress("unused")
val disableAllowBackupPatch = resourcePatch(
    name = "Disable app backup (allowBackup=false)",
    description = """
        Sets android:allowBackup="false" so the app's private data is excluded from
        ADB backups, cloud backups and device-to-device transfers.

        Applies to any app. You lose automatic backup/restore of this app's data.
    """.trimIndent(),
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            var patched = 0
            doc.forEachManifestElement("application") { application ->
                if (application.getAttribute("android:allowBackup") != "false") {
                    application.setAttribute("android:allowBackup", "false")
                    patched++
                }
            }
            if (patched > 0) {
                logUniversal("Disable backup: android:allowBackup set to false on $patched application(s).")
            }
        }
    }
}
