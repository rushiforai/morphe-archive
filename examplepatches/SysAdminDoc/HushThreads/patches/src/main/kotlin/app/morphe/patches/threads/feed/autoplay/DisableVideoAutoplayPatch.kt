/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 449 and 448 and by a method trace of 449 on an emulator (2026-10-02), and
 * carried to 450 by reading its reshaped PostVideo and playback effect (2026-10-06). The Instagram
 * post, trend preview and ad card calls and PostVideo's default mask were read from 450 (2026-10-10),
 * their shortened PostVideo forwarder from 451 (2026-10-13), 454's forwarder, which pins the
 * play flag to false, from 454 (2026-11-02), and the lambda 455's PostVideo hands the flag to from
 * 455 (2026-11-12).
 */
package app.morphe.patches.threads.feed.autoplay

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.feed.reaching
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.argumentRegister
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.readsAfter
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Disable video autoplay"
internal const val VIDEO_AUTOPLAY = "$EXTENSION_PACKAGE/feed/VideoAutoplay;"

/** Compose's note naming Threads' video-in-a-post composable. It names the source file, so it survives Redex. */
internal const val POST_VIDEO = "com.instagram.barcelona.feed.post.video.PostVideo (PostVideo.kt:"

/** The same note for the effect that starts and releases a post video's player. */
internal const val PLAYBACK_EFFECT = "com.instagram.video.player.compose.VideoPlaybackEffect (VideoPlaybackEffect.kt:"

/** And for Instagram's video player composable, which runs that effect. Since 455 PostVideo reaches it through a lambda. */
internal const val VIDEO_PLAYER = "com.instagram.video.player.compose.IgComposeVideoPlayer (IgComposeVideoPlayer.kt:"

/** Notes in the feed post composables that put a video in a post: one on its own, and one in a carousel. */
internal const val POST_SINGLE_MEDIA = "com.instagram.barcelona.feed.post.ui.PostSingleMedia"
internal const val POST_CAROUSEL = "com.instagram.barcelona.feed.post.ui.PostCarousel"

/**
 * Notes in the composables that show a video inside a post rather than as its own media: an
 * Instagram post shown in a thread, a trend's preview and an ad card. 452 moved the Instagram post's
 * PostVideo call into a lambda of its composable, so its note covers the lambdas too.
 */
internal const val INLINE_IG_VIDEO = "com.instagram.barcelona.igmedia.InlineIgVideo"
internal const val TREND_PREVIEW_VIDEO =
    "com.instagram.barcelona.common.ui.mediahighlights.AutoplayingMediaHighlightVideo (TrendMediaHighlightsPreview.kt:"
internal const val AD_CARD = "com.instagram.barcelona.sponsored.ui.AdCard (AdCard.kt:"

/** Every composable whose calls to PostVideo the hook holds. */
internal val VIDEO_CALLERS = listOf(POST_SINGLE_MEDIA, POST_CAROUSEL, INLINE_IG_VIDEO, TREND_PREVIEW_VIDEO, AD_CARD)

/**
 * Videos in feed posts wait for a tap.
 *
 * A video in a post is Threads' PostVideo composable. One of its booleans says whether this is the
 * video Threads picked to play; PostVideo plays it only when that's true and the player is ready,
 * hands the answer to VideoPlaybackEffect, which starts or releases the player, and only builds the
 * player's surface for the picked video. Since 455 it hands the flag to a lambda instead, which
 * composes Instagram's video player with a 1 to play by only when the flag is true, and the player
 * hands that to the effect. The posts in a feed, a profile or a thread pass that flag
 * from PostSingleMedia and PostCarousel, and the hook sits on it at those calls. So does an
 * Instagram post shown in a thread. Trend previews and ad cards call PostVideo themselves too, but
 * leave the flag to PostVideo's default, which plays: Compose's default mask has the flag's bit set,
 * so PostVideo throws away what they pass. At those calls the hook clears that bit and hands
 * PostVideo the extension's answer about the default instead. On 454 they go through a forwarder
 * that pins the flag to false, so the mask's bit alone decides, and the hook keeps the bit only
 * when the extension lets the video play. The full-screen viewer a tap opens
 * calls PostVideo from its own composable, also leaving the flag to the default, and isn't touched,
 * so it plays as it always has. PostVideo itself isn't touched either, since the viewer goes
 * through it.
 *
 * Instagram's own autoplay check, which brosssh/morphe-patches turns off for Instagram, is still in
 * Threads but isn't on this path: a trace of 449 showed a feed video starting with it answering
 * that autoplay was off. Threads' video prefetcher reads it, though, so a held video could still
 * download ahead. The check has two readers, the prefetcher's skip test and Instagram's older
 * autoplay checker, and only the first is wanted. So the hook goes on the check's answer inside the
 * skip test, and the check itself stays as it was.
 */
