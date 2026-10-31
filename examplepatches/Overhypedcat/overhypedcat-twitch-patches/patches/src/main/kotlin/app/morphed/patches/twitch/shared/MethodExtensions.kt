package app.morphed.patches.twitch.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode

/** Indices of every [opcode] instruction, last first so inserting code keeps them valid. */
internal fun MutableMethod.indicesOf(opcode: Opcode): List<Int> {
    val indices = implementation!!.instructions
        .withIndex()
        .filter { it.value.opcode == opcode }
        .map { it.index }
        .reversed()
    check(indices.isNotEmpty()) { "$name has no ${opcode.name}" }
    return indices
}
