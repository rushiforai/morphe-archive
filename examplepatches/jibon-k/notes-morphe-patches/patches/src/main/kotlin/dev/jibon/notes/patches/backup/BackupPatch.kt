package dev.jibon.notes.patches.backup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jibon.notes.patches.compat.elements
import dev.jibon.notes.patches.compat.frameworkCompatPatch
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

/** onCreateView of a drawer: the inflated root view is in the register right after inflate(). */
private fun drawerFingerprint(definingClass: String) = Fingerprint(
    definingClass = definingClass,
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    filters = listOf(
        methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "inflate"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
)

private val phoneDrawerFingerprint =
    drawerFingerprint("Lcom/samsung/android/support/senl/nt/app/main/drawer/view/DrawerFragment;")
private val tabletDrawerFingerprint =
    drawerFingerprint("Lcom/samsung/android/support/senl/nt/app/main/tablet/TabletDrawerView;")

/** Declares the extension's folder-picker activity. */
private val folderPickerManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement.elements("application").first()
            val activity = document.createElement("activity").apply {
                setAttribute("android:name", "samsungcompat.FolderPickerActivity")
                setAttribute("android:exported", "false")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            }
            application.appendChild(activity)
        }
    }
}

@Suppress("unused")
val backupPatch = bytecodePatch(
    name = "Backup to folder",
    description = "Adds a Backup row to the bottom of the side menu: backs up changed notes as .sdocx files " +
        "to a folder you choose (any folder, including SD card or a synced folder).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(frameworkCompatPatch, folderPickerManifestPatch)

    execute {
        listOf(phoneDrawerFingerprint, tabletDrawerFingerprint).forEach { fingerprint ->
            val moveResult = fingerprint.instructionMatches.last()
            val viewRegister = moveResult.getInstruction<OneRegisterInstruction>().registerA
            fingerprint.method.addInstruction(
                moveResult.index + 1,
                "invoke-static {v$viewRegister}, Lsamsungcompat/NotesBackup;->onDrawerCreated(Landroid/view/View;)V",
            )
        }
    }
}
