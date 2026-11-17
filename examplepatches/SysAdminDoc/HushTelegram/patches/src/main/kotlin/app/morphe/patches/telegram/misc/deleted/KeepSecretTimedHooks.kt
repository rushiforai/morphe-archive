/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val KEEP_SECRET_TIMED = "$EXTENSION_PACKAGE/misc/KeepSecretTimed;"
private const val SECRET_LIST = "Ljava/util/ArrayList;"
internal const val SECRET_TIMED_TASK = "$KEEP_SECRET_TIMED->task(${SECRET_LIST}J)$SECRET_LIST"

/** The deletion the self-destruct timer runs for each chat, with no random IDs and no secret chat. */
internal const val TIMED_DELETE = "$MESSAGES_CONTROLLER->deleteMessages($SECRET_LIST$SECRET_LIST" +
    "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;JZIZJLorg/telegram/tgnet/TLObject;I)V"

/**
 * Where one chat's due messages are read out of the timer's task: right after both the list, in
 * [list], and the chat ID, in [chat] and the one above it. The hook goes in at [at].
 */
internal class SecretTimedSpot(val at: Int, val list: Int, val chat: Int)

/** The timer's runnable and its two spots, the deleting and the media emptying; or why there's none. */
internal class KeepSecretTimedPlan(val method: MutableMethod?, val spots: List<SecretTimedSpot>, val missing: String?)

private class SecretTimedUnbuilt(why: String) : Exception(why)

private fun secretNeed(ok: Boolean, why: String) {
    if (!ok) throw SecretTimedUnbuilt(why)
}

/**
 * MessagesController.checkDeletingTask posts one runnable once a self-destruct timer is due, built
 * from the task's two sparse arrays of due messages per chat: the ones to delete and the ones whose
 * media to empty. In its run(), each array is walked chat by chat, the list and the chat ID read
 * out next to each other, before the deleting ([TIMED_DELETE]) or the emptying. Each spot hands
 * that list over and goes on with what comes back. A build where that can't be found keeps the
 * rest of Keep deleted messages, without the switch.
 */
internal fun BytecodePatchContext.resolveKeepSecretTimed(): KeepSecretTimedPlan {
    requireStatusMethod("keepSecretTimed")
    controlHook(KEEP_SECRET_TIMED, "task", listOf(SECRET_LIST, "J"), SECRET_LIST)
    controlHook(KEEP_SECRET_TIMED, "secretDialog", listOf("J"), "Z")
    return try {
        requireReachable(TIMED_IS_ENCRYPTED, true)
        val (method, spots) = secretTimedSpots()
        KeepSecretTimedPlan(method, spots, null)
    } catch (missing: SecretTimedUnbuilt) {
        KeepSecretTimedPlan(null, emptyList(), missing.message)
    } catch (missing: PatchException) {
        KeepSecretTimedPlan(null, emptyList(), missing.message)
    }
}

/** Hooks each spot, on a copy first so a refusal leaves the app untouched, then writes the stub. */
internal fun BytecodePatchContext.applyKeepSecretTimed(plan: KeepSecretTimedPlan) {
    val method = plan.method ?: throw PatchException("Keep self-destructing secret chat messages has no plan: ${plan.missing}")
    insertSecretTimed(MutableMethod(ImmutableMethod.of(method)), plan.spots)
    insertSecretTimed(method, plan.spots)
    writeStub(KEEP_SECRET_TIMED, "secretDialog", 3, """
        invoke-static {p0, p1}, $TIMED_IS_ENCRYPTED
        move-result v0
        return v0
    """)
}

/** Later spots first, so each index still points where it was found. */
private fun insertSecretTimed(method: MutableMethod, spots: List<SecretTimedSpot>) {
    for (spot in spots.sortedByDescending { it.at }) {
        method.addInstructions(spot.at, """
            invoke-static {v${spot.list}, v${spot.chat}, v${spot.chat + 1}}, $SECRET_TIMED_TASK
            move-result-object v${spot.list}
        """)
    }
}

