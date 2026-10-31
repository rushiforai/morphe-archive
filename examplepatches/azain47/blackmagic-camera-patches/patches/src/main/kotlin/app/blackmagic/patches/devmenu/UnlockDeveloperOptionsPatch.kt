package app.blackmagic.patches.devmenu

import app.blackmagic.patches.shared.Constants.COMPATIBILITY_BLACKMAGIC_CAM
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private fun FieldReference.smali() = "$definingClass->$name:$type"

@Suppress("unused")
val unlockDeveloperOptionsPatch = bytecodePatch(
    name = "Unlock developer options",
    description = "Reveals the hidden internal \"Development\" settings category (debug UI overlay, " +
        "software-encoder selection, custom bitrate field, camera-DB reload, etc.), which the stock " +
        "release build gates behind an \"internal builds only\" check. Off by default: these are " +
        "debug toggles, and some do nothing useful on a retail device.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLACKMAGIC_CAM)

    execute {
        // The Availability field read from the category parameter (BaseSettingsCategory.availability).
        val availabilityField = CategoryAvailabilityGateFingerprint.instructionMatches[0]
            .getInstruction<ReferenceInstruction>().reference as FieldReference

        // Find the InternalBuilds enum constant: the sput-object storing it, right after the
        // "InternalBuilds" string in the Availability static initializer.
        val clinit = AvailabilityClinitFingerprint
        val stringIndex = clinit.instructionMatches[0].index
        val clinitInstructions = clinit.method.implementation!!.instructions.toList()
        val internalConst = clinitInstructions.drop(stringIndex + 1)
            .firstNotNullOfOrNull { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference
                if (insn.opcode == Opcode.SPUT_OBJECT && ref is FieldReference && ref.type == AVAILABILITY_CLASS) {
                    ref
                } else {
                    null
                }
            }
            ?: throw PatchException("Could not locate the InternalBuilds enum constant.")

        // Prepend: if the category's availability is InternalBuilds, show it (return true);
        // otherwise fall through to the original gate (which still handles AllBuilds, etc.).
        // Uses v0 and p0 only (method has 1 local); the original rewrites p0 before reading it,
        // so clobbering it here is safe.
        val gate = CategoryAvailabilityGateFingerprint.method
        gate.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p1, ${availabilityField.smali()}
                sget-object p0, ${internalConst.smali()}
                if-ne v0, p0, :original
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
            ExternalLabel("original", gate.getInstruction(0)),
        )
    }
}
