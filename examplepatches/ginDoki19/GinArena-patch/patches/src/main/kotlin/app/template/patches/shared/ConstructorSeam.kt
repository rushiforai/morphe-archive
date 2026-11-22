package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Insert [code] into a constructor *after* the constructor has initialised `this`.
 *
 * Why this exists — issue #52. The pin patch registers the category adapter by injecting
 *
 *     invoke-static {p0}, LPins;->seeAdapter(Ljava/lang/Object;)V
 *
 * at instruction 0 of the category adapter's constructor. Instruction 0 is *before*
 * `invoke-direct {p0}, LSuper;-><init>()V`, so at that point `this` still has the verifier type
 * **Uninitialized This**. ART rejects passing it where an ordinary `java.lang.Object` is expected,
 * and it does so at class load — the app dies before any of our code runs.
 *
 * Both broken ports failed exactly that way, quoted from the device logs:
 *
 *   CricZ  [0x0] register v1 has type Uninitialized This Reference: g4.m
 *   PlayZ  [0x0] register v7 has type Uninitialized This Reference: ic.b
 *
 * Injecting after the superclass call hands the seam an initialised `this`, which verifies
 * cleanly. Routing every port through this helper means the mistake cannot come back in the next
 * one.
 */
internal fun MutableMethod.addInstructionsAfterSuperInit(code: String) {
    addInstructionsAtSuperInitEnd(code)
}

private fun MutableMethod.addInstructionsAtSuperInitEnd(code: String) {
    addInstructions(superInitEndIndex(), code)
}

/**
 * Index of the first instruction *after* `invoke-direct {this}, LSomeSuper;-><init>(...)V`.
 *
 * Throws instead of falling back to index 0 when the call cannot be located — an unresolvable
 * superclass call is a fingerprint problem and must be loud, not silently unsafe.
 */
internal fun MutableMethod.superInitEndIndex(): Int {
    val thisRegister = thisRegister()
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_DIRECT) return@forEachIndexed
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@forEachIndexed
        if (reference.name != "<init>") return@forEachIndexed
        val receiver = (instruction as? FiveRegisterInstruction)?.registerC
            ?: return@forEachIndexed
        if (receiver != thisRegister) return@forEachIndexed
        return index + 1
    }
    throw IllegalStateException(
        "No superclass <init> call found in $definingClass->$name; cannot place the injection " +
            "after `this` is initialised.",
    )
}

/**
 * The register that holds `this`.
 *
 * dexlib2 numbers registers v0..vN with parameters at the top, so `this` is
 * `registerCount - (1 + parameter words)`.
 */
private fun MutableMethod.thisRegister(): Int {
    val impl = implementation
        ?: throw IllegalStateException("$definingClass->$name has no code")
    val parameterWords = 1 + parameterTypes.sumOf { type ->
        val descriptor = type.toString()
        if (descriptor.startsWith("J") || descriptor.startsWith("D")) 2 else 1
    }
    return impl.registerCount - parameterWords
}
