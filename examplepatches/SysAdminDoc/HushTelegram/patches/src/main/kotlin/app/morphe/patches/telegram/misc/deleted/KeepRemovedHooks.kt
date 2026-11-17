/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.liveAcrossInjection
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.restrictions.CantOpenAlert
import app.morphe.patches.telegram.misc.restrictions.cantOpenAlert
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val KEEP_REMOVED = "$EXTENSION_PACKAGE/misc/KeepRemoved;"
internal const val REMOVED_REMOVING = "$KEEP_REMOVED->removing(Ljava/lang/Object;IJI)V"
internal const val REMOVED_NOT_IN_CHAT = "$KEEP_REMOVED->notInChat(Ljava/lang/Object;)Z"
internal const val REMOVED_CANT_OPEN = "$KEEP_REMOVED->cantOpen(Ljava/lang/Object;)Z"
internal const val REMOVED_DELETING = "$KEEP_REMOVED->deleting(JII)V"

private const val REMOVED_OBJECT = "Ljava/lang/Object;"
private const val REMOVED_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
internal const val REMOVED_IS_NOT_IN_CHAT = "Lorg/telegram/messenger/ChatObject;->isNotInChat($REMOVED_CHAT)Z"
internal const val REMOVED_GET_CHAT = "$MESSAGES_CONTROLLER->getChat(Ljava/lang/Long;)$REMOVED_CHAT"

/** MessagesController's whole delete, which every other deleteDialog ends in. */
internal const val REMOVED_DELETE_DIALOG = "$MESSAGES_CONTROLLER->deleteDialog(JIIIZLorg/telegram/tgnet/TLRPC\$InputPeer;J)V"
internal const val REMOVED_DIALOGS = "Lorg/telegram/tgnet/TLRPC\$messages_Dialogs;->dialogs:Ljava/util/ArrayList;"
private const val UPDATE_CHANNEL = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateChannel;"
private const val UPDATE_CHAT = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateChat;"
private const val SHOWN_DIALOG = "Landroid/app/Dialog;"

/**
 * Where Keep chats you're removed from goes in: [forwarder] is deleteDialog(did, onlyHistory,
 * revoke), which R8 left as `(I J Z)` with no name of its own; [updates] calls it at [deletes],
 * once where an updated channel no longer has you and once for a basic group. [lists] are the
 * chat list's loads, whose not-in-chat checks sit at [checks]. [alert] is the chat screen's
 * can't-open alert, which the hook skips to [kept]; [delete] the whole delete, hooked at its start.
 */
internal class KeepRemovedPlan(
    val forwarder: Method?,
    val updates: MutableMethod?,
    val deletes: List<Int>,
    val lists: List<MutableMethod>,
    val checks: List<List<Int>>,
    val alert: CantOpenAlert?,
    val kept: Int,
    val delete: MutableMethod?,
    val missing: String?,
)

private class RemovedUnbuilt(why: String) : Exception(why)

private fun removedNeed(ok: Boolean, why: String) {
    if (!ok) throw RemovedUnbuilt(why)
}

/**
 * Telegram deletes a group or channel, saved messages and all, where processUpdateArray learns the
 * chat no longer has you (an updated channel you're not in, a basic group that reads forbidden or
 * kicked), and drops such a chat wherever the chat list loads. The switch asks the extension at
 * each of those, at the chat screen's can't-open alert, whose dismissal deletes the chat too, and
 * at the start of the delete, so a kept chat deleted from the chat list leaves the list it's kept
 * in. A build where any of it moved keeps the rest of Keep deleted messages, without the switch.
 */
