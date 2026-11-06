package app.swiftbackup.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.swiftbackup.patches.shared.Constants.COMPATIBILITY_SWIFTBACKUP
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Expose the native settings-transfer flow without changing authentication or other account-sensitive features. */
@Suppress("unused")
val swiftBackupSettingsTransferPatch = bytecodePatch(
    name = "Swift Backup Settings Export and Import",
    description = "Shows Export settings and Import settings for signed-in users, including blacklist transfer.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SWIFTBACKUP)

    execute {
        val visibility = SettingsTransferVisibilityFingerprint.method
        val click = SettingsTransferClickFingerprint.method
        val instructions = click.implementation!!.instructions
        val gates = instructions.withIndex().filter { (_, instruction) ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Lorg/swiftapps/swiftbackup/anonymous/MFirebaseUser;" && call.name == "isAnonymous"
        }
        if (gates.size != 4 || gates.any { instructions[it.index + 1].opcode != Opcode.MOVE_RESULT }) {
            throw PatchException("Settings transfer: expected four anonymous checks followed by move-result")
        }
        val visibilityInstructions = visibility.implementation!!.instructions
        val visibilityGates = visibilityInstructions.withIndex().filter { (_, instruction) ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Lorg/swiftapps/swiftbackup/anonymous/MFirebaseUser;" && call.name == "isAnonymous"
        }
        if (visibilityGates.size != 2 || visibilityInstructions[visibilityGates.last().index + 1].opcode != Opcode.MOVE_RESULT) {
            throw PatchException("Settings transfer: expected two visibility checks; only the last controls export/import")
        }

        // All four checks in this handler belong to export/import; preserve null-user and file-picker behavior.
        for ((index) in gates) {
            val register = (instructions[index + 1] as OneRegisterInstruction).registerA
            click.replaceInstruction(index, "nop")
            click.replaceInstruction(index + 1, "const/4 v$register, 0x1")
        }

        // Keep the original control flow and registers: R8 reuses the receiver register near method exit.
        // Only the final anonymous test controls these rows; the earlier test belongs to another preference.
        val visibilityIndex = visibilityGates.last().index
        val visibilityRegister = (visibilityInstructions[visibilityIndex + 1] as OneRegisterInstruction).registerA
        visibility.replaceInstruction(visibilityIndex, "nop")
        visibility.replaceInstruction(visibilityIndex + 1, "const/4 v$visibilityRegister, 0x1")
    }
}
