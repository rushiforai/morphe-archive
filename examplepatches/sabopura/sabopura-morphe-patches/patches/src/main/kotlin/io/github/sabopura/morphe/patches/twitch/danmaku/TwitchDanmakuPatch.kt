package io.github.sabopura.morphe.patches.twitch.danmaku

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.chat.describedFields
import io.github.sabopura.morphe.patches.twitch.player.ivsPlayerHooks
import io.github.sabopura.morphe.patches.twitch.player.vodContextHook
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.enableTwitchFeature
import io.github.sabopura.morphe.patches.twitch.support.fieldBridge
import io.github.sabopura.morphe.patches.twitch.support.replaceBridge
import io.github.sabopura.morphe.patches.twitch.support.requirePublicField
import io.github.sabopura.morphe.patches.twitch.support.insertBeforeKeepingLabels
import io.github.sabopura.morphe.patches.twitch.support.softHook
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import io.github.sabopura.morphe.patches.twitch.ui.playerMenuResourcePatch
import java.util.logging.Logger

private const val EXTENSION_CLASS =
    "Lio/github/sabopura/morphe/extension/twitch/danmaku/TwitchDanmaku;"
private const val LIVE_CHAT =
    "Lio/github/sabopura/morphe/extension/twitch/danmaku/LiveChat;"
private const val MESSAGE_ACCESS =
    "Lio/github/sabopura/morphe/extension/twitch/danmaku/MessageAccess;"
private val logger = Logger.getLogger("Morphe.Twitch.Danmaku")

/** Strings only Twitch's live chat parser uses while classifying a message. */
private val PARSER_STRINGS = setOf("gigantified-emote-message", "animated-message")

/** The parsed live chat message is a Kotlin data class; its toString() is the stable anchor. */
internal object LiveChatMessageToStringFingerprint : Fingerprint(
    name = "toString",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
    strings = listOf("LiveChatMessage(messageId="),
)

/** Accessor name, label in the message's toString, and the type that field must have. */
private val MESSAGE_FIELDS = listOf(
    Triple("tags", ", messageTags=", "Ljava/util/Map;"),
    Triple("color", ", senderColor=", "Ljava/lang/Integer;"),
    Triple("tokens", ", messageTokens=", "Ljava/util/List;"),
    Triple("gigantifiedEmote", ", gigantifiedEmoteToken=", null),
    Triple("timestampSeconds", ", timestampSeconds=", "Ljava/lang/Long;"),
    Triple("sender", ", sender=", null),
)

/** Stops the comments while the video is paused; follows bakwudo/uyu's player state hook. */
private fun BytecodePatchContext.hookPlayerState() {
    val presenter = classesWithStrings("getPlayerStateAndEventDisposable()Lio/reactivex/disposables/Disposable;").uniqueContract("player presenter")
    val update = presenter.methods.filter { method ->
        method.parameterTypes.size == 1 && method.returnType == "V" && method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "widevine"
        } == true
    }.uniqueContract("player state update")
    val implementation = update.implementation ?: throw PatchException("Danmaku: player state update has no code")
    if (implementation.registerCount - update.parameterTypes.size - 1 < 2)
        throw PatchException("Danmaku: player state update has too few free registers")

    val (playerField, getState) = presenter.instanceFields.mapNotNull { field ->
        val type = classDefByOrNull(field.type)?.takeIf { AccessFlags.INTERFACE.isSet(it.accessFlags) } ?: return@mapNotNull null
        val method = type.methods.singleOrNull { it.name == "getState" && it.parameterTypes.isEmpty() } ?: return@mapNotNull null
        if (classDefByOrNull(method.returnType)?.superclass == "Ljava/lang/Enum;") field to method else null
    }.uniqueContract("player state field")
    val viewField = presenter.instanceFields.filter { classDefByOrNull(it.type)?.superclass == RX_VIEW_DELEGATE }
        .uniqueContract("player view delegate field")
    val rootView = classDefBy(BASE_VIEW_DELEGATE).instanceFields.filter { it.type == "Landroid/view/View;" }
        .uniqueContract("view delegate root view")
    val target = mutableClassDefBy(presenter).methods.first { it.name == update.name && it.parameterTypes == update.parameterTypes }
    target.addInstructionsWithLabels(0, """
        move-object/from16 v1, p0
        iget-object v0, v1, $playerField
        if-eqz v0, :skip
        invoke-interface {v0}, $getState
        move-result-object v0
        iget-object v1, v1, $viewField
        if-eqz v1, :skip
        iget-object v1, v1, $rootView
        invoke-static {v1, v0}, $EXTENSION_CLASS->onPlayerState(Landroid/view/View;Ljava/lang/Enum;)V
    """, ExternalLabel("skip", target.getInstruction(0)))
}

