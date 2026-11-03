package app.template.patches.truecaller.misc.haptics

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The progress above which a swipe button starts its looping vibration (0.1f).
private val VIBRATION_THRESHOLD_BITS = 0.1f.toRawBits()

private val BLOCK_ENDS = setOf(
    Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW,
    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH,
)

// The R8-merged function reference lambdas: (arity, receiver, owner class, name, signature, flags, case).
private val FUNCTION_REFERENCE_CONSTRUCTOR = listOf(
    "I", "Ljava/lang/Object;", "Ljava/lang/Class;", "Ljava/lang/String;", "Ljava/lang/String;", "I", "B",
)

@Suppress("unused")
val disableCallButtonHapticsPatch = bytecodePatch(
    name = "Disable call button haptics",
    description = "Stops the vibration when you answer or decline a call.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. The haptic played when a call is answered or declined. Every call UI action handler
        // dispatches a haptic event (new HapticEvent(CallUIHaptic.X), then a void dispatch call)
        // and then reports an analytics action. The handlers that report ACCEPT or REJECT
        // (full screen, details view and PiP) lose the dispatch; hang-up (HANGUP, KEYPAD_END_CALL)
        // plays the same REJECT haptic and keeps it, as do all other buttons.
        // Collect first: mutating classes while iterating them is not allowed.
        val handlerClasses = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method -> method.implementation?.instructions?.any { it.answerDeclineAction() != null } == true }) {
                handlerClasses += classDef
            }
        }
        val covered = mutableSetOf<Pair<String, String>>()
        for (classDef in handlerClasses) {
            for (method in mutableClassDefBy(classDef).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                val dispatches = sortedSetOf<Int>(reverseOrder())
                instructions.forEachIndexed { index, instruction ->
                    val action = instruction.answerDeclineAction() ?: return@forEachIndexed
                    val haptic = instructions.hapticBefore(index) ?: return@forEachIndexed
                    val played = (instructions[haptic] as ReferenceInstruction).field().name
                    if (played != ANSWER_DECLINE_ACTIONS.getValue(action)) {
                        throw PatchException("${method.label()}: ${action.second} plays CallUIHaptic.$played, expected ${ANSWER_DECLINE_ACTIONS.getValue(action)}")
                    }
                    dispatches += method.hapticDispatch(instructions, haptic)
                    covered += action
                }
                dispatches.forEach { method.removeInstruction(it) }
            }
        }
        val missing = ANSWER_DECLINE_ACTIONS.keys - covered
        if (missing.isNotEmpty()) {
            throw PatchException("No haptic dispatch found for ${missing.map { "${it.first}${it.second}" }}")
        }

        val composable = IncomingCallSwipeHandlersFingerprint.method

        // 2. The click when a swipe button starts moving: the dragging state handler dispatches
        // CallUIHaptic.CLICK behind "if (state != IDLE)". The dispatch is dropped.
        run {
            val (method, block) = swipeHandlerCase(composable, DRAGGING_STATE_HANDLER)
            val instructions = method.instructions.toList()
            val idle = block.firstOrNull { index ->
                instructions[index].opcode == Opcode.SGET_OBJECT &&
                    (instructions[index] as ReferenceInstruction).field().let { it.definingClass == SWIPE_DRAGGING_STATE && it.name == "IDLE" }
            } ?: throw PatchException("${method.label()}: the $DRAGGING_STATE_HANDLER case does not read IDLE")
            val idleRegister = (instructions[idle] as OneRegisterInstruction).registerA
            val guard = instructions[idle + 1]
            if ((guard.opcode != Opcode.IF_EQ && guard.opcode != Opcode.IF_NE) ||
                idleRegister !in (guard as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }
            ) {
                throw PatchException("${method.label()}: IDLE is not compared right after it is read; got ${guard.opcode}")
            }
            val haptic = (idle + 2..block.last).firstOrNull { index -> instructions[index].isHaptic() }
                ?: throw PatchException("${method.label()}: no haptic after the IDLE check")
            val played = (instructions[haptic] as ReferenceInstruction).field().name
            if (played != "CLICK") throw PatchException("${method.label()}: the drag start plays CallUIHaptic.$played, expected CLICK")
            val dispatch = method.hapticDispatch(instructions, haptic)
            if ((guard as BuilderOffsetInstruction).target.location.index <= dispatch) {
                throw PatchException("${method.label()}: the IDLE check does not skip the drag start haptic")
            }
            method.removeInstruction(dispatch)
        }

        // 3. The looping vibration while a swipe button is dragged: the progress handler starts a
        // vibrator job once progress > 0.1f and stops it at or below that. The progress is set to
        // 0 right before the compare, so the handler always takes the stop path.
        run {
            val (method, block) = swipeHandlerCase(composable, DRAGGING_PROGRESS_HANDLER)
            val instructions = method.instructions.toList()
            val threshold = block.firstOrNull { index ->
                instructions[index].opcode == Opcode.CONST &&
                    (instructions[index] as NarrowLiteralInstruction).narrowLiteral == VIBRATION_THRESHOLD_BITS
            } ?: throw PatchException("${method.label()}: the $DRAGGING_PROGRESS_HANDLER case does not load 0.1f")
            val thresholdRegister = (instructions[threshold] as OneRegisterInstruction).registerA
            val compare = threshold + 1
            val cmp = instructions[compare] as? ThreeRegisterInstruction
            if ((instructions[compare].opcode != Opcode.CMPG_FLOAT && instructions[compare].opcode != Opcode.CMPL_FLOAT) || cmp == null) {
                throw PatchException("${method.label()}: 0.1f is not compared right after it is loaded; got ${instructions[compare].opcode}")
            }
            val progress = when (thresholdRegister) {
                cmp.registerC -> cmp.registerB
                cmp.registerB -> cmp.registerC
                else -> throw PatchException("${method.label()}: the float compare does not use 0.1f")
            }
            method.requireNoBranchTargetAt(compare, "zeroing the drag progress")
            val zero = if (progress < 16) "const/4 v$progress, 0x0" else "const/16 v$progress, 0x0"
            method.addInstructionsChecked(compare, zero)
        }
    }
}

