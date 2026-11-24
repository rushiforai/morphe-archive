package app.ckzorigins.patches.mono

import app.ckzorigins.patches.compat.GluBackupManifest
import app.ckzorigins.patches.compat.bundleObbPatch
import app.ckzorigins.patches.shared.Constants.ORIGINAL_APK
import app.adebisi.patches.shared.requireGluMobileSigner
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly

/**
 * Drops Glu's backup agent so `adb backup` uses the system full backup. Unnamed, so it is
 * not a toggle: every visible Origins patch depends on it, and [bundleObbPatch] rides with it.
 */
internal val gluBackupPatch = patch {
    dependsOn(bundleObbPatch)

    execute {
        requireGluMobileSigner(ORIGINAL_APK)
        AjtBackupDataChangedFingerprint.method.returnEarly()
        AjtBackupRequestRestoreFingerprint.method.returnEarly()
        GluBackupAgentOnCreateFingerprint.method.returnEarly()
        GluBackupAgentOnBackupFingerprint.method.returnEarly()
        GluBackupAgentOnRestoreFingerprint.method.returnEarly()
        document("AndroidManifest.xml").use { GluBackupManifest.strip(it) }
    }
}
