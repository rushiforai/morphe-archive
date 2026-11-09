/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.recommendations

import app.morphe.patcher.Fingerprint
import app.morphe.util.names.addInstructions
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
import app.morphe.patches.telegram.misc.maintabs.CONSTANTS
import app.morphe.patches.telegram.misc.maintabs.constant
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.literalReads
import app.morphe.util.namedRegisters
import app.morphe.util.readsAfter
import app.morphe.util.refusedByVerifier
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgFingerprint
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Hide recommendations"
private const val RECOMMENDATIONS = "$EXTENSION_PACKAGE/misc/Recommendations;"
internal const val KEYBOARD_FEATURED = "$RECOMMENDATIONS->keyboardFeatured(Ljava/util/ArrayList;)Ljava/util/ArrayList;"
internal const val FEATURED_STICKERS = "Lorg/telegram/messenger/MediaDataController;->getFeaturedStickerSets()Ljava/util/ArrayList;"
internal const val FEATURED_EMOJI = "Lorg/telegram/messenger/MediaDataController;->getFeaturedEmojiSets()Ljava/util/ArrayList;"
internal const val TRENDING_TAB = "Lorg/telegram/messenger/R\$string;->FeaturedStickersShort:I"
internal const val TRENDING_HIDDEN = "featured_hidden"
/** The array both featured getters read, which 13.2's R8 reads in their place: stickers first, then emoji. */
internal const val FEATURED_SETS = "Lorg/telegram/messenger/MediaDataController;->featuredStickerSets:[Ljava/util/ArrayList;"

internal const val CHANNEL_RECOMMENDATIONS = "Lorg/telegram/messenger/MessagesController\$ChannelRecommendations;"
internal const val GET_CHANNEL_RECOMMENDATIONS = "Lorg/telegram/tgnet/TLRPC\$TL_channels_getChannelRecommendations;"
internal const val GET_BOT_RECOMMENDATIONS = "Lorg/telegram/tgnet/tl/TL_bots\$getBotRecommendations;"
internal const val CACHED_RECOMMENDATIONS = "$MESSAGES_CONTROLLER->cachedChannelRecommendations:Ljava/util/HashMap;"
internal const val MAP_GET = "Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;"

/** One controller method fetches similar bots for positive IDs and channels for zero or negative IDs. */
internal val GetChannelRecommendationsFingerprint by tgFingerprint {
    Fingerprint(
        definingClass = type(MESSAGES_CONTROLLER),
        returnType = type(CHANNEL_RECOMMENDATIONS),
        parameters = listOf("J"),
        filters = listOf(newInstance(GET_BOT_RECOMMENDATIONS), newInstance(GET_CHANNEL_RECOMMENDATIONS)),
    )
}

