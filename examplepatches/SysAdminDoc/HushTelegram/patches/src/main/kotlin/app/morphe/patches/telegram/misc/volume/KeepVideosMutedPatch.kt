/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
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
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VOLUME_KEYS = "$EXTENSION_PACKAGE/misc/VolumeKeys;"
internal const val LAUNCH_ACTIVITY = "Lorg/telegram/ui/LaunchActivity;"
internal const val DISPATCH_KEY = "$LAUNCH_ACTIVITY->dispatchKeyEvent(Landroid/view/KeyEvent;)Z"
private const val PLAY_MESSAGE = "Lorg/telegram/messenger/MediaController;->playMessage(Lorg/telegram/messenger/MessageObject;)Z"
private const val NO_SOUND_HINT = "Lorg/telegram/messenger/SharedConfig;->setNoSoundHintShowed(Z)V"
private const val ROUND_VIDEO = "Lorg/telegram/messenger/MessageObject;->isRoundVideo()Z"
private const val SWIPE_BACK = "isSwipeBackEnabled(Landroid/view/MotionEvent;)Z"

@Suppress("unused")
val keepVideosMutedPatch = bytecodePatch(
    name = "Keep videos muted on volume keys",
    description = "Adds a switch, off by default, that stops the volume keys in a chat from playing the video or round video on screen with sound, so they only change the volume.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveKeepVideosMuted()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        site.replace(MutableMethod(ImmutableMethod.of(site.dispatch)))
        writeStub(VOLUME_KEYS, "stockChatTakesKey", 1, """
            check-cast p0, ${site.handler.definingClass}
            invoke-virtual {p0}, ${site.handler}
            move-result p0
            return p0
        """)
        site.replace(site.dispatch)
        enableStatus("keepVideosMuted")
    }
}

/** LaunchActivity's key dispatch, which offers a volume key to the chat on screen at [indices] through [handler]. */
internal class KeepVideosMutedSite(val dispatch: MutableMethod, val indices: List<Int>, val handler: MethodReference) {
    /** The same register, the chat, goes to the extension instead. */
    fun replace(target: MutableMethod) {
        val hook = "$VOLUME_KEYS->chatTakesKey(Ljava/lang/Object;)Z"
        for (index in indices) {
            val call = target.getInstruction(index)
            val registers = call.namedRegisters()
            target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
                "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $hook"
            } else {
                "invoke-static {${registers.joinToString { "v$it" }}}, $hook"
            })
        }
    }
}

/**
 * On a volume key, LaunchActivity checks whether the screen on top, on a phone and again on a
 * tablet's side, is a chat without a sheet open, casts it, and asks it whether it takes the key.
 * The chat's answer plays the muted video or round video on screen with sound.
 */
internal fun BytecodePatchContext.resolveKeepVideosMuted(): KeepVideosMutedSite {
    requireStatusMethod("keepVideosMuted")
    controlHook(VOLUME_KEYS, "chatTakesKey", listOf("Ljava/lang/Object;"), "Z")
    controlHook(VOLUME_KEYS, "stockChatTakesKey", listOf("Ljava/lang/Object;"), "Z")

    val launch = mutableClassDefByOrNull(LAUNCH_ACTIVITY)
    controlShape(launch != null, "LaunchActivity is missing")
    val dispatch = launch!!.methods.filter { it.toString() == DISPATCH_KEY }.controlSingle("key dispatch")
    val body = dispatch.controlBody()
    val chats = body.filter { it.opcode == Opcode.INSTANCE_OF }.map { ((it as ReferenceInstruction).reference as TypeReference).type }.toSet()
    // Each offer: the chat cast, then asked at once, about nothing, for a yes or no.
    val indices = body.indices.filter { i ->
        val call = (body[i] as? ReferenceInstruction)?.reference as? MethodReference
        i > 0 && body[i].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.definingClass in chats && call.parameterTypes.isEmpty() &&
            call.returnType == "Z" && body[i - 1].opcode == Opcode.CHECK_CAST &&
            ((body[i - 1] as ReferenceInstruction).reference as TypeReference).type == call.definingClass &&
            body[i - 1].namedRegisters() == body[i].namedRegisters()
    }
    controlShape(indices.isNotEmpty(), "the key dispatch no longer offers a volume key to the chat")
    controlShape(indices.all { body.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT }, "the key dispatch no longer reads the chat's answer")
    val handler = indices.map { (body[it] as ReferenceInstruction).reference as MethodReference }.distinctBy { it.toString() }
        .controlSingle("chat's volume key answer")

    val chat = mutableClassDefByOrNull(handler.definingClass)
    controlShape(chat != null && AccessFlags.PUBLIC.isSet(chat.accessFlags) &&
        chat.methods.any { "${it.name}${it.parameterTypes.joinToString("", "(", ")")}${it.returnType}" == SWIPE_BACK },
        "${handler.definingClass} isn't a public screen")
    val answer = chat!!.methods.singleOrNull { it.toString() == handler.toString() }
    controlShape(answer != null && AccessFlags.PUBLIC.isSet(answer.accessFlags) && !AccessFlags.STATIC.isSet(answer.accessFlags),
        "the chat's volume key answer isn't public")
    val refs = answer!!.controlBody().mapNotNull { it.controlRef() }.toSet()
    controlShape(PLAY_MESSAGE in refs && NO_SOUND_HINT in refs && ROUND_VIDEO in refs,
        "the chat's volume key answer no longer plays a video with sound")
    return KeepVideosMutedSite(dispatch, indices, handler)
}