private const val BASE_VIEW_DELEGATE = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"
private const val RX_VIEW_DELEGATE = "Ltv/twitch/android/core/mvp/viewdelegate/RxViewDelegate;"

/**
 * Sends each parsed live chat message to the shared stream. Only danmaku, read-aloud and the
 * hype meter depend on it, so with none of them selected Twitch's parser is left untouched.
 */
internal val liveChatHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    val readers = linkedMapOf<String, FieldReference>()

    execute {
        val message = LiveChatMessageToStringFingerprint.originalClassDef
        val fields = describedFields(message)
        for ((name, label, type) in MESSAGE_FIELDS) {
            val field = fields[label]?.takeIf { type == null || it.type == type }
                ?: throw PatchException("Danmaku: message field $label not found")
            readers[name] = field
        }
        // Chat messages carry no "login" tag; the sender's username is the login name.
        readers["login"] = describedFields(classDefBy(readers.getValue("sender").type))[", username="]
            ?.takeIf { it.type == "Ljava/lang/String;" } ?: throw PatchException("Danmaku: sender username not found")
        readers.values.forEach { requirePublicField(it, "Danmaku") }
        for (anchor in listOf("TextToken(text=", "EmoteToken(id=")) {
            if (classDefByStrings(anchor).isEmpty()) throw PatchException("Danmaku: chat token format changed: $anchor")
        }

        // The parser returns one LiveChatMessage per incoming IRC/EventSub message. Whispers
        // and other surfaces use different factory methods without these message types.
        val parsers = mutableListOf<Pair<String, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (method.returnType != message.type) return@forEach
                val strings = method.implementation?.instructions
                    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                    ?.toSet() ?: return@forEach
                if (strings.containsAll(PARSER_STRINGS)) parsers += classDef.type to method
            }
        }
        val (parserClass, parser) = parsers.uniqueContract("live chat parser")
        val method = mutableClassDefBy(parserClass).methods.single {
            it.name == parser.name && it.parameterTypes == parser.parameterTypes && it.returnType == parser.returnType
        }
        val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
        if (returns.isEmpty()) throw PatchException("Twitch chat parser has no return")
        returns.asReversed().forEach { index ->
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.insertBeforeKeepingLabels(
                index,
                "invoke-static/range {v$register .. v$register}, $LIVE_CHAT->onMessage(Ljava/lang/Object;)V",
            )
        }
        logger.info("Hooked ${returns.size} return(s) of $parserClass->${parser.name}")
    }

    finalize {
        readers.forEach { (name, field) -> replaceBridge(MESSAGE_ACCESS, name, fieldBridge(field)) }
    }
}

@Suppress("unused")
val twitchDanmakuPatch = bytecodePatch(
    name = "Danmaku chat",
    description = "Flows live chat, and the chat replay of VODs, over the video like NicoNico/bilibili, " +
        "with emotes and NG words. Long-press the player menu button to switch it on or off.",
    default = true,
) {
    // The IVS player and VOD setup hooks tell the VOD replay where the video is and which VOD it shows.
    dependsOn(liveChatHook, twitchDanmakuResourcePatch, playerMenuResourcePatch, ivsPlayerHooks, vodContextHook)
    compatibleWith(TWITCH_SUPPORTED)
    extendWith("extensions/twitch.mpe")
    val vodReaders = linkedMapOf<String, FieldReference>()

    execute {
        softHook("Danmaku pause with the video") { hookPlayerState() }
        softHook("Danmaku on VODs") { vodReaders.putAll(hookVodComments()) }
    }

    finalize {
        enableTwitchFeature("DANMAKU")
        if (vodReaders.isNotEmpty()) {
            vodReaders.forEach { (name, field) -> replaceBridge(VOD_COMMENT_ACCESS, name, vodBridge(field)) }
            enableTwitchFeature("VOD_DANMAKU")
        }
    }
}
