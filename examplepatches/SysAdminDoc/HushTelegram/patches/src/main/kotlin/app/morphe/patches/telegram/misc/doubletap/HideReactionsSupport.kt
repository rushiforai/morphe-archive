/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.doubletap

import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val MESSAGE_REACTIONS = "Lorg/telegram/tgnet/TLRPC\$MessageReactions;"
internal const val REACTIONS_AVAILABLE = "$MESSAGE_OBJECT->isReactionsAvailable()Z"
internal const val ENABLED_REACTIONS = "Lorg/telegram/messenger/MediaDataController;->getEnabledReactionsList()Ljava/util/List;"
internal const val MESSAGE_GROUP_ID = "$MESSAGE_OBJECT->getGroupId()J"
internal const val PREMIUM_BLOCKED = "Lorg/telegram/messenger/MessagesController;->premiumFeaturesBlocked()Z"
internal const val EMOJI_PACK_PLURAL = "MessageContainsEmojiPacks"

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
    val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    return object : ReactionPlan(null) {
        override fun apply() {
            method.addInstructions(
                0,
                if (method.parameterTypes.size == 4) """
                    invoke-static/range {p1 .. p3}, $DOUBLE_TAP_REACTIONS->rows(Ljava/lang/Object;ZZ)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $MESSAGE_OBJECT
                """ else """
                    move-object/from16 v0, p1
                    move/from16 v1, p2
                    const/4 v2, 0x0
                    invoke-static {v0, v2, v1}, $DOUBLE_TAP_REACTIONS->rows(Ljava/lang/Object;ZZ)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $MESSAGE_OBJECT
                """,
            )
        }
    }
}

/**
 * setMessage(message, small, tag, resources), or 13.2's (message, tag, resources), where R8 dropped
 * the small flag the row no longer reads. The 13.2 hook hands the extension a clear small flag
 * through three of the setter's own locals, which it writes before reading anyway.
 */
internal fun Method.isRowSetter(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    val parameters = origParameterTypes
    val full = parameters.size == 4 && parameters[0] == MESSAGE_OBJECT && parameters[1] == "Z" && parameters[2] == "Z" && parameters[3].startsWith("L")
    val dropped = parameters.size == 3 && parameters[0] == MESSAGE_OBJECT && parameters[1] == "Z" && parameters[2].startsWith("L") &&
        (implementation?.registerCount ?: 0) - 4 >= 3
    if (!full && !dropped) return false
    val body = controlBody()
    return body.any { it.controlRef() == "$MESSAGE_REACTIONS->results:Ljava/util/ArrayList;" } &&
        body.any { it.controlRef() == "Ljava/util/ArrayList;->clear()V" } &&
        body.any { it.controlRef()?.endsWith("->getChatFull(J)Lorg/telegram/tgnet/TLRPC\$ChatFull;") == true }
}

internal const val PEER_REACTION = "Lorg/telegram/tgnet/TLRPC\$MessagePeerReaction;"
internal const val PEER_REACTION_UNREAD = "$PEER_REACTION->unread:Z"

/**
 * The row's "has unread reactions" flag: the boolean field of the row's own class that setMessage
 * writes right after its last read of a recent reaction's unread flag, and also clears up front.
 */
internal fun Method.unreadFlag(): FieldReference? {
    val body = controlBody()
    fun own(i: Instruction) = i.opcode == Opcode.IPUT_BOOLEAN &&
        ((i as ReferenceInstruction).reference as FieldReference).definingClass == definingClass
    val read = body.indexOfLast { it.controlRef() == PEER_REACTION_UNREAD }
    if (read < 0) return null
    val write = body.drop(read + 1).firstOrNull(::own) ?: return null
    val flag = (write as ReferenceInstruction).reference as FieldReference
    val writes = body.count { own(it) && ((it as ReferenceInstruction).reference as FieldReference).name == flag.name }
    return flag.takeIf { writes >= 2 }
}

/**
 * A hidden row is handed no message, so setMessage leaves its unread flag false, and the chat marks
 * a message's reactions seen only once its row says it has unread ones: the heart in the chat list
 * and the chat's reactions button never went away. Before each return the hook hands the flag to the
 * extension, which answers for the message the row hid.
 */
