/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 454 (2026-11-05).
 */
package app.morphe.patches.threads.feed.posttime

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Show exact post times"
internal const val POST_TIME = "$EXTENSION_PACKAGE/feed/PostTime;"
internal const val EXACT = "$POST_TIME->exact(Landroid/content/Context;D)Ljava/lang/String;"
internal const val SPOKEN = "$POST_TIME->spoken(Ljava/lang/String;Landroid/content/Context;D)Ljava/lang/String;"

/** The source note Threads' post header time composable carries. Its line number is left off. */
internal const val POST_TIMESTAMP_NOTE = "com.instagram.barcelona.feed.post.ui.PostHeaderTimestamp (PostTimestamp.kt:"

/** What the formatter builds from a post's time before Threads writes it out as a date. */
internal const val DATE_FROM_MILLIS = "Ljava/util/Date;-><init>(J)V"

/** The formatter's own parameters and answer: the context and the post's time in seconds, to the header's text. */
private val FORMATTER_PARAMETERS = listOf("Landroid/content/Context;", "D")
private const val FORMATTER_RETURNS = "Ljava/lang/String;"

/**
 * Shows a post's date and time in its header instead of "3h" or "2d".
 *
 * Threads writes a post header's time in one static function next to the header's composable,
 * which takes the context and the post's time in seconds: a post from the last few days gets
 * "3h" or "2d", an older one a date. The feed, an opened post and replies all call it. The
 * extension is asked first thing, and while the switch is on it answers the date and time, which
 * the function returns. A null answer goes on to Threads' own code, as it would without the patch.
 *
 * TalkBack reads an older post's header text as it's shown, but a recent post's spoken time ("3
 * hours ago") comes from another class's formatter, which the DM inbox and activity feed use too.
 * Only the composable's own call to it is changed: its answer goes through the extension, which
 * hands back the header's text while the switch is on and Threads' description otherwise.
 *
 * The composable is found by its source note, which exactly one method may hold, and the function
 * is the one call it makes to a method of its own class taking a context and a double and
 * answering a string. The spoken time is its one call of that shape into another class. The patch
 * refuses rather than guessing when there's more than one of either call, when the function isn't
 * static or doesn't build a date from the time, or when the spoken time's answer isn't kept in a
 * register it can reach.
 */
@Suppress("unused")
val exactPostTimesPatch = bytecodePatch(
    name = PATCH,
    description = "Posts and replies show the date and time they went up instead of 3h or 2d, in your " +
        "phone's 12 or 24-hour format. Good if you want to know exactly when something was posted. " +
        "Starts off. Turn it on in HushThreads settings > Posts.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("exactPostTimes")
        val composable = postTimestampComposable()
        val formatter = postTimeFormatter(composable)
        formatter.requireLocals(PATCH, 1)
        val spoken = composable.spokenTimeCall()
        composable.addInstructions(
            spoken.insertAt,
            """
                invoke-static { v${spoken.result}, v${spoken.context}, v${spoken.low}, v${spoken.high} }, $SPOKEN
                move-result-object v${spoken.result}
            """,
        )
        formatter.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p2 }, $EXACT
                move-result-object v0
                if-eqz v0, :threads
                return-object v0
            """,
            ExternalLabel("threads", formatter.getInstruction(0)),
        )
        enableStatus("exactPostTimes")
    }
}

/** A method's full signature. A Method is a MethodReference too. */
private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Instruction.isPostTimestampNote(): Boolean =
    opcode == Opcode.CONST_STRING && getReference<StringReference>()?.string?.startsWith(POST_TIMESTAMP_NOTE) == true

private fun MethodReference.isFormatterShape(): Boolean =
    parameterTypes.map { it.toString() } == FORMATTER_PARAMETERS && returnType == FORMATTER_RETURNS

/** The post header's time composable: the one method outside the extension that holds [POST_TIMESTAMP_NOTE]. */
internal fun BytecodePatchContext.postTimestampComposable(): MutableMethod =
    classDefByStrings(POST_TIMESTAMP_NOTE, StringComparisonType.STARTS_WITH)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .distinctBy { it.signature() }
        // Read through the mutable copy, so what's checked is what the patch changes.
        .map { mutableClassDefBy(it.definingClass).findMutableMethodOf(it) }
        .filter { method -> method.implementation?.instructions?.any { it.isPostTimestampNote() } == true }
        .singleOrPatchException("$PATCH: the post header time's \"$POST_TIMESTAMP_NOTE\" note")

/**
 * The function [postTimestampComposable] has write its time: its one static call into its own class
 * that takes a context and a double and answers a string. Throws unless that function is static and
 * builds a [DATE_FROM_MILLIS] date.
 */
internal fun BytecodePatchContext.postTimeFormatter(composable: MutableMethod = postTimestampComposable()): MutableMethod {
    val calls = composable.implementation!!.instructions
        .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .mapNotNull { it.getReference<MethodReference>() }
        .filter { it.definingClass == composable.definingClass && it.isFormatterShape() }
        .distinctBy { it.signature() }
    val call = calls.singleOrPatchException("$PATCH: the call ${composable.signature()} makes to write its time")
    val formatter = mutableClassDefBy(call.definingClass).methods.singleOrNull { it.signature() == call.signature() }
        ?: throw PatchException("$PATCH: ${call.signature()} isn't defined in ${call.definingClass}")
    if (!AccessFlags.STATIC.isSet(formatter.accessFlags)) {
        throw PatchException("$PATCH: ${formatter.signature()} isn't static")
    }
    val buildsDate = formatter.implementation?.instructions?.any {
        it.opcode == Opcode.INVOKE_DIRECT && it.getReference<MethodReference>()?.signature() == DATE_FROM_MILLIS
    } == true
    if (!buildsDate) {
        throw PatchException("$PATCH: ${formatter.signature()} doesn't build a date from the post's time")
    }
    return formatter
}

private val CALLS = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC_RANGE)

/**
 * Where a recent post's spoken time is written: [insertAt] is right after the move-result that
 * keeps it in [result], and the call got the context in [context] and the time in [low] and [high].
 */
internal class SpokenTimeCall(val insertAt: Int, val result: Int, val context: Int, val low: Int, val high: Int)

/**
 * The composable's one call into another class that takes a context and a double and answers a
 * string, with the move-result after it. Throws unless there's exactly one, its answer is kept,
 * and every register the hook names fits a plain invoke.
 */
internal fun MutableMethod.spokenTimeCall(): SpokenTimeCall {
    val body = implementation!!.instructions.toList()
    val index = body.indices.filter { i ->
        val reference = body[i].getReference<MethodReference>()
        body[i].opcode in CALLS && reference != null && reference.definingClass != definingClass && reference.isFormatterShape()
    }.singleOrPatchException("$PATCH: the call ${signature()} makes for a recent post's spoken time")
    val call = body[index] as? FiveRegisterInstruction
        ?: throw PatchException("$PATCH: the spoken time call in ${signature()} takes its registers as a range")
    val kept = body.getOrNull(index + 1)
    if (kept?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("$PATCH: ${signature()} doesn't keep the spoken time it gets")
    }
    val arguments = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)
        .take(call.registerCount).takeLast(3)
    val result = (kept as OneRegisterInstruction).registerA
    if ((arguments + result).any { it > 15 }) {
        throw PatchException("$PATCH: the spoken time in ${signature()} sits in a register past v15")
    }
    return SpokenTimeCall(index + 2, result, arguments[0], arguments[1], arguments[2])
}
