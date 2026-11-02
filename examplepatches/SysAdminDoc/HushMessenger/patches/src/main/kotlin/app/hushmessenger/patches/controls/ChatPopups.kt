package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.hushmessenger.patches.MessengerTarget
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val CHAT_CHANNEL_KEEP = "chat_channel_keep"
internal const val CHAT_CHANNEL_RAISE = "chat_channel_raise"
private const val CHAT_POPUPS = "Lapp/hushmessenger/extension/ChatPopups;"
private const val NOTIFICATION_CHANNEL = "Landroid/app/NotificationChannel;"
private const val GET_IMPORTANCE = "$NOTIFICATION_CHANNEL->getImportance()I"
private const val KEEP_SINK = "$CHAT_POPUPS->keepChannel(${NOTIFICATION_CHANNEL}I)Z"
private const val RAISE_SINK = "$CHAT_POPUPS->raiseChannel($NOTIFICATION_CHANNEL)Z"
/** The channel manager's recreate logs this, and the initializer's check of the Chats channel reports this. */
private const val RECREATE_LOG = "recreateChannel for updating channel importance"
private const val BANNER_STATE = "chats_channel_banner_state"

private fun Method.strings() = implementation?.instructions?.toList().orEmpty().mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}

/** static String recreate(channel, session, manager, key, importance, demoted), whatever this build calls the manager. */
private fun List<CharSequence>.isRecreateShape() = size == 6 && this[0].toString() == NOTIFICATION_CHANNEL &&
    this[1].toString() == BUBBLE_SESSION && this[3].toString() == "Ljava/lang/String;" &&
    this[4].toString() == "I" && this[5].toString() == "Z" && this[2].toString() != "Ljava/lang/String;"

private fun Method.isChannelRecreate() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "Ljava/lang/String;" &&
    parameterTypes.isRecreateShape() && RECREATE_LOG in strings()

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.argumentRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun Instruction.writes(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

/**
 * The initializer's check of the Chats channel. [gates] is where it starts asking whether a chat head covers for a
 * channel below high, [scratch] holds the bound that check just compared and gets overwritten by the next instruction,
 * and [raise] starts Messenger's own raise of [channel].
 */
private class ChatRaiseSite(val gates: Int, val scratch: Int, val channel: Int, val raise: Int)

private fun Method.chatRaiseSite(): ChatRaiseSite? {
    if (BANNER_STATE !in strings()) return null
    val code = implementation?.instructions?.toList() ?: return null
    val recreate = code.indices.filter { at ->
        code[at].methodRef()?.let { it.returnType == "Ljava/lang/String;" && it.parameterTypes.isRecreateShape() } == true
    }.singleOrNull() ?: return null
    val channel = code[recreate].argumentRegisters().firstOrNull() ?: return null
    val raise = (recreate downTo 0).firstOrNull { at ->
        code[at].methodRef()?.toString() == GET_IMPORTANCE && code[at].argumentRegisters().singleOrNull() == channel
    } ?: return null
    // The channel's lower bound: importance 3 is where a chat head can stand in for the banner.
    val bound = code.indices.filter { at ->
        code[at].opcode == Opcode.IF_LT && at in 1 until raise && (code[at - 1] as? NarrowLiteralInstruction)?.narrowLiteral == 3 &&
            (code[at] as TwoRegisterInstruction).registerB == (code[at - 1] as OneRegisterInstruction).registerA
    }.singleOrNull() ?: return null
    val scratch = (code[bound - 1] as OneRegisterInstruction).registerA
    val gates = bound + 1
    if (!code[gates].writes(scratch) || gates in jumpTargets()) return null
    // The hook skips the gates, so nothing the raise reads may be set by them.
    val carried = (raise until recreate).mapNotNull { (code[it] as? TwoRegisterInstruction)?.registerB } + channel
    if ((gates until raise).any { at -> carried.any { code[at].writes(it) } }) return null
    return ChatRaiseSite(gates, scratch, channel, raise)
}

internal fun findChatChannelRaise(classes: Iterable<ClassDef>): List<Method> =
    classes.asSequence().flatMap { it.methods }.filter { it.name == "run" && it.chatRaiseSite() != null }.toList()

internal fun findChatChannelKeep(classes: Iterable<ClassDef>): List<Method> =
    classes.asSequence().flatMap { it.methods }.filter { it.isChannelRecreate() }.toList()

private fun Method.chatKeepRoom() = implementation?.registerCount?.let { it in 7..16 } == true

/** Before the first edit, so a build that moved either one stops the patch with Messenger untouched. */
internal fun Method.validateChatChannels(hook: String) {
    val fits = if (hook == CHAT_CHANNEL_KEEP) isChannelRecreate() && chatKeepRoom() else chatRaiseSite() != null
    if (!fits) throw PatchException("Messenger controls: ${hookId()} isn't Messenger's Chats channel importance code")
}

/** A raise the extension allows skips the chat head and server flag checks and runs Messenger's own code. */
internal fun MutableMethod.injectChatChannelRaise() {
    validateChatChannels(CHAT_CHANNEL_RAISE)
    val site = chatRaiseSite()!!
    val scratch = "v${site.scratch}"
    addInstructionsWithLabels(site.gates, """
        invoke-static/range {v${site.channel} .. v${site.channel}}, $RAISE_SINK
        move-result $scratch
        if-nez $scratch, :chat_raise
    """.trimIndent(), ExternalLabel("chat_raise", getInstruction(site.raise)))
}

/** Both callers already handle the null a recreate returns when the channel has no definition. */
internal fun MutableMethod.injectChatChannelKeep() {
    validateChatChannels(CHAT_CHANNEL_KEEP)
    addInstructionsWithLabels(0, """
        invoke-static {p0, p4}, $KEEP_SINK
        move-result v0
        if-eqz v0, :stock_recreate
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), ExternalLabel("stock_recreate", getInstruction(0)))
}

@Suppress("unused")
val keepChatPopupsPatch = bytecodePatch(
    name = "Keep chat pop-ups",
    description = "Messenger can turn off message pop-ups for good when it expects a chat head to show. This stops that and brings them back on a phone where it already happened, unless you lowered them yourself in Android's settings or picked Chat heads under Allow chat bubbles.",
    default = true,
) {
    category("Fixes")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension)
    execute {
        validateControls(discoveredControls, setOf(CHAT_CHANNEL_KEEP, CHAT_CHANNEL_RAISE))
        val (keep, raise) = listOf(CHAT_CHANNEL_KEEP, CHAT_CHANNEL_RAISE).map { hook ->
            val original = discoveredControls.getValue(hook).single()
            original.validateChatChannels(hook)
            mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }
        }
        keep.injectChatChannelKeep()
        raise.injectChatChannelRaise()
    }
}
