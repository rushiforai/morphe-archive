package io.github.jordanwoodson.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.shared.requireKept
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

// Hook points shared by Chat keywords and Chat appearance. Each patch adds its own calls at the same points, so
// either works alone; their extension classes agree on who paints a row's background.

/** A live chat line's render model and the fields the hooks read: message ID, sender, tokens and the sender's badges. */
internal class LiveChatLine(
    val type: String, val id: FieldReference, val sender: FieldReference, val tokens: FieldReference, val badges: FieldReference,
)

internal fun BytecodePatchContext.liveChatLine(): LiveChatLine {
    val method = LiveChatLineFingerprint.twitchMatch("live chat message").method
    val line = LiveChatLine(method.definingClass, method.printedField("LiveChatMessage(messageId="),
        method.printedField(", sender="), method.printedField(", messageTokens="), method.printedField(", senderBadges="))
    if (line.id.type != "Ljava/lang/String;" || line.tokens.type != "Ljava/util/List;" || line.badges.type != "Ljava/util/List;") {
        throw PatchException("Twitch: unexpected live chat message fields")
    }
    return line
}

/**
 * The native chat line builder, checked against the models it takes: the sender (parameter 3), the message ID
 * (9), the message style (11) and the line's click configuration (13), and the span group it returns.
 */
internal fun BytecodePatchContext.chatLineBuilder(): MutableMethod {
    val method = ChatLineBuilderFingerprint.twitchMatch("chat line builder").method
    val spans = ChatLineSpansFingerprint.twitchMatch("chat line span group").classDef.type
    val sender = ChatLineSenderFingerprint.twitchMatch("chat line sender").classDef.type
    val config = ChatLineItemFingerprint.twitchMatch("chat line item").method.parameterTypes[2].toString()
    val types = method.parameterTypes.map { it.toString() }
    if (method.returnType != spans || types.size != 21 || types[3] != sender || types[9] != "Ljava/lang/String;" ||
        types[13] != config || types[8] != "Z" || classDefBy(types[11]).let { AccessFlags.ABSTRACT.isSet(it.accessFlags) }.not()) {
        throw PatchException("Twitch: the chat line builder changed")
    }
    // The hooks at its start use v0-v3, unset there.
    method.requireLocals(4)
    return method
}

/** The index of the span group constructor at the end of the line builder, and its first register. */
internal fun MutableMethod.spanGroupConstructor(): Pair<Int, Int> {
    val instructions = instructionList()
    val index = instructions.indices.singleOrNull {
        instructions[it].opcode == Opcode.INVOKE_DIRECT_RANGE && instructions[it].methodRef?.let { init ->
            init.definingClass == returnType && init.name == "<init>" && init.parameterTypes.size == 6
        } == true
    } ?: throw PatchException("Twitch: no chat line span group constructor")
    requireNotBranchTarget(index, "chat line span group constructor")
    // this, timestamp, badges, sender, inline header, message, isRTL.
    return index to (instructions[index] as RegisterRangeInstruction).startRegister
}

/**
 * Calls [method] (static, (Landroid/view/View;Landroid/widget/TextView;)V) with a chat line's row and its text
 * view once the row is bound, in native chat (live and history) and in VOD chat replay. The row is the view whose
 * background Twitch sets: null or transparent unless the line is selected or pressed.
 */
