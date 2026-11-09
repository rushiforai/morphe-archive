/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.sendas

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefByOrNull

private const val PATCH = "Hide Send as button"
internal const val SEND_AS = "$EXTENSION_PACKAGE/misc/SendAs;"
internal const val ENTER_VIEW = "Lorg/telegram/ui/Components/ChatActivityEnterView;"
internal const val SEND_AS_PEERS = "Lorg/telegram/tgnet/TLRPC\$TL_channels_sendAsPeers;->peers:Ljava/util/ArrayList;"
internal const val SEND_AS_LABEL = "Lorg/telegram/messenger/R\$string;->AccDescrSendAs:I"
internal const val PEER = "Lorg/telegram/tgnet/TLRPC\$Peer;"
internal const val PEER_USER = "Lorg/telegram/tgnet/TLRPC\$TL_peerUser;"
private const val CHANNEL_ID = "$PEER->channel_id:J"
internal const val SHOW_SEND_AS = "$SEND_AS->show(Ljava/lang/Object;Z)Z"

@Suppress("unused")
val hideSendAsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides your picture next to the message box in groups and channels where you could post as a channel, " +
        "while you're posting as yourself. Starts off. Turn it on in HushTelegram settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val gate = resolveSendAsGate()
        writeStub(SEND_AS, "isUser", 1, "instance-of p0, p0, $PEER_USER\nreturn p0")
        gate.method.addInstructionsAtControlFlowLabel(gate.index,
            "invoke-static {v${gate.peer}, v${gate.shown}}, $SHOW_SEND_AS\nmove-result v${gate.shown}")
        enableStatus("hideSendAs")
    }
}

/** Where the message box decides to show the Send as button: [shown] holds the answer and [peer] who you'd post as. */
internal data class SendAsGate(val method: MutableMethod, val index: Int, val peer: Int, val shown: Int)

/**
 * The message box updates its Send as button from one method: it works out who you'd post as (the
 * chat's saved choice, else the first on the list Telegram sent), decides whether the button shows,
 * builds it if it does, and then labels it with that identity's name. The decision is settled once,
 * before the build, and the rest of the method only reads it to show or hide the button.
 */
internal fun BytecodePatchContext.resolveSendAsGate(): SendAsGate {
    requireStatusMethod("hideSendAs")
    controlHook(SEND_AS, "show", listOf("Ljava/lang/Object;", "Z"), "Z")
    controlHook(SEND_AS, "isUser", listOf("Ljava/lang/Object;"), "Z")
    val user = tgClassDefByOrNull(PEER_USER)
    shape(user != null && user.origSuperclass == PEER && !AccessFlags.ABSTRACT.isSet(user.accessFlags),
        "Telegram's person peer is no longer a kind of peer")

    val owner = tgMutableClassDefByOrNull(ENTER_VIEW) ?: throw PatchException("$PATCH: no message box (before editing)")
    val updaters = owner.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" && m.parameterTypes.map { it.toString() } == listOf("Z", "Z") &&
            m.controlBody().let { body -> body.any { it.controlRef() == SEND_AS_PEERS } && body.any { it.controlRef() == SEND_AS_LABEL } }
    }
    shape(updaters.size == 1, "the message box's Send as updater is missing or ambiguous (${updaters.size})")
    val method = updaters.single()
    val body = method.controlBody()
    val flow = ControlFlow.of(method)

    // The label goes on whoever the first identity read belongs to, once that identity is non-null.
    val read = body.indexOfFirst { it.opcode == Opcode.IGET_WIDE && it.controlRef() == CHANNEL_ID }
    shape(read > 2, "the Send as button is no longer labelled by its identity")
    val peer = body[read].namedRegisters()[1]
    val check = read - 1
    shape(body[check].opcode == Opcode.IF_EQZ && body[check].namedRegisters() == listOf(peer),
        "the Send as identity is no longer checked before it's read")

    // Right before that check: if shown, build the button. The build doesn't touch the identity.
    val gate = check - 2
    val build = body[gate + 1]
    val self = method.localRegisterCount()
    shape(body[gate].opcode == Opcode.IF_EQZ && flow.normal[gate].sorted() == listOf(gate + 1, check) &&
        build.opcode == Opcode.INVOKE_VIRTUAL && build.namedRegisters() == listOf(self) &&
        build.call()?.let { it.origDefiningClass == ENTER_VIEW && it.parameterTypes.isEmpty() && it.origReturnType == "V" } == true &&
        flow.normal[gate + 1] == listOf(check), "the Send as button is no longer built only when it shows")
    method.requireThisIntact(PATCH, listOf(gate + 1))
    val shown = body[gate].namedRegisters().single()
    shape(shown != peer, "the Send as decision and identity share a register")
    // Settled here: nothing after the decision writes it again, and the button's show and hide read it.
    shape((gate + 1 until body.size).none { body[it].writes(shown) } &&
        (check + 1 until body.size).count { shown in body[it].namedRegisters() } >= 2,
        "the Send as decision changes after it's made")
    shape(peer <= 15 && shown <= 15, "the Send as decision is out of a call's reach")
    return SendAsGate(method, gate, peer, shown)
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

private fun shape(ok: Boolean, what: String) {
    if (!ok) throw PatchException("$PATCH: $what (before editing)")
}
