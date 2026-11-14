/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val BANNED_CHANNEL_WEB = "$EXTENSION_PACKAGE/misc/BannedChannelWeb;"
internal const val BANNED_OFFER = "$BANNED_CHANNEL_WEB->offer(Ljava/lang/Object;Ljava/lang/Object;)V"

/** The title Telegram gives its alert for a channel that banned you, only on the chat screen's can't-open alert. */
internal const val BANNED_TITLE = "Lorg/telegram/messenger/R\$string;->ChannelCantOpenBannedByAdminTitle:I"
internal const val CHANNEL_FORBIDDEN = "Lorg/telegram/tgnet/TLRPC\$TL_channelForbidden;"
internal const val ALERT_BUILDER = "Lorg/telegram/ui/ActionBar/AlertDialog\$Builder;"
private const val CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"

/**
 * The chat screen's alert for a chat it can't open (#71): [alert] sets the alert's OK at [ok] on
 * the builder in [builder], with [free] unused right after it. [chat] is the screen's chat,
 * [account] its account getter, and [button] the builder's second button, taking a [listener].
 */
internal class BannedChannelAlert(
    val alert: MutableMethod, val ok: Int, val builder: Int, val free: Int,
    val chat: FieldReference, val account: MethodReference, val button: MethodReference, val listener: String,
)

/**
 * Finds the alert by the title it gives a channel that banned you, the only place Telegram uses
 * that title, and refuses with a PatchException, before anything is changed, when a build moved
 * any of what the button needs.
 */
internal fun BytecodePatchContext.resolveBannedChannelAlert(): BannedChannelAlert {
    controlHook(BANNED_CHANNEL_WEB, "offer", listOf(OBJECT, OBJECT), "V")
    controlHook(BANNED_CHANNEL_WEB, "chatOf", listOf(OBJECT), OBJECT)
    controlHook(BANNED_CHANNEL_WEB, "account", listOf(OBJECT), "I")
    controlHook(BANNED_CHANNEL_WEB, "addButton", listOf(OBJECT, STRING, OBJECT), "V")
    controlHook(BANNED_CHANNEL_WEB, "listenerType", emptyList(), "Ljava/lang/Class;")

    val found = classDefsMentioning(Mention.allReferences(listOf(BANNED_TITLE, CHANNEL_FORBIDDEN)))
        .filterNot { it.type.startsWith("Lapp/hushtelegram/") }
        .flatMap { cls -> cls.methods.filter { it.isCantOpenAlert() } }
        .controlSingle("the chat screen's can't-open alert")
    val screen = tgMutableClassDefBy(found.definingClass)
    val alert = screen.methods.single { it.name == found.name && it.returnType == found.returnType &&
        it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString) }
    controlShape(AccessFlags.PUBLIC.isSet(screen.accessFlags), "the chat screen is inaccessible")
    val body = alert.controlBody()

    // The chat the alert asks about, read right before Telegram checks whether it's a channel that banned you.
    val forbidden = body.indexOfFirst { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == CHANNEL_FORBIDDEN }
    val read = body.getOrNull(forbidden - 1)
    val chat = read?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField()
    controlShape(chat != null && chat.origType == CHAT && (read as TwoRegisterInstruction).registerA ==
        (body[forbidden] as TwoRegisterInstruction).registerB, "the alert's chat")
    controlShape(tgClassDefByOrNull(chat!!.definingClass)?.fields?.any { it.name == chat.name && AccessFlags.PUBLIC.isSet(it.accessFlags) } == true,
        "the chat screen's chat is inaccessible")

    // The alert's OK: the builder's one button setter that takes any text, set after the title.
    val title = body.indexOfFirst { it.controlRef() == BANNED_TITLE }
    val ok = (title until body.size).firstOrNull { at ->
        body[at].opcode == Opcode.INVOKE_VIRTUAL && (body[at].methodRef())?.let {
            it.origDefiningClass == ALERT_BUILDER && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString).let { p -> p.size == 2 && p[0] == "Ljava/lang/CharSequence;" }
        } == true
    }
    controlShape(ok != null, "the alert's OK button")
    val okSetter = body[ok!!].methodRef()!!
    val builder = (body[ok] as FiveRegisterInstruction).registerC
    controlShape(builder < 16, "the alert's builder sits in a register a call can't name")
    val listener = okSetter.parameterTypes[1].toString()
    controlShape(tgClassDefByOrNull(listener)?.let { AccessFlags.INTERFACE.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) } == true,
        "the alert's button listener isn't a public interface")

    // Telegram's negative and neutral buttons, each taking a text and the same listener: either
    // puts a second button beside OK, and either closes the alert the way OK does.
    val builderClass = tgClassDefByOrNull(ALERT_BUILDER)
    val okFields = builderClass?.methods?.singleOrNull { it.sameAs(okSetter) }?.fieldsWritten().orEmpty()
    val button = builderClass?.methods?.toList().orEmpty().filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(STRING, listener) &&
            it.fieldsWritten().let { written -> written.size == 2 && written.none(okFields::contains) }
    }.minByOrNull { it.name }
    controlShape(okFields.size == 2 && button != null && AccessFlags.PUBLIC.isSet(builderClass!!.accessFlags), "the alert's second button")

    // The account the chat screen is in, from Telegram's base screen class, as Outside translate finds it.
    val account = superclassChain(screen.type).mapNotNull { tgClassDefByOrNull(it) }
        .flatMap { it.methods.asSequence() }
        .firstOrNull { it.origName == "getCurrentAccount" && it.parameterTypes.isEmpty() && it.origReturnType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) }
    controlShape(account != null && AccessFlags.PUBLIC.isSet(account.accessFlags) &&
        tgClassDefByOrNull(account.definingClass)?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } == true,
        "the chat screen no longer says which account it's in")

    val free = try {
        alert.getFreeRegisterProvider(ok + 1, 1, builder).getFreeRegister4Bit()
    } catch (taken: RuntimeException) {
        null
    }
    controlShape(free != null, "no register is free beside the alert's OK")
    return BannedChannelAlert(alert, ok, builder, free!!, chat, account!!, button!!, listener)
}

