package app.ckzorigins.patches.compat

import app.adebisi.patches.shared.removeUnusedNamedEntries
import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Glu ships `GluBackupAgent` plus `android.permission.BACKUP`. The permission is
 * signature|privileged, so a user build never holds it. The agent is what
 * `adb backup` actually hits: key-value helpers
 * from encrypted properties, not a full file dump. The hand APK papered over that
 * with `fullBackupOnly`. Drop the agent instead, and the system uses default full backup.
 */
internal object GluBackupManifest {
    const val BACKUP_PERMISSION = "android.permission.BACKUP"
    const val BACKUP_AGENT = "com.glu.plugins.GluBackupAgent"
    const val BACKUP_API_KEY = "com.google.android.backup.api_key"

    fun strip(document: Document) {
        val app = document.getElementsByTagName("application").item(0) as Element?
            ?: throw PatchException("AndroidManifest.xml has no <application>")
        val agent = app.getAttribute("android:backupAgent")
        if (agent != BACKUP_AGENT) {
            throw PatchException(
                "AndroidManifest.xml backupAgent is '$agent', expected $BACKUP_AGENT",
            )
        }
        if (!app.hasAttribute("android:restoreAnyVersion")) {
            throw PatchException("AndroidManifest.xml has no android:restoreAnyVersion")
        }
        app.removeAttribute("android:backupAgent")
        app.removeAttribute("android:restoreAnyVersion")
        removeUnusedNamedEntries(
            document,
            listOf(
                "uses-permission" to BACKUP_PERMISSION,
                "meta-data" to BACKUP_API_KEY,
            ),
        )
    }
}
