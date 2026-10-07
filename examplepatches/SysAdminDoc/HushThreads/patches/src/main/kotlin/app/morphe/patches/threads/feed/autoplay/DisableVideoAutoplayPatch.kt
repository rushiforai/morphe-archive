/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 449 and 448 and by a method trace of 449 on an emulator (2026-10-02), and
 * carried to 450 by reading its reshaped PostVideo and playback effect (2026-10-06).
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Disable video autoplay"
internal const val VIDEO_AUTOPLAY = "$EXTENSION_PACKAGE/feed/VideoAutoplay;"

/** Compose's note naming Threads' video-in-a-post composable. It names the source file, so it survives Redex. */
internal const val POST_VIDEO = "com.instagram.barcelona.feed.post.video.PostVideo (PostVideo.kt:"

/** The same note for the effect that starts and releases a post video's player. */
internal const val PLAYBACK_EFFECT = "com.instagram.video.player.compose.VideoPlaybackEffect (VideoPlaybackEffect.kt:"

/** Notes in the feed post composables that put a video in a post: one on its own, and one in a carousel. */
internal const val POST_SINGLE_MEDIA = "com.instagram.barcelona.feed.post.ui.PostSingleMedia"
internal const val POST_CAROUSEL = "com.instagram.barcelona.feed.post.ui.PostCarousel"

/**
 * Videos in feed posts wait for a tap.
 *
 * A video in a post is Threads' PostVideo composable. One of its booleans says whether this is the
 * video Threads picked to play; PostVideo plays it only when that's true and the player is ready,
 * hands the answer to VideoPlaybackEffect, which starts or releases the player, and only builds the
 * player's surface for the picked video. The posts in a feed, a profile or a thread pass that flag
 * from PostSingleMedia and PostCarousel, and the hook sits on it at those calls. The full-screen
 * viewer a tap opens calls PostVideo from its own composable and isn't touched, so it plays as it
 * always has. So do the Instagram embeds, trend previews and ad cards, which reach PostVideo
 * through their own callers.
 *
 * Instagram's own autoplay check, which brosssh/morphe-patches turns off for Instagram, is still in
 * Threads but isn't on this path: a trace of 449 showed a feed video starting with it answering
 * that autoplay was off. Threads' video prefetcher still reads it.
 */
@Suppress("unused")
val disableVideoAutoplayPatch = bytecodePatch(
    name = PATCH,
    description = "Videos in feed posts don't play by themselves as you scroll. Tap one to watch it full screen.",
    default = false,
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("disableVideoAutoplay")
        val effect = composable(PLAYBACK_EFFECT, "the video playback effect").also { it.requirePlaybackEffect() }
        val postVideo = composable(POST_VIDEO, "PostVideo")
        val play = postVideo.playParameter(effect)
        val sites = listOf(POST_SINGLE_MEDIA, POST_CAROUSEL).flatMap { note ->
            playSites(postVideo, note, play).ifEmpty { throw PatchException("$PATCH: no call to PostVideo holds \"$note\"") }
        }
        sites.forEach { site ->
            mutableClassDefBy(site.method.definingClass).findMutableMethodOf(site.method).addInstructionsAtControlFlowLabel(
                site.call,
                """
                    invoke-static/range { v${site.register} .. v${site.register} }, $VIDEO_AUTOPLAY->play(Z)Z
                    move-result v${site.register}
                """,
            )
        }
        enableStatus("disableVideoAutoplay")
    }
}

/** A feed post's call to PostVideo, and the register carrying whether its video is the one to play. */
internal data class PlaySite(val method: Method, val call: Int, val register: Int)

internal fun Method.holdsNote(note: String): Boolean = implementation?.instructions?.any {
    it.getReference<StringReference>()?.string?.startsWith(note) == true
} == true

/**
 * The effect takes the composer, the player's state and the video, then Compose's ints (450 adds a
 * volume float among them), and ends on its booleans: three in 448 and 449, two in 450. Whether to
 * play is the first boolean, and its index comes back.
 */
internal fun Method.requirePlaybackEffect(): Int {
    val types = parameterTypes.map { it.toString() }
    val play = types.indexOf("Z")
    val middle = if (play > 3) types.subList(3, play) else emptyList()
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || types.take(3).any { !it.startsWith("L") } ||
        "I" !in middle || middle.any { it != "I" && it != "F" } || types.drop(play).any { it != "Z" } || types.size - play !in 2..3
    ) throw PatchException("$PATCH: the video playback effect $definingClass->$name${types.joinToString("", "(", ")")}$returnType has another shape")
    return play
}