internal fun BytecodePatchContext.resolveHiddenRowUnread(): ReactionPlan {
    val found = classDefsMentioning(Mention.type(MESSAGE_REACTIONS)).flatMap { cls ->
        cls.methods.filter { it.isRowSetter() }
    }
    val match = found.singleOrNull() ?: return nothing("the reaction row no longer has one setMessage method")
    val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    val flag = method.unreadFlag() ?: return nothing("the reaction row no longer keeps its unread reactions in one flag")
    if (method.localRegisterCount() < 2) return nothing("the reaction row's setMessage has no two locals for the unread reactions hook")
    if (method.controlBody().none { it.opcode == Opcode.RETURN_VOID }) return nothing("the reaction row's setMessage no longer returns")
    val field = "${flag.definingClass}->${flag.name}:Z"
    return object : ReactionPlan(null) {
        override fun apply() {
            // The rows hook goes in first, so the returns are found again here, and taken last first.
            val body = method.controlBody()
            for (at in body.indices.filter { body[it].opcode == Opcode.RETURN_VOID }.reversed()) {
                method.addInstructionsAtControlFlowLabel(
                    at,
                    """
                        move-object/from16 v1, p0
                        iget-boolean v0, v1, $field
                        invoke-static {v0}, $DOUBLE_TAP_REACTIONS->unreadRow(I)Z
                        move-result v0
                        iput-boolean v0, v1, $field
                    """,
                )
            }
        }
    }
}

/**
 * The chat plays a reaction's animation over its row for MessageObject.getRandomUnreadReaction(),
 * when the message scrolls in and when a reaction arrives. A hidden row has nothing to play it over,
 * so the hook answers null first, the way a message with no recent reactions does.
 */
internal fun BytecodePatchContext.resolveReactionEffect(): ReactionPlan {
    val method = tgMutableClassDefByOrNull(MESSAGE_OBJECT)?.methods?.filter {
        it.origName == "getRandomUnreadReaction" && it.origParameterTypes.isEmpty() && it.origReturnType == PEER_REACTION
    }?.singleOrNull() ?: return nothing("MessageObject no longer has one getRandomUnreadReaction method")
    if (method.implementation == null || method.localRegisterCount() < 1) return nothing("getRandomUnreadReaction has no local for the hook")
    return object : ReactionPlan(null) {
        override fun apply() = method.returnEarlyWhen("Disable double-tap reactions",
            "$DOUBLE_TAP_REACTIONS->hideEffect()Z", "const/4 v0, 0x0\nreturn-object v0")
    }
}

internal const val STORED_REACTIONS = "Lorg/telegram/tgnet/TLRPC\$Message;->reactions:Lorg/telegram/tgnet/TLRPC\$TL_messageReactions;"
internal const val REACTED_WITH = "AccDescrReactedWith"
private const val SPOKEN_REACTIONS = "Lorg/telegram/tgnet/TLRPC\$TL_messageReactions;"

internal fun Method.isSpokenBuilder() = name == "createAccessibilityNodeInfo" &&
    origParameterTypes == listOf("I") && returnType == "Landroid/view/accessibility/AccessibilityNodeInfo;" &&
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
    val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
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

/** 13.2 inlines getEnabledReactionsList, so the builder reads the list's field instead. */
internal const val ENABLED_REACTIONS_FIELD = "Lorg/telegram/messenger/MediaDataController;->enabledReactionsList:Ljava/util/ArrayList;"
private val ENABLED_REACTIONS_READS = setOf(ENABLED_REACTIONS, ENABLED_REACTIONS_FIELD)
private val MENU_BUILDER_MENTION get() = Mention.reference(REACTIONS_AVAILABLE) and Mention.anyReference(ENABLED_REACTIONS_READS)

internal fun Method.isMenuBuilder() =!AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" &&
    origParameterTypes == listOf("Landroid/view/View;", "Z", "Z", "F", "F", "Z", "Z", "Z") &&
    controlBody().any { it.controlRef() == REACTIONS_AVAILABLE } && controlBody().any { it.controlRef() in ENABLED_REACTIONS_READS }

/**
 * The chat's long-press menu builder decides whether the reaction strip exists in one boolean that
 * its if/else merges after Telegram's checks: a 1 on one path, a 0 on the other, then the code
 * that reads it. The hook filters that register right at the merge, so every path in is covered.
 */
