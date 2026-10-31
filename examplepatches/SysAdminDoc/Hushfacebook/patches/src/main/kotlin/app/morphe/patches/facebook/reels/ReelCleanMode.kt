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
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Where "Always use Clean mode" hooks, found by kept literals only (read from 577, 580 and 581,
 * 2026-10-07). The obfuscated names in these comments are for reviewers; the code never writes one
 * down.
 *
 * - Facebook's Clean mode (its "clear mode" inside) is switched by an event whose toString formats
 *   "%s: %s, enableClearMode: %s" (581 LX/88G). Every Clean mode toggle makes one: the three-dot
 *   menu item, the pinch gesture, the store below.
 * - The store is an injected singleton keeping one AtomicBoolean, the remembered choice for
 *   accounts Facebook gives sticky Clean mode (581 LX/87t). Its one setter sets the flag and posts
 *   the event, and only when the sticky config getter answers yes, so for everyone else the flag
 *   stays false.
 * - Three parts of the Reels viewer read the flag as they're made, each in its Litho
 *   createInitialState (577's overlay in a static helper it calls), each naming its spec in a log
 *   literal: FbShortsViewerOverlayComponentSpec (the buttons down the side; it skips the read for an
 *   ad reel), FbShortsViewerFooterComponentSpec and FbShortsVideoControlComponent. Up to 582 a
 *   fourth, UddPlayerControlComponent (582 LX/XIg;), read it too; 583 has no such component left,
 *   only its spec's CallerContext names. They read it with AtomicBoolean.get(); the video controls
 *   of 580 and 581 go through a static helper that boxes it (581 LX/18Q;->A0X). Each method reads it
 *   once. The flag's other readers (a toggle that leaves Clean mode, a lambda) are left alone.
 */

/** The toString format of Facebook's Clean mode event, the one literal that names it. */
internal const val CLEAR_MODE_EVENT = "%s: %s, enableClearMode: %s"

/** The spec names of the three viewer parts that start from the remembered Clean mode flag. */
internal val CLEAN_MODE_PARTS = listOf(
    "FbShortsViewerOverlayComponentSpec",
    "FbShortsViewerFooterComponentSpec",
    "FbShortsVideoControlComponent",
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
    return store.methods.any { setsFlag(it, event) { read -> read.sameAs(field) } }
}

/** Whether [method] makes the [event] and sets an AtomicBoolean [isFlag] accepts right after reading it. */
private fun setsFlag(method: Method, event: String, isFlag: (FieldReference) -> Boolean): Boolean {
    val code = method.implementation?.instructions?.toList() ?: return false
    return code.any { it.opcode == Opcode.NEW_INSTANCE && (it.reference as TypeReference).type == event } &&
        code.zipWithNext().any { (read, next) ->
            read.opcode == Opcode.IGET_OBJECT && isFlag(read.reference as FieldReference) && next.calls() == ATOMIC_BOOLEAN_SET
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
internal fun MutableMethod.startCleanAfter(read: CleanModeRead) =
    if (read.boxed) askAfter(read.moveResult, read.register, START_CLEAN_BOXED, "move-result-object")
    else askAfter(read.moveResult, read.register, START_CLEAN, "move-result")

private fun MutableMethod.askAfter(moveResult: Int, register: Int, hook: String, keep: String) = addInstructions(
    moveResult + 1,
    """
        invoke-static/range { v$register .. v$register }, $hook
        $keep v$register
    """,
)

/*
 * The Clean mode button (#304), read from 585 arm64 and armeabi-v7a, 2026-10-30. Over a clean reel
 * the overlay shows a button whose tap Facebook logs as "tap_clear_mode" (585 LX/0b4J; case 11).
 *
 * - For an account with sticky Clean mode (585 LX/05YM;->A1M()Z, asked of the reel) the tap calls
 *   the store's setter with the opposite of the button's own state (585 LX/0cNr;->A0A, xor 1). The
 *   setter asks the same check first, then sets the flag and posts the Clean mode event on the bus
 *   the overlay listens to (585 LX/05ml;). For everyone else the tap posts the event on the
 *   viewer's other bus (LX/05YP;), which the overlay doesn't hear, so its value never changes and
 *   the button keeps its state: with the switch on it always offered to leave Clean mode.
 * - The overlay's listener (585 LX/09xH;) boxes the event's yes or no into a one-element state
 *   update, "updateState:FbShortsViewerOverlayComponent.onUpdateIsClearModeEnabled", and its state
 *   keeps it in an AtomicReference. An ad never reads the store and starts with a no it keeps, its
 *   listener ignoring the event.
 * - The button's builder (585 LX/0B6k;->A00, called from the overlay's render with that
 *   AtomicReference) returns nothing when the reference holds a no, and otherwise makes the button
 *   (585 LX/0cNr;) with its state read from the same reference again. So in Facebook's design the
 *   button only leaves Clean mode, and an ad gets none.
 *
 * Hooked: the sticky check in the setter and the same call nearest before the setter in the tap,
 * the listener's boxed state, and the builder's first read of the reference, which only that no
 * check uses.
 */

/** The point Facebook logs as the Clean mode button is tapped, in the tap's handler. */
internal const val CLEAR_MODE_TAP = "tap_clear_mode"

/** The overlay's state update as it hears the Clean mode event. */
internal const val OVERLAY_CLEAR_MODE_UPDATE =
    "updateState:FbShortsViewerOverlayComponent.onUpdateIsClearModeEnabled"

internal const val ATOMIC_REFERENCE = "Ljava/util/concurrent/atomic/AtomicReference;"
private const val ATOMIC_REFERENCE_GET = "$ATOMIC_REFERENCE->get()Ljava/lang/Object;"
private const val OBJECT = "Ljava/lang/Object;"
private const val OBJECT_ARRAY = "[Ljava/lang/Object;"

internal const val STICKY_CLEAN = "$CLEAN_MODE->stickyClean(Z)Z"
internal const val MARK_LEFT_CLEAN = "$CLEAN_MODE->markLeftClean($OBJECT_ARRAY)$OBJECT_ARRAY"
internal const val CLEAN_BUTTON_STATE = "$CLEAN_MODE->cleanButtonState($OBJECT)$OBJECT"

/** One hook of the Clean mode button: [call] right after the move-result at [moveResult] in [owner]'s [method], on [register]. */
internal data class ButtonHook(val owner: ClassDef, val method: Method, val moveResult: Int, val register: Int, val call: String)

private fun Method.code() = implementation?.instructions?.toList().orEmpty()

private fun Method.sameAs(call: MethodReference) = name == call.name && returnType == call.returnType &&
    parameterTypes.map(CharSequence::toString) == call.parameterTypes.map(CharSequence::toString)

private fun refuse(why: String): Nothing = throw PatchException("$PATCH: $why")

/** The register a move-result at [at] in [code] keeps, or null when [at] isn't one of [kinds]. */
private fun kept(code: List<Instruction>, at: Int, vararg kinds: Opcode) =
    code.getOrNull(at)?.takeIf { it.opcode in kinds }?.let { (it as OneRegisterInstruction).registerA }

/** The first register of each of [method]'s parameters, by index. They're the method's last registers, past `this`. */
private fun parameterRegisters(method: Method): List<Int> {
    val sizes = method.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    var next = method.implementation!!.registerCount - sizes.sum()
    return sizes.map { size -> next.also { next += size } }
}

/**
 * The four hooks of the Clean mode button. [holders] answers the classes with a method loading a
 * literal, and [classOf] a class by type. Refuses unless each is found exactly once.
 */
internal fun cleanModeButtonHooks(
    holders: (String) -> List<ClassDef>,
    classOf: (String) -> ClassDef?,
): List<ButtonHook> {
    val event = clearModeEvent(holders(CLEAR_MODE_EVENT)) ?: refuse("expected one class whose toString loads \"$CLEAR_MODE_EVENT\"")

    val taps = holders(CLEAR_MODE_TAP).flatMap { owner -> methodsHolding(owner, CLEAR_MODE_TAP).map { owner to it } }
    val (tapOwner, tap) = taps.singleOrNull() ?: refuse("expected one method loading \"$CLEAR_MODE_TAP\", found ${taps.size}")
    val tapCode = tap.code()
    val literalAt = tapCode.indexOfFirst { (it.reference as? StringReference)?.string == CLEAR_MODE_TAP }

    // The store's setter: the call nearest before the literal to a method that makes the event and
    // sets an AtomicBoolean of its own class right after reading it.
    fun setterOf(call: MethodReference): Pair<ClassDef, Method>? {
        val store = classOf(call.definingClass) ?: return null
        val method = store.methods.firstOrNull { it.sameAs(call) } ?: return null
        return (store to method).takeIf { setsFlag(method, event) { it.definingClass == store.type && it.type == ATOMIC_BOOLEAN } }
    }
    val setterAt = (minOf(literalAt, tapCode.size) - 1 downTo 0).firstOrNull { at ->
        (tapCode[at].reference as? MethodReference)?.let(::setterOf) != null
    } ?: refuse("the method loading \"$CLEAR_MODE_TAP\" calls no Clean mode setter before it")
    val setterCall = tapCode[setterAt]
    val (store, setter) = setterOf(setterCall.reference as MethodReference)!!

    // The sticky check: the setter's first no-argument yes-or-no call, asked before anything else.
    val setterCode = setter.code()
    val gateAt = setterCode.indexOfFirst {
        it.opcode in VIRTUAL_CALLS && (it.reference as MethodReference).let { call -> call.parameterTypes.isEmpty() && call.returnType == "Z" }
    }
    val setterGate = kept(setterCode, gateAt + 1, Opcode.MOVE_RESULT)?.takeIf { gateAt >= 0 }
        ?: refuse("the Clean mode setter ${store.type}->${setter.name} asks no yes-or-no check")
    val gate = setterCode[gateAt].calls()
    val tapGateAt = (setterAt - 1 downTo 0).firstOrNull { tapCode[it].calls() == gate }
        ?: refuse("the Clean mode button's tap doesn't ask $gate before the setter")
    val tapGate = kept(tapCode, tapGateAt + 1, Opcode.MOVE_RESULT)
        ?: refuse("the Clean mode button's tap doesn't keep $gate")

    // The button: the class whose boolean the tap flips for the setter.
    val wanted = setterCall.registers().last()
    val flip = (setterAt - 1 downTo maxOf(0, setterAt - READ_WINDOW)).map { tapCode[it] }.firstOrNull {
        it.opcode == Opcode.XOR_INT_LIT8 && (it as TwoRegisterInstruction).registerA == wanted
    } as TwoRegisterInstruction? ?: refuse("the Clean mode button's tap doesn't flip the button's state for the setter")
    val buttonState = tapCode.subList(0, setterAt).lastOrNull {
        it.opcode == Opcode.IGET_BOOLEAN && (it as TwoRegisterInstruction).registerA == flip.registerB
    } ?: refuse("the Clean mode button's tap doesn't read the button's state")
    val button = (buttonState.reference as FieldReference).definingClass

    // The overlay's listener: its one boxing of the event's value into the state update.
    val listeners = holders(OVERLAY_CLEAR_MODE_UPDATE).flatMap { owner ->
        methodsHolding(owner, OVERLAY_CLEAR_MODE_UPDATE).map { owner to it }
    }
    val (listenerOwner, listener) = listeners.singleOrNull()
        ?: refuse("expected one method loading \"$OVERLAY_CLEAR_MODE_UPDATE\", found ${listeners.size}")
    val listenerCode = listener.code()
    val boxings = listenerCode.indices.filter { at ->
        val call = listenerCode[at].reference as? MethodReference
        listenerCode[at].opcode in STATIC_CALLS && call != null && call.returnType == OBJECT_ARRAY &&
            call.parameterTypes.map { it.toString() } == listOf("Z") && kept(listenerCode, at + 1, Opcode.MOVE_RESULT_OBJECT) != null
    }
    val boxing = boxings.singleOrNull() ?: refuse("expected the overlay's listener to box the Clean mode value once, found ${boxings.size}")

    // The builder: called from the overlay with an AtomicReference, it makes the button.
    val builders = CLEAN_MODE_PARTS.first().let(holders).flatMap { overlay ->
        overlay.methods.flatMap { method ->
            method.code().mapNotNull { (it.reference as? MethodReference)?.takeIf { call -> ATOMIC_REFERENCE in call.parameterTypes.map(CharSequence::toString) } }
        }
    }.distinctBy { it.toString() }.mapNotNull { call ->
        val owner = classOf(call.definingClass) ?: return@mapNotNull null
        val method = owner.methods.firstOrNull { it.sameAs(call) } ?: return@mapNotNull null
        (owner to method).takeIf {
            method.code().any { it.opcode == Opcode.NEW_INSTANCE && (it.reference as TypeReference).type == button }
        }
    }
    val (builderOwner, builder) = builders.singleOrNull()
        ?: refuse("expected one method the overlay calls with an AtomicReference to make $button, found ${builders.size}")
    // Its first read of the reference goes straight into a static yes-or-no check of the value
    // against a boolean, which keeps its answer in the same register, so the value isn't read again.
    val reference = builder.parameterTypes.map(CharSequence::toString).indexOf(ATOMIC_REFERENCE)
        .let { parameterRegisters(builder)[it] }
    val builderCode = builder.code()
    val readAt = builderCode.indexOfFirst { it.calls() == ATOMIC_REFERENCE_GET && it.registers().singleOrNull() == reference }
    val value = kept(builderCode, readAt + 1, Opcode.MOVE_RESULT_OBJECT)?.takeIf { readAt >= 0 }
        ?: refuse("the Clean mode button's builder doesn't read its AtomicReference")
    val check = builderCode.getOrNull(readAt + 2)
    val checkCall = check?.reference as? MethodReference
    if (check?.opcode !in STATIC_CALLS || checkCall?.returnType != "Z" ||
        checkCall.parameterTypes.map { it.toString() } != listOf(OBJECT, "Z") ||
        check.registers().first() != value || kept(builderCode, readAt + 3, Opcode.MOVE_RESULT) != value
    ) refuse("the Clean mode button's builder doesn't check its AtomicReference's value right away")

    return listOf(
        ButtonHook(store, setter, gateAt + 1, setterGate, STICKY_CLEAN),
        ButtonHook(tapOwner, tap, tapGateAt + 1, tapGate, STICKY_CLEAN),
        ButtonHook(listenerOwner, listener, boxing + 1, kept(listenerCode, boxing + 1, Opcode.MOVE_RESULT_OBJECT)!!, MARK_LEFT_CLEAN),
        ButtonHook(builderOwner, builder, readAt + 1, value, CLEAN_BUTTON_STATE),
    )
}

private val VIRTUAL_CALLS = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

/**
 * The Clean mode button switches both ways while "Always use Clean mode" is on: its tap and the
 * store take Facebook's sticky way, the overlay marks a reel the person took out, and the builder
 * keeps the button for that reel. Each hook hands a value to the extension and goes on with its
 * answer in the same register.
 */
internal fun BytecodePatchContext.toggleReelCleanMode() {
    val hooks = cleanModeButtonHooks(
        holders = { literal ->
            classDefByStrings(literal, StringComparisonType.EQUALS).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        },
        classOf = { type -> classDefByOrNull(type) },
    )
    hooks.sortedByDescending { it.moveResult }.forEach { hook ->
        val keep = if (hook.call.endsWith(")Z")) "move-result" else "move-result-object"
        mutableClassDefBy(hook.owner).findMutableMethodOf(hook.method).askAfter(hook.moveResult, hook.register, hook.call, keep)
    }
}
