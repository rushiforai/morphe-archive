/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.doubletap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val MESSAGE_REACTIONS = "Lorg/telegram/tgnet/TLRPC\$MessageReactions;"
internal const val REACTIONS_AVAILABLE = "$MESSAGE_OBJECT->isReactionsAvailable()Z"
internal const val ENABLED_REACTIONS = "Lorg/telegram/messenger/MediaDataController;->getEnabledReactionsList()Ljava/util/List;"

/** A hook that goes in once [missing] is null, so the patch can collect both plans before changing anything. */
internal abstract class ReactionPlan(val missing: String?) {
    abstract fun apply()
}

private fun nothing(why: String) = object : ReactionPlan(why) { override fun apply() = Unit }

/**
 * The reaction row's setMessage takes (MessageObject, small, tag, resources) and clears the row's
 * buttons before it fills them from the message's reaction list. Handing it null in place of the
 * message makes it lay out as the empty row it already knows, and nothing stored is touched.
 */
internal fun BytecodePatchContext.resolveReactionRows(): ReactionPlan {
    val found = classDefsMentioning(Mention.type(MESSAGE_REACTIONS)).flatMap { cls ->
        cls.methods.filter { it.isRowSetter() }
    }
    val match = found.singleOrNull() ?: return nothing("the reaction row no longer has one setMessage method")
    val method = mutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    return object : ReactionPlan(null) {
        override fun apply() {
            method.addInstructions(
                0,
                """
                    invoke-static/range {p1 .. p3}, $DOUBLE_TAP_REACTIONS->rows(Ljava/lang/Object;ZZ)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $MESSAGE_OBJECT
                """,
            )
        }
    }
}

internal fun Method.isRowSetter(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    val parameters = parameterTypes.map { it.toString() }
    if (parameters.size != 4 || parameters[0] != MESSAGE_OBJECT || parameters[1] != "Z" || parameters[2] != "Z" ||
        !parameters[3].startsWith("L")) return false
    val body = controlBody()
    return body.any { it.controlRef() == "$MESSAGE_REACTIONS->results:Ljava/util/ArrayList;" } &&
        body.any { it.controlRef() == "Ljava/util/ArrayList;->clear()V" } &&
        body.any { it.controlRef()?.endsWith("->getChatFull(J)Lorg/telegram/tgnet/TLRPC\$ChatFull;") == true }
}

internal const val STORED_REACTIONS = "Lorg/telegram/tgnet/TLRPC\$Message;->reactions:Lorg/telegram/tgnet/TLRPC\$TL_messageReactions;"
internal const val REACTED_WITH = "AccDescrReactedWith"
private const val SPOKEN_REACTIONS = "Lorg/telegram/tgnet/TLRPC\$TL_messageReactions;"

internal fun Method.isSpokenBuilder() = name == "createAccessibilityNodeInfo" &&
    parameterTypes.map { it.toString() } == listOf("I") && returnType == "Landroid/view/accessibility/AccessibilityNodeInfo;" &&
    controlBody().any { it.controlRef() == STORED_REACTIONS } && controlBody().any { it.controlString() == REACTED_WITH }

/**
 * A chat message's accessibility node builds what TalkBack reads from the message's stored
 * reactions, not from the row, so a hidden row still read "X reacted with". Its reaction text
 * sits behind one null test of those reactions, and the hook filters the value that test reads.
 */