private fun MutableMethod.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun ReferenceInstruction.field() = reference as FieldReference

/** The ACCEPT / REJECT analytics action [this] loads, if any. */
private fun Instruction.answerDeclineAction(): Pair<String, String>? {
    if (opcode != Opcode.SGET_OBJECT) return null
    val field = (this as ReferenceInstruction).reference as FieldReference
    return (field.definingClass to field.name).takeIf { it in ANSWER_DECLINE_ACTIONS }
}

private fun Instruction.isHaptic() =
    opcode == Opcode.SGET_OBJECT && ((this as ReferenceInstruction).reference as FieldReference).definingClass == CALL_UI_HAPTIC

/**
 * The CallUIHaptic read on the straight-line path into [index]: walks back until it finds one, and
 * gives up at the end of the previous block (goto, return, throw, switch) or at a branch target.
 */
private fun List<BuilderInstruction>.hapticBefore(index: Int): Int? {
    for (i in index - 1 downTo 0) {
        val instruction = this[i]
        if (instruction.opcode in BLOCK_ENDS) return null
        if (instruction.isHaptic()) return i
        if (instruction.location.labels.isNotEmpty()) return null
    }
    return null
}

/**
 * Index of the void call that dispatches the haptic event built from the CallUIHaptic read at
 * [haptic]: new-instance vE, Event; sget-object vH, CallUIHaptic.X; invoke-direct {vE, vH},
 * Event-><init>(CallUIHaptic)V; invoke-* {vBus, vE}, ...(Event)V. Throws on any other shape.
 */
private fun MutableMethod.hapticDispatch(instructions: List<BuilderInstruction>, haptic: Int): Int {
    val hapticRegister = (instructions[haptic] as OneRegisterInstruction).registerA
    val create = instructions.getOrNull(haptic - 1)
    val init = instructions.getOrNull(haptic + 1)
    val dispatch = instructions.getOrNull(haptic + 2)
    val event = (create as? OneRegisterInstruction)?.registerA
    val initCall = (init as? ReferenceInstruction)?.reference as? MethodReference
    val dispatchCall = (dispatch as? ReferenceInstruction)?.reference as? MethodReference
    if (create?.opcode != Opcode.NEW_INSTANCE || init?.opcode != Opcode.INVOKE_DIRECT ||
        initCall?.name != "<init>" || initCall.parameterTypes.map(CharSequence::toString) != listOf(CALL_UI_HAPTIC) ||
        (init as FiveRegisterInstruction).let { it.registerC != event || it.registerD != hapticRegister }
    ) {
        throw PatchException("${label()}: the CallUIHaptic at $haptic is not passed to a new haptic event")
    }
    if ((dispatch?.opcode != Opcode.INVOKE_VIRTUAL && dispatch?.opcode != Opcode.INVOKE_INTERFACE) ||
        dispatchCall?.returnType != "V" || dispatchCall.parameterTypes.size != 1 ||
        (dispatch as FiveRegisterInstruction).registerD != event
    ) {
        throw PatchException("${label()}: the haptic event built at $haptic is not dispatched right away; got ${dispatch?.opcode}")
    }
    if ((haptic..haptic + 2).any { instructions[it].location.labels.isNotEmpty() }) {
        throw PatchException("${label()}: the haptic dispatch at $haptic is a branch target")
    }
    return haptic + 2
}

