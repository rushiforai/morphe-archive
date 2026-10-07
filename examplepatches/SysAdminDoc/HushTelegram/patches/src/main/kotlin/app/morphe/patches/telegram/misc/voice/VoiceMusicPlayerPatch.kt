/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

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
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VOICE_PLAYER = "$EXTENSION_PACKAGE/misc/VoicePlayer;"
internal const val PLAYER_MUSIC = "$VOICE_PLAYER->music(Ljava/lang/Object;)Z"
internal const val IS_MUSIC = "Lorg/telegram/messenger/MessageObject;->isMusic()Z"
internal const val FRAGMENT_CONTEXT_VIEW = "Lorg/telegram/ui/Components/FragmentContextView;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private val PLAYER_TRAITS = listOf(
    "Lorg/telegram/messenger/NotificationCenter\$NotificationCenterDelegate;",
    "Lorg/telegram/messenger/DownloadController\$FileDownloadProgressListener;",
)
private const val SAVED_MUSIC = "Lorg/telegram/messenger/MessagesController\$SavedMusicList;"
private val VIRTUAL = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

@Suppress("unused")
val voiceMusicPlayerPatch = bytecodePatch(
    name = "Voice messages in the music player",
    description = "Adds a switch, off by default, so tapping the bar above a chat while a voice message plays opens Telegram's full music player with its seek bar instead of jumping to the message. View-once voice messages stay as they are.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveVoiceMusicPlayer()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.calls.forEach { (method, indices) -> replaceMusicChecks(MutableMethod(ImmutableMethod.of(method)), indices) }
        for ((name, check) in listOf("isMusic" to "isMusic()Z", "isVoice" to "isVoice()Z", "once" to "isVoiceOnce()Z")) {
            writeStub(VOICE_PLAYER, name, 2, """
                check-cast p0, $MESSAGE
                invoke-virtual {p0}, $MESSAGE->$check
                move-result v0
                return v0
            """)
        }
        site.calls.forEach { (method, indices) -> replaceMusicChecks(method, indices) }
        enableStatus("voiceMusicPlayer")
    }
}

/** The player bar's tap, the full player and its helpers, with the indices of their music checks. */
internal class VoiceMusicPlayerSite(val player: String, val calls: List<Pair<MutableMethod, List<Int>>>)

/** Each music check asks the extension instead, with the same register and the same result. */
internal fun replaceMusicChecks(target: MutableMethod, indices: List<Int>) {
    for (index in indices) {
        val call = target.getInstruction(index)
        val message = call.namedRegisters().single()
        target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            "invoke-static/range {v$message .. v$message}, $PLAYER_MUSIC"
        } else {
            "invoke-static {v$message}, $PLAYER_MUSIC"
        })
    }
}

/**
 * FragmentContextView's tap opens AudioPlayerAlert only when MessageObject.isMusic() says so, and
 * the player closes itself and stops updating its seek bar for anything that isn't music. Those
 * checks are what change; MediaController already plays voice through the background music service.
 */
internal fun BytecodePatchContext.resolveVoiceMusicPlayer(): VoiceMusicPlayerSite {
    requireStatusMethod("voiceMusicPlayer")
    controlHook(VOICE_PLAYER, "music", listOf("Ljava/lang/Object;"), "Z")
    controlHook(VOICE_PLAYER, "isMusic", listOf("Ljava/lang/Object;"), "Z")
    controlHook(VOICE_PLAYER, "isVoice", listOf("Ljava/lang/Object;"), "Z")
    controlHook(VOICE_PLAYER, "once", listOf("Ljava/lang/Object;"), "Z")
    val message = classDefByOrNull(MESSAGE)
    controlShape(message != null && listOf("isMusic()Z", "isVoice()Z", "isVoiceOnce()Z").all { wanted ->
        message.methods.any { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) }
    }, "a message no longer says whether it's music, voice or view-once")

    // The bar: a music check followed closely by the full player being created.
    val bar = mutableListOf<Triple<String, String, Int>>()
    val players = mutableSetOf<String>()
    classDefForEach { cls ->
        if (cls.type != FRAGMENT_CONTEXT_VIEW && cls.fields.none { it.type == FRAGMENT_CONTEXT_VIEW && !AccessFlags.STATIC.isSet(it.accessFlags) }) return@classDefForEach
        cls.methods.forEach { m ->
            val body = m.controlBody()
            for (i in body.indices) {
                if (body[i].opcode !in VIRTUAL || body[i].controlRef() != IS_MUSIC) continue
                val created = (i + 1 until minOf(body.size, i + 14)).map { body[it] }
                    .filter { it.opcode == Opcode.NEW_INSTANCE }
                    .map { ((it as ReferenceInstruction).reference as TypeReference).type }
                    .filter { isPlayer(classDefByOrNull(it)) }
                if (created.isEmpty()) continue
                bar += Triple(cls.type, signature(m), i)
                players += created
            }
        }
    }
    controlShape(bar.size == 1, "the player bar's tap no longer opens the full player for music (${bar.size} sites)")
    val player = players.toList().controlSingle("full music player")

    // The player and the classes built around it, each music check they make.
    val found = mutableListOf(Triple(bar.single().first, bar.single().second, listOf(bar.single().third)))
    var inPlayer = 0
    classDefForEach { cls ->
        val holds = cls.type == player || cls.fields.any { it.type == player && !AccessFlags.STATIC.isSet(it.accessFlags) }
        if (!holds || cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { m ->
            val body = m.controlBody()
            val indices = body.indices.filter { body[it].opcode in VIRTUAL && body[it].controlRef() == IS_MUSIC }
            if (indices.isEmpty()) return@forEach
            if (cls.type == player) inPlayer += indices.size
            found += Triple(cls.type, signature(m), indices)
        }
    }
    controlShape(inPlayer >= 2, "the full player no longer checks for music where it closes and updates its seek bar")
    return VoiceMusicPlayerSite(player, found.map { (type, wanted, indices) -> mutableClassDefBy(type).methods.single { signature(it) == wanted } to indices })
}

/** AudioPlayerAlert keeps its listener interfaces and its saved-music field through R8. */
private fun isPlayer(cls: ClassDef?) = cls != null && PLAYER_TRAITS.all { it in cls.interfaces } &&
    cls.fields.any { it.type == SAVED_MUSIC && !AccessFlags.STATIC.isSet(it.accessFlags) }

private fun signature(method: Method) = "${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}"