private fun BytecodePatchContext.secretTimedSpots(): Pair<MutableMethod, List<SecretTimedSpot>> {
    val checks = tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.filter {
        it.origName == "checkDeletingTask" && it.origParameterTypes == listOf("Z") && it.origReturnType == "Z" &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    secretNeed(checks.size == 1, "MessagesController.checkDeletingTask is missing or ambiguous (${checks.size} found)")
    // The runnable it builds whose run() deletes: the one it posts once the timer is due.
    val runs = checks.single().controlBody().filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { it.controlRef() }.distinct()
        .mapNotNull { type -> tgMutableClassDefByOrNull(type)?.methods?.singleOrNull { it.isSecretTimedRun() } }
        .filter { run -> run.controlBody().any { it.controlRef() == TIMED_DELETE } }
    secretNeed(runs.size == 1, "the self-destruct timer's runnable is missing or ambiguous (${runs.size} found)")
    val run = runs.single()
    secretNeed(run.controlBody().none { it.controlRef()?.startsWith(KEEP_SECRET_TIMED) == true }, "the self-destruct timer is already hooked")
    val body = run.controlBody()
    val deletes = body.indices.filter { body[it].controlRef() == TIMED_DELETE }
    secretNeed(deletes.size == 1, "the self-destruct timer deletes in ${deletes.size} places, not one")
    val spots = body.indices.mapNotNull { spotAt(body, it) }
    secretNeed(spots.size == 2, "the self-destruct timer reads ${spots.size} chats' lists, not two")
    secretNeed(spots[0].at <= deletes.single() && spots[1].at > deletes.single(),
        "the self-destruct timer's deleting isn't between its two lists")
    val flow = ControlFlow.of(run)
    for (spot in spots) {
        // Only the read right before reaches the spot, so nothing jumps past the hook.
        secretNeed(body.indices.none { from -> from != spot.at - 1 && spot.at in flow.normal[from] + flow.exceptional[from] },
            "something jumps into the self-destruct timer right where a list is read")
        secretNeed(spot.list < 16 && spot.chat + 1 < 16, "the self-destruct timer keeps a list past v15")
    }
    return run to spots
}

private fun Method.isSecretTimedRun() =
    name == "run" && parameterTypes.isEmpty() && returnType == "V" && !AccessFlags.STATIC.isSet(accessFlags)

/**
 * A spot starting at [from]: a sparse array's value at an index cast to a list, and its key at the
 * same index read as a long, one right after the other in either order.
 */
private fun spotAt(body: List<Instruction>, from: Int): SecretTimedSpot? {
    fun read(at: Int, returns: String): Pair<Int, Int>? {
        val call = body.getOrNull(at) as? FiveRegisterInstruction ?: return null
        if (body[at].opcode != Opcode.INVOKE_VIRTUAL || call.registerCount != 2) return null
        val ref = (body[at] as ReferenceInstruction).reference as? MethodReference ?: return null
        if (ref.parameterTypes.map { it.toString() } != listOf("I") || ref.returnType != returns) return null
        return call.registerC to call.registerD
    }
    fun result(at: Int, opcode: Opcode) = (body.getOrNull(at)?.takeIf { it.opcode == opcode } as? OneRegisterInstruction)?.registerA

    fun value(at: Int): Pair<Pair<Int, Int>, Int>? {
        val call = read(at, "Ljava/lang/Object;") ?: return null
        val list = result(at + 1, Opcode.MOVE_RESULT_OBJECT) ?: return null
        val cast = body.getOrNull(at + 2)?.takeIf { it.opcode == Opcode.CHECK_CAST } ?: return null
        if ((cast as OneRegisterInstruction).registerA != list || cast.controlRef() != SECRET_LIST) return null
        return call to list
    }
    fun key(at: Int): Pair<Pair<Int, Int>, Int>? {
        val call = read(at, "J") ?: return null
        return call to (result(at + 1, Opcode.MOVE_RESULT_WIDE) ?: return null)
    }
    val listFirst = value(from)?.let { (call, list) -> key(from + 3)?.takeIf { it.first == call }?.let { Triple(from + 5, list, it.second) } }
    val keyFirst = key(from)?.let { (call, chat) -> value(from + 2)?.takeIf { it.first == call }?.let { Triple(from + 5, it.second, chat) } }
    val (at, list, chat) = listFirst ?: keyFirst ?: return null
    if (list == chat || list == chat + 1) return null
    return SecretTimedSpot(at, list, chat)
}
