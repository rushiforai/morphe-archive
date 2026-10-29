package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val SETTINGS = "Lapp/mightymorphing/extension/joey/MorpheSettings;"
private const val BACKUP = "Lapp/mightymorphing/extension/joey/MorpheBackup;"

@Suppress("unused")
val backupRestorePatch = bytecodePatch(
    name = "Backup and restore",
    description = "Save various Joey settings to a file and restore them later. Encouraged to login to reddit account and then restore. Access via Joey - Settings - Morphe Settings.",
) {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        SettingsHookFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $SETTINGS->enableBackup()V
            invoke-static {p0}, $SETTINGS->attach(Landroid/app/Activity;)V
            """,
        )

        val result = ActivityResultFingerprint.method
        result.insertAt(
            0,
            """
            invoke-static {p1, p2, p3}, $BACKUP->onActivityResult(IILandroid/content/Intent;)Z
            move-result v0
            if-eqz v0, :morphe_result_skip
            return-void
            """,
            ExternalLabel("morphe_result_skip", result.instructions[0]),
        )
    }
}
