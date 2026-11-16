package app.morphe.patches.all.shared

import com.android.tools.smali.dexlib2.Opcode

fun isControlFlow(op: Opcode): Boolean = op.name.startsWith("GOTO") ||
    op.name.startsWith("IF_") ||
    op.name.startsWith("RETURN") ||
    op == Opcode.PACKED_SWITCH ||
    op == Opcode.SPARSE_SWITCH ||
    op == Opcode.THROW ||
    op == Opcode.MOVE_EXCEPTION
