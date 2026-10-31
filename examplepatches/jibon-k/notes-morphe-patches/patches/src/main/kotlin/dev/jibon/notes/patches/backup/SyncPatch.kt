package dev.jibon.notes.patches.backup

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES
import dev.jibon.notes.patches.shared.MemoApplicationOnCreateFingerprint
import dev.jibon.notes.patches.shared.featureFingerprint

@Suppress("unused")
val syncPatch = bytecodePatch(
    name = "Folder sync",
    description = "Experimental. Syncs notes with other devices through a shared folder (for example one " +
        "kept in sync by Syncthing): \"Sync now\" in the Backup menu, and automatically each time the app opens.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(backupPatch)

    execute {
        featureFingerprint("syncEnabled").method.returnEarly(true)
        MemoApplicationOnCreateFingerprint.let {
            it.method.addInstruction(
                it.instructionMatches.first().index + 1,
                "invoke-static {p0}, Lsamsungcompat/NotesSync;->installAutoSync(Landroid/app/Application;)V",
            )
        }
    }
}
