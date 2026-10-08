/*
 * Bytecode behavior adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.tiktok.misc.optimizer

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val reviewedSplashGateInstructionCounts = setOf(
    listOf(4, 4, 30),
    listOf(4, 4),
)

internal fun isReviewedSplashGateShape(instructionCounts: List<Int>): Boolean =
    instructionCounts.sorted() in reviewedSplashGateInstructionCounts

internal const val ANIMATED_DRAWABLE_DESCRIPTOR = "Lcom/facebook/fresco/animation/drawable/AnimatedDrawable2;"

/** Fresco's caching strategy for its keep-last-frame cache (CACHING_STRATEGY_KEEP_LAST_CACHE). */
internal const val KEEP_LAST_FRAME_STRATEGY = 3

/**
 * Fresco's animated drawable factory: it reads the caching strategy from a supplier, compares it
 * with 1, 2 and 3, and builds a FrescoFrameCache for the first two. R8 renames the class and the
 * method; the drawable it returns and the cache it builds keep their names.
 */
internal fun Method.isAnimatedDrawableFactory(): Boolean =
    returnType == ANIMATED_DRAWABLE_DESCRIPTOR && parameterTypes.size == 1 &&
        implementation?.instructions?.any { it.methodReference()?.let { ref ->
            ref.definingClass == FRESCO_FRAME_CACHE_DESCRIPTOR && ref.name == "<init>"
        } == true } == true

/**
 * The caching strategy as the factory reads it: the move-result after the first
 * Integer.intValue(), and the class it builds when that value is [KEEP_LAST_FRAME_STRATEGY].
 */
internal class CachingStrategyRead(val resultIndex: Int, val register: Int, val keepLastClass: String)

internal fun Method.cachingStrategyRead(): CachingStrategyRead? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val read = instructions.indexOfFirst { it.isIntegerIntValue() }
    val result = instructions.getOrNull(read + 1)
    if (read < 0 || result?.opcode != Opcode.MOVE_RESULT) return null
    val register = (result as OneRegisterInstruction).registerA
    // const vX, 3 then if-eq strategy, vX -> the keep-last branch, whose first instruction
    // builds the cache.
    val addresses = instructions.runningFold(0) { at, instruction -> at + instruction.codeUnits }
    for (i in read + 2 until instructions.size - 1) {
        val constant = instructions[i]
        val compare = instructions[i + 1]
        if (constant !is NarrowLiteralInstruction || constant.narrowLiteral != KEEP_LAST_FRAME_STRATEGY) continue
        if (compare.opcode != Opcode.IF_EQ || compare !is TwoRegisterInstruction) continue
        val registers = setOf(compare.registerA, compare.registerB)
        if (registers != setOf(register, (constant as OneRegisterInstruction).registerA)) continue
        val target = addresses[i + 1] + (compare as OffsetInstruction).codeOffset
        val branch = addresses.indexOf(target)
        val built = instructions.getOrNull(branch)
        if (built?.opcode != Opcode.NEW_INSTANCE) return null
        return CachingStrategyRead(read + 1, register, (built as ReferenceInstruction).reference.toString())
    }
    return null
}

/**
 * The animation backend builder the factory calls just before it constructs the drawable. It
 * reads how many frames to decode ahead (the request's own count, else a supplier's) into one
 * register and skips the frame preparer on if-lez. Returns the if-lez index, or null.
 */
internal fun Method.framePreparerGateIndex(): Int? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val read = instructions.indexOfFirst { it.isIntegerIntValue() }
    val result = instructions.getOrNull(read + 1)
    if (read < 0 || result?.opcode != Opcode.MOVE_RESULT) return null
    val register = (result as OneRegisterInstruction).registerA
    val gate = (read + 2 until instructions.size).firstOrNull {
        instructions[it].opcode == Opcode.IF_LEZ && (instructions[it] as OneRegisterInstruction).registerA == register
    } ?: return null
    // Nothing may jump straight to the gate, or a const put in front of it would be skipped.
    val addresses = instructions.runningFold(0) { at, instruction -> at + instruction.codeUnits }
    val gateAddress = addresses[gate]
    val targeted = instructions.indices.any { i ->
        val branch = instructions[i] as? OffsetInstruction
        branch != null && addresses[i] + branch.codeOffset == gateAddress
    }
    return if (targeted) null else gate
}

/** The backend builder call in the factory: the last call on its own class before the drawable is made. */
internal fun Method.backendBuilderCall(): MethodReference? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val drawable = instructions.indexOfLast {
        it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == ANIMATED_DRAWABLE_DESCRIPTOR
    }
    if (drawable < 0) return null
    return instructions.subList(0, drawable).asReversed().firstNotNullOfOrNull { instruction ->
        instruction.methodReference()?.takeIf { it.definingClass == definingClass && instruction.opcode == Opcode.INVOKE_VIRTUAL }
    }
}

private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.isIntegerIntValue(): Boolean =
    opcode == Opcode.INVOKE_VIRTUAL && methodReference()?.let {
        it.definingClass == "Ljava/lang/Integer;" && it.name == "intValue"
    } == true
