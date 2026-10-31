/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CONNECTIONS_MANAGER = "Lorg/telegram/tgnet/ConnectionsManager;"
internal const val SEND_REQUEST_INTERNAL = "sendRequestInternal"
internal val SEND_REQUEST_INTERNAL_PARAMETERS = listOf(
    "Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/tgnet/RequestDelegate;", "Lorg/telegram/tgnet/RequestDelegateTimestamp;",
    "Lorg/telegram/tgnet/QuickAckDelegate;", "Lorg/telegram/tgnet/WriteToSocketDelegate;", "I", "I", "I", "Z", "I",
)
internal const val NATIVE_SEND_REQUEST = "$CONNECTIONS_MANAGER->native_sendRequest(IJIIIZII)V"
private const val SERIALIZE = "Lorg/telegram/tgnet/TLObject;->serializeToStream("

/** What a gate adds to the top of the send: the ask, its answer, the test and the early return. */
internal const val SEND_REQUEST_GATE_SIZE = 4

/**
 * The gate for [hook], a static that answers true to drop the request: `(Ljava/lang/Object;)Z` is
 * handed the request, `(Ljava/lang/Object;Ljava/lang/Object;)Z` the request and its callback (p2).
 */
internal fun sendRequestGateCode(hook: String) = """
    invoke-static/range {p1 .. ${if (hook.endsWith("(Ljava/lang/Object;Ljava/lang/Object;)Z")) "p2" else "p1"}}, $hook
    move-result v0
    if-eqz v0, :hush_send
    return-void
"""

/**
 * Telegram's one way out for a request, found and checked before anything is edited, or [missing],
 * why this build can't take a gate there. Two patches may each put a gate at the top; whichever goes
 * in second asks first, and both see every request.
 */
internal class SendRequestGate(val method: MutableMethod?, val missing: String?) {
    fun apply(hook: String, into: (MutableMethod) -> MutableMethod = { it }) {
        val target = method?.let(into) ?: return
        val before = target.implementation!!.instructions.size
        target.addInstructionsWithLabels(0, sendRequestGateCode(hook), ExternalLabel("hush_send", target.getInstruction(0)))
        // smali drops an instruction it can't build and only logs it, so count what went in.
        if (target.implementation!!.instructions.size - before != SEND_REQUEST_GATE_SIZE) {
            throw IllegalStateException("the request gate didn't compile whole")
        }
    }

    /** The same edit on a copy, so a smali or register problem shows before the app is touched. */
    fun rehearse(hook: String): String? = try {
        apply(hook) { MutableMethod(ImmutableMethod.of(it)) }
        null
    } catch (failed: RuntimeException) {
        "the request gate doesn't compile (${failed.javaClass.simpleName}: ${failed.message})"
    }
}

/**
 * Every `sendRequest` overload ends in ConnectionsManager's private `sendRequestInternal`, on the
 * stage queue, with the request first. It writes the request out and hands it to the native side,
 * and nothing else in the app calls that native send. A gate at its very start, before the request
 * is written out or its callback registered, drops a request so it never leaves the phone and its
 * callback runs only if the hook answers it. Anything else here and the gate is left out, with [SendRequestGate.missing]
 * saying why. Rehearsed with [hook], so a build that can't take it never gets a half-made edit.
 */
internal fun BytecodePatchContext.resolveSendRequestGate(hook: String): SendRequestGate {
    fun missing(why: String) = SendRequestGate(null, why)

    val owner = mutableClassDefByOrNull(CONNECTIONS_MANAGER) ?: return missing("ConnectionsManager is missing")
    val sends = owner.methods.filter { it.name == SEND_REQUEST_INTERNAL }
    val method = sends.singleOrNull() ?: return missing("ConnectionsManager has ${sends.size} request sends, not one")
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V" ||
        method.parameterTypes.map { it.toString() } != SEND_REQUEST_INTERNAL_PARAMETERS || method.implementation == null
    ) return missing("ConnectionsManager's request send changed shape")
    // The gate's answer goes in v0, which holds nothing yet at the start; the request is p1, its callback p2.
    if (method.localRegisterCount() < 1) return missing("ConnectionsManager's request send has no register for the gate")
    val body = method.controlBody()
    if (body.none { it.controlRef()?.startsWith(SERIALIZE) == true } || body.none { it.controlRef() == NATIVE_SEND_REQUEST }) {
        return missing("ConnectionsManager's request send no longer writes the request out and sends it")
    }
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        return missing("ConnectionsManager's request send can't be read (${failed.message})")
    }
    if (flow.normal.any { 0 in it } || flow.exceptional.any { 0 in it }) {
        return missing("something jumps back to the start of ConnectionsManager's request send")
    }
    val others = classDefsMentioning(Mention.reference(NATIVE_SEND_REQUEST)).flatMap { classDef ->
        classDef.methods.filter { other -> other.controlBody().any { it.controlRef() == NATIVE_SEND_REQUEST } }
    }.filter { it.definingClass != CONNECTIONS_MANAGER || it.name != SEND_REQUEST_INTERNAL }
    others.firstOrNull()?.let { return missing("${it.definingClass}->${it.name} sends requests past the gate") }
    val gate = SendRequestGate(method, null)
    return gate.rehearse(hook)?.let(::missing) ?: gate
}
