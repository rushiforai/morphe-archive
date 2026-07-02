/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/microsoft/officelens/misc/onedrive/HideOneDriveMigrationPatch.kt
 */
package app.morphe.patches.microsoft.officelens.misc.onedrive

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideOneDriveMigrationPatch = bytecodePatch(
    name = "Hide OneDrive migration",
    description = "Hides the OneDrive migration prompt when opening Microsoft Office Lens.",
) {
    compatibleWith(AppCompatibilities.MICROSOFT_LENS)

    execute {
        HasMigratedToOneDriveFingerprint.method.replaceInstructions(
            0,
            """
                sget-object v0, Lcom/microsoft/office/officelens/scansMigration/LensMigrationStage;->PreMigration:Lcom/microsoft/office/officelens/scansMigration/LensMigrationStage;
                return-object v0
            """.trimIndent(),
        )
    }
}