internal fun BytecodePatchContext.resolveKeepRemovedChats(): KeepRemovedPlan {
    requireStatusMethod("keepRemovedChats")
    controlHook(KEEP_REMOVED, "removing", listOf(REMOVED_OBJECT, "I", "J", "I"), "V")
    controlHook(KEEP_REMOVED, "notInChat", listOf(REMOVED_OBJECT), "Z")
    controlHook(KEEP_REMOVED, "cantOpen", listOf(REMOVED_OBJECT), "Z")
    controlHook(KEEP_REMOVED, "deleting", listOf("J", "I", "I"), "V")
    controlHook(KEEP_REMOVED, "chat", listOf(REMOVED_OBJECT, "J"), REMOVED_OBJECT)
    controlHook(KEEP_REMOVED, "chatState", listOf(REMOVED_OBJECT), "I")
    controlHook(KEEP_REMOVED, "chatId", listOf(REMOVED_OBJECT), "J")
    controlHook(KEEP_REMOVED, "stockNotInChat", listOf(REMOVED_OBJECT), "Z")
    controlHook(KEEP_REMOVED, "stockDelete", listOf(REMOVED_OBJECT, "I", "J", "I"), "V")
    controlHook(KEEP_REMOVED, "screenChat", listOf(REMOVED_OBJECT), REMOVED_OBJECT)
    return try {
        requireReachable(REMOVED_IS_NOT_IN_CHAT, true)
        requireReachable(REMOVED_GET_CHAT, false)
        controlMembers(REMOVED_CHAT, "id:J", "kicked:Z", "left:Z", "deactivated:Z", "migrated_to:Lorg/telegram/tgnet/TLRPC\$InputChannel;")
        for (type in listOf("TL_chatForbidden", "TL_channelForbidden", "TL_chatEmpty")) controlMembers("Lorg/telegram/tgnet/TLRPC\$$type;")
        val controller = tgMutableClassDefBy(MESSAGES_CONTROLLER)
        val delete = controller.methods.filter {
            it.origName == "deleteDialog" && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.origParameterTypes == listOf("J", "I", "I", "I", "Z", "Lorg/telegram/tgnet/TLRPC\$InputPeer;", "J") && it.origReturnType == "V"
        }
        removedNeed(delete.size == 1, "MessagesController.deleteDialog is missing or ambiguous (${delete.size} found)")
        val forwarders = controller.methods.filter { it.isDeleteForwarder() }
        removedNeed(forwarders.size == 1, "deleteDialog(did, onlyHistory, revoke) is missing or ambiguous (${forwarders.size} found)")
        val forwarder = forwarders.single()
        removedNeed(AccessFlags.PUBLIC.isSet(forwarder.accessFlags), "deleteDialog(did, onlyHistory, revoke) isn't public")
        val (updates, deletes) = removedUpdates(controller.methods.toList(), forwarder)
        val (lists, checks) = removedLists()
        val alert = cantOpenAlert()
        val kept = removedAlertSkip(alert)
        val start = delete.single()
        // The hook reads the first three parameters by position, so R8 mustn't have moved them.
        removedNeed(start.parameterTypes.map { it.toString() }.take(3) == listOf("J", "I", "I"), "deleteDialog's parameters moved")
        removedNeed(start.controlBody().none { it.controlRef() == REMOVED_DELETING }, "deleteDialog is already hooked")
        removedNeed(ControlFlow.of(start).normal.none { 0 in it }, "something jumps back to deleteDialog's first instruction")
        KeepRemovedPlan(forwarder, updates, deletes, lists, checks, alert, kept, start, null)
    } catch (missing: RemovedUnbuilt) {
        KeepRemovedPlan(null, null, emptyList(), emptyList(), emptyList(), null, -1, null, missing.message)
    } catch (missing: PatchException) {
        KeepRemovedPlan(null, null, emptyList(), emptyList(), emptyList(), null, -1, null, missing.message)
    }
}

/** Every hook, on copies first so a refusal leaves the app untouched, then the stubs. */
internal fun BytecodePatchContext.applyKeepRemovedChats(plan: KeepRemovedPlan) {
    val forwarder = plan.forwarder ?: throw PatchException("Keep chats you're removed from has no plan: ${plan.missing}")
    val alert = plan.alert!!
    val copies = plan.lists.map { MutableMethod(ImmutableMethod.of(it)) }
    insertRemoved(MutableMethod(ImmutableMethod.of(plan.updates!!)), plan.deletes, copies, plan.checks,
        MutableMethod(ImmutableMethod.of(alert.alert)), alert.ok, plan.kept, MutableMethod(ImmutableMethod.of(plan.delete!!)))
    insertRemoved(plan.updates, plan.deletes, plan.lists, plan.checks, alert.alert, alert.ok, plan.kept, plan.delete)

    writeStub(KEEP_REMOVED, "chat", 4, """
        check-cast p0, $MESSAGES_CONTROLLER
        invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v0
        invoke-virtual {p0, v0}, $REMOVED_GET_CHAT
        move-result-object v0
        return-object v0
    """)
    writeStub(KEEP_REMOVED, "chatState", 3, """
        const/4 v0, 0x0
        instance-of v1, p0, $REMOVED_CHAT
        if-eqz v1, :done
        check-cast p0, $REMOVED_CHAT
        instance-of v1, p0, Lorg/telegram/tgnet/TLRPC${'$'}TL_chatForbidden;
        if-nez v1, :forbidden
        instance-of v1, p0, Lorg/telegram/tgnet/TLRPC${'$'}TL_channelForbidden;
        if-eqz v1, :kicked
        :forbidden
        or-int/lit8 v0, v0, 0x1
        :kicked
        iget-boolean v1, p0, $REMOVED_CHAT->kicked:Z
        if-eqz v1, :left
        or-int/lit8 v0, v0, 0x2
        :left
        iget-boolean v1, p0, $REMOVED_CHAT->left:Z
        if-eqz v1, :deactivated
        or-int/lit8 v0, v0, 0x4
        :deactivated
        iget-boolean v1, p0, $REMOVED_CHAT->deactivated:Z
        if-eqz v1, :migrated
        or-int/lit8 v0, v0, 0x8
        :migrated
        iget-object v1, p0, $REMOVED_CHAT->migrated_to:Lorg/telegram/tgnet/TLRPC${'$'}InputChannel;
        if-eqz v1, :empty
        or-int/lit8 v0, v0, 0x10
        :empty
        instance-of v1, p0, Lorg/telegram/tgnet/TLRPC${'$'}TL_chatEmpty;
        if-eqz v1, :done
        or-int/lit8 v0, v0, 0x20
        :done
        return v0
    """)
    writeStub(KEEP_REMOVED, "chatId", 3, """
        check-cast p0, $REMOVED_CHAT
        iget-wide v0, p0, $REMOVED_CHAT->id:J
        return-wide v0
    """)
    writeStub(KEEP_REMOVED, "stockNotInChat", 2, """
        check-cast p0, $REMOVED_CHAT
        invoke-static {p0}, $REMOVED_IS_NOT_IN_CHAT
        move-result v0
        return v0
    """)
    // The forwarder by its own dex name, since the names table has no row for it.
    writeStub(KEEP_REMOVED, "stockDelete", 6, """
        check-cast p0, ${forwarder.definingClass}
        const/4 v0, 0x0
        if-eqz p4, :call
        const/4 v0, 0x1
        :call
        invoke-virtual {p0, p1, p2, p3, v0}, ${forwarder.definingClass}->${forwarder.name}(IJZ)V
        return-void
    """)
    writeStub(KEEP_REMOVED, "screenChat", 2, """
        check-cast p0, ${alert.chat.definingClass}
        iget-object v0, p0, ${alert.chat}
        return-object v0
    """)
}

