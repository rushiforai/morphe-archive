package app.journal.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.journal.patches.shared.Constants.COMPATIBILITY_JOURNAL

// The Settings screen draws each section (Customization, Feedback, ...) with
// one call to a shared header+card helper, Lz60;->b(...), passing the
// section title and a pre-built composable lambda for its body. Both the
// "Customization" and "Feedback" section calls live in the same Settings
// composable, so anchor on both title strings to uniquely find it, then
// remove the single invoke-static that actually draws the Feedback section
// (header + the FAQ / "Question, bug report" / "Copy support info" rows) -
// everything before it just builds arguments that go unused once the call
// itself is gone.
internal object SettingsSectionsFingerprint : Fingerprint(
    strings = listOf("Customization", "Feedback"),
)

private fun Instruction.isSectionHeaderCall(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is MethodReference &&
        reference.definingClass == "Lz60;" &&
        reference.name == "b"
}

@Suppress("unused")
val hideFeedbackSectionPatch = bytecodePatch(
    name = "Hide feedback section",
    description = "Removes the \"Feedback\" section (FAQ, bug report, copy support info) from Settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JOURNAL)

    execute {
        val method = SettingsSectionsFingerprint.method
        val instructions = method.instructions

        val titleIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as ReferenceInstruction).reference as? StringReference)?.string == "Feedback"
        }
        if (titleIndex == -1) {
            throw PatchException("Could not find the \"Feedback\" section title")
        }

        val headerCallIndex = instructions
            .withIndex()
            .drop(titleIndex)
            .firstOrNull { (_, instruction) -> instruction.isSectionHeaderCall() }
            ?.index
            ?: throw PatchException("Could not find the Feedback section's header/card call")

        method.removeInstruction(headerCallIndex)
    }
}