@Suppress("unused")
val disableVideoAutoplayPatch = bytecodePatch(
    name = PATCH,
    description = "Videos in your feed wait for a tap instead of playing as you scroll. Good for a calmer feed and " +
        "less data use. Starts off. Turn it on in HushThreads settings > Feed.",
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("disableVideoAutoplay")
        val effect = composable(PLAYBACK_EFFECT, "the video playback effect").also { it.requirePlaybackEffect() }
        val postVideo = composable(POST_VIDEO, "PostVideo")
        val shape = playTest(postVideo, effect)
        val default = postVideo.playDefault(shape)
        val targets = playTargets(postVideo, shape.parameter, default)
        val skip = prefetchSkip()
        val sites = VIDEO_CALLERS.flatMap { note ->
            playSites(targets, note).ifEmpty { throw PatchException("$PATCH: no call to PostVideo holds \"$note\"") }
        }
        sites.forEach { site ->
            // A caller that leaves the flag to PostVideo's default gets the bit cleared and the default's value to ask about.
            val defaulted = site.defaulted?.let {
                """
                    const v${it.register}, ${it.mask}
                    const/16 v${site.register}, ${it.value}
                """
            }.orEmpty()
            val ask = """
                invoke-static/range { v${site.register} .. v${site.register} }, $VIDEO_AUTOPLAY->play(Z)Z
                move-result v${site.register}
            """
            // Behind a forwarder that pins the flag, the mask is all there is: ask about the default's
            // 1, then hand PostVideo the mask with its bit when the video may play and without it when not.
            val hook = site.chosen?.let {
                """
                    const/16 v${site.register}, 0x1
                """ + ask + """
                    if-nez v${site.register}, :plays
                    const v${site.register}, ${it.without}
                    goto :chosen
                    :plays
                    const v${site.register}, ${it.with}
                    :chosen
                    nop
                """
            } ?: (defaulted + ask)
            mutableClassDefBy(site.method.definingClass).findMutableMethodOf(site.method)
                .addInstructionsAtControlFlowLabel(site.call, hook)
        }
        // The skip test's answer: true skips the prefetch, so a held video isn't downloaded ahead.
        mutableClassDefBy(skip.method.definingClass).findMutableMethodOf(skip.method).addInstructionsAtControlFlowLabel(
            skip.test,
            """
                invoke-static/range { v${skip.register} .. v${skip.register} }, $VIDEO_AUTOPLAY->skipPrefetch(Z)Z
                move-result v${skip.register}
            """,
        )
        enableStatus("disableVideoAutoplay")
    }
}

/** The string the prefetch dispatcher queues under. It's in Threads' own logging, so Redex leaves it. */
internal const val PREFETCH_DISPATCHER = "VideoPrefetchDispatcher.queue"

/** The two names of the flag Instagram's autoplay-off check reads. */
internal const val AUTOPLAY_OFF = "ig_disable_video_autoplay"
internal const val AUTOPLAY_OFF_OLYMPUS = "ig_olympus_disable_video_autoplay"

/**
 * The prefetcher's skip test: the [method] that asks the [check] whether autoplay is off and skips
 * the prefetch if so. [call] is the check's call, [test] the if-nez that reads its answer from
 * [register], which only that call writes.
 */
internal data class PrefetchSkip(val method: Method, val check: Method, val call: Int, val test: Int, val register: Int)

internal fun Method.holdsString(value: String): Boolean = implementation?.instructions?.any {
    it.getReference<StringReference>()?.string == value
} == true

private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Instagram's autoplay-off check is the one static method taking a single object and returning a
 * boolean that holds both flag names. Its sibling takes a second parameter and holds only the
 * Olympus name, so it never matches. The skip is the method the prefetch dispatcher, the one method
 * holding "VideoPrefetchDispatcher.queue", calls directly that calls the check. Instagram's older
 * autoplay checker calls the check too, but the dispatcher doesn't call it, so it's never the match.
 */
internal fun BytecodePatchContext.prefetchSkip(): PrefetchSkip {
    val check = classDefByStrings(AUTOPLAY_OFF, StringComparisonType.EQUALS).flatMap { it.methods }
        .filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" && it.parameterTypes.size == 1 &&
                it.parameterTypes[0].startsWith("L") && it.holdsString(AUTOPLAY_OFF) && it.holdsString(AUTOPLAY_OFF_OLYMPUS)
        }
        .distinctBy { it.signature() }
        .singleOrPatchException("$PATCH: Instagram's autoplay-off check")
    val dispatcher = classDefByStrings(PREFETCH_DISPATCHER, StringComparisonType.EQUALS).flatMap { it.methods }
        .filter { it.holdsString(PREFETCH_DISPATCHER) }
        .distinctBy { it.signature() }
        .singleOrPatchException("$PATCH: the video prefetch dispatcher, the method holding \"$PREFETCH_DISPATCHER\"")
    val callees = dispatcher.implementation!!.instructions
        .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .mapNotNull { it.getReference<MethodReference>() }
        .filter { it.returnType == "Z" }
        .distinctBy { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})" }
        .mapNotNull { reference ->
            val owner = runCatching { classDefBy(reference.definingClass) }.getOrNull() ?: return@mapNotNull null
            owner.methods.singleOrNull {
                it.name == reference.name && it.returnType == reference.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == reference.parameterTypes.map(CharSequence::toString)
            }
        }
        .filter { callee -> callee.implementation?.instructions?.any { it.calls(check) } == true }
    val method = callees.singleOrPatchException("$PATCH: the prefetch skip, the dispatcher's call that asks the autoplay-off check")
    val body = method.implementation!!.instructions.toList()
    val call = body.indices.filter { body[it].calls(check) }
        .singleOrPatchException("$PATCH: ${method.signature()}'s call to the autoplay-off check")
    val result = body.getOrNull(call + 1)
    val test = body.getOrNull(call + 2)
    val register = (result as? OneRegisterInstruction)?.registerA
    if (result?.opcode != Opcode.MOVE_RESULT || register == null || test?.opcode != Opcode.IF_NEZ ||
        (test as OneRegisterInstruction).registerA != register
    ) throw PatchException("$PATCH: ${method.signature()} doesn't test the autoplay-off check's answer straight away")
    val arrived = method.reaching(call + 2, setOf(register))
    if (arrived.fromEntry || arrived.writes != setOf(call + 1)) {
        throw PatchException("$PATCH: ${method.signature()}'s test of v$register can be reached with another value")
    }
    if (register > 255) throw PatchException("$PATCH: ${method.signature()} holds the check's answer in v$register, past move-result's reach")
    return PrefetchSkip(method, check, call, call + 2, register)
}