internal fun BytecodePatchContext.resolveReactionSpeech(): ReactionPlan {
    val found = classDefsMentioning(Mention.reference(STORED_REACTIONS) and Mention.string(REACTED_WITH)).flatMap { cls ->
        cls.methods.filter { it.isSpokenBuilder() }
    }
    val match = found.singleOrNull() ?: return nothing("the chat message's TalkBack text is no longer built in one place")
    val method = mutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    val body = method.controlBody()
    val read = body.indexOfFirst { it.controlRef() == STORED_REACTIONS }
    val test = body.getOrNull(read + 1)
    val register = (body[read] as OneRegisterInstruction).registerA
    if (test?.opcode != Opcode.IF_EQZ || (test as OneRegisterInstruction).registerA != register) {
        return nothing("the chat message's TalkBack text no longer checks its reactions before reading them")
    }
    val flow = try { ControlFlow.of(method) } catch (failure: IllegalArgumentException) {
        return nothing("the chat message's TalkBack text has a branch the patch can't follow")
    }
    val skip = flow.normal[read + 1].maxOrNull() ?: -1
    val lastSpoken = body.indexOfLast { it.controlRef() == STORED_REACTIONS }
    if (skip <= lastSpoken || body.indexOfFirst { it.controlString() == REACTED_WITH } !in read until skip) {
        return nothing("the chat message's reaction check no longer skips all of its reaction text")
    }
    val at = read + 1
    return object : ReactionPlan(null) {
        override fun apply() {
            method.addInstructionsAtControlFlowLabel(
                at,
                """
                    invoke-static/range {v$register .. v$register}, $DOUBLE_TAP_REACTIONS->spoken(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, $SPOKEN_REACTIONS
                """,
            )
        }
    }
}

internal fun Method.isMenuBuilder() =!AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" &&
    parameterTypes.map { it.toString() } == listOf("Landroid/view/View;", "Z", "Z", "F", "F", "Z", "Z", "Z") &&
    controlBody().any { it.controlRef() == REACTIONS_AVAILABLE } && controlBody().any { it.controlRef() == ENABLED_REACTIONS }

/**
 * The chat's long-press menu builder decides whether the reaction strip exists in one boolean that
 * its if/else merges after Telegram's checks: a 1 on one path, a 0 on the other, then the code
 * that reads it. The hook filters that register right at the merge, so every path in is covered.
 */
internal fun BytecodePatchContext.resolveReactionPicker(): ReactionPlan {
    val found = classDefsMentioning(Mention.reference(REACTIONS_AVAILABLE) and Mention.reference(ENABLED_REACTIONS)).flatMap { cls ->
        cls.methods.filter { it.isMenuBuilder() }
    }
    val match = found.singleOrNull() ?: return nothing("the chat's message menu builder is no longer found in one place")
    val method = mutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    val body = method.controlBody()
    val lastCall = body.indexOfLast { it.controlRef() == REACTIONS_AVAILABLE }
    val flow = try { ControlFlow.of(method) } catch (failure: IllegalArgumentException) {
        return nothing("the chat's message menu builder has a branch the patch can't follow")
    }
    var merge = -1
    var register = -1
    for (i in lastCall + 1 until body.size - 3) {
        val yes = body[i]
        val skip = body[i + 1]
        val no = body[i + 2]
        if (yes.opcode !in SMALL_CONSTS || no.opcode !in SMALL_CONSTS || skip.opcode !in GOTOS) continue
        val reg = (yes as OneRegisterInstruction).registerA
        if ((no as OneRegisterInstruction).registerA != reg) continue
        if ((yes as NarrowLiteralInstruction).narrowLiteral != 1 || (no as NarrowLiteralInstruction).narrowLiteral != 0) continue
        if (flow.normal[i + 1].singleOrNull() != i + 3) continue
        merge = i + 3
        register = reg
        break
    }
    if (merge < 0) return nothing("the chat's message menu builder no longer ends its reaction check with a true/false merge")
    val readers = body.drop(merge).count { it.opcode in TESTS && (it as OneRegisterInstruction).registerA == register }
    if (readers < 2) return nothing("the chat's message menu builder no longer reads the reaction answer more than once")
    val at = merge
    val reg = register
    return object : ReactionPlan(null) {
        override fun apply() {
            method.addInstructionsAtControlFlowLabel(
                at,
                """
                    invoke-static/range {v$reg .. v$reg}, $DOUBLE_TAP_REACTIONS->picker(Z)Z
                    move-result v$reg
                """,
            )
        }
    }
}

private val SMALL_CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16)
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val TESTS = setOf(Opcode.IF_EQZ, Opcode.IF_NEZ)

