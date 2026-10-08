/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Where "Always use Clean mode" hooks, found by kept literals only (read from 577, 580 and 581,
 * 2026-10-07). The obfuscated names in these comments are for reviewers; the code never writes one
 * down.
 *
 * - Facebook's Clean mode (its "clear mode" inside) is switched by an event whose toString formats
 *   "%s: %s, enableClearMode: %s" (581 LX/88G, 580 LX/88k, 577 LX/9bT). Every Clean mode toggle
 *   makes one: the three-dot menu item, the pinch gesture, the store below.
 * - The store is an injected singleton keeping one AtomicBoolean, the remembered choice for
 *   accounts Facebook gives sticky Clean mode (581 LX/87t, 580 LX/88N, 577 LX/9b5). Its one setter
 *   sets the flag and posts the event, and only when the sticky config getter answers yes, so for
 *   everyone else the flag stays false.
 * - Four parts of the Reels viewer read the flag as they're made, each in its Litho
 *   createInitialState (577's overlay in a static helper it calls), each naming its spec in a log
 *   literal: FbShortsViewerOverlayComponentSpec (the buttons down the side; it skips the read for an
 *   ad reel), FbShortsViewerFooterComponentSpec, FbShortsVideoControlComponent and
 *   UddPlayerControlComponent. Three read it with AtomicBoolean.get(); the video controls of 580 and
 *   581 go through a static helper that boxes it (581 LX/18Q;->A0X). Each method reads it once.
 *   The flag's other readers (a toggle that leaves Clean mode, a lambda) are left alone.
 */

/** The toString format of Facebook's Clean mode event, the one literal that names it. */
internal const val CLEAR_MODE_EVENT = "%s: %s, enableClearMode: %s"

/** The spec names of the four viewer parts that start from the remembered Clean mode flag. */
internal val CLEAN_MODE_PARTS = listOf(
    "FbShortsViewerOverlayComponentSpec",
    "FbShortsViewerFooterComponentSpec",
    "FbShortsVideoControlComponent",
    "UddPlayerControlComponent",
)

internal const val ATOMIC_BOOLEAN = "Ljava/util/concurrent/atomic/AtomicBoolean;"
private const val ATOMIC_BOOLEAN_GET = "$ATOMIC_BOOLEAN->get()Z"
private const val ATOMIC_BOOLEAN_SET = "$ATOMIC_BOOLEAN->set(Z)V"
private const val BOXED_BOOLEAN = "Ljava/lang/Boolean;"

private const val CLEAN_MODE = "$EXTENSION_PACKAGE/reels/ReelCleanMode;"
internal const val START_CLEAN = "$CLEAN_MODE->startClean(Z)Z"
internal const val START_CLEAN_BOXED = "$CLEAN_MODE->startClean($BOXED_BOOLEAN)$BOXED_BOOLEAN"

/** How far after the flag's field read the value may be taken. 581's boxed read is two after. */
private const val READ_WINDOW = 4

private const val PATCH = "Clean up Reels"

/**
 * One read of the flag: [moveResult] is the index of the move-result that keeps the answer in
 * [register], a boolean, or a Boolean when [boxed].
 */
internal data class CleanModeRead(val moveResult: Int, val register: Int, val boxed: Boolean)

private val Instruction.reference get() = (this as? ReferenceInstruction)?.reference

private fun Instruction.calls() = (reference as? MethodReference)?.toString()

private fun FieldReference.sameAs(other: FieldReference) =
    definingClass == other.definingClass && name == other.name && type == other.type

/** The class whose toString loads [CLEAR_MODE_EVENT], among [holders], or null unless exactly one. */
internal fun clearModeEvent(holders: List<ClassDef>): String? = holders.filter { holder ->
    holder.methods.any { it.name == "toString" && it.parameterTypes.isEmpty() && holdsString(it, CLEAR_MODE_EVENT) }
}.map { it.type }.distinct().singleOrNull()

/**
 * Whether [field] is [store]'s remembered Clean mode flag: an AtomicBoolean of [store]'s own that a
 * method of [store] sets, right after reading it, in a method that also makes the [event].
 */
internal fun isCleanModeFlag(store: ClassDef, field: FieldReference, event: String): Boolean {
    if (field.definingClass != store.type || field.type != ATOMIC_BOOLEAN) return false
    return store.methods.any { method ->
        val code = method.implementation?.instructions?.toList() ?: return@any false
        code.any { it.opcode == Opcode.NEW_INSTANCE && (it.reference as TypeReference).type == event } &&
            code.zipWithNext().any { (read, next) ->
                read.opcode == Opcode.IGET_OBJECT && (read.reference as FieldReference).sameAs(field) &&
                    next.calls() == ATOMIC_BOOLEAN_SET
            }
    }
}

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/**
 * The reads of the flag in [method]: each `iget-object` of a field [isFlag] accepts, whose value
 * (or a `move-object` copy of it) goes within [READ_WINDOW] instructions into `AtomicBoolean.get()`
 * or a static helper taking just the AtomicBoolean and answering a Boolean, kept by the next
 * instruction's move-result. A field read used any other way first isn't one.
 */
internal fun cleanModeReads(method: Method, isFlag: (FieldReference) -> Boolean): List<CleanModeRead> {
    val code = method.implementation?.instructions?.toList() ?: return emptyList()
    return code.indices.mapNotNull { at ->
        val read = code[at]
        if (read.opcode != Opcode.IGET_OBJECT || !isFlag(read.reference as FieldReference)) return@mapNotNull null
        val holders = mutableSetOf((read as OneRegisterInstruction).registerA)
        for (next in at + 1 until minOf(code.size - 1, at + 1 + READ_WINDOW)) {
            val instruction = code[next]
            if (instruction.opcode in MOVE_OBJECTS && (instruction as TwoRegisterInstruction).registerB in holders) {
                holders += instruction.registerA
                continue
            }
            val call = instruction.reference as? MethodReference ?: continue
            if (instruction.registers().none { it in holders }) continue
            val kept = code[next + 1]
            return@mapNotNull when {
                call.toString() == ATOMIC_BOOLEAN_GET && kept.opcode == Opcode.MOVE_RESULT ->
                    CleanModeRead(next + 1, (kept as OneRegisterInstruction).registerA, boxed = false)
                instruction.opcode in STATIC_CALLS && call.returnType == BOXED_BOOLEAN &&
                    call.parameterTypes.map { it.toString() } == listOf(ATOMIC_BOOLEAN) &&
                    kept.opcode == Opcode.MOVE_RESULT_OBJECT ->
                    CleanModeRead(next + 1, (kept as OneRegisterInstruction).registerA, boxed = true)
                else -> null
            }
        }
        null
    }
}

private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val STATIC_CALLS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

/**
 * Every viewer part's read of the flag, with the class and method it's in, part by part. [holders]
 * answers the classes with a method loading a literal, and [classOf] a class by type. Refuses
 * unless the event, and exactly one read for each of [CLEAN_MODE_PARTS], are found.
 */
internal fun cleanModeHooks(
    holders: (String) -> List<ClassDef>,
    classOf: (String) -> ClassDef?,
): List<Triple<ClassDef, Method, CleanModeRead>> {
    val eventHolders = holders(CLEAR_MODE_EVENT)
    val event = clearModeEvent(eventHolders) ?: throw PatchException(
        "$PATCH: expected one class whose toString loads \"$CLEAR_MODE_EVENT\", found " +
            eventHolders.count { holder -> holder.methods.any { it.name == "toString" } },
    )
    val flags = mutableMapOf<String, Boolean>()
    val isFlag = { field: FieldReference ->
        flags.getOrPut(field.toString()) {
            field.type == ATOMIC_BOOLEAN && classOf(field.definingClass)?.let { isCleanModeFlag(it, field, event) } == true
        }
    }
    return CLEAN_MODE_PARTS.map { part ->
        val reads = holders(part).flatMap { owner ->
            methodsHolding(owner, part).flatMap { method -> cleanModeReads(method, isFlag).map { Triple(owner, method, it) } }
        }
        reads.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one read of Facebook's remembered Clean mode flag in a method naming \"$part\", found ${reads.size}",
        )
    }
}

