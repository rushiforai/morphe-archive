package patches.west

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal data class OwnedEdit(
    val index: Int,
    val opcodes: List<Opcode>,
    val references: List<String?>,
    val replacement: List<String>,
    val target: Int? = null,
    val branch: Int? = null,
)

internal data class OwnedMethod(
    val owner: String,
    val signature: String,
    val flags: Int,
    val registers: Int,
    val count: Int,
    val edits: List<OwnedEdit>,
)

// Inspect every original anchor before dependencies can edit a shared method.
// No static mutable state survives between patcher contexts or selections.
internal val originalCode = bytecodePatch {
    dependsOn(originalInput)
    execute {
        for (target in adsTargets + trackingTargets + consentTargets) {
            val method = exact(target.owner, target.signature).method
            val original = method.instructions.toList()
            check(method.accessFlags == target.flags &&
                method.implementation!!.registerCount == target.registers &&
                original.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD,
                    Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } == target.count) {
                "Omroep West original method changed: ${target.owner}->${target.signature}"
            }
            for (edit in target.edits) {
                check(edit.opcodes.size == edit.references.size && edit.index in 0..original.size)
                for (offset in edit.opcodes.indices) {
                    val instruction = original[edit.index + offset]
                    check(instruction.opcode == edit.opcodes[offset]) {
                        "Omroep West original opcode changed: ${target.owner}->${target.signature}@${edit.index + offset}"
                    }
                    edit.references[offset]?.let { reference ->
                        check((instruction as? ReferenceInstruction)?.reference?.toString() == reference) {
                            "Omroep West original reference changed: ${target.owner}->${target.signature}@${edit.index + offset}"
                        }
                    }
                }
            }
        }
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun applyOwnedEdits(targets: List<OwnedMethod>) {
    for (target in targets) {
        val method = exact(target.owner, target.signature).method
        val labels = target.edits.associateWith { edit ->
            edit.target?.let { method.implementation!!.newLabelForIndex(it) }
        }
        for (edit in target.edits.sortedByDescending { it.index }) {
            when {
                edit.opcodes.isEmpty() -> method.addInstructions(edit.index, edit.replacement.joinToString("\n"))
                edit.opcodes.size == edit.replacement.size -> edit.replacement.forEachIndexed { offset, instruction ->
                    method.replaceInstruction(edit.index + offset, instruction)
                }
                else -> {
                    check(edit.opcodes.size == 1 && edit.replacement.size > 1)
                    method.replaceInstruction(edit.index, edit.replacement.first())
                    method.addInstructions(edit.index + 1, edit.replacement.drop(1).joinToString("\n"))
                }
            }
            labels[edit]?.let { label ->
                method.replaceInstruction(edit.index + checkNotNull(edit.branch), BuilderInstruction30t(Opcode.GOTO_32, label))
            }
        }
    }
}