private fun insertRemoved(
    updates: MutableMethod, deletes: List<Int>, lists: List<MutableMethod>, checks: List<List<Int>>,
    alert: MutableMethod, ok: Int, kept: Int, delete: MutableMethod,
) {
    // Each delete becomes the extension's, with the same registers, so nothing shifts.
    for (at in deletes) updates.replaceInstruction(at, "invoke-static {${registersOf(updates.getInstruction(at))}}, $REMOVED_REMOVING")
    lists.forEachIndexed { which, list ->
        for (at in checks[which]) list.replaceInstruction(at, "invoke-static {${registersOf(list.getInstruction(at))}}, $REMOVED_NOT_IN_CHAT")
    }
    // Recomputed on the method being edited, a copy or the real one: the same index on both.
    val free = alert.freeLocalsAt("Keep chats you're removed from", ok + 1, 1, listOf(kept)).single()
    alert.addInstructionsWithLabels(ok + 1, """
        move-object/from16 v$free, p0
        invoke-static {v$free}, $REMOVED_CANT_OPEN
        move-result v$free
        if-nez v$free, :hush_kept
    """, ExternalLabel("hush_kept", alert.getInstruction(kept)))
    val did = delete.parameterRegisterNumber(0)
    delete.addInstructions(0, "invoke-static/range {v$did .. v${did + 3}}, $REMOVED_DELETING")
}

/** The registers a call names, as smali writes them. */
private fun registersOf(call: Instruction): String = when (call) {
    is FiveRegisterInstruction -> listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)
        .take(call.registerCount).joinToString { "v$it" }
    is RegisterRangeInstruction -> throw PatchException("a range call can't be swapped in place")
    else -> throw PatchException("not a call")
}

/** deleteDialog(did, onlyHistory, revoke): an instance method taking (I J Z) that only hands on to the whole delete. */
private fun Method.isDeleteForwarder(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.map { it.toString() } != listOf("I", "J", "Z")) return false
    val calls = controlBody().filter { it.opcode.referenceType == com.android.tools.smali.dexlib2.ReferenceType.METHOD }
    return calls.size == 1 && calls.single().controlRef() == REMOVED_DELETE_DIALOG
}

private fun Instruction.calls(method: Method): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val ref = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return ref.definingClass == method.definingClass && ref.name == method.name && ref.returnType == method.returnType &&
        ref.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() }
}

/** processUpdateArray's update loop: the one method that checks both chat updates and deletes through [forwarder] exactly twice. */
private fun BytecodePatchContext.removedUpdates(methods: List<MutableMethod>, forwarder: Method): Pair<MutableMethod, List<Int>> {
    val found = methods.filter { m ->
        val body = m.controlBody()
        body.any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == UPDATE_CHANNEL } &&
            body.any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == UPDATE_CHAT } &&
            body.any { it.calls(forwarder) }
    }
    removedNeed(found.size == 1, "the update loop that deletes a chat you're no longer in is missing or ambiguous (${found.size} found)")
    val updates = found.single()
    val body = updates.controlBody()
    removedNeed(body.none { it.controlRef()?.startsWith(KEEP_REMOVED) == true }, "the update loop is already hooked")
    val deletes = body.indices.filter { body[it].calls(forwarder) }
    removedNeed(deletes.size == 2, "the update loop deletes a chat in ${deletes.size} places, not two")
    // The extension looks the chat up again itself, so only the call's own shape matters here.
    for (at in deletes) {
        val call = body[at] as? FiveRegisterInstruction
        removedNeed(call != null && call.registerCount == 5, "the update loop's delete isn't a plain call")
    }
    return updates to deletes
}

