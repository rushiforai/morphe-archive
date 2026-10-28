/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.branchTarget
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VOICE_PLAYER = "$EXTENSION_PACKAGE/misc/VoicePlayer;"
internal const val PLAYER_MUSIC = "$VOICE_PLAYER->music(Ljava/lang/Object;)Z"
internal const val IS_MUSIC = "Lorg/telegram/messenger/MessageObject;->isMusic()Z"
internal const val FRAGMENT_CONTEXT_VIEW = "Lorg/telegram/ui/Components/FragmentContextView;"
internal const val PLAYER_PROFILE = "$VOICE_PLAYER->keepsProfileOut(I)Z"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val PLAYING_NOW = "$MEDIA_CONTROLLER->getPlayingMessageObject()$MESSAGE"
private const val ANIMATE = "Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;"
private val PLAYER_TRAITS = listOf(
    "Lorg/telegram/messenger/NotificationCenter\$NotificationCenterDelegate;",
    "Lorg/telegram/messenger/DownloadController\$FileDownloadProgressListener;",
)
private const val SAVED_MUSIC = "Lorg/telegram/messenger/MessagesController\$SavedMusicList;"
private val VIRTUAL = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

@Suppress("unused")
val voiceMusicPlayerPatch = bytecodePatch(
    name = "Voice messages in the music player",
    description = "Makes tapping the bar above a chat, while a voice message plays, open Telegram's full music player " +
        "with a seek bar. Starts off. Turn it on in HushTelegram settings > Playback.",
    default = true,
) {
    category("Playback")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveVoiceMusicPlayer()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.calls.forEach { (method, indices) -> replaceMusicChecks(MutableMethod(ImmutableMethod.of(method)), indices) }
        askBeforeProfileButtons(MutableMethod(ImmutableMethod.of(site.profile.first)), site.profile.second)
        for ((name, check) in listOf("isMusic" to "isMusic()Z", "isVoice" to "isVoice()Z", "once" to "isVoiceOnce()Z")) {
            writeStub(VOICE_PLAYER, name, 2, """
                check-cast p0, $MESSAGE
                invoke-virtual {p0}, $MESSAGE->$check
                move-result v0
                return v0
            """)
        }
        writeStub(VOICE_PLAYER, "playing", 1, """
            invoke-static {}, $MEDIA_CONTROLLER->getInstance()$MEDIA_CONTROLLER
            move-result-object v0
            invoke-virtual {v0}, $PLAYING_NOW
            move-result-object v0
            return-object v0
        """)
        site.calls.forEach { (method, indices) -> replaceMusicChecks(method, indices) }
        askBeforeProfileButtons(site.profile.first, site.profile.second)
        enableStatus("voiceMusicPlayer")
    }
}

/**
 * The player bar's tap, the full player and its helpers, with the indices of their music checks, and
 * the player's Add to Profile toggle with the index right after it reads whether it shows your own list.
 */
internal class VoiceMusicPlayerSite(
    val player: String,
    val calls: List<Pair<MutableMethod, List<Int>>>,
    val profile: Pair<MutableMethod, Int>,
)

/** The toggle hides both profile buttons when the extension says so, the way it does on your own list. */
internal fun askBeforeProfileButtons(target: MutableMethod, index: Int) {
    val mine = target.getInstruction(index - 1).namedRegisters().single()
    target.addInstructions(index, if (mine > 15) """
        invoke-static/range {v$mine .. v$mine}, $PLAYER_PROFILE
        move-result v$mine
    """ else """
        invoke-static {v$mine}, $PLAYER_PROFILE
        move-result v$mine
    """)
}

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
    forEachClassMentioning(Mention.reference(IS_MUSIC)) { cls ->
        if (cls.type != FRAGMENT_CONTEXT_VIEW && cls.fields.none { it.type == FRAGMENT_CONTEXT_VIEW && !AccessFlags.STATIC.isSet(it.accessFlags) }) return@forEachClassMentioning
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
    forEachClassMentioning(Mention.reference(IS_MUSIC)) { cls ->
        val holds = cls.type == player || cls.fields.any { it.type == player && !AccessFlags.STATIC.isSet(it.accessFlags) }
        if (!holds || cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val body = m.controlBody()
            val indices = body.indices.filter { body[it].opcode in VIRTUAL && body[it].controlRef() == IS_MUSIC }
            if (indices.isEmpty()) return@forEach
            if (cls.type == player) inPlayer += indices.size
            found += Triple(cls.type, signature(m), indices)
        }
    }
    controlShape(inPlayer >= 2, "the full player no longer checks for music where it closes and updates its seek bar")
    val profile = resolveProfileButtons(player)
    return VoiceMusicPlayerSite(
        player,
        found.map { (type, wanted, indices) -> mutableClassDefBy(type).methods.single { signature(it) == wanted } to indices },
        mutableClassDefBy(player).methods.single { signature(it) == profile.first } to profile.second,
    )
}

/**
 * AudioPlayerAlert.setVisibleInProfile(boolean) fades Add to Profile and Remove from Profile in and
 * out, and opens by asking isMyList(), the one no-argument check that reads the saved-music list.
 * Your own list hides both buttons there; the hook goes right after that answer is read.
 */
private fun BytecodePatchContext.resolveProfileButtons(player: String): Pair<String, Int> {
    controlHook(VOICE_PLAYER, "keepsProfileOut", listOf("I"), "Z")
    controlHook(VOICE_PLAYER, "playing", emptyList(), "Ljava/lang/Object;")
    val controller = classDefByOrNull(MEDIA_CONTROLLER)
    controlShape(controller != null && controller.methods.any { it.name == "getInstance" && it.parameterTypes.isEmpty() &&
        it.returnType == MEDIA_CONTROLLER && AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) } &&
        controller.methods.any { "$MEDIA_CONTROLLER->${signature(it)}" == PLAYING_NOW && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags) }, "the music player no longer says which message is playing")
    val methods = classDefByOrNull(player)!!.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    val mine = methods.filter { m ->
        m.parameterTypes.isEmpty() && m.returnType == "Z" &&
            m.controlBody().any { it.opcode == Opcode.IGET_OBJECT && it.controlRef()?.endsWith(":$SAVED_MUSIC") == true }
    }.controlSingle("the player's check for your own profile list")
    val asks = "$player->${signature(mine)}"
    val toggle = methods.filter { m ->
        val body = m.controlBody()
        m.parameterTypes.map { it.toString() } == listOf("Z") && m.returnType == "V" && body.size > 2 &&
            body[0].opcode == Opcode.INVOKE_VIRTUAL && body[0].controlRef() == asks && body[1].opcode == Opcode.MOVE_RESULT &&
            body.count { it.controlRef() == ANIMATE } >= 2
    }.controlSingle("the player's Add to Profile toggle")
    val body = toggle.controlBody()
    val refuse: (String) -> Nothing = { why -> controlShape(false, "the Add to Profile toggle: $why"); error(why) }
    controlShape(body.indices.filter { body[it] is OffsetInstruction }.none { body.branchTarget(it, refuse) == 2 },
        "something in the Add to Profile toggle jumps past its own-list check")
    return signature(toggle) to 2
}

/** AudioPlayerAlert keeps its listener interfaces and its saved-music field through R8. */
private fun isPlayer(cls: ClassDef?) = cls != null && PLAYER_TRAITS.all { it in cls.interfaces } &&
    cls.fields.any { it.type == SAVED_MUSIC && !AccessFlags.STATIC.isSet(it.accessFlags) }

private fun signature(method: Method) = "${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}"
