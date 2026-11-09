/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.paste

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCallable
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.util.RegisterKind
import app.morphe.util.RegisterKinds
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val MENTION_BY_ID = "$EXTENSION_PACKAGE/misc/MentionById;"
private const val OBJECT = "Ljava/lang/Object;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val MEDIA_DATA = "Lorg/telegram/messenger/MediaDataController;"
private val ENTITIES_PARAMETERS = listOf("[Ljava/lang/CharSequence;", "Z", "Z")

internal const val ADD_MENTIONS = "$MENTION_BY_ID->add($OBJECT$OBJECT$OBJECT)$ARRAY_LIST"

/**
 * The end of `MediaDataController.getEntities(CharSequence[], boolean, boolean)`, where a typed
 * message's entities leave it. The hook only runs when the last argument is true: that's what the
 * two-argument form the message box, captions and drafts call has always passed, and the two places
 * that call this one straight pass false.
 */
internal class MentionSite(
    val method: MutableMethod, val index: Int, val register: Int,
    val controller: Int, val text: Int, val gate: Int,
) {
    /** v0 to v2 carry the call; at the method's last return nothing but the result is read again. */
    fun code() = buildString {
        appendLine("if-eqz v$gate, :hush_keep")
        if (register != 2) appendLine("move-object/from16 v2, v$register")
        appendLine("move-object/from16 v0, v$controller")
        appendLine("move-object/from16 v1, v$text")
        appendLine("invoke-static/range {v0 .. v2}, $ADD_MENTIONS")
        appendLine("move-result-object v$register")
        appendLine(":hush_keep")
        append("nop")
    }

    fun insert() = method.addInstructionsAtControlFlowLabel(index, code())

    /** The same edit on a copy, so a register or smali problem shows before the app is touched. */
    fun rehearse() = MutableMethod(ImmutableMethod.of(method)).addInstructionsAtControlFlowLabel(index, code())
}

/**
 * Telegram 13.2's R8 folded the two-argument `getEntities` into its callers, so the hook sits in the
 * three-argument one, in front of its last `return-object`. That return gives back the list; any
 * other return in the method only gives back null. `this`, the text array and the last flag are
 * never written in the body, so at the end they still hold what the caller passed.
 */
internal fun BytecodePatchContext.resolveMentionById(): MentionSite {
    controlHook(MENTION_BY_ID, "add", listOf(OBJECT, OBJECT, OBJECT), ARRAY_LIST)
    val owner = tgMutableClassDefByOrNull(MEDIA_DATA)
    controlShape(owner != null, "the media controller is missing")
    val method = owner!!.methods.filter { candidate ->
        candidate.origName == "getEntities" && candidate.origParameterTypes == ENTITIES_PARAMETERS &&
            candidate.origReturnType == ARRAY_LIST
    }.controlSingle("the message entities method")
    controlShape(method.controlCallable(false), "the message entities method is not public")
    val body = method.controlBody()
    val last = body.size - 1
    val result = body.getOrNull(last)?.takeIf { it.opcode == Opcode.RETURN_OBJECT }?.namedRegisters()?.singleOrNull()
    controlShape(result != null, "the message entities method no longer ends on its list")
    val kinds = RegisterKinds.of(method)
    controlShape(body.indices.all { it == last || body[it].opcode != Opcode.RETURN_OBJECT ||
        kinds.at(it)?.getOrNull(body[it].namedRegisters().single())?.tag == RegisterKind.Tag.ZERO },
        "the message entities method returns its list in more than one place")
    val text = method.parameterRegisterNumber(0)
    val controller = text - 1
    val gate = method.parameterRegisterNumber(2)
    controlShape(controller >= 3 && gate <= 255, "the message entities method has no room for the hook")
    controlShape(body.none { instruction -> instruction.opcode.setsRegister() &&
        instruction.namedRegisters().firstOrNull().let { it == controller || it == text || it == gate ||
            instruction.opcode.setsWideRegister() && it != null && (it + 1 == controller || it + 1 == text || it + 1 == gate) } },
        "the message entities method writes over its own arguments")
    return MentionSite(method, last, result!!, controller, text, gate).also { it.rehearse() }
}