/**
 * The chat list's two loads, processLoadedDialogs' and processDialogsUpdate's runnables: the only
 * run() methods that read a dialogs answer's list and ask whether you're in a chat, two and four
 * times.
 */
private fun BytecodePatchContext.removedLists(): Pair<List<MutableMethod>, List<List<Int>>> {
    val runs = classDefsMentioning(Mention.allReferences(listOf(REMOVED_DIALOGS, REMOVED_IS_NOT_IN_CHAT)))
        .filterNot { it.type.startsWith("Lapp/hushtelegram/") }
        .flatMap { cls -> cls.methods.filter { m ->
            m.name == "run" && m.parameterTypes.isEmpty() && m.returnType == "V" && !AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.controlBody().let { body -> body.any { it.controlRef() == REMOVED_DIALOGS } && body.any { it.controlRef() == REMOVED_IS_NOT_IN_CHAT } }
        }.map { cls.type to it.name } }
        .distinct()
    val lists = runs.map { (type, _) -> tgMutableClassDefBy(type).methods.single { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" } }
    val checks = lists.map { list -> list.controlBody().let { body -> body.indices.filter { body[it].controlRef() == REMOVED_IS_NOT_IN_CHAT } } }
    removedNeed(checks.map { it.size }.sorted() == listOf(2, 4),
        "the chat list's loads ask whether you're in a chat ${checks.map { it.size }.sorted()} times, not two and four")
    for ((which, list) in lists.withIndex()) {
        val body = list.controlBody()
        for (at in checks[which]) {
            val call = body[at] as? FiveRegisterInstruction
            removedNeed(body[at].opcode == Opcode.INVOKE_STATIC && call?.registerCount == 1 &&
                body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT, "the chat list's not-in-chat check isn't a plain call")
        }
    }
    return lists to checks
}

/**
 * Where the hook right after the alert's OK goes for a kept chat: past the alert's showing, onto
 * what Telegram does once it's shown (loading ends, the history is drawn). The alert is made and
 * shown in a straight line, so only the hook's own branch can reach that instruction from there.
 */
private fun removedAlertSkip(site: CantOpenAlert): Int {
    val alert = site.alert
    val body = alert.controlBody()
    val flow = ControlFlow.of(alert)
    val hookAt = site.ok + 1
    removedNeed(body.indices.none { from -> from != site.ok && hookAt in flow.normal[from] }, "something jumps right past the alert's OK")
    val show = (hookAt until body.size).firstOrNull { at ->
        val ref = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        body[at].opcode == Opcode.INVOKE_VIRTUAL && ref != null && ref.returnType == SHOWN_DIALOG &&
            ref.parameterTypes.map { it.toString() } == listOf(SHOWN_DIALOG)
    }
    removedNeed(show != null, "the alert isn't shown after its OK")
    removedNeed((hookAt until show!!).all { flow.normal[it] == listOf(it + 1) }, "the alert isn't shown in a straight line after its OK")
    val shown = body.getOrNull(show + 1)
    val branch = body.getOrNull(show + 2)
    removedNeed(shown?.opcode == Opcode.MOVE_RESULT_OBJECT && branch?.opcode == Opcode.IF_NEZ &&
        (branch as OneRegisterInstruction).registerA == (shown as OneRegisterInstruction).registerA,
        "the alert's showing isn't checked right after")
    val kept = flow.normal[show + 2].single { it != show + 3 }
    removedNeed(kept > show + 2, "the alert's check doesn't go on past it")
    // Nothing skipped may be read from there on.
    val skipped = (hookAt until kept).mapNotNull { at ->
        val i = body[at]
        (i as? OneRegisterInstruction)?.registerA?.takeIf { i.opcode.setsRegister() }?.let { if (i.opcode.setsWideRegister()) listOf(it, it + 1) else listOf(it) }
    }.flatten().toSet()
    val live = alert.liveAcrossInjection(kept)
    removedNeed(skipped.none { it in live }, "the alert writes what's read after it's shown")
    alert.requireThisIntact("Keep chats you're removed from", listOf(hookAt))
    alert.freeLocalsAt("Keep chats you're removed from", hookAt, 1, listOf(kept))
    return kept
}
