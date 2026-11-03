package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.truecaller.shared.toStringFields
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hideImportantSendersPatch = bytecodePatch(
    name = "Hide important senders",
    description = "Hides the Important senders section in the Messages tab.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. The screen state's importantSenders field, mapped through its toString.
        val state = BusinessHomeScreenStateToStringFingerprint
        val importantSenders = toStringFields(state.method, state.classDef.type)
            .singleOrNull { it.first == "importantSenders" }?.second
            ?: throw PatchException("${state.classDef.type}.toString does not print importantSenders")

        // 2. The Messages tab's list builder adds the Important senders grid as the LazyColumn item
        // "important-senders-header" behind if-lt importantSenders.size(), 6. The builder now always
        // jumps past the item. The Categories row, the section titles and Recents are untouched.
        ImportantSendersListFingerprint.method.skipLazyListItem("important-senders-header") { instructions, guard ->
            val branch = instructions[guard]
            if (branch.opcode != Opcode.IF_LT) {
                throw PatchException("The important senders item is guarded by ${branch.opcode}, expected if-lt on the senders count")
            }
            val sizeResult = instructions.lastWriter(guard, (branch as TwoRegisterInstruction).registerA)
            val sizeCall = instructions.getOrNull(sizeResult - 1)
            val size = (sizeCall as? ReferenceInstruction)?.reference as? MethodReference
            if (instructions.getOrNull(sizeResult)?.opcode != Opcode.MOVE_RESULT || size?.definingClass != "Ljava/util/List;" || size.name != "size") {
                throw PatchException("The important senders guard does not compare a List.size() result")
            }
            val listRegister = (sizeCall as? FiveRegisterInstruction)?.registerC
                ?: throw PatchException("The important senders count is read by ${sizeCall?.opcode}, expected invoke-interface")
            val listRead = instructions.getOrNull(instructions.lastWriter(sizeResult - 1, listRegister))
            val field = (listRead as? ReferenceInstruction)?.reference as? FieldReference
            if (listRead?.opcode != Opcode.IGET_OBJECT || field != importantSenders ||
                (listRead as OneRegisterInstruction).registerA != listRegister
            ) {
                throw PatchException("The important senders guard counts $field, not $importantSenders")
            }
        }
    }
}