/**
 * Which of PostVideo's parameters says whether its video plays: the fifth boolean in 448 and 449,
 * the fourth in 450, which dropped one ahead of it. It's the boolean PostVideo tests last before its
 * one call to the effect, on a branch whose false side writes a 0 as the effect's play argument
 * before the call, and every write to that argument between the test and the call must be a 0 or a
 * 1, with a 1 among them. The tested register has to hold that one boolean on every path to the
 * test, as it arrived or through one move, or the default Compose gives it when a caller leaves it
 * out.
 */
internal fun Method.playParameter(effect: Method): Int = playTest(effect).parameter

/** PostVideo's test of its play flag at [test], the flag's [parameter] index, and the [call] to the effect it sets [argument] for. */
internal data class PlayTest(val test: Int, val call: Int, val argument: Int, val parameter: Int)

internal fun Method.playTest(effect: Method): PlayTest {
    if (!AccessFlags.STATIC.isSet(accessFlags)) throw PatchException("$PATCH: PostVideo $definingClass->$name isn't static")
    val types = parameterTypes.map { it.toString() }
    val body = implementation!!.instructions.toList()
    val call = body.indices.filter { body[it].calls(effect) }.singleOrPatchException("$PATCH: PostVideo's call to the video playback effect")
    val playArgument = body[call].argumentRegister(effect.registerOffset(effect.requirePlaybackEffect()))!!
    val first = implementation!!.registerCount - parameterRegisters()
    // Each boolean parameter, by the register it arrives in.
    val booleans = types.indices.filter { types[it] == "Z" }.associateBy { first + registerOffset(it) }
    // The boolean [register] holds when the instruction at [at] runs, the same one on every path.
    fun held(at: Int, register: Int): Int? {
        val writes = reaching(at, setOf(register))
        val sources = writes.writes.mapNotNull { write ->
            val instruction = body[write]
            // Compose's default for the parameter, set when a caller leaves it out.
            if (instruction is NarrowLiteralInstruction && instruction.narrowLiteral in 0..1) return@mapNotNull null
            val source = (instruction as? TwoRegisterInstruction)?.registerB?.takeIf { instruction.opcode.isMove() } ?: return null
            val arrived = reaching(write, setOf(source))
            if (arrived.writes.isNotEmpty() || !arrived.fromEntry) return null
            booleans[source] ?: return null
        }
        val own = if (writes.fromEntry) listOf(booleans[register] ?: return null) else emptyList()
        return (sources + own).distinct().singleOrNull()
    }
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
            held(at, (body[at] as OneRegisterInstruction).registerA).also { play = it } != null
    } ?: throw PatchException("$PATCH: PostVideo never tests one of its booleans before the playback effect")
    val writes = (test + 1 until call).map { body[it] }.filter { (it as? OneRegisterInstruction)?.registerA == playArgument && it.opcode.setsRegister() }
    if (writes.any { it !is NarrowLiteralInstruction || it.narrowLiteral !in 0..1 }) {
        throw PatchException("$PATCH: PostVideo's play argument to the playback effect isn't set from the boolean it tests")
    }
    if ((body[falseSide(test)!!] as NarrowLiteralInstruction).narrowLiteral != 0 || writes.none { (it as NarrowLiteralInstruction).narrowLiteral == 1 }) {
        throw PatchException("$PATCH: PostVideo's play argument to the playback effect doesn't follow the boolean it tests")
    }
    return PlayTest(test, call, playArgument, play!!)
}

/**
 * Every call to PostVideo from a method holding [note], with the register of its [play] argument.
 * The call must be the last thing to read that register, since the hook leaves its own answer there.
 */
private fun BytecodePatchContext.playSites(postVideo: Method, note: String, play: Int): List<PlaySite> =
    classDefByStrings(note, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(note) }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }
        .flatMap { method ->
            val body = method.implementation!!.instructions.toList()
            body.indices.filter { body[it].calls(postVideo) }.map { call ->
                val register = body[call].argumentRegister(postVideo.registerOffset(play))!!
                val later = method.readsAfter(call, register)
                if (later.isNotEmpty()) throw PatchException("$PATCH: ${method.definingClass}->${method.name} reads v$register again after PostVideo, at $later")
                if (register > 255) throw PatchException("$PATCH: ${method.definingClass}->${method.name} passes the play flag in v$register, past move-result's reach")
                PlaySite(method, call, register)
            }
        }

private fun Opcode.isMove() = this == Opcode.MOVE || this == Opcode.MOVE_FROM16 || this == Opcode.MOVE_16

/** Registers the parameters take, `this` included. */
private fun Method.parameterRegisters(): Int =
    (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) + parameterTypes.sumOf { if (it.isWide()) 2 else 1 }

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
