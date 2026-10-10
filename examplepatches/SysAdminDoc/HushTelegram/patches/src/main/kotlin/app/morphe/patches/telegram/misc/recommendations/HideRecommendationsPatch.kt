/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.recommendations

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PATCH = "Hide recommendations"
private const val RECOMMENDATIONS = "$EXTENSION_PACKAGE/misc/Recommendations;"

internal const val CHANNEL_RECOMMENDATIONS = "Lorg/telegram/messenger/MessagesController\$ChannelRecommendations;"
internal const val GET_CHANNEL_RECOMMENDATIONS = "Lorg/telegram/tgnet/TLRPC\$TL_channels_getChannelRecommendations;"
internal const val GET_BOT_RECOMMENDATIONS = "Lorg/telegram/tgnet/tl/TL_bots\$getBotRecommendations;"

/** One controller method fetches similar bots for positive IDs and channels for zero or negative IDs. */
internal object GetChannelRecommendationsFingerprint : Fingerprint(
    definingClass = MESSAGES_CONTROLLER,
    returnType = CHANNEL_RECOMMENDATIONS,
    parameters = listOf("J"),
    filters = listOf(newInstance(GET_BOT_RECOMMENDATIONS), newInstance(GET_CHANNEL_RECOMMENDATIONS)),
)

/** Search also reads recommendations through this separate kept cache getter. */
internal object GetCachedChannelRecommendationsFingerprint : Fingerprint(
    name = "getCachedChannelRecommendations",
    definingClass = MESSAGES_CONTROLLER,
    returnType = CHANNEL_RECOMMENDATIONS,
    parameters = listOf("J"),
    filters = listOf(
        fieldAccess(definingClass = MESSAGES_CONTROLLER, name = "cachedChannelRecommendations", type = "Ljava/util/HashMap;"),
        methodCall(definingClass = "Ljava/util/HashMap;", name = "get"),
    ),
)

/**
 * Hides similar channels and bots without clearing Telegram's recommendation cache.
 *
 * The request getter returns null before it reads cached results or builds either request. Its
 * callers treat null as no recommendations. The cache-only getter returns a fresh empty result:
 * search uses null for loading placeholders, but an empty list draws no recommended section.
 * Both guards leave the complete stock methods available when disabled or paused.
 *
 * Verified against Telegram 12.10.6 on 2026-10-01. Both request constructors are required for the
 * shared request capability; the independent cache hook has its own capability.
 */
@Suppress("unused")
val hideRecommendationsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides suggested similar channels and bots, and stops Telegram from loading new suggestions. On by " +
        "default. Turn it off in HushTelegram settings > Chats.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hideRecommendations")
        requireStatusMethod("channelRecommendations")
        requireStatusMethod("cachedRecommendations")

        handleTargets(PATCH, "recommendation targets", RecommendationTarget.entries) { target ->
            when (target) {
                RecommendationTarget.REQUEST -> GetChannelRecommendationsFingerprint.methodOrNull.let { method ->
                    if (method == null) "the messages controller has no (long) method that builds both channel and bot recommendations"
                    else {
                        method.returnEarlyWhen(PATCH, "$RECOMMENDATIONS->skipRecommendations()Z", "const/4 v0, 0x0\nreturn-object v0")
                        enableCapability("channelRecommendations")
                        null
                    }
                }
                RecommendationTarget.CACHE -> GetCachedChannelRecommendationsFingerprint.methodOrNull.let { method ->
                    val result = classDefByOrNull(CHANNEL_RECOMMENDATIONS)
                    val constructor = result?.methods?.singleOrNull {
                        it.name == "<init>" && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                            AccessFlags.PUBLIC.isSet(it.accessFlags)
                    }
                    val body = constructor?.implementation?.instructions?.toList().orEmpty()
                    val emptyList = result != null && AccessFlags.PUBLIC.isSet(result.accessFlags) &&
                        body.map { it.opcode } == listOf(
                        Opcode.INVOKE_DIRECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.RETURN_VOID,
                    ) && body.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() } == listOf(
                        "Ljava/lang/Object;-><init>()V", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;-><init>()V",
                        "$CHANNEL_RECOMMENDATIONS->chats:Ljava/util/ArrayList;",
                    )
                    if (method == null) "the messages controller has no kept recommendation cache getter"
                    else if (!emptyList) "the recommendation result has no public no-argument constructor with an empty list"
                    else {
                        method.returnEarlyWhen(
                            PATCH, "$RECOMMENDATIONS->skipCachedRecommendations()Z",
                            "new-instance v0, $CHANNEL_RECOMMENDATIONS\n" +
                                "invoke-direct {v0}, $CHANNEL_RECOMMENDATIONS-><init>()V\nreturn-object v0",
                        )
                        enableCapability("cachedRecommendations")
                        null
                    }
                }
            }
        }

        enableStatus("hideRecommendations")
    }
}

private enum class RecommendationTarget { REQUEST, CACHE }
