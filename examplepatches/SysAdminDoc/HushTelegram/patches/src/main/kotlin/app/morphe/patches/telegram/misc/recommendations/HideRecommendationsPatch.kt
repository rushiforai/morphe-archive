/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.recommendations

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.refusedByVerifier
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Hide recommendations"
private const val RECOMMENDATIONS = "$EXTENSION_PACKAGE/misc/Recommendations;"
internal const val KEYBOARD_FEATURED = "$RECOMMENDATIONS->keyboardFeatured(Ljava/util/ArrayList;)Ljava/util/ArrayList;"
internal const val FEATURED_STICKERS = "Lorg/telegram/messenger/MediaDataController;->getFeaturedStickerSets()Ljava/util/ArrayList;"
internal const val FEATURED_EMOJI = "Lorg/telegram/messenger/MediaDataController;->getFeaturedEmojiSets()Ljava/util/ArrayList;"
internal const val TRENDING_TAB = "Lorg/telegram/messenger/R\$string;->FeaturedStickersShort:I"
internal const val TRENDING_HIDDEN = "featured_hidden"

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
 *
 * The trending packs switch is optional: a build without both keyboard reads keeps the rest.
 */
@Suppress("unused")
val hideRecommendationsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides suggested similar channels and bots, and stops Telegram from loading new suggestions. On by " +
        "default. Turn it off in HushTelegram settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hideRecommendations")
        requireStatusMethod("channelRecommendations")
        requireStatusMethod("cachedRecommendations")
        requireStatusMethod("keyboardFeatured")
        controlHook(RECOMMENDATIONS, "keyboardFeatured", listOf("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;")

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

        val keyboard = resolveKeyboardFeatured()
        if (keyboard.missing == null) {
            keyboard.apply()
            enableCapability("keyboardFeatured")
        } else {
            patchLog.warning("$PATCH: ${keyboard.missing}. The patch goes on without the trending packs switch.")
        }

        enableStatus("hideRecommendations")
    }
}

private enum class RecommendationTarget { REQUEST, CACHE }

/** A keyboard pass's one read of a featured list, and the register the copy goes on from. */
internal class FeaturedRead(val method: MutableMethod, val at: Int, val register: Int) {
    val smali get() = "invoke-static/range {v$register .. v$register}, $KEYBOARD_FEATURED\nmove-result-object v$register"
}

/** Both keyboard reads, or [missing], why this build can't have the switch. Nothing changes until [apply]. */
internal class KeyboardFeaturedPlan(private val reads: List<FeaturedRead>, val missing: String?) {
    fun apply() {
        if (missing == null) reads.forEach { read -> read.method.addInstructions(read.at, read.smali) }
    }
}

/**
 * The sticker keyboard's tab pass copies Telegram's featured stickers into the list its Trending tab
 * and the grid's trending row both test for empty, and the emoji keyboard's grid pass does the same
 * for featured emoji packs. Each read is wrapped where its result lands, so with the switch on both
 * copies start from an empty list. Search and the Stickers and Emoji screen read Telegram's list
 * themselves and keep it.
 */
internal fun BytecodePatchContext.resolveKeyboardFeatured(): KeyboardFeaturedPlan {
    fun missing(why: String) = KeyboardFeaturedPlan(emptyList(), why)

    val tabs = classDefsMentioning(Mention.reference(FEATURED_STICKERS) and Mention.reference(TRENDING_TAB) and
        Mention.string(TRENDING_HIDDEN)).flatMap { classDef ->
        classDef.methods.filter { method ->
            method.isKeyboardPass() && method.controlBody().any { it.controlRef() == TRENDING_TAB } &&
                method.controlBody().any { it.controlString() == TRENDING_HIDDEN }
        }.map { classDef to it }
    }
    val (keyboard, tab) = tabs.singleOrNull()
        ?: return missing("the sticker keyboard no longer builds its Trending tab in one place")
    val tabRead = mutableClassDefBy(keyboard).methods.single { it.toString() == tab.toString() }
        .featuredRead(FEATURED_STICKERS) ?: return missing("the sticker keyboard no longer reads its trending packs once")

    val grids = classDefsMentioning(Mention.reference(FEATURED_EMOJI)).filter { classDef ->
        classDef.fields.any { it.type == keyboard.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
    }.flatMap { classDef -> classDef.methods.filter { it.isKeyboardPass() && it.featuredCalls(FEATURED_EMOJI) == 1 }.map { classDef to it } }
    val (owner, grid) = grids.singleOrNull()
        ?: return missing("the emoji keyboard no longer builds its pack list in one place")
    val gridRead = mutableClassDefBy(owner).methods.single { it.toString() == grid.toString() }
        .featuredRead(FEATURED_EMOJI) ?: return missing("the emoji keyboard no longer reads its trending packs once")

    for (read in listOf(tabRead, gridRead)) {
        val refusals = read.trialRefusals(this)
        if (refusals.isNotEmpty()) return missing("${read.method} would fail Android's verifier: ${refusals.joinToString("; ")}")
    }
    return KeyboardFeaturedPlan(listOf(tabRead, gridRead), null)
}

/** An instance method taking one boolean, as both keyboard passes are. */
private fun Method.isKeyboardPass() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.map { it.toString() } == listOf("Z") && implementation != null

private fun Method.featuredCalls(call: String) = controlBody().count { it.controlRef() == call }

/** The one [call] here, kept in a register, with nothing jumping to the instruction after it. */
private fun MutableMethod.featuredRead(call: String): FeaturedRead? {
    if (featuredCalls(call) != 1) return null
    val body = controlBody()
    val index = body.indexOfFirst { it.controlRef() == call }
    val result = body.getOrNull(index + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction ?: return null
    val at = index + 2
    if (at >= body.size) return null
    val flow = ControlFlow.of(this)
    val reached = flow.normal.indices.any { from -> (from != index + 1 && at in flow.normal[from]) || at in flow.exceptional[from] }
    return if (reached) null else FeaturedRead(this, at, result.registerA)
}

/**
 * What Android's verifier would refuse in a copy of the method with the wrap in place, past what it
 * already refuses in the stock method. The check is stricter than ART about stock code that merges
 * two classes into one register, so only what the wrap adds counts.
 */
private fun FeaturedRead.trialRefusals(context: BytecodePatchContext): List<String> {
    val trial = MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, null, null, method.implementation)).apply { addInstructions(at, smali) }
    fun refusals(target: Method) = refusedByVerifier(target, { context.classDefByOrNull(it)?.superclass },
        { context.classDefByOrNull(it)?.let { found -> AccessFlags.INTERFACE.isSet(found.accessFlags) } })
    val numbered = Regex("^instruction (\\d+) ")
    fun asStock(refusal: String): String {
        val number = numbered.find(refusal)?.groups?.get(1) ?: return refusal
        val index = number.value.toInt()
        return when {
            index < at -> refusal
            index < at + 2 -> "the wrap's $refusal"
            else -> refusal.replaceRange(number.range, (index - 2).toString())
        }
    }
    return try {
        val stock = refusals(method).groupingBy { it }.eachCount().toMutableMap()
        refusals(trial).map(::asStock).filter { refusal ->
            val left = stock[refusal] ?: 0
            if (left > 0) stock[refusal] = left - 1
            left == 0
        }
    } catch (unreadable: IllegalArgumentException) {
        listOf("its body can't be checked: ${unreadable.message}")
    }
}