/**
 * The switch case of the R8-merged lambda that the incoming call screen [composable] passes as the
 * function reference named [handler]: the lambda's invoke method and the instruction range of the
 * case, from its switch target to its first return or throw.
 */
private fun BytecodePatchContext.swipeHandlerCase(
    composable: MutableMethod,
    handler: String,
): Pair<MutableMethod, IntRange> {
    val instructions = composable.instructions.toList()
    val names = instructions.indices.filter { index ->
        instructions[index].opcode.let { it == Opcode.CONST_STRING || it == Opcode.CONST_STRING_JUMBO } &&
            ((instructions[index] as ReferenceInstruction).reference as StringReference).string == handler
    }
    val name = names.singleOrNull() ?: throw PatchException("${composable.label()} loads \"$handler\" ${names.size} times, expected once")
    val nameRegister = (instructions[name] as OneRegisterInstruction).registerA

    // The function reference constructor that gets the name; its last argument is the case.
    val constructor = (name + 1 until instructions.size).firstOrNull { index ->
        val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        (instructions[index].opcode == Opcode.INVOKE_DIRECT || instructions[index].opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            call?.name == "<init>" && instructions[index].argumentRegisters()?.contains(nameRegister) == true
    } ?: throw PatchException("${composable.label()}: \"$handler\" is not passed to a constructor")
    val constructorCall = (instructions[constructor] as ReferenceInstruction).reference as MethodReference
    if (constructorCall.parameterTypes.map(CharSequence::toString) != FUNCTION_REFERENCE_CONSTRUCTOR) {
        throw PatchException("${composable.label()}: \"$handler\" goes to $constructorCall, not a merged function reference lambda")
    }
    val caseRegister = instructions[constructor].argumentRegisters()!!.last()
    val caseWriter = (constructor - 1 downTo 0).firstOrNull { (instructions[it] as? OneRegisterInstruction)?.registerA == caseRegister && instructions[it].opcode.setsRegister() }
    val case = (instructions.getOrNull(caseWriter ?: -1) as? NarrowLiteralInstruction)?.narrowLiteral
        ?: throw PatchException("${composable.label()}: the \"$handler\" lambda case is not a constant")

    // The lambda's invoke method switches on its own byte field.
    val lambda = mutableClassDefBy(constructorCall.definingClass)
    val invokes = lambda.methods.filter { it.name == "invoke" && it.implementation != null }
    val invoke = invokes.singleOrNull() ?: throw PatchException("${lambda.type} has ${invokes.size} invoke methods, expected one")
    val body = invoke.instructions.toList()
    val selector = body.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IGET_BYTE && (instruction as ReferenceInstruction).field().definingClass == lambda.type
    }
    if (selector < 0) throw PatchException("${invoke.label()} does not read its case field")
    val selectorRegister = (body[selector] as TwoRegisterInstruction).registerA
    val switch = (selector + 1 until body.size).firstOrNull { index ->
        body[index].opcode == Opcode.PACKED_SWITCH || body[index].opcode == Opcode.SPARSE_SWITCH ||
            ((body[index] as? OneRegisterInstruction)?.registerA == selectorRegister && body[index].opcode.setsRegister())
    }
    if (switch == null || (body[switch] as OneRegisterInstruction).registerA != selectorRegister ||
        (body[switch].opcode != Opcode.PACKED_SWITCH && body[switch].opcode != Opcode.SPARSE_SWITCH)
    ) {
        throw PatchException("${invoke.label()} does not switch on its case field")
    }
    val payload = (body[switch] as BuilderOffsetInstruction).target.location.instruction as? BuilderSwitchPayload
        ?: throw PatchException("${invoke.label()}: the case switch has no payload")
    val start = payload.switchElements.firstOrNull { it.key == case }?.target?.location?.index ?: (switch + 1)
    val end = (start until body.size).firstOrNull { index ->
        body[index].opcode.let { it == Opcode.RETURN_OBJECT || it == Opcode.RETURN_VOID || it == Opcode.THROW }
    } ?: throw PatchException("${invoke.label()}: case $case never returns")
    return invoke to (start..end)
}

private fun Instruction.argumentRegisters(): List<Int>? = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> null
}
