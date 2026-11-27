package app.template.patches.redditsync.removeultracloudbackup

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.removeultracloudbackup.fingerprints.preferencesBackupFragmentFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Confirmed by hand via apktool: PreferencesBackupFragment's setup method
 * (Lpa/q;->C3) wires up "ultra_backup_all"/"ultra_backup_restore"/"ultra_backup_delete"
 * by key with no null checks, then gates the whole "ultra_backup" category's visibility
 * (also looked up by key), as the very last thing the method does before its final
 * return-void. With those rows deleted from cat_backup.xml by
 * removeUltraCloudBackupResourcesPatch, this crashes the Backup settings screen on
 * open the same way past preference removals have.
 *
 * This patch removes that entire block — anchored on the unique "ultra_backup_all"
 * string constant, removed through to (but not including) the method's final
 * return-void, the same safe pattern already used for the "mod" credits block in
 * rebrandAboutSetupPatch.kt. Because this block is the last thing the method does,
 * there's no code after it that could depend on any register it sets (unlike the
 * Developer-options removal, which needed care for exactly that reason).
 *
 * This patch used to ALSO fix a second crash: PreferencesUltraFragment's setup method
 * (Lpa/l1;->s4) looking up "ultra_cloud" ("Settings cloud backup") by key to wire its
 * click listener. Dropped once removeSyncUltraResourcesPatch started removing the Sync
 * Ultra screen's entry point outright — PreferencesUltraFragment is unreachable dead code
 * once nothing can navigate to it, so a crash inside it can never actually happen. See
 * removeUltraCloudBackupResourcesPatch.kt for the corresponding resource-side change.
 *
 * Depends on removeUltraCloudBackupResourcesPatch (the XML deletion) so selecting
 * either one in Morphe Manager applies both together.
 */
val removeUltraCloudBackupSetupPatch = bytecodePatch(
    name = "Remove Ultra cloud backup",
    description = "Removes the redundant, Firebase-backend-dependent \"Cloud backup and " +
        "restore\" section from Sync for Reddit's Backup settings screen. This is the " +
        "bytecode fix \"Remove Ultra cloud backup (resources)\" needs to avoid a crash — " +
        "select that patch too (or select this one, which pulls it in automatically).",
    default = true,
) {
    dependsOn(removeUltraCloudBackupResourcesPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val method = preferencesBackupFragmentFingerprint.method
        val implementation = method.implementation!!

        val blockStart = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "ultra_backup_all"
        }

        if (blockStart == -1) {
            error(
                "Could not find the Ultra cloud backup setup code in " +
                    "PreferencesBackupFragment. This build's method structure may " +
                    "differ from what was inspected — re-check with apktool.",
            )
        }

        val blockCount = implementation.instructions.size - 1 - blockStart
        repeat(blockCount) { implementation.removeInstruction(blockStart) }
    }
}
