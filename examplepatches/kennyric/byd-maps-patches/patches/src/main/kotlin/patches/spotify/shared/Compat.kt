package patches.spotify.shared

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The first register holding a parameter (`p0`), including `this` for an instance method. */
internal val Method.p0Register: Int
    get() {
        var words = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
        parameterTypes.forEach { type ->
            words += if (type.toString() == "J" || type.toString() == "D") 2 else 1
        }
        return implementation!!.registerCount - words
    }

internal fun Method.indexOfFirstInstruction(predicate: Instruction.() -> Boolean): Int {
    implementation?.instructions?.forEachIndexed { index, instruction ->
        if (instruction.predicate()) return index
    }
    return -1
}

internal fun Method.indexOfFirstInstructionOrThrow(predicate: Instruction.() -> Boolean): Int =
    indexOfFirstInstruction(predicate).also {
        check(it >= 0) { "Instruction not found in ${definingClass}->$name" }
    }

internal fun Method.indexOfFirstStringInstruction(value: String): Int = indexOfFirstInstruction {
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string == value
}