internal fun BytecodePatchContext.resolveReactionPicker(): ReactionPlan {
    val found = classDefsMentioning(MENU_BUILDER_MENTION).flatMap { cls ->
        cls.methods.filter { it.isMenuBuilder() }
    }
    val match = found.singleOrNull() ?: return nothing("the chat's message menu builder is no longer found in one place")
    val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
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

internal fun Method.isSelectionSetter() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    origParameterTypes == listOf("Ljava/util/List;") && controlBody().any { it.controlRef() == MESSAGE_GROUP_ID }

/**
 * The bubble of reactions over a selected message lives in its own overlay, away from the long-press
 * menu. Its one setter takes the selected messages and decides to show itself only when the list
 * isn't empty, so handing it an empty list keeps it hidden. The chat's own selection isn't touched.
 */
internal fun BytecodePatchContext.resolveReactionSelection(): ReactionPlan {
    val found = classDefsMentioning(Mention.reference(MESSAGE_GROUP_ID)).flatMap { cls ->
        cls.methods.filter { it.isSelectionSetter() }
    }
    val match = found.singleOrNull() ?: return nothing("the selection's reaction bubble no longer has one setter")
    val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    return object : ReactionPlan(null) {
        override fun apply() {
            method.addInstructions(
                0,
                """
                    invoke-static/range {p1 .. p1}, $DOUBLE_TAP_REACTIONS->selection(Ljava/util/List;)Ljava/util/List;
                    move-result-object p1
                """,
            )
        }
    }
}

/**
 * Where the long-press menu adds the emoji pack line: the premium-blocked test right before the line
 * is made. Returns that call's index, or -1 unless its result goes straight to an if-nez that skips
 * past the line. The patch applies other hooks to this method, so apply() looks it up again.
 */
private fun Method.packNoteCall(button: String): Int {
    val body = controlBody()
    val made = body.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == button }
    if (made < 0) return -1
    val call = (made downTo maxOf(made - 24, 0)).firstOrNull { body[it].controlRef() == PREMIUM_BLOCKED } ?: return -1
    val result = body[call + 1]
    val test = body[call + 2]
    if (result.opcode != Opcode.MOVE_RESULT || test.opcode != Opcode.IF_NEZ) return -1
    if ((result as OneRegisterInstruction).registerA != (test as OneRegisterInstruction).registerA) return -1
    val skip = try { ControlFlow.of(this).normal[call + 2].maxOrNull() ?: -1 } catch (failure: IllegalArgumentException) { -1 }
    return if (skip > made) call else -1
}

/**
 * The "this message contains emoji from" line goes in behind a test of premiumFeaturesBlocked(),
 * because a client with premium blocked already leaves it out along with its divider. The hook answers
 * that one test, so the line goes the way stock takes it away. Premium itself is never asked again here.
 */
internal fun BytecodePatchContext.resolveEmojiPackNote(): ReactionPlan {
    val button = classDefsMentioning(Mention.string(EMOJI_PACK_PLURAL)).filter { cls ->
        cls.methods.any { method -> method.controlBody().any { it.controlString() == EMOJI_PACK_PLURAL } }
    }.singleOrNull()?.type
        ?: return nothing("the emoji pack line is no longer built by one class")
    val found = classDefsMentioning(MENU_BUILDER_MENTION).flatMap { cls ->
        cls.methods.filter { it.isMenuBuilder() }
    }
    val match = found.singleOrNull() ?: return nothing("the chat's message menu builder is no longer found in one place")
    val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    if (method.packNoteCall(button) < 0) return nothing("the chat's message menu no longer tests premium right before the emoji pack line")
    return object : ReactionPlan(null) {
        override fun apply() {
            val call = method.packNoteCall(button)
            val register = (method.controlBody()[call + 1] as OneRegisterInstruction).registerA
            method.addInstructions(
                call + 2,
                """
                    invoke-static/range {v$register .. v$register}, $DOUBLE_TAP_REACTIONS->packNote(I)Z
                    move-result v$register
                """,
            )
        }
    }
}

private val SMALL_CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16)
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val TESTS = setOf(Opcode.IF_EQZ, Opcode.IF_NEZ)