/**
 * A call to PostVideo, the register carrying whether its video is the one to play, and what to
 * change when the caller leaves that flag to PostVideo's default. Behind a forwarder that pins the
 * flag, [register] is the caller's mask and [chosen] holds the two masks to pick between.
 */
internal data class PlaySite(
    val method: Method,
    val call: Int,
    val register: Int,
    val defaulted: DefaultedFlag? = null,
    val chosen: ChosenMask? = null,
)

/** The caller's default mask [register], the [mask] to hand PostVideo there without the flag's bit, and the [value] PostVideo would've played by. */
internal data class DefaultedFlag(val register: Int, val mask: Int, val value: Int)

/** A caller's constant mask [with] the default's bit, which plays, and [without] it, which plays by the forwarder's pinned false. */
internal data class ChosenMask(val with: Int, val without: Int)

/** PostVideo's default for its play flag: when a caller sets [bit] in its [mask] parameter, PostVideo plays by [value] instead of the flag it's handed. */
internal data class PlayDefault(val mask: Int, val bit: Int, val value: Int)

/**
 * PostVideo or a checked forwarder, with the parameters carrying PostVideo's play flag and mask.
 * [parameter] is null for a forwarder that pins the flag to false.
 */
private data class PlayTarget(val method: Method, val parameter: Int?, val default: PlayDefault?)

/**
 * Embeds since 451 call a shortened overload beside PostVideo. It only fills omitted arguments and
 * copies the others before its one call to PostVideo, then returns. Follow the play flag and mask
 * back to their unchanged parameters, so the hook stays at each embed rather than in shared code.
 * 454's overload has no play flag of its own: it pins PostVideo's to false, which leaves playing to
 * the default whenever the caller's mask has the default's bit, so only the mask is followed there.
 */
private fun BytecodePatchContext.playTargets(postVideo: Method, play: Int, default: PlayDefault?): List<PlayTarget> {
    val forwards = mutableClassDefBy(postVideo.definingClass).methods.filter { method ->
        (method.name != postVideo.name || method.parameterTypes != postVideo.parameterTypes) &&
            method.implementation?.instructions?.any { it.calls(postVideo) } == true
    }.map { method ->
        val body = method.implementation!!.instructions.toList()
        val call = body.indices.filter { body[it].calls(postVideo) }
            .singleOrPatchException("$PATCH: ${method.definingClass}->${method.name}'s forwarded PostVideo call")
        val copies = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16,
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
        if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != postVideo.returnType ||
            call != body.lastIndex - 1 || body.last().opcode != Opcode.RETURN_VOID ||
            body.take(call).any { it.opcode !in copies && it.opcode !in CONSTANTS }
        ) throw PatchException("$PATCH: ${method.definingClass}->${method.name} isn't a straight PostVideo forwarder")
        val first = method.implementation!!.registerCount - method.parameterRegisters()
        fun forwarded(parameter: Int, type: String): Int {
            val register = body[call].argumentRegister(postVideo.registerOffset(parameter))!!
            val (write, source) = method.origin(call, register)
                ?: throw PatchException("$PATCH: ${method.definingClass}->${method.name} changes PostVideo's $type argument")
            return method.parameterTypes.indices.singleOrNull { index ->
                write < 0 && method.parameterTypes[index].toString() == type && first + method.registerOffset(index) == source
            } ?: throw PatchException("$PATCH: ${method.definingClass}->${method.name} doesn't forward PostVideo's $type parameter unchanged")
        }
        val playRegister = body[call].argumentRegister(postVideo.registerOffset(play))!!
        val pinned = method.origin(call, playRegister)?.first?.takeIf { it >= 0 }?.let { body[it] }
            ?.takeIf { it.opcode in CONSTANTS }?.let { (it as NarrowLiteralInstruction).narrowLiteral }
        if (pinned == null) {
            PlayTarget(method, forwarded(play, "Z"), default?.let { it.copy(mask = forwarded(it.mask, "I")) })
        } else {
            // Only a pinned false with a default of 1 leaves the caller's mask to decide.
            if (default == null || default.value != 1 || pinned != 0) {
                throw PatchException("$PATCH: ${method.definingClass}->${method.name} pins PostVideo's play flag to $pinned")
            }
            PlayTarget(method, null, default.copy(mask = forwarded(default.mask, "I")))
        }
    }
    return listOf(PlayTarget(postVideo, play, default)) + forwards
}

