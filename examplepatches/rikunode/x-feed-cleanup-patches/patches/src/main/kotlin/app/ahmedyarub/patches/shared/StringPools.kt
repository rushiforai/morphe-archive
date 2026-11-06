package app.ahmedyarub.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlin.properties.Delegates

/*
 * Strings R8 moved out of the methods that use them.
 *
 * From Instagram 449, many string constants live in pool methods: a static String A00(int)
 * that switches on its argument and returns one const-string per case. A method then loads a
 * key with
 *
 *     const/16 v0, 1353
 *     invoke-static {v0}, LX/0000;->A00(I)Ljava/lang/String;
 *     move-result-object v0
 *
 * so the key is not a string in that method, and a fingerprint or patch looking for it finds
 * nothing. stringPoolsPatch reads every pool once, so the string a register holds is known
 * whichever way it was loaded.
 */

/** The strings of each pool method, by the index that returns them. Keyed by class and name. */
private var pools: Map<String, Map<Int, String>> by Delegates.notNull()

/**
 * Reads the app's string pools. Every patch and fingerprint that uses [loadedStrings] or
 * [indicesOfString] must depend on it; before it runs they throw.
 */
val stringPoolsPatch = bytecodePatch(
    description = "Reads the strings R8 pooled into lookup methods.",
) {
    execute {
        val found = mutableMapOf<String, Map<Int, String>>()

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "Ljava/lang/String;" &&
                    method.parameterTypes.singleOrNull()?.toString() == "I"
                ) {
                    method.poolStrings()?.let { found[method.id] = it }
                }
            }
        }

        pools = found
    }
}

/** Every string this method loads, whether from a const-string or from a pool. */
internal val Method.loadedStrings: Set<String>
    get() {
        val instructions = implementation?.instructions?.toList() ?: return emptySet()

        return instructions.indices.mapNotNullTo(mutableSetOf()) { instructions.stringAt(it) }
    }

/**
 * The indices of the instructions after which a register holds [string]: its const-string, or
 * the move-result-object of a pool call returning it.
 */
internal fun Method.indicesOfString(string: String): List<Int> {
    val instructions = implementation?.instructions?.toList() ?: return emptyList()

    return instructions.indices.filter { instructions.stringAt(it) == string }
}

/**
 * Makes every place this method loads [key] load "BOGUS" instead. A JSON parser patched this
 * way never recognises the field, so whatever it would have built from it is left out.
 */
internal fun MutableMethod.replaceKeyWithBogus(key: String) {
    val indices = indicesOfString(key).ifEmpty { throw PatchException("$name does not load $key") }

    // Last first, so the indices still to be patched do not move.
    indices.sortedDescending().forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA

        addInstruction(index + 1, "const-string v$register, \"BOGUS\"")
    }
}

/** The string in a register after the instruction at [index], if it is a known string. */
private fun List<Instruction>.stringAt(index: Int): String? {
    val instruction = this[index]

    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.let { return it.string }

    if (instruction.opcode != Opcode.MOVE_RESULT_OBJECT || index < 2) return null

    val call = this[index - 1] as? FiveRegisterInstruction ?: return null
    if (call.opcode != Opcode.INVOKE_STATIC || call.registerCount != 1) return null
    val method = (call as ReferenceInstruction).reference as MethodReference
    if (method.returnType != "Ljava/lang/String;" || method.parameterTypes.singleOrNull()?.toString() != "I") return null
    val pool = pools[method.id] ?: return null

    // The index must be a constant loaded into the argument right before the call; anything
    // computed is not known until the app runs.
    val literal = this[index - 2]
    if (literal !is NarrowLiteralInstruction || (literal as OneRegisterInstruction).registerA != call.registerC) return null

    return pool[literal.narrowLiteral]
}

/**
 * The strings a pool method returns, by index, or null if it is not a pool: its packed switch
 * must lead each case straight to a const-string.
 */
private fun Method.poolStrings(): Map<Int, String>? {
    val instructions = implementation?.instructions?.toList() ?: return null

    val addresses = mutableMapOf<Int, Instruction>()
    var address = 0
    var switchAddress = -1
    instructions.forEach { instruction ->
        addresses[address] = instruction
        if (instruction.opcode == Opcode.PACKED_SWITCH && switchAddress < 0) switchAddress = address
        address += instruction.codeUnits
    }
    if (switchAddress < 0) return null

    val switch = addresses.getValue(switchAddress) as OffsetInstruction
    val payload = addresses[switchAddress + switch.codeOffset] as? SwitchPayload ?: return null

    return payload.switchElements.associate { element ->
        val target = addresses[switchAddress + element.offset] as? ReferenceInstruction
        val string = target?.reference as? StringReference ?: return null

        element.key to string.string
    }
}

private val MethodReference.id get() = "$definingClass->$name"