/**
 * Each viewer part asks the extension right after it reads the remembered Clean mode flag, and goes
 * on with the answer in the same register: a yes stays yes, and the switch can turn a no into a yes.
 * Nothing else changes, so a part that skips the read (the overlay for an ad) stays Facebook's.
 */
internal fun BytecodePatchContext.startReelsInCleanMode() {
    val hooks = cleanModeHooks(
        holders = { literal ->
            classDefByStrings(literal, StringComparisonType.EQUALS).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        },
        classOf = { type -> classDefByOrNull(type) },
    )
    hooks.forEach { (owner, method, read) -> mutableClassDefBy(owner).findMutableMethodOf(method).startCleanAfter(read) }
}

/**
 * Puts the extension right after [read]'s move-result, on the same register, so nothing else is
 * borrowed. A jump to the instruction after the move-result keeps landing on it, past the hook,
 * since such a path didn't come from the read.
 */
internal fun MutableMethod.startCleanAfter(read: CleanModeRead) {
    val register = read.register
    val (hook, keep) = if (read.boxed) START_CLEAN_BOXED to "move-result-object" else START_CLEAN to "move-result"
    addInstructions(
        read.moveResult + 1,
        """
            invoke-static/range { v$register .. v$register }, $hook
            $keep v$register
        """,
    )
}