internal fun Method.holdsNote(note: String): Boolean = implementation?.instructions?.any {
    it.getReference<StringReference>()?.string?.startsWith(note) == true
} == true

/**
 * The effect takes the composer, the player's state and the video, then Compose's ints (450 adds a
 * volume float among them, 455 a String ahead of it), and ends on its booleans: two in 450, where
 * 449 and 448 had three. Whether to play is the first boolean, and its index comes back.
 */
internal fun Method.requirePlaybackEffect(): Int {
    val types = parameterTypes.map { it.toString() }
    val play = types.indexOf("Z")
    val middle = if (play > 3) types.subList(3, play) else emptyList()
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || types.take(3).any { !it.startsWith("L") } ||
        "I" !in middle || middle.any { it != "I" && it != "F" && it != "Ljava/lang/String;" } ||
        types.drop(play).any { it != "Z" } || types.size - play !in 2..3
    ) throw PatchException("$PATCH: the video playback effect $definingClass->$name${types.joinToString("", "(", ")")}$returnType has another shape")
    return play
}

/**
 * Which of PostVideo's parameters says whether its video plays: the fourth boolean in 450, which
 * dropped one ahead of it, and the fifth since 454, which adds one back. Up to 454 it's the boolean
 * PostVideo tests last before its one call to the effect, on a branch whose false side writes a 0
 * as the effect's play argument before the call, and every write to that argument between the test
 * and the call must be a 0 or a 1, with a 1 among them. The tested register has to hold that one
 * boolean on every path to the test, as it arrived or through one move, or the default Compose
 * gives it when a caller leaves it out. 455 makes the same test in a lambda ([lambdaPlayTest]).
 */
internal fun BytecodePatchContext.playParameter(postVideo: Method, effect: Method): Int = playTest(postVideo, effect).parameter

/**
 * Where PostVideo's play flag decides whether its video plays: the [test] of the flag in [method]
 * and the [call] whose play [argument] follows it. Up to 454 that's PostVideo and its call to the
 * effect, since 455 the lambda PostVideo builds and its call to the video player. [parameter] is
 * the flag's index among PostVideo's parameters, and PostVideo reads it from [register] at [read].
 */
internal data class PlayTest(
    val method: Method,
    val test: Int,
    val call: Int,
    val argument: Int,
    val parameter: Int,
    val read: Int,
    val register: Int,
)

internal fun BytecodePatchContext.playTest(postVideo: Method, effect: Method): PlayTest {
    if (!AccessFlags.STATIC.isSet(postVideo.accessFlags)) {
        throw PatchException("$PATCH: PostVideo ${postVideo.definingClass}->${postVideo.name} isn't static")
    }
    if (postVideo.implementation!!.instructions.any { it.calls(effect) }) return postVideo.effectPlayTest(effect)
    return lambdaPlayTest(postVideo, composable(VIDEO_PLAYER, "IgComposeVideoPlayer"), effect)
}

/**
 * The boolean parameter of static [this] that [register] holds when the instruction at [at] runs,
 * the same one on every path, as it arrived or through one move, or null. A 0 or 1 written along
 * the way is the default Compose gives it when a caller leaves it out.
 */
private fun Method.heldBoolean(at: Int, register: Int): Int? {
    val body = implementation!!.instructions.toList()
    val first = implementation!!.registerCount - parameterRegisters()
    // Each boolean parameter, by the register it arrives in.
    val booleans = parameterTypes.indices.filter { parameterTypes[it].toString() == "Z" }.associateBy { first + registerOffset(it) }
    val writes = reaching(at, setOf(register))
    val sources = writes.writes.mapNotNull { write ->
        val instruction = body[write]
        if (instruction is NarrowLiteralInstruction && instruction.narrowLiteral in 0..1) return@mapNotNull null
        val source = (instruction as? TwoRegisterInstruction)?.registerB?.takeIf { instruction.opcode.isMove() } ?: return null
        val arrived = reaching(write, setOf(source))
        if (arrived.writes.isNotEmpty() || !arrived.fromEntry) return null
        booleans[source] ?: return null
    }
    val own = if (writes.fromEntry) listOf(booleans[register] ?: return null) else emptyList()
    return (sources + own).distinct().singleOrNull()
}

/**
 * 455's PostVideo no longer calls the effect. It builds a lambda, handing it the play flag, and the
 * lambda tests the flag, which it keeps in a field, before composing Instagram's video player: the
 * player plays by a 1 only on the flag's true side. The player hands its own boolean to the effect,
 * or Compose's default for it when the lambda's default mask asks, which it mustn't. So the flag is
 * followed from the lambda's test to its field, to the constructor parameter stored there, and to
 * what PostVideo passes for it.
 */
