/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.forward

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val FORWARD_SENDER = "$EXTENSION_PACKAGE/misc/ForwardSender;"
internal const val STARTS = "$FORWARD_SENDER->starts(Ljava/lang/Object;Ljava/util/ArrayList;)V"
internal const val PREVIEW_PARAMS = "Lorg/telegram/messenger/MessagePreviewParams;"
internal const val UPDATE_FORWARD = "$PREVIEW_PARAMS->updateForward(Ljava/util/ArrayList;J)V"
internal const val FORWARDS = "$PREVIEW_PARAMS->forwardMessages:Lorg/telegram/messenger/MessagePreviewParams\$Messages;"
internal const val HIDE_SENDERS = "$PREVIEW_PARAMS->hideForwardSendersName:Z"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val MESSAGE_TYPE = "$MESSAGE_OBJECT->type:I"
internal const val IS_PREMIUM = "Lorg/telegram/messenger/UserConfig;->isPremium()Z"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private val COMPARES = setOf(Opcode.IF_EQ, Opcode.IF_NE)

/** The animation on the preview's Hide sender's name button. */
internal const val NAME_HIDE = "Lorg/telegram/messenger/R\$raw;->name_hide:I"

@Suppress("unused")
val forwardHideSenderPatch = bytecodePatch(
    name = "Hide sender names when forwarding",
    description = "Adds a switch, off by default, that starts Telegram's Hide sender's name option on each time you forward. You can still turn it off before sending.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveForwardHideSender()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertForwardStart(MutableMethod(ImmutableMethod.of(site.update)))
        writeStub(FORWARD_SENDER, "fresh", 2, """
            check-cast p0, $PREVIEW_PARAMS
            iget-object v0, p0, $FORWARDS
            if-nez v0, :hush_held
            const/4 v0, 0x1
            return v0
            :hush_held
            const/4 v0, 0x0
            return v0
        """)
        writeStub(FORWARD_SENDER, "premium", 2, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $USER_CONFIG->getInstance(I)$USER_CONFIG
            move-result-object v0
            invoke-virtual {v0}, $IS_PREMIUM
            move-result v0
            return v0
        """)
        writeStub(FORWARD_SENDER, "type", 2, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_TYPE
            return v0
        """)
        writeStub(FORWARD_SENDER, "article", 1, """
            const v0, ${site.article}
            return v0
        """)
        writeStub(FORWARD_SENDER, "hide", 2, """
            check-cast p0, $PREVIEW_PARAMS
            const/4 v0, 0x1
            iput-boolean v0, p0, $HIDE_SENDERS
            return-void
        """)
        insertForwardStart(site.update)
        enableStatus("forwardHideSender")
    }
}

/** The preview's [update] for a new forward, and the message type Telegram keeps behind Premium. */
internal class ForwardHideSenderSite(val update: MutableMethod, val article: Int)

/** The extension sees the preview and the messages before Telegram stores them. */
internal fun insertForwardStart(target: MutableMethod) {
    val params = target.implementation!!.registerCount - 4
    target.addInstructions(0, "invoke-static {v$params, v${params + 1}}, $STARTS")
}

/**
 * MessagePreviewParams.updateForward(messages, dialog) fills the forward preview, and its
 * hideForwardSendersName flag is what the send reads. The preview's own Hide sender's name button
 * refuses a non-Premium account whose forward holds an article, found by its type number.
 */
internal fun BytecodePatchContext.resolveForwardHideSender(): ForwardHideSenderSite {
    requireStatusMethod("forwardHideSender")
    controlHook(FORWARD_SENDER, "starts", listOf("Ljava/lang/Object;", "Ljava/util/ArrayList;"), "V")
    controlHook(FORWARD_SENDER, "fresh", listOf("Ljava/lang/Object;"), "Z")
    controlHook(FORWARD_SENDER, "premium", listOf("Ljava/lang/Object;"), "Z")
    controlHook(FORWARD_SENDER, "type", listOf("Ljava/lang/Object;"), "I")
    controlHook(FORWARD_SENDER, "article", listOf(), "I")
    controlHook(FORWARD_SENDER, "hide", listOf("Ljava/lang/Object;"), "V")

    val params = mutableClassDefByOrNull(PREVIEW_PARAMS)
    controlShape(params != null, "MessagePreviewParams is missing")
    controlShape(params!!.fields.any { "${it.definingClass}->${it.name}:${it.type}" == FORWARDS && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "the forward preview no longer holds its messages")
    controlShape(params.fields.any { "${it.definingClass}->${it.name}:${it.type}" == HIDE_SENDERS && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "the forward preview no longer has a Hide sender's name flag")
    val update = params.methods.filter { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == UPDATE_FORWARD &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("forward preview update")
    controlShape(update.controlBody().any { it.controlRef() == FORWARDS }, "the forward preview update no longer stores the messages")
    controlShape(ControlFlow.of(update).normal.none { 0 in it }, "something jumps back to the start of the forward preview update")

    val message = classDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && listOf("type", "currentAccount").all { name -> message.fields.any { it.name == name && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } },
        "a message no longer has its type and account")
    val config = classDefByOrNull(USER_CONFIG)
    controlShape(config != null && listOf("getInstance(I)$USER_CONFIG", "isPremium()Z").all { wanted ->
        config.methods.any { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) }
    }, "Telegram's Premium check changed")

    // The button's gate: not Premium, then each forwarded message's type compared with one number.
    val articles = mutableSetOf<Int>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { m ->
            val body = m.controlBody()
            val premium = body.indexOfFirst { it.controlRef() == IS_PREMIUM }
            if (premium < 0 || body.none { it.controlRef() == FORWARDS } || body.none { it.controlRef() == NAME_HIDE }) return@forEach
            for (i in premium until body.size - 2) {
                val literal = body[i + 1] as? NarrowLiteralInstruction ?: continue
                if (body[i].controlRef() == MESSAGE_TYPE && body[i + 2].opcode in COMPARES) articles += literal.narrowLiteral
            }
        }
    }
    val article = articles.toList().controlSingle("the Premium gate on hiding an article's sender")
    return ForwardHideSenderSite(update, article)
}
