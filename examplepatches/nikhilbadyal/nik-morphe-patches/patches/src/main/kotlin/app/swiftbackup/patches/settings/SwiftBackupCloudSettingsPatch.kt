package app.swiftbackup.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.swiftbackup.patches.cloud.swiftBackupLocalCloudMetadataPatch
import app.swiftbackup.patches.shared.Constants.COMPATIBILITY_SWIFTBACKUP

/** Reuse the existing durable cloud transport and native settings exporter/importer; automatic backup is opt-in. */
@Suppress("unused")
val swiftBackupCloudSettingsPatch = bytecodePatch(
    name = "Swift Backup Cloud Settings Backup",
    description = "Adds opt-in automatic cloud backup and explicit restore for settings, favorites, and the blacklist.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SWIFTBACKUP)
    dependsOn(swiftBackupLocalCloudMetadataPatch, swiftBackupSettingsTransferPatch)

    execute {
        // p0 is still the original fragment at entry; attach posts UI work until native initialization completes.
        SettingsTransferVisibilityFingerprint.method.addInstructions(0, """
            invoke-static {p0}, Lapp/morphe/extension/swiftbackup/SettingsBackup;->attach(Ljava/lang/Object;)V
        """.trimIndent())
    }
}