private fun BytecodePatchContext.lambdaPlayTest(postVideo: Method, player: Method, effect: Method): PlayTest {
    if (!AccessFlags.STATIC.isSet(player.accessFlags)) {
        throw PatchException("$PATCH: the video player ${player.definingClass}->${player.name} isn't static")
    }
    val playerBody = player.implementation!!.instructions.toList()
    val effectCall = playerBody.indices.filter { playerBody[it].calls(effect) }
        .singleOrPatchException("$PATCH: the video player's call to the video playback effect")
    val effectPlay = playerBody[effectCall].argumentRegister(effect.registerOffset(effect.requirePlaybackEffect()))!!
    val defaults = mutableListOf<PlayerDefault>()
    val playerPlay = handedBoolean(player, effectCall, effectPlay, defaults)
        ?: throw PatchException("$PATCH: the video player doesn't hand the playback effect one of its booleans unchanged")

    val postBody = postVideo.implementation!!.instructions.toList()
    fun Method.composesPlayer() = implementation?.instructions?.any { it.calls(player) } == true
    val lambda = postBody.filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { it.getReference<TypeReference>()?.type }.distinct()
        .filter { type -> runCatching { classDefBy(type) }.getOrNull()?.methods?.any { it.composesPlayer() } == true }
        .singleOrPatchException("$PATCH: the lambda PostVideo composes the video player through")
    val lambdaClass = mutableClassDefBy(lambda)
    val host = lambdaClass.methods.filter { it.composesPlayer() }.singleOrPatchException("$PATCH: the lambda's method composing the video player")
    val body = host.implementation!!.instructions.toList()
    val call = body.indices.filter { body[it].calls(player) }.singleOrPatchException("$PATCH: the lambda's call to the video player")
    val argument = body[call].argumentRegister(player.registerOffset(playerPlay))!!
    // A default mask with the flag's bit set would have the player drop the lambda's flag for its default.
    for (default in defaults) {
        val mask = host.constantAt(call, body[call].argumentRegister(player.registerOffset(default.mask))!!)
            ?: throw PatchException("$PATCH: the lambda's default mask for the video player isn't one constant")
        if (mask and default.bit != 0) throw PatchException("$PATCH: the lambda leaves the video player's play flag to its default")
    }
    val arrived = host.reaching(call, setOf(argument))
    val literals = arrived.writes.map { body[it] }
    if (arrived.fromEntry || literals.any { it !is NarrowLiteralInstruction || it.opcode !in CONSTANTS || it.narrowLiteral !in 0..1 }) {
        throw PatchException("$PATCH: the lambda's play argument to the video player isn't set from the boolean it tests")
    }
    val address = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
    // Where a branch at [at] goes when its boolean is false. On 455 that's past the call, which a goto comes back to.
    fun falseSide(at: Int): Int? = when (body[at].opcode) {
        Opcode.IF_EQZ -> address.indexOf(address[at] + (body[at] as OffsetInstruction).codeOffset).takeIf { it >= 0 }
        Opcode.IF_NEZ -> at + 1
        else -> null
    }
    // The lambda's own boolean field that [register] holds at [at], read on every path from the lambda itself.
    fun field(at: Int, register: Int): FieldReference? {
        val (read, _) = host.origin(at, register)?.takeIf { it.first >= 0 } ?: return null
        val get = body[read].takeIf { it.opcode == Opcode.IGET_BOOLEAN } as? TwoRegisterInstruction ?: return null
        val (from, self) = host.origin(read, get.registerB) { it.isObjectMove() } ?: return null
        return (get as Instruction).getReference<FieldReference>()?.takeIf { from < 0 && host.isThis(self) && it.definingClass == lambda }
    }
    var flag: FieldReference? = null
    val test = (call - 1 downTo 0).firstOrNull { at ->
        val side = falseSide(at) ?: return@firstOrNull false
        (body[side] as? OneRegisterInstruction)?.registerA == argument && body[side].opcode.setsRegister() &&
            field(at, (body[at] as OneRegisterInstruction).registerA).also { flag = it } != null
    } ?: throw PatchException("$PATCH: the video player's lambda never tests one of its booleans before the player")
    if ((body[falseSide(test)!!] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        literals.none { (it as NarrowLiteralInstruction).narrowLiteral == 1 }
    ) throw PatchException("$PATCH: the lambda's play argument to the video player doesn't follow the boolean it tests")

    // The constructor PostVideo calls stores one of its booleans in the field, and nothing else writes it.
    val stores = lambdaClass.methods.flatMap { method ->
        (method.implementation?.instructions?.toList() ?: emptyList()).withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.IPUT_BOOLEAN && instruction.getReference<FieldReference>()?.let {
                it.definingClass == flag!!.definingClass && it.name == flag!!.name
            } == true
        }.map { method to it.index }
    }
    val (init, store) = stores.singleOrPatchException("$PATCH: the lambda's store of its play flag")
    val stored = init.implementation!!.instructions.elementAt(store) as TwoRegisterInstruction
    val (storedAt, value) = init.origin(store, stored.registerA) ?: throw PatchException("$PATCH: the lambda's play flag differs by path")
    val index = init.parameterIndex(value)?.takeIf { parameter ->
        init.name == "<init>" && storedAt < 0 && init.parameterTypes[parameter].toString() == "Z" &&
            init.origin(store, stored.registerB) { it.isObjectMove() }?.let { (from, self) -> from < 0 && init.isThis(self) } == true
    } ?: throw PatchException("$PATCH: the lambda's constructor doesn't keep one of its booleans as the play flag")
    val construct = postBody.indices.filter {
        (postBody[it].opcode == Opcode.INVOKE_DIRECT || postBody[it].opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            postBody[it].getReference<MethodReference>()?.let { called ->
                called.definingClass == lambda && called.name == init.name &&
                    called.parameterTypes.map(CharSequence::toString) == init.parameterTypes.map(CharSequence::toString)
            } == true
    }.singleOrPatchException("$PATCH: PostVideo's construction of the video player's lambda")

    // Back through PostVideo's copies of the flag to where it reads it.
    var read = construct
    var register = postBody[construct].argumentRegister(1 + init.registerOffset(index))!!
    while (true) {
        val writes = postVideo.reaching(read, setOf(register))
        val write = writes.writes.singleOrNull()?.takeUnless { writes.fromEntry } ?: break
        if (!postBody[write].opcode.isMove()) break
        read = write
        register = (postBody[write] as TwoRegisterInstruction).registerB
    }
    val parameter = postVideo.heldBoolean(read, register)
        ?: throw PatchException("$PATCH: PostVideo doesn't hand the video player's lambda one of its booleans")
    return PlayTest(host, test, call, argument, parameter, read, register)
}

/** Compose's default for one of the video player's booleans: the [bit] of its int parameter [mask] swaps it for [value]. */
private data class PlayerDefault(val mask: Int, val bit: Int, val value: Int)

/**
 * The boolean parameter of [player] it hands on in [register] at [at], the same one on every path,
 * through moves and through Compose's default merges, which go into [defaults]. Null when paths
 * disagree or a copy loops back on itself. 455's player sets each boolean to `merge(mask & bit, flag)`,
 * the flag while the bit is clear, and both that merge and the path skipping it start from one move,
 * so [following] holds only the copies on the current path, never every one already followed.
 */
private fun BytecodePatchContext.handedBoolean(
    player: Method,
    at: Int,
    register: Int,
    defaults: MutableList<PlayerDefault>,
    following: MutableSet<Pair<Int, Int>> = mutableSetOf(),
): Int? {
    if (!following.add(at to register)) return null
    try {
        return handedBooleanFrom(player, at, register, defaults, following)
    } finally {
        following.remove(at to register)
    }
}

private fun BytecodePatchContext.handedBooleanFrom(
    player: Method,
    at: Int,
    register: Int,
    defaults: MutableList<PlayerDefault>,
    following: MutableSet<Pair<Int, Int>>,
): Int? {
    val body = player.implementation!!.instructions.toList()
    val reaching = player.reaching(at, setOf(register))
    val sources = mutableSetOf<Int>()
    if (reaching.fromEntry) sources += player.parameterIndex(register)?.takeIf { player.parameterTypes[it].toString() == "Z" } ?: return null
    for (write in reaching.writes) {
        val instruction = body[write]
        sources += when {
            instruction.opcode.isMove() -> handedBoolean(player, write, (instruction as TwoRegisterInstruction).registerB, defaults, following)
            instruction.opcode == Opcode.MOVE_RESULT -> {
                val merge = body.getOrNull(write - 1) ?: return null
                val value = defaultMerge(merge) ?: return null
                val (tested, _) = player.origin(write - 1, merge.argumentRegister(0)!!)?.takeIf { it.first >= 0 } ?: return null
                val and = body[tested].takeIf { it.opcode == Opcode.AND_INT_LIT8 || it.opcode == Opcode.AND_INT_LIT16 } ?: return null
                val bit = (and as NarrowLiteralInstruction).narrowLiteral.takeIf { it.countOneBits() == 1 } ?: return null
                val (from, masked) = player.origin(tested, (and as TwoRegisterInstruction).registerB) ?: return null
                val mask = player.parameterIndex(masked)?.takeIf { from < 0 && player.parameterTypes[it].toString() == "I" } ?: return null
                defaults += PlayerDefault(mask, bit, value)
                handedBoolean(player, write - 1, merge.argumentRegister(1)!!, defaults, following)
            }
            else -> null
        } ?: return null
    }
    return sources.singleOrNull()
}

/**
 * The 0 or 1 a call to Compose's default merge answers in place of its boolean, or null when [call]
 * isn't one: a static `(IZ)Z` that returns the boolean while the int is 0 and its own constant otherwise.
 */
private fun BytecodePatchContext.defaultMerge(call: Instruction): Int? {
    val called = call.getReference<MethodReference>()?.takeIf {
        call.opcode == Opcode.INVOKE_STATIC && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "Z")
    } ?: return null
    val merge = runCatching { classDefBy(called.definingClass) }.getOrNull()?.methods?.singleOrNull {
        it.name == called.name && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "Z")
    }?.implementation ?: return null
    val body = merge.instructions.toList()
    if (merge.registerCount != 2 || body.size != 3) return null
    val (test, value, answer) = body
    val returnsFlag = test.opcode == Opcode.IF_EQZ && (test as OneRegisterInstruction).registerA == 0 &&
        (test as OffsetInstruction).codeOffset == test.codeUnits + value.codeUnits &&
        value.opcode == Opcode.CONST_4 && (value as OneRegisterInstruction).registerA == 1 &&
        answer.opcode == Opcode.RETURN && (answer as OneRegisterInstruction).registerA == 1
    if (!returnsFlag) return null
    return (value as NarrowLiteralInstruction).narrowLiteral.takeIf { it in 0..1 }
}

