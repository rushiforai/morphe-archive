/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 449 and 448 and by a method trace of 449 on an emulator (2026-10-02).
 */
package app.morphe.patches.threads.feed.autoplay

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
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
 * The effect takes the composer, the player's state, the video and Compose's change flags, then
 * whether to play and two more booleans.
 */
internal fun Method.requirePlaybackEffect() {
    val types = parameterTypes.map { it.toString() }
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || types.size != 7 ||
        types.take(3).any { !it.startsWith("L") } || types[3] != "I" || types.drop(4) != listOf("Z", "Z", "Z")
    ) throw PatchException("$PATCH: the video playback effect $definingClass->$name${types.joinToString("", "(", ")")}$returnType has another shape")
}

/**
 * Which of PostVideo's parameters says whether its video plays: the fifth boolean in 448 and 449.
 * PostVideo must test it just before its one call to the effect and set the effect's play argument
 * from that test, so a shuffled parameter list is refused rather than holding the wrong flag.
 */
internal fun Method.playParameter(effect: Method): Int {
    if (!AccessFlags.STATIC.isSet(accessFlags)) throw PatchException("$PATCH: PostVideo $definingClass->$name isn't static")
    val types = parameterTypes.map { it.toString() }
    val play = types.indices.filter { types[it] == "Z" }.getOrNull(4)
        ?: throw PatchException("$PATCH: PostVideo has fewer than five booleans")
    val body = implementation!!.instructions.toList()
    val call = body.indices.filter { body[it].calls(effect) }.singleOrPatchException("$PATCH: PostVideo's call to the video playback effect")
    val playArgument = body[call].argumentRegister(4)!!
    val parameter = implementation!!.registerCount - parameterRegisters() + registerOffset(play)
    val copies = body.filter { it.opcode.isMove() && (it as TwoRegisterInstruction).registerB == parameter }
        .map { (it as TwoRegisterInstruction).registerA }.toSet() + parameter
    val test = (call - 1 downTo 0).firstOrNull {
        (body[it].opcode == Opcode.IF_EQZ || body[it].opcode == Opcode.IF_NEZ) && (body[it] as OneRegisterInstruction).registerA in copies
    } ?: throw PatchException("$PATCH: PostVideo never tests its fifth boolean before the playback effect")
    val writes = (test + 1 until call).map { body[it] }.filter { (it as? OneRegisterInstruction)?.registerA == playArgument && it.opcode.setsRegister() }
    if (writes.isEmpty() || writes.any { it !is NarrowLiteralInstruction || it.narrowLiteral !in 0..1 }) {
        throw PatchException("$PATCH: PostVideo's play argument to the playback effect isn't set from its fifth boolean")
    }
    return play
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
