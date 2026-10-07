/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
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
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VOICE_PLAYLIST = "$EXTENSION_PACKAGE/misc/VoicePlaylist;"
internal const val QUEUE = "$VOICE_PLAYLIST->queue(Ljava/util/ArrayList;)Ljava/util/ArrayList;"
internal const val MEDIA_CONTROLLER = "Lorg/telegram/messenger/MediaController;"
internal const val SET_PLAYLIST = "$MEDIA_CONTROLLER->setVoiceMessagesPlaylist(Ljava/util/ArrayList;Z)V"
private const val PLAYLIST = "$MEDIA_CONTROLLER->voiceMessagesPlaylist:Ljava/util/ArrayList;"
private const val PLAY = "$MEDIA_CONTROLLER->playMessage(Lorg/telegram/messenger/MessageObject;"

@Suppress("unused")
val voiceOneAtATimePatch = bytecodePatch(
    name = "Play voice messages one at a time",
    description = "Adds a switch, off by default, so a voice or video message stops when it ends instead of playing the next one.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val setter = resolveVoiceOneAtATime()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertQueue(MutableMethod(ImmutableMethod.of(setter)))
        insertQueue(setter)
        enableStatus("voiceOneAtATime")
    }
}

/** The queue goes through the extension before anything reads it, in its own register. */
internal fun insertQueue(target: MutableMethod) {
    val playlist = target.implementation!!.registerCount - 2
    target.addInstructions(0, """
        invoke-static {v$playlist}, $QUEUE
        move-result-object v$playlist
    """)
}

/**
 * Telegram hands MediaController the voice and video messages after the one being played, and
 * plays the next of them each time one ends.
 */
internal fun BytecodePatchContext.resolveVoiceOneAtATime(): MutableMethod {
    requireStatusMethod("voiceOneAtATime")
    controlHook(VOICE_PLAYLIST, "queue", listOf("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;")
    val controller = mutableClassDefByOrNull(MEDIA_CONTROLLER)
    controlShape(controller != null, "MediaController is missing")
    val setter = controller!!.methods.filter { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == SET_PLAYLIST &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("voice playlist setter")
    val body = setter.controlBody()
    controlShape(body.any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == PLAYLIST }, "the voice playlist setter no longer stores the queue")
    controlShape(ControlFlow.of(setter).normal.none { 0 in it }, "something jumps back to the start of the voice playlist setter")
    controlShape(controller.methods.any { m -> m.controlBody().let { b -> b.any { it.controlRef() == PLAYLIST } && b.any { it.controlRef()?.startsWith(PLAY) == true } } },
        "MediaController no longer plays the next message from its queue")
    return setter
}
