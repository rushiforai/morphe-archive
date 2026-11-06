package app.swiftbackup.patches.blacklist

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.swiftbackup.patches.shared.Constants.COMPATIBILITY_SWIFTBACKUP
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Keep the storage limit and UI guard aligned; removing only the guard would silently discard entries. */
@Suppress("unused")
val swiftBackupBlacklistLimitPatch = bytecodePatch(
    name = "Swift Backup Blacklist Limit",
    description = "Raises the shared blacklist limit from 100 to 1,000 apps.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SWIFTBACKUP)

    execute {
        // Resolve every entry point before modifying any, and reject an ambiguous APK layout.
        val storage = BlacklistStorageLimitFingerprint.method
        val add = BlacklistAddLimitFingerprint.method
        val appMenu = BlacklistAppMenuLimitFingerprint.method
        val selection = BlacklistSelectionLimitFingerprint.method
        val toolbar = BlacklistToolbarCountFingerprint.method
        val dialog = BlacklistDialogCountFingerprint.method

        fun MutableMethod.limitIndex(): Int {
            val matches = implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.CONST_16 &&
                    (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 100
            }
            if (matches.size != 1) throw PatchException("Blacklist: expected one 100-app limit in $definingClass->$name")
            return matches.single().index
        }

        val storageIndex = storage.limitIndex()
        val addIndex = add.limitIndex()
        val appMenuIndex = appMenu.limitIndex()
        val selectionIndex = selection.limitIndex()

        // Shared lambda methods contain unrelated percentage arithmetic; edit only the maximum passed to Const.p.
        fun MutableMethod.counterIndex(): Int {
            val instructions = implementation!!.instructions
            val calls = instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Lorg/swiftapps/swiftbackup/common/Const;" && reference.name == "p"
            }
            if (calls.size != 1) throw PatchException("Blacklist counter: expected one Const.p call in $definingClass->$name")
            val call = calls.single()
            val register = (call.value as FiveRegisterInstruction).registerE
            val source = (call.index - 1 downTo 0).firstOrNull {
                (instructions[it] as? OneRegisterInstruction)?.registerA == register
            } ?: throw PatchException("Blacklist counter: maximum register has no local assignment")
            if (instructions[source].opcode != Opcode.CONST_16 ||
                (instructions[source] as? NarrowLiteralInstruction)?.narrowLiteral != 100) {
                throw PatchException("Blacklist counter: expected a 100-app maximum")
            }
            return source
        }

        val toolbarIndex = toolbar.counterIndex()
        val dialogIndex = dialog.counterIndex()
        val message = add.implementation!!.instructions.withIndex().single { (_, instruction) ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == " (100/100)"
        }

        // Replace constants in place using the original registers so branch targets and register allocation stay valid.
        for ((method, index) in listOf(storage to storageIndex, add to addIndex, appMenu to appMenuIndex,
            selection to selectionIndex, toolbar to toolbarIndex, dialog to dialogIndex)) {
            val register = (method.implementation!!.instructions[index] as OneRegisterInstruction).registerA
            method.replaceInstruction(index, "const/16 v$register, 0x3e8")
        }
        val register = (message.value as OneRegisterInstruction).registerA
        add.replaceInstruction(message.index, "const-string v$register, \" (1000/1000)\"")
    }
}