internal fun BytecodePatchContext.hookChatRows(method: String) {
    // Native chat: before each return of the binder; each comes right after the row's background is set.
    ChatRowBinderFingerprint.twitchMatch("chat row binder").method.apply {
        val instructions = instructionList()
        val appearance = instructions.indexOfFirst {
            it.methodRef?.let { ref -> ref.definingClass == "Landroid/widget/TextView;" && ref.name == "setTextAppearance" } == true
        }
        if (appearance < 0) throw PatchException("Twitch: chat row binder sets no text appearance")
        val textRegister = (instructions[appearance] as FiveRegisterInstruction).registerC
        val text = (appearance downTo 0).firstNotNullOfOrNull { i ->
            instructions[i].takeIf {
                it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == textRegister
            }?.fieldRef
        }?.takeIf { it.definingClass == definingClass && it.type == "Landroid/widget/TextView;" }
            ?: throw PatchException("Twitch: chat row binder's text view isn't its own field")
        // The binder ends three ways: selected in overlay mode, selected, and not selected, each right after
        // setting the row's background, or after the other chat patch's call with the row. (A fourth return
        // follows the throw for an unknown chat mode.)
        val returns = instructions.indices.filter { index ->
            instructions[index].opcode == Opcode.RETURN_VOID && instructions[index - 1].let {
                it.opcode == Opcode.INVOKE_VIRTUAL && it.methodRef?.definingClass == "Landroid/view/View;" &&
                    it.methodRef?.name in setOf("setBackground", "setBackgroundColor") || it.isRowHook()
            }
        }
        if (returns.size != 3) throw PatchException("Twitch: chat row binder doesn't end with the row background")
        returns.reversed().forEach { index ->
            requireNotBranchTarget(index, "chat row binder return")
            val row = (instructions[index - 1] as FiveRegisterInstruction).registerC
            val scratch = (0..15).first { it != row }
            if (row > 15) throw PatchException("Twitch: chat row register out of range")
            // Only return-void follows, so every register but the row is free.
            addInstructions(index, """
                move-object/from16 v$scratch, p0
                iget-object v$scratch, v$scratch, $text
                invoke-static { v$row, v$scratch }, $method
            """)
        }
    }
    // VOD chat replay: right after the row's pressed or transparent background is set.
    ReplayRowBinderFingerprint.twitchMatch("chat replay row binder").method.apply {
        val instructions = instructionList()
        val setText = instructions.indices.single {
            instructions[it].methodRef?.let { ref -> ref.definingClass == "Landroid/widget/TextView;" && ref.name == "setText" } == true
        }
        val background = instructions.indices.single {
            instructions[it].methodRef?.let { ref -> ref.definingClass == "Landroid/view/View;" && ref.name == "setBackgroundColor" } == true
        }
        val text = (instructions[setText] as FiveRegisterInstruction).registerC
        val row = (instructions[background] as FiveRegisterInstruction).registerC
        if (background < setText || text > 15 || row > 15 || text == row) {
            throw PatchException("Twitch: unexpected chat replay row registers")
        }
        requireKept(setText, background + 1, text, "chat replay text view")
        requireNotBranchTarget(background + 1, "chat replay row background")
        addInstructions(background + 1, "invoke-static { v$row, v$text }, $method")
    }
}

/** A call [hookChatRows] added, whose first register is the row. */
private fun Instruction.isRowHook() = opcode == Opcode.INVOKE_STATIC && methodRef?.let {
    it.definingClass.startsWith("Lio/github/jordanwoodson/extension/") && it.returnType == "V" &&
        it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/view/View;", "Landroid/widget/TextView;")
} == true

/** The chat list's feeder: takes every chat list event and appends live messages to the list. */
internal fun chatListFeederFingerprint(line: LiveChatLine, parent: String) = Fingerprint(
    returnType = "V",
    parameters = listOf(parent),
    custom = { method, classDef ->
        classDef.fields.any { it.type == "Landroid/content/ContextWrapper;" } &&
            method.implementation?.instructions?.any { it.opcode == Opcode.INSTANCE_OF && it.typeRef == line.type } == true
    },
)

/**
 * The field a toString prints right after [label]: the first object field of this class read after the label's
 * constant, from this.
 */
internal fun MutableMethod.printedField(label: String): FieldReference {
    val instructions = instructionList()
    val at = instructions.indexOfFirst { it.stringRef == label }
    if (at < 0) throw PatchException("Twitch: no \"$label\" in $definingClass")
    val read = instructions.drop(at + 1).firstOrNull { it.opcode == Opcode.IGET_OBJECT }
        ?: throw PatchException("Twitch: nothing printed after \"$label\"")
    val field = read.fieldRef!!
    // toString has no parameters, so this is the last register.
    if (field.definingClass != definingClass || (read as TwoRegisterInstruction).registerB != implementation!!.registerCount - 1) {
        throw PatchException("Twitch: \"$label\" isn't followed by its own field")
    }
    return field
}
