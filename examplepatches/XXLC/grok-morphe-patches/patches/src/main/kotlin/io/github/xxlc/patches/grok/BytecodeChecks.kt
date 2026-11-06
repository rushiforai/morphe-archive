package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

// Kiểm tra cấu trúc trước khi dùng các thanh ghi đã xác nhận từ smali gốc.
internal fun MutableMethod.requireRegisterCount(expected: Int) {
    if (implementation?.registerCount != expected) {
        throw PatchException("Số thanh ghi không khớp bản Grok hỗ trợ: $this")
    }
}

internal fun MutableMethod.requireRegisters(index: Int, vararg expected: Int) {
    if (implementation!!.instructions[index].registersUsed != expected.toList()) {
        throw PatchException("Thanh ghi tại vị trí $index không khớp smali gốc: $this")
    }
}

internal fun MutableMethod.indexOfReference(opcode: Opcode, reference: String): Int {
    val matches = implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == opcode &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == reference
    }
    if (matches.size != 1) {
        throw PatchException("Cần đúng một điểm chèn cho $reference, tìm thấy ${matches.size}: $this")
    }
    return matches.single().index
}