/** Up to 454: PostVideo tests the flag itself, before its one call to the effect. */
private fun Method.effectPlayTest(effect: Method): PlayTest {
    val body = implementation!!.instructions.toList()
    val call = body.indices.filter { body[it].calls(effect) }.singleOrPatchException("$PATCH: PostVideo's call to the video playback effect")
    val playArgument = body[call].argumentRegister(effect.registerOffset(effect.requirePlaybackEffect()))!!
    val address = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
    // Where a branch at [at] goes when its boolean is false, if that's between it and the call.
    fun falseSide(at: Int): Int? = when (body[at].opcode) {
        Opcode.IF_EQZ -> address.indexOf(address[at] + (body[at] as OffsetInstruction).codeOffset)
        Opcode.IF_NEZ -> at + 1
        else -> null
    }?.takeIf { it in at + 1 until call }
    var play: Int? = null
    val test = (call - 1 downTo 0).firstOrNull { at ->
        val side = falseSide(at) ?: return@firstOrNull false
        (body[side] as? OneRegisterInstruction)?.registerA == playArgument && body[side].opcode.setsRegister() &&
            heldBoolean(at, (body[at] as OneRegisterInstruction).registerA).also { play = it } != null
    } ?: throw PatchException("$PATCH: PostVideo never tests one of its booleans before the playback effect")
    val writes = (test + 1 until call).map { body[it] }.filter { (it as? OneRegisterInstruction)?.registerA == playArgument && it.opcode.setsRegister() }
    if (writes.any { it !is NarrowLiteralInstruction || it.narrowLiteral !in 0..1 }) {
        throw PatchException("$PATCH: PostVideo's play argument to the playback effect isn't set from the boolean it tests")
    }
    if ((body[falseSide(test)!!] as NarrowLiteralInstruction).narrowLiteral != 0 || writes.none { (it as NarrowLiteralInstruction).narrowLiteral == 1 }) {
        throw PatchException("$PATCH: PostVideo's play argument to the playback effect doesn't follow the boolean it tests")
    }
    return PlayTest(this, test, call, playArgument, play!!, test, (body[test] as OneRegisterInstruction).registerA)
}

