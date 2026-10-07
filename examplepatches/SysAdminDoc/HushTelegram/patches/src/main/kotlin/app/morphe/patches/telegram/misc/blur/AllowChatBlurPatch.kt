/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.blur

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CHAT_BLUR = "$EXTENSION_PACKAGE/misc/ChatBlur;"
internal const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
internal const val CAN_BLUR = "$SHARED_CONFIG->canBlurChat()Z"
private const val PERFORMANCE = "$SHARED_CONFIG->getDevicePerformanceClass()I"
private const val BLUR_ENABLED = "$SHARED_CONFIG->chatBlurEnabled()Z"

@Suppress("unused")
val allowChatBlurPatch = bytecodePatch(
    name = "Allow chat blur on slower phones",
    description = "Adds a switch, off by default, that lets phones Telegram rates as slow use its blurred chat header and panels.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val rating = resolveAllowChatBlur()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertBlurAnswer(MutableMethod(ImmutableMethod.of(rating)))
        insertBlurAnswer(rating)
        enableStatus("allowChatBlur")
    }
}

/** The extension answers first, and a no falls through to Telegram's own rating. */
internal fun insertBlurAnswer(target: MutableMethod) {
    target.addInstructionsWithLabels(0, """
        invoke-static {}, $CHAT_BLUR->allowed()Z
        move-result v0
        if-eqz v0, :hush_stock
        return v0
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/** Telegram's rating of whether the phone is fast enough to blur chats, which its blur setting asks first. */
internal fun BytecodePatchContext.resolveAllowChatBlur(): MutableMethod {
    requireStatusMethod("allowChatBlur")
    controlHook(CHAT_BLUR, "allowed", listOf(), "Z")
    val config = mutableClassDefByOrNull(SHARED_CONFIG)
    controlShape(config != null, "SharedConfig is missing")
    val rating = config!!.methods.filter { "${it.definingClass}->${it.name}()${it.returnType}" == CAN_BLUR && it.parameterTypes.isEmpty() &&
        AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("chat blur rating")
    controlShape(rating.implementation!!.registerCount >= 1, "the chat blur rating has no register to answer in")
    controlShape(rating.controlBody().any { it.controlRef() == PERFORMANCE }, "the chat blur rating no longer looks at the phone's speed")
    controlShape(config.methods.any { "${it.definingClass}->${it.name}()${it.returnType}" == BLUR_ENABLED &&
        it.controlBody().any { i -> i.controlRef() == CAN_BLUR } }, "chat blur no longer asks for the rating")
    return rating
}
