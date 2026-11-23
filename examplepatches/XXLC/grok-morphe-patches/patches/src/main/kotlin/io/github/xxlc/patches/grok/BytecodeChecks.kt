package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

// Structural checks before using registers verified against original smali.
internal fun MutableMethod.requireRegisterCount(expected: Int) {
    if (implementation?.registerCount != expected) {
        throw PatchException("Register count does not match supported Grok version: $this")
    }
}

internal fun MutableMethod.requireRegisters(index: Int, vararg expected: Int) {
    if (implementation!!.instructions[index].registersUsed != expected.toList()) {
        throw PatchException("Registers at index $index do not match original smali: $this")
    }
}

internal fun MutableMethod.indexOfReference(opcode: Opcode, reference: String): Int {
    val matches = implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == opcode &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == reference
    }
    if (matches.size != 1) {
        throw PatchException("Expected exactly one insertion point for $reference, found ${matches.size}: $this")
    }
    return matches.single().index
}