/**
 * Where PostVideo sets its play flag to Compose's default: the 0 or 1 it writes into the register
 * it reads the flag from, behind an if-eqz on one bit of an int parameter, the caller's default
 * mask. Null when PostVideo has no default for the flag, so every caller passes its own.
 */
internal fun Method.playDefault(shape: PlayTest): PlayDefault? {
    val body = implementation!!.instructions.toList()
    val write = reaching(shape.read, setOf(shape.register)).writes.filter { body[it] is NarrowLiteralInstruction }.ifEmpty { return null }
        .singleOrPatchException("$PATCH: PostVideo's default for its play flag")
    val address = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
    val guard = body.getOrNull(write - 1)
    if (guard?.opcode != Opcode.IF_EQZ || address[write - 1] + (guard as OffsetInstruction).codeOffset != address[write + 1]) {
        throw PatchException("$PATCH: PostVideo's default for its play flag isn't behind a test of its default mask")
    }
    val (tests, bitRegister) = origin(write - 1, (guard as OneRegisterInstruction).registerA)
        ?: throw PatchException("$PATCH: PostVideo tests its play flag's default on a value that differs by path")
    val and = body.getOrNull(tests)
    // The bit is the and's literal, or on 454 (0x8000, too wide for and-int/lit16) a constant in its other register.
    val (bit, masked) = when (and?.opcode) {
        Opcode.AND_INT_LIT16, Opcode.AND_INT_LIT8 -> (and as NarrowLiteralInstruction).narrowLiteral to (and as TwoRegisterInstruction).registerB
        Opcode.AND_INT -> (and as ThreeRegisterInstruction).let { listOf(it.registerB to it.registerC, it.registerC to it.registerB) }
            .firstNotNullOfOrNull { (constant, other) -> constantAt(tests, constant)?.let { it to other } }
        else -> null
    } ?: (null to -1)
    if (bit == null || bit.countOneBits() != 1) {
        throw PatchException("$PATCH: PostVideo's default for its play flag isn't behind one bit of v$bitRegister")
    }
    val (from, mask) = origin(tests, masked)
        ?: throw PatchException("$PATCH: PostVideo's default mask differs by path")
    val first = implementation!!.registerCount - parameterRegisters()
    val parameter = parameterTypes.indices.takeIf { from < 0 }
        ?.singleOrNull { parameterTypes[it].toString() == "I" && first + registerOffset(it) == mask }
        ?: throw PatchException("$PATCH: PostVideo's default mask isn't one of its int parameters")
    return PlayDefault(parameter, bit, (body[write] as NarrowLiteralInstruction).narrowLiteral)
}

/**
 * The instruction whose value [register] holds when the one at [at] runs, the same one on every
 * path, followed back through moves: its index and the register it wrote, or -1 and the register
 * as the method got it. Null when paths disagree.
 */
private fun Method.origin(at: Int, register: Int, follows: (Opcode) -> Boolean = { it.isMove() }): Pair<Int, Int>? {
    val body = implementation!!.instructions.toList()
    var index = at
    var held = register
    while (true) {
        val reaching = reaching(index, setOf(held))
        if (reaching.writes.isEmpty()) return if (reaching.fromEntry) -1 to held else null
        val write = reaching.writes.singleOrNull()?.takeUnless { reaching.fromEntry } ?: return null
        if (!follows(body[write].opcode)) return write to held
        index = write
        held = (body[write] as TwoRegisterInstruction).registerB
    }
}