/** Search also reads recommendations through this separate kept cache getter. */
internal val GetCachedChannelRecommendationsFingerprint by tgFingerprint {
    Fingerprint(
        name = methodName(MESSAGES_CONTROLLER, "getCachedChannelRecommendations", listOf("J"), CHANNEL_RECOMMENDATIONS),
        definingClass = type(MESSAGES_CONTROLLER),
        returnType = type(CHANNEL_RECOMMENDATIONS),
        parameters = listOf("J"),
        filters = listOf(
            fieldAccess(
                definingClass = type(MESSAGES_CONTROLLER),
                name = field(MESSAGES_CONTROLLER, "cachedChannelRecommendations", "Ljava/util/HashMap;").name,
                type = "Ljava/util/HashMap;",
            ),
            methodCall(definingClass = "Ljava/util/HashMap;", name = "get"),
        ),
    )
}

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
                    val result = tgClassDefByOrNull(CHANNEL_RECOMMENDATIONS)
                    val constructor = result?.methods?.singleOrNull {
                        it.origName == "<init>" && it.parameterTypes.isEmpty() && it.origReturnType == "V" &&
                            AccessFlags.PUBLIC.isSet(it.accessFlags)
                    }
                    val body = constructor?.implementation?.instructions?.toList().orEmpty()
                    val emptyList = result != null && AccessFlags.PUBLIC.isSet(result.accessFlags) &&
                        body.map { it.opcode } == listOf(
                        Opcode.INVOKE_DIRECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.RETURN_VOID,
                    ) && body.filterIsInstance<ReferenceInstruction>().map { it.reference.origString() } == listOf(
                        "Ljava/lang/Object;-><init>()V", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;-><init>()V",
                        "$CHANNEL_RECOMMENDATIONS->chats:Ljava/util/ArrayList;",
                    )
                    // 13.2's R8 inlined the getter into its callers, so each inlined copy takes the guard instead.
                    // Their trial guards build the empty result, so the constructor comes first.
                    val inlined = if (method == null && emptyList) resolveInlinedCacheReads() else null
                    if (!emptyList) "the recommendation result has no public no-argument constructor with an empty list"
                    else if (inlined?.missing != null) inlined.missing
                    else {
                        if (inlined != null) inlined.apply()
                        else method!!.returnEarlyWhen(
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

/**
 * One caller's inlined copy of the cache getter: a missing map gives [result] null and jumps to [at],
 * the map's answer lands there cast. The guard goes in at [at], where both meet, so a hidden result
 * is the fresh empty one the getter answered, in [result]. [scratch] holds nothing anything reads
 * from there on. The check-cast at the guard's end holds its label; [result] is already that type.
 */
internal class CachedRead(val method: MutableMethod, val at: Int, val result: Int, val scratch: Int) {
    val smali get() = "invoke-static {}, $RECOMMENDATIONS->skipCachedRecommendations()Z\n" +
        "move-result v$scratch\n" +
        "if-eqz v$scratch, :hush_cached\n" +
        "new-instance v$result, $CHANNEL_RECOMMENDATIONS\n" +
        "invoke-direct/range {v$result .. v$result}, $CHANNEL_RECOMMENDATIONS-><init>()V\n" +
        ":hush_cached\n" +
        "check-cast v$result, $CHANNEL_RECOMMENDATIONS"

    fun insert(target: MutableMethod = method) = target.addInstructionsAtControlFlowLabel(at, smali)
}

/** Every inlined cache read, or [missing], why this build can't have the cache guard. Nothing changes until [apply]. */
internal class InlinedCachePlan(private val reads: List<CachedRead>, val missing: String?) {
    // Back to front, so a second read in one method keeps its index.
    fun apply() {
        if (missing == null) reads.sortedByDescending { it.at }.forEach { it.insert() }
    }
}

/**
 * Every read of the recommendation cache outside the controller, each in the getter's inlined shape:
 * the map, a null check that answers null, the get, and the cast. One read in any other shape refuses
 * the whole guard, so no read keeps showing cached results while the switch says they're hidden.
 */
internal fun BytecodePatchContext.resolveInlinedCacheReads(): InlinedCachePlan {
    fun missing(why: String) = InlinedCachePlan(emptyList(), why)
    val reads = mutableListOf<CachedRead>()
    val owners = classDefsMentioning(Mention.reference(CACHED_RECOMMENDATIONS) and Mention.reference(MAP_GET))
        .filter { it.origType != MESSAGES_CONTROLLER && !it.origType.startsWith("Lapp/hushtelegram/") }
    for (owner in owners) for (stock in owner.methods) {
        val body = stock.controlBody()
        val loads = body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlRef() == CACHED_RECOMMENDATIONS }
        val gets = loads.filter { load -> stock.literalReads(load).any { body[it].controlRef() == MAP_GET } }
        if (gets.isEmpty()) continue
        val method = tgMutableClassDefBy(owner.type).methods.single { it.toString() == stock.toString() }
        for (load in gets) reads += method.inlinedCacheRead(load)
            ?: return missing("a caller's inlined recommendation cache getter changed shape in ${stock.definingClass}->${stock.name}")
    }
    if (reads.isEmpty()) return missing("the messages controller has no kept recommendation cache getter")
    for (read in reads) {
        val refusals = trialRefusals(read.method, read.at, 6) { read.insert(it) }
        if (refusals.isNotEmpty()) return missing("${read.method} would fail Android's verifier: ${refusals.joinToString("; ")}")
    }
    return InlinedCachePlan(reads, null)
}

/** The inlined getter whose map read is at [load], or null when its shape is anything else. */
private fun MutableMethod.inlinedCacheRead(load: Int): CachedRead? {
    val body = controlBody()
    val map = (body[load] as OneRegisterInstruction).registerA
    // A missing map: answer null and jump past the cast.
    if (body.getOrNull(load + 1)?.let { it.opcode == Opcode.IF_NEZ && it.namedRegisters() == listOf(map) } != true) return null
    val get = (load + 2 until minOf(load + 10, body.size)).firstOrNull { body[it].controlRef() == MAP_GET } ?: return null
    if (body[get].namedRegisters().first() != map) return null
    val answer = body.getOrNull(get + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction ?: return null
    // R8 may copy the answer into the result register before the cast.
    val copied = body.getOrNull(get + 2)?.takeIf { it.opcode in MOVES && it.namedRegisters().getOrNull(1) == answer.registerA }
    val cast = if (copied != null) get + 3 else get + 2
    val result = body.getOrNull(cast)?.takeIf { it.opcode == Opcode.CHECK_CAST && it.controlRef() == CHANNEL_RECOMMENDATIONS }
        ?.let { (it as OneRegisterInstruction).registerA } ?: return null
    if ((copied?.namedRegisters()?.first() ?: answer.registerA) != result) return null
    val at = cast + 1
    if (at >= body.size) return null
    val flow = ControlFlow.of(this)
    // The null answer: the check falls through to a jump to [at], with a write of the result first
    // unless R8 knows the register already holds null. A map goes on to the get.
    val empty = load + 2
    val jump = if (body[empty].opcode in GOTOS) empty else empty + 1
    if (jump != empty && (!body[empty].opcode.setsRegister() || body[empty].namedRegisters().firstOrNull() != result)) return null
    val onward = flow.normal[load + 1] - empty
    if (empty !in flow.normal[load + 1] || onward.size != 1 || onward.single() !in jump + 1..get) return null
    if (body[jump].opcode !in GOTOS || flow.normal[jump] != listOf(at)) return null
    // Only the cast and the null answer reach [at].
    val into = flow.normal.indices.filter { at in flow.normal[it] || at in flow.exceptional[it] }
    if (into.toSet() != setOf(cast, jump)) return null
    val scratch = (0 until implementation!!.registerCount).firstOrNull { register ->
        register != result && readsAfter(cast, register).isEmpty()
    } ?: return null
    return CachedRead(this, at, result, scratch)
}

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

    val featured = Mention.reference(FEATURED_SETS)
    val tabs = classDefsMentioning((Mention.reference(FEATURED_STICKERS) or featured) and Mention.reference(TRENDING_TAB) and
        Mention.string(TRENDING_HIDDEN)).flatMap { classDef ->
        classDef.methods.filter { method ->
            method.isKeyboardPass() && method.controlBody().any { it.controlRef() == TRENDING_TAB } &&
                method.controlBody().any { it.controlString() == TRENDING_HIDDEN }
        }.map { classDef to it }
    }
    val (keyboard, tab) = tabs.singleOrNull()
        ?: return missing("the sticker keyboard no longer builds its Trending tab in one place")
    val tabRead = tgMutableClassDefBy(keyboard).methods.single { it.toString() == tab.toString() }
        .featuredRead(Featured.STICKERS) ?: return missing("the sticker keyboard no longer reads its trending packs once")

    val grids = classDefsMentioning(Mention.reference(FEATURED_EMOJI) or featured).filter { classDef ->
        classDef.fields.any { it.origType == keyboard.origType && !AccessFlags.STATIC.isSet(it.accessFlags) }
    }.flatMap { classDef -> classDef.methods.filter { it.isKeyboardPass() && it.featuredReads(Featured.EMOJI).size == 1 }.map { classDef to it } }
    val (owner, grid) = grids.singleOrNull()
        ?: return missing("the emoji keyboard no longer builds its pack list in one place")
    val gridRead = tgMutableClassDefBy(owner).methods.single { it.toString() == grid.toString() }
        .featuredRead(Featured.EMOJI) ?: return missing("the emoji keyboard no longer reads its trending packs once")

    for (read in listOf(tabRead, gridRead)) {
        val refusals = trialRefusals(read.method, read.at, 2) { it.addInstructions(read.at, read.smali) }
        if (refusals.isNotEmpty()) return missing("${read.method} would fail Android's verifier: ${refusals.joinToString("; ")}")
    }
    return KeyboardFeaturedPlan(listOf(tabRead, gridRead), null)
}

/** An instance method taking one boolean, as both keyboard passes are. */
private fun Method.isKeyboardPass() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.map { it.toString() } == listOf("Z") && implementation != null

/** A featured list's getter, and the slot of [FEATURED_SETS] 13.2's R8 reads in its place. */
internal enum class Featured(val call: String, val slot: Int) { STICKERS(FEATURED_STICKERS, 0), EMOJI(FEATURED_EMOJI, 1) }

/**
 * Every read of [featured] here, from its first instruction to the one that leaves the list in a
 * register: the getter and its result, or 13.2's array read and the load of the slot from it. A read
 * that leaves nothing in a register, or an array read whose slot isn't one plain constant, counts
 * as a read of either list that can't be wrapped.
 */
internal fun Method.featuredReads(featured: Featured): List<IntRange> {
    val body = controlBody()
    val flow by lazy { ControlFlow.of(this) }
    return body.indices.mapNotNull { first ->
        val instruction = body[first]
        when {
            instruction.controlRef() == featured.call ->
                first..(if (body.getOrNull(first + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT) first + 1 else first)
            instruction.opcode == Opcode.IGET_OBJECT && instruction.controlRef() == FEATURED_SETS -> {
                val array = (instruction as OneRegisterInstruction).registerA
                // At most one constant between, the slot, and not into the array's register.
                val load = (first + 1..minOf(first + 2, body.lastIndex)).firstOrNull { at ->
                    body[at].opcode == Opcode.AGET_OBJECT && (body[at] as ThreeRegisterInstruction).registerB == array &&
                        (at == first + 1 || body[first + 1].opcode in CONSTANTS && body[first + 1].namedRegisters().first() != array)
                }
                val slot = load?.let { constant(body, flow, it, (body[it] as ThreeRegisterInstruction).registerC) }
                when {
                    load == null || slot == null -> first..first
                    slot == featured.slot -> first..load
                    else -> null
                }
            }
            else -> null
        }
    }
}

/** The one read of [featured] here, kept in a register, with nothing jumping to the instruction after it. */
private fun MutableMethod.featuredRead(featured: Featured): FeaturedRead? {
    val read = featuredReads(featured).singleOrNull() ?: return null
    val body = controlBody()
    val end = read.last
    val result = body[end].takeIf { end > read.first && it.opcode in KEPT } as? OneRegisterInstruction ?: return null
    val at = end + 1
    if (at >= body.size) return null
    val flow = ControlFlow.of(this)
    val reached = flow.normal.indices.any { from -> (from != end && at in flow.normal[from]) || at in flow.exceptional[from] }
    return if (reached) null else FeaturedRead(this, at, result.registerA)
}

private val KEPT = setOf(Opcode.MOVE_RESULT_OBJECT, Opcode.AGET_OBJECT)
private val MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

/**
 * What Android's verifier would refuse in a copy of [method] with [added] instructions put in at [at]
 * by [insert], past what it already refuses in the stock method. The check is stricter than ART about
 * stock code that merges two classes into one register, so only what the hook adds counts.
 */
private fun BytecodePatchContext.trialRefusals(method: MutableMethod, at: Int, added: Int, insert: (MutableMethod) -> Unit): List<String> {
    val context = this
    val trial = MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, null, null, method.implementation)).apply(insert)
    fun refusals(target: Method) = refusedByVerifier(target, { context.tgClassDefByOrNull(it)?.superclass },
        { context.tgClassDefByOrNull(it)?.let { found -> AccessFlags.INTERFACE.isSet(found.accessFlags) } })
    val numbered = Regex("^instruction (\\d+) ")
    fun asStock(refusal: String): String {
        val number = numbered.find(refusal)?.groups?.get(1) ?: return refusal
        val index = number.value.toInt()
        return when {
            index < at -> refusal
            index < at + added -> "the hook's $refusal"
            else -> refusal.replaceRange(number.range, (index - added).toString())
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
