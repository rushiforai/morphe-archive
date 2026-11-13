/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 451 for #9 (2026-10-13).
 */
package app.morphe.patches.threads.feed.copytext

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.ads.sourceOrNull
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.freeLocalsAt
import app.morphe.patches.threads.misc.extension.localRegisterCount
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.extension.requireParameterIntact
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.util.ControlFlow
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.literalReads
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.EnumSet

private const val PATCH = "Copy text on long press"
internal const val COPY_TEXT = "$EXTENSION_PACKAGE/feed/CopyText;"
internal const val LONG_PRESS = "$COPY_TEXT->longPress(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val SELECTION = "$COPY_TEXT->selection(Z)Z"

/**
 * The note on the lambda of Threads' post row that lays out a post's text, for the feed, profiles
 * and an opened post. The line number after it moves from build to build.
 */
internal const val POST_ROW_NOTE =
    "com.instagram.barcelona.feed.post.ui.FeedPostRow.<anonymous>.<anonymous> (FeedPostRow.kt:"

/** The note PostText puts on remembering its text selection, inlined into PostText itself. */
internal const val SELECTION_NOTE =
    "com.instagram.barcelona.feed.post.ui.rememberPostTextSelectionState (PostTextSelectionMode.kt:"

private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

private val MOVES = EnumSet.of(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

/**
 * The post row's long press override: in [method], the read at [read] of the override the row
 * was handed into [register], the null check at [guard] that decides the long press from it, the
 * override's own long press [action] the row reads when there is one, a register [free] the hook
 * may write in front of [guard], and [low], the override in a register the hook's read and call can
 * name: [register] itself up to v15, a free local holding a copy of it above.
 */
internal class LongPressOverride(
    val method: MutableMethod,
    val read: Int,
    val guard: Int,
    val register: Int,
    val action: FieldReference,
    val free: Int,
    val low: Int = register,
) {
    /** The hook put in front of [guard], with a `:threads` label for Threads' own check. */
    fun hook(): String {
        val held = "v$register"
        val copy = if (low == register) "" else "move-object/from16 v$low, $held\n"
        return """
            if-eqz $held, :threads
            ${copy}iget-object v$free, v$low, $action
            invoke-static { v$low, v$free }, $LONG_PRESS
            move-result-object $held
            check-cast $held, ${action.definingClass}
        """
    }
}

/** PostText, [method], and its boolean [parameter] that turns text selection on, copied at [copy] and tested at [check]. */
internal class SelectionFlag(val method: MutableMethod, val parameter: Int, val copy: Int, val check: Int) {
    /**
     * The hook put first thing in [method]. `move-result` names 8 bits, and some 455 builds hold the
     * flag in v262, so a flag above v255 comes back through v0, which nothing holds yet at entry.
     */
    fun hook(): String {
        val flag = method.parameterRegisterNumber(parameter)
        val answer = if (flag > 255) "move-result v0\nmove/16 v$flag, v0" else "move-result v$flag"
        return """
            invoke-static/range { v$flag .. v$flag }, $SELECTION
            $answer
        """
    }
}

/**
 * Gives an opened post's long press back its Copy text sheet, and keeps Threads' word selection
 * off, while the Copy text switch is on (#9).
 *
 * Threads lays out a post's text in one lambda of its post row, and its link preview in another,
 * and each one's long press opens Copy text. The row can be handed an override for that press, and
 * an opened post hands it one with no action in it, so each lambda puts a press that does nothing
 * in its place. Each reads the override and checks it for null; the override goes through the
 * extension in between, along with the action in it, and comes back null when the extension wants
 * the lambda's own press. PostText takes a boolean that turns on Threads' text selection, which
 * some accounts get on opened posts, and the extension is asked for it first thing.
 *
 * Part of every build, with no name to deselect it by: the settings patch, which every HushThreads
 * patch depends on, depends on this one, and its switch is the settings entry's own. It refuses
 * rather than guess, which stops the run, when no lambda reads an override, the lambdas read
 * different ones, a check is reached other than from its read, or PostText's selection check
 * doesn't read a copy of one boolean parameter as it came in.
 */
internal val copyTextPatch = bytecodePatch {
    dependsOn(threadsExtensionPatch)

    execute {
        // Everything is found before anything changes, so a refusal leaves Threads as it was.
        val overrides = longPressOverrides()
        val selection = selectionFlag()

        // From the bottom of each method up, so a hook never moves a check still to come.
        overrides.sortedByDescending { it.guard }.forEach { override ->
            override.method.addInstructionsWithLabels(
                override.guard,
                override.hook(),
                ExternalLabel("threads", override.method.getInstruction(override.guard)),
            )
        }

        selection.method.addInstructions(0, selection.hook())
    }
}

/** A method's full signature. A Method is a MethodReference too. */
private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.isNote(note: String): Boolean =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        getReference<StringReference>()?.string?.startsWith(note) == true

/** Every method outside the extension holding a string that starts with [note], read through its mutable copy. */
private fun BytecodePatchContext.noted(note: String): List<MutableMethod> =
    classDefByStrings(note, StringComparisonType.STARTS_WITH)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .distinctBy { it.signature() }
        .filter { method -> method.body().any { it.isNote(note) } }
        // Read through the mutable copy, so what's checked is what the hook goes into.
        .map { mutableClassDefBy(it.definingClass).findMutableMethodOf(it) }

/**
 * Every null check of a long press override in the post row's lambdas: on 451 and 452 the post's
 * text and its link preview each have one. Throws unless there's at least one, they all read the
 * same override's same action, and each check is reached only by falling into it, holding nothing
 * but the lambda's own override.
 */
internal fun BytecodePatchContext.longPressOverrides(): List<LongPressOverride> {
    val sites = noted(POST_ROW_NOTE).flatMap { method ->
        val flow = ControlFlow.of(method)
        flow.instructions.indices.filter { guard -> method.overrideAction(flow, guard) != null }.map { method to it }
    }
    if (sites.isEmpty()) throw PatchException("$PATCH: no lambda of the post row reads and checks a long press override")
    val found = sites.map { (method, guard) -> method.overrideAt(guard) }
    val actions = found.map { it.action.toString() }.distinct()
    if (actions.size != 1) throw PatchException("$PATCH: the post row's override checks read different actions, $actions")
    return found
}

/**
 * The override checked at [guard], and the read it came from. Throws unless the check is reached
 * only by falling into it, so no jump skips the hook, and what it checks can only be the override
 * the lambda read from its own field.
 */
private fun MutableMethod.overrideAt(guard: Int): LongPressOverride {
    val method = this
    val flow = ControlFlow.of(method)
    val register = (flow.instructions[guard] as OneRegisterInstruction).registerA
    val into = flow.instructions.indices.filter { from -> guard in flow.normal[from] || guard in flow.exceptional[from] }
    if (into != listOf(guard - 1)) {
        throw PatchException("$PATCH: ${method.signature()} reaches its override check at $guard from $into, not only " +
            "from the read before it")
    }
    val read = method.sourceOrNull(guard, register)?.at?.takeIf { at ->
        at >= 0 && flow.instructions[at].opcode == Opcode.IGET_OBJECT &&
            flow.instructions[at].getReference<FieldReference>()?.definingClass == method.definingClass
    } ?: throw PatchException("$PATCH: the override check at $guard in ${method.signature()} doesn't read only the " +
        "lambda's own override")
    val action = method.overrideAction(flow, guard)!!
    if (!method.readsOwnAs(read, action.definingClass)) {
        throw PatchException("$PATCH: the override check at $guard in ${method.signature()} reads $action from " +
            "another type than the override it read at $read")
    }
    // The hook's read and call name 4-bit registers, so an override above v15 goes through a copy.
    val scratch = method.freeLocalsAt(PATCH, guard, if (register > 15) 2 else 1, excluding = listOf(register))
    return LongPressOverride(method, read, guard, register, action, scratch[0], scratch.getOrElse(1) { register })
}

/**
 * The override's long press, when [guard] is the row's null check of an override of its own: an
 * `if-nez` or `if-eqz` on a register, and on its not-null side, within a few instructions, a read
 * of that register's `Function0` field, of a type the lambda keeps a field of, tested at most one
 * other test later. 451 reads the override just before the check and its action where the check
 * jumps. 452 reads the override earlier, falls into the action and tests a boolean of the
 * override's first. Null for anything else.
 */
private fun Method.overrideAction(flow: ControlFlow, guard: Int): FieldReference? {
    val body = flow.instructions
    val check = body[guard]
    if (check.opcode != Opcode.IF_NEZ && check.opcode != Opcode.IF_EQZ) return null
    val register = (check as OneRegisterInstruction).registerA
    val held = if (check.opcode == Opcode.IF_NEZ) {
        flow.normal[guard].singleOrNull { it != guard + 1 } ?: return null
    } else {
        guard + 1
    }
    for (at in held until minOf(held + 4, body.size)) {
        val instruction = body[at]
        if (instruction.opcode != Opcode.IGET_OBJECT) continue
        val action = instruction.getReference<FieldReference>() ?: continue
        val get = instruction as TwoRegisterInstruction
        if (get.registerB != register || action.type != FUNCTION0) continue
        if (implementation == null || !ownsFieldOf(action.definingClass)) return null
        val tested = (at + 1 until minOf(at + 3, body.size)).firstOrNull { (body[it] as? OneRegisterInstruction)?.registerA == get.registerA }
            ?: return null
        val between = (at + 1 until tested).all { body[it].opcode == Opcode.IF_NEZ || body[it].opcode == Opcode.IF_EQZ }
        val test = body[tested].opcode
        return action.takeIf { between && (test == Opcode.IF_NEZ || test == Opcode.IF_EQZ) }
    }
    return null
}

/** Whether the lambda's class reads a field of its own as [type] anywhere in this method. */
private fun Method.ownsFieldOf(type: String): Boolean {
    val body = body()
    return body.indices.any { readsOwnAs(body, it, type) }
}

/**
 * Whether [at] reads a field of the lambda's own class as [type]: a field of that type, or, in a
 * lambda class 455 merged for several lambdas, an `Object` field cast to it right after.
 */
private fun Method.readsOwnAs(at: Int, type: String) = readsOwnAs(body(), at, type)

private fun Method.readsOwnAs(body: List<Instruction>, at: Int, type: String): Boolean {
    val read = body[at]
    if (read.opcode != Opcode.IGET_OBJECT) return false
    val field = read.getReference<FieldReference>() ?: return false
    if (field.definingClass != definingClass) return false
    if (field.type == type) return true
    val cast = body.getOrNull(at + 1) ?: return false
    return field.type == "Ljava/lang/Object;" && cast.opcode == Opcode.CHECK_CAST &&
        (cast as OneRegisterInstruction).registerA == (read as TwoRegisterInstruction).registerA &&
        cast.getReference<TypeReference>()?.type == type
}

/**
 * PostText's selection flag: the first `if-eqz` after [SELECTION_NOTE] in the one method holding
 * it, which tests a boolean parameter or one copy of one. Throws unless the copy reads the
 * parameter as it came in.
 */
internal fun BytecodePatchContext.selectionFlag(): SelectionFlag {
    val method = noted(SELECTION_NOTE).singleOrPatchException("$PATCH: PostText, the method holding \"$SELECTION_NOTE\"")
    val body = method.body()
    val note = body.indexOfFirst { it.isNote(SELECTION_NOTE) }
    val check = (note + 1 until body.size).firstOrNull { body[it].opcode == Opcode.IF_EQZ }
        ?: throw PatchException("$PATCH: ${method.signature()} checks nothing after its selection note")
    val register = (body[check] as OneRegisterInstruction).registerA
    fun parameterIn(held: Int) = method.parameterTypes.indices.firstOrNull { method.parameterRegisterNumber(it) == held }
    val copy = if (register >= method.localRegisterCount()) {
        check
    } else {
        val copies = (0 until check).filter { at ->
            body[at].opcode in MOVES && (body[at] as TwoRegisterInstruction).registerA == register &&
                check in method.literalReads(at)
        }
        copies.singleOrNull() ?: throw PatchException("$PATCH: ${method.signature()} fills v$register for its " +
            "selection check at $check from ${copies.size} copies, not one")
    }
    val source = if (copy == check) register else (body[copy] as TwoRegisterInstruction).registerB
    val parameter = parameterIn(source)
        ?: throw PatchException("$PATCH: the selection check at $check in ${method.signature()} reads v$source, " +
            "which isn't a parameter")
    if (method.parameterTypes[parameter].toString() != "Z") {
        throw PatchException("$PATCH: the selection check at $check in ${method.signature()} reads parameter " +
            "$parameter, a ${method.parameterTypes[parameter]}, not a boolean")
    }
    // The hook goes in first thing, so what the check reads has to be the parameter as it came in.
    method.requireParameterIntact(PATCH, parameter, listOf(copy))
    return SelectionFlag(method, parameter, copy, check)
}