/** The constant [register] holds when the instruction at [at] runs, the same one on every path, or null. */
private fun Method.constantAt(at: Int, register: Int): Int? {
    val write = origin(at, register)?.first?.takeIf { it >= 0 } ?: return null
    return implementation!!.instructions.elementAt(write).takeIf { it.opcode in CONSTANTS }?.let { (it as NarrowLiteralInstruction).narrowLiteral }
}

/**
 * Every call to one of [targets] from a method holding [note], with its play argument's register.
 * A call whose constant mask leaves that flag to PostVideo's default also supplies the mask's
 * register. The call must be the last thing to read those registers, since the hook writes them.
 * A call to a forwarder that pins the flag supplies only its mask, and is left alone when the mask
 * lacks the default's bit, since PostVideo then plays by the pinned false.
 */
private fun BytecodePatchContext.playSites(targets: List<PlayTarget>, note: String): List<PlaySite> =
    classDefByStrings(note, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(note) }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }
        .flatMap { method ->
            val body = method.implementation!!.instructions.toList()
            body.indices.mapNotNull { call ->
                val target = targets.singleOrNull { body[call].calls(it.method) } ?: return@mapNotNull null
                fun mask(flag: PlayDefault): Pair<Int, Int> {
                    val maskRegister = body[call].argumentRegister(target.method.registerOffset(flag.mask))!!
                    val mask = method.origin(call, maskRegister)?.first?.let { body.getOrNull(it) }
                        ?.takeIf { it.opcode in CONSTANTS }?.let { (it as NarrowLiteralInstruction).narrowLiteral }
                        ?: throw PatchException("$PATCH: ${method.definingClass}->${method.name} hands PostVideo a default mask in v$maskRegister that isn't one constant")
                    return maskRegister to mask
                }
                if (target.parameter == null) {
                    val flag = target.default!!
                    val (maskRegister, mask) = mask(flag)
                    if (mask and flag.bit == 0) return@mapNotNull null
                    val later = method.readsAfter(call, maskRegister)
                    if (later.isNotEmpty()) throw PatchException("$PATCH: ${method.definingClass}->${method.name} reads v$maskRegister again after PostVideo, at $later")
                    if (maskRegister > 255) throw PatchException("$PATCH: ${method.definingClass}->${method.name} passes its default mask in v$maskRegister, past const's reach")
                    return@mapNotNull PlaySite(method, call, maskRegister, chosen = ChosenMask(mask, mask and flag.bit.inv()))
                }
                val register = body[call].argumentRegister(target.method.registerOffset(target.parameter))!!
                val defaulted = target.default?.let { flag ->
                    val (maskRegister, mask) = mask(flag)
                    DefaultedFlag(maskRegister, mask and flag.bit.inv(), flag.value).takeIf { mask and flag.bit != 0 }
                }
                for (written in listOfNotNull(register, defaulted?.register)) {
                    val later = method.readsAfter(call, written)
                    if (later.isNotEmpty()) throw PatchException("$PATCH: ${method.definingClass}->${method.name} reads v$written again after PostVideo, at $later")
                }
                if (register > 255) throw PatchException("$PATCH: ${method.definingClass}->${method.name} passes the play flag in v$register, past move-result's reach")
                if ((defaulted?.register ?: 0) > 255) throw PatchException("$PATCH: ${method.definingClass}->${method.name} passes its default mask in v${defaulted!!.register}, past const's reach")
                PlaySite(method, call, register, defaulted)
            }
        }

/** The instructions that load an int constant. */
private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)

private fun Opcode.isMove() = this == Opcode.MOVE || this == Opcode.MOVE_FROM16 || this == Opcode.MOVE_16

private fun Opcode.isObjectMove() = this == Opcode.MOVE_OBJECT || this == Opcode.MOVE_OBJECT_FROM16 || this == Opcode.MOVE_OBJECT_16

/** Registers the parameters take, `this` included. */
private fun Method.parameterRegisters(): Int =
    (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) + parameterTypes.sumOf { if (it.isWide()) 2 else 1 }

/** Whether [register] is the one `this` arrives in. */
private fun Method.isThis(register: Int): Boolean =
    !AccessFlags.STATIC.isSet(accessFlags) && register == implementation!!.registerCount - parameterRegisters()

/** The parameter that arrives in [register], or null. */
private fun Method.parameterIndex(register: Int): Int? {
    val first = implementation!!.registerCount - parameterRegisters() + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return parameterTypes.indices.singleOrNull { first + registerOffset(it) == register }
}

/** How far into a static call's arguments the [index]th parameter sits, counting wide ones twice. */
private fun Method.registerOffset(index: Int): Int = parameterTypes.take(index).sumOf { if (it.isWide()) 2 else 1 }

private fun CharSequence.isWide() = this == "J" || this == "D"

private fun Instruction.calls(method: Method): Boolean =
    (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) && getReference<MethodReference>()?.let {
        it.definingClass == method.definingClass && it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
    } == true

private fun BytecodePatchContext.composable(note: String, label: String): MutableMethod {
    val method = classDefByStrings(note, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(note) }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }
        .singleOrPatchException("$PATCH: $label, the method holding \"$note\"")
    return mutableClassDefBy(method.definingClass).findMutableMethodOf(method)
}