/** Writes the stubs, then hands the extension the builder and the chat screen right after OK is set. */
internal fun BytecodePatchContext.applyBannedChannelAlert(site: BannedChannelAlert) {
    writeStub(BANNED_CHANNEL_WEB, "chatOf", 2, """
        check-cast p0, ${site.chat.definingClass}
        iget-object v0, p0, ${site.chat}
        return-object v0
    """)
    writeStub(BANNED_CHANNEL_WEB, "account", 2, """
        check-cast p0, ${site.account.definingClass}
        invoke-virtual {p0}, ${site.account}
        move-result v0
        return v0
    """)
    writeStub(BANNED_CHANNEL_WEB, "addButton", 3, """
        check-cast p0, ${site.button.definingClass}
        check-cast p2, ${site.listener}
        invoke-virtual {p0, p1, p2}, ${site.button}
        return-void
    """)
    writeStub(BANNED_CHANNEL_WEB, "listenerType", 1, """
        const-class v0, ${site.listener}
        return-object v0
    """)
    site.alert.addInstructions(site.ok + 1, """
        move-object/from16 v${site.free}, p0
        invoke-static {v${site.builder}, v${site.free}}, $BANNED_OFFER
    """)
}

/** An instance method that gives a channel that banned you its own title, after checking the chat is one. */
internal fun Method.isCantOpenAlert(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags)) return false
    val body = controlBody()
    return body.any { it.controlRef() == BANNED_TITLE } &&
        body.any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == CHANNEL_FORBIDDEN }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodRef() =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Method.sameAs(other: MethodReference) = name == other.name && returnType == other.returnType &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

/** The fields a setter writes, as `name:type`. */
private fun Method.fieldsWritten(): List<String> = controlBody().filter { it.opcode == Opcode.IPUT_OBJECT }
    .mapNotNull { it.controlField()?.let { f -> "${f.definingClass}->${f.name}:${f.type}" } }
