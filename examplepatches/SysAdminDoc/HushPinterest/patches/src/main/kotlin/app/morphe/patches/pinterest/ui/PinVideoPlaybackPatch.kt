/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.actions.PIN_CLOSEUP_PRESENTER
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Pin video playback"

internal const val PIN_VIDEO_WAITS_HOOK = "$UI_HOOKS->pinVideoWaits()I"
internal const val PIN_VIDEO_MUTED_HOOK = "$UI_HOOKS->pinVideoStartsMuted()I"

/** The ad pin page. Its unbind resets its video's saved state the same way the organic page's does. */
internal const val PROMOTED_CLOSEUP_PRESENTER = "Lcom/pinterest/feature/pin/closeup/presenter/PromotedPinCloseupPresenter;"

/** The lambda each pin page's unbind runs on its video's saved state, a Kotlin name that stays. */
internal const val UNBIND_RESET = "onUnbind\$lambda\$0"

/** The regular video pin page, a class name that stays. */
internal const val PIN_CLOSEUP_VIDEO_MODULE = "Lcom/pinterest/activity/pin/view/modules/PinCloseupVideoModule;"

/** The regular video pin page's read of Pinterest's sound flag each time it becomes the one on screen, a name that stays. */
internal const val LOAD_SAVED_MUTE_STATE = "loadSavedMuteState"

/** The base class of the idea pin page view, a name that stays. */
internal const val ROUNDED_CORNERS_LAYOUT = "Lcom/pinterest/design/widget/RoundedCornersLayout;"

/**
 * Pinterest's saved state for each video, kept by the video's id. [getter] hands back a copy of a
 * video's state, or a fresh one when it has none, and [paused] is the state's flag that keeps a
 * video from starting. [resets] are the two pin pages' unbind lambdas with the index of the
 * `const/4 vA, 0` each stores in [paused] right after, which is how a pin you leave plays again
 * when you come back.
 */
internal class VideoStates(val getter: MethodReference, val paused: FieldReference, val resets: List<Pair<Method, Int>>)

/**
 * Read off the organic pin page's unbind (14.45.0: `onUnbind` @15 to @17). For a video pin it reads
 * its pin's saved state with the getter, a static call taking the pin's id, then hands what came
 * back to [UNBIND_RESET], which clears the paused flag.
 */
internal fun BytecodePatchContext.videoStates(): VideoStates {
    val organic = classDefByOrNull(PIN_CLOSEUP_PRESENTER) ?: throw PatchException("$PATCH: no pin page presenter $PIN_CLOSEUP_PRESENTER")
    val unbind = organic.methods.filter { it.name == "onUnbind" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        .one("$PATCH: the pin page's unbind")
    val body = unbind.instructions()
    val reset = body.indices.filter { at ->
        val called = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        body[at].opcode == Opcode.INVOKE_STATIC && called?.definingClass == PIN_CLOSEUP_PRESENTER && called.name == UNBIND_RESET
    }.one("$PATCH: the pin page's reset of its video's state")
    val getter = (body.getOrNull(reset - 2) as? ReferenceInstruction)?.reference as? MethodReference
    val lambda = (body[reset] as ReferenceInstruction).reference as MethodReference
    if (getter == null || body[reset - 2].opcode != Opcode.INVOKE_STATIC || getter.parameters() != listOf("Ljava/lang/String;") ||
        lambda.parameters() != listOf(getter.returnType) || body[reset - 1].opcode != Opcode.MOVE_RESULT_OBJECT ||
        body[reset].passed() != listOf((body[reset - 1] as OneRegisterInstruction).registerA)
    ) throw PatchException("$PATCH: the pin page no longer resets the saved state it reads for its video")
    val resets = listOf(PIN_CLOSEUP_PRESENTER, PROMOTED_CLOSEUP_PRESENTER).map { type ->
        val owner = classDefByOrNull(type) ?: throw PatchException("$PATCH: no pin page presenter $type")
        val method = owner.methods.filter { it.name == UNBIND_RESET && it.parameters() == listOf(getter.returnType) && it.implementation != null }
            .one("$PATCH: $type's reset of its video's state")
        method to clearIn(method, getter.returnType)
    }
    val paused = resets.map { (method, at) -> (method.instructions()[at + 1] as ReferenceInstruction).reference as FieldReference }
        .distinct().one("$PATCH: the flag both pin pages clear")
    return VideoStates(getter, paused, resets)
}

/** The index of the `const/4 vA, 0` [method] stores in a boolean of [state], its only store, right after (14.45.0: @1). */
private fun clearIn(method: Method, state: String): Int {
    val body = method.instructions()
    val stores = body.indices.filter { body[it].opcode == Opcode.IPUT_BOOLEAN }
    val store = stores.singleOrNull()
        ?: throw PatchException("$PATCH: ${method.definingClass}->${method.name} stores ${stores.size} flags, expected 1")
    val flag = (body[store] as ReferenceInstruction).reference as FieldReference
    val constant = body.getOrNull(store - 1)
    val parameter = method.implementation!!.registerCount - 1
    if (constant?.opcode != Opcode.CONST_4 || (constant as NarrowLiteralInstruction).narrowLiteral != 0 ||
        (constant as OneRegisterInstruction).registerA != (body[store] as TwoRegisterInstruction).registerA ||
        (body[store] as TwoRegisterInstruction).registerB != parameter || flag.definingClass != state || flag.type != "Z"
    ) throw PatchException("$PATCH: ${method.definingClass}->${method.name} no longer clears a flag of the video's state")
    return store - 1
}

/** Whether a try range covers the instruction at [index]. */
private fun Method.videoTryCovers(index: Int): Boolean {
    val code = implementation ?: return false
    val address = instructions().take(index).sumOf { it.codeUnits }
    return code.tryBlocks.any { address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount }
}

/** The state getter's return of a fresh state, built for a video it has nothing saved for, and the register that state is in. */
internal class FreshState(val method: Method, val at: Int, val state: Int)

/**
 * In the getter (14.45.0: `mc3/u.b(String)`, @18), the cached state is cast and tested for null.
 * Where there's none, a fresh state is built in one straight run and returned. That fresh state
 * plays, which is what lets a pin page's video start on its own.
 */
internal fun BytecodePatchContext.freshState(states: VideoStates): FreshState {
    val getter = states.getter
    val method = classDefByOrNull(getter.definingClass)?.methods?.singleOrNull {
        it.name == getter.name && it.parameters() == getter.parameters() && it.returnType == getter.returnType && it.implementation != null
    } ?: throw PatchException("$PATCH: the video state getter $getter has no body here")
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val cast = body.indices.filter { at ->
        body[at].opcode == Opcode.CHECK_CAST && ((body[at] as ReferenceInstruction).reference as TypeReference).type == getter.returnType
    }.one("$PATCH: the video state getter's saved state")
    val test = body.getOrNull(cast + 1)
    if (test?.opcode != Opcode.IF_EQZ || (test as OneRegisterInstruction).registerA != (body[cast] as OneRegisterInstruction).registerA) {
        throw PatchException("$PATCH: the video state getter no longer checks for a saved state")
    }
    val fresh = flow.normal[cast + 1].filter { it != cast + 2 }.one("$PATCH: the video state getter's way to a fresh state")
    var at = fresh
    while (at < body.size && body[at].opcode != Opcode.RETURN_OBJECT) {
        if (flow.normal[at] != listOf(at + 1)) throw PatchException("$PATCH: the video state getter's fresh state isn't built in one straight run")
        at++
    }
    if (at >= body.size) throw PatchException("$PATCH: the video state getter never returns its fresh state")
    for (inside in fresh + 1..at) {
        if (flow.normal.indices.any { from -> from != inside - 1 && inside in flow.normal[from] }) {
            throw PatchException("$PATCH: something jumps into the video state getter's fresh state at $inside")
        }
    }
    val state = (body[at] as OneRegisterInstruction).registerA
    val built = (fresh until at).any { k ->
        body[k].opcode == Opcode.NEW_INSTANCE && (body[k] as OneRegisterInstruction).registerA == state &&
            ((body[k] as ReferenceInstruction).reference as TypeReference).type == getter.returnType
    }
    if (!built) throw PatchException("$PATCH: the video state getter's fresh state isn't a new ${getter.returnType}")
    if (state > 15) throw PatchException("$PATCH: the fresh video state is in v$state, out of reach of iput-boolean")
    if (method.videoTryCovers(at)) throw PatchException("$PATCH: the fresh video state's return sits inside a try range")
    return FreshState(method, at, state)
}

/** The idea pin page's start of its video: the method, its `play()`, and the register the video is in. */
internal class IdeaPinStart(val method: Method, val play: Int, val video: Int)

/**
 * An idea pin page plays its page's video itself when the page becomes the one on screen
 * (14.45.0: `fx1/n1.e()` @15, from `fx1/b1.C1`), without asking the saved state first. The method
 * clears a pending flag of the page, seeks the video to its start and plays it.
 */
internal fun BytecodePatchContext.ideaPinStart(): IdeaPinStart {
    val found = mutableListOf<IdeaPinStart>()
    classDefForEach { owner ->
        if (owner.superclass != ROUNDED_CORNERS_LAYOUT) return@classDefForEach
        owner.methods.mapNotNullTo(found, ::ideaPinStartIn)
    }
    return found.one("$PATCH: the idea pin page's start of its video")
}

private fun ideaPinStartIn(method: Method): IdeaPinStart? {
    if (method.parameterTypes.isNotEmpty() || method.returnType != "V" || method.implementation == null) return null
    val body = method.instructions()
    val play = body.indices.filter { at ->
        val called = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        body[at].opcode == Opcode.INVOKE_INTERFACE && called?.name == "play" && called.parameterTypes.isEmpty() && called.returnType == "V"
    }.singleOrNull() ?: return null
    if (play < 1 || play + 1 >= body.size) return null
    val video = body[play].passed().singleOrNull() ?: return null
    val played = (body[play] as ReferenceInstruction).reference as MethodReference
    val seek = (body[play - 1] as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (body[play - 1].opcode != Opcode.INVOKE_INTERFACE || seek.definingClass != played.definingClass ||
        seek.parameters() != listOf("J", "Z") || body[play - 1].passed().firstOrNull() != video
    ) return null
    // It runs once for each time the page comes on screen: it reads the page's pending flag and clears it first.
    val read = body.take(play).filter { it.opcode == Opcode.IGET_BOOLEAN }.map { (it as ReferenceInstruction).reference as FieldReference }
    val cleared = body.take(play).filter { it.opcode == Opcode.IPUT_BOOLEAN }.map { (it as ReferenceInstruction).reference as FieldReference }
    if (read.none { it in cleared && it.definingClass != method.definingClass }) return null
    return IdeaPinStart(method, play, video)
}

/**
 * Where each pin page takes its sound from Pinterest's app-wide sound flag [flag], true for muted,
 * the flag the speaker button sets. [video] is the regular video pin page's read of the flag each
 * time it becomes the one on screen. [idea] is the idea pin presenter's start each time its page
 * does, which has [applier] put the flag on the page's videos and its speaker button.
 */
internal class SoundStarts(val flag: FieldReference, val video: Method, val applier: Method, val idea: Method)

/**
 * 14.45.0: `PinCloseupVideoModule.loadSavedMuteState()` starts with `sget-boolean v0, mc3/u.a`, the
 * flag kept with the saved video states, and hands it to its video's mute setter. `fx1/b1.k2()`
 * reads the same flag first and stores it back as true or false with the page's videos and speaker
 * button. `ex1/a0.x4()`, the idea pin presenter's start, is the one method with no parameters in
 * another class that calls it. The video manager never makes an idea pin's video the active one
 * (S25, 2026-11-24), so the pages are where the sound starts.
 */
internal fun BytecodePatchContext.soundStarts(states: VideoStates): SoundStarts {
    val (video, flag) = soundFlag(states)
    val appliers = mutableListOf<Method>()
    classDefForEach { owner -> owner.methods.filterTo(appliers) { it.setsSound(flag) } }
    val applier = appliers.one("$PATCH: the idea pin page's sound setter")
    val ideas = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type == applier.definingClass) return@classDefForEach
        owner.methods.filterTo(ideas) { method ->
            method.parameterTypes.isEmpty() && method.returnType == "V" && method.implementation != null && method.calls().any {
                it.definingClass == applier.definingClass && it.name == applier.name && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
        }
    }
    val idea = ideas.one("$PATCH: the idea pin presenter's start")
    return SoundStarts(flag, video, applier, idea)
}

/** The regular video pin page's read of Pinterest's sound flag, its first instruction, and the flag it reads. */
internal fun BytecodePatchContext.soundFlag(states: VideoStates): Pair<Method, FieldReference> {
    val module = classDefByOrNull(PIN_CLOSEUP_VIDEO_MODULE) ?: throw PatchException("$PATCH: no regular video pin page $PIN_CLOSEUP_VIDEO_MODULE")
    val video = module.methods.filter {
        it.name == LOAD_SAVED_MUTE_STATE && it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null
    }.one("$PATCH: the video pin page's $LOAD_SAVED_MUTE_STATE")
    val first = video.instructions().firstOrNull()
    val flag = (first as? ReferenceInstruction)?.reference as? FieldReference
    if (first?.opcode != Opcode.SGET_BOOLEAN || flag == null || flag.type != "Z" || flag.definingClass != states.getter.definingClass) {
        throw PatchException("$PATCH: the video pin page's $LOAD_SAVED_MUTE_STATE no longer starts by reading Pinterest's sound flag")
    }
    return video to flag
}

/** A method with no parameters that starts by reading [flag] and stores it in two places: the idea pin page's sound setter. */
internal fun Method.setsSound(flag: FieldReference): Boolean {
    if (parameterTypes.isNotEmpty() || returnType != "V" || implementation == null) return false
    val body = instructions()
    fun touches(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction, opcode: Opcode) =
        instruction.opcode == opcode && ((instruction as ReferenceInstruction).reference as FieldReference).toString() == flag.toString()
    return body.isNotEmpty() && touches(body[0], Opcode.SGET_BOOLEAN) && body.count { touches(it, Opcode.SPUT_BOOLEAN) } >= 2
}

/**
 * Pin video playback (#48), two switches. Don't autoplay pin videos: Pinterest's pin pages start a
 * video unless its saved state says paused, and a video with nothing saved gets a fresh state that
 * plays. The extension's answer goes into that fresh state's paused flag, and into the flag each
 * pin page clears when you leave it, so a pin you come back to doesn't start either. Idea pin pages
 * start their page's video themselves, and that one play asks too. Start pin videos muted: each
 * time a pin page becomes the one on screen, regular video pins and idea pins alike, Pinterest's
 * app-wide sound flag takes the extension's answer right before the page reads it. Tapping the
 * speaker works as before.
 */
@Suppress("unused")
val pinVideoPlaybackPatch = bytecodePatch(
    name = PATCH,
    description = "Lets a video on a pin you open or swipe to wait for you to tap play, and start with the sound off. " +
        "Two switches, both start off. Turn them on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("pinVideoPlayback")
        requireStatusMethod("pinVideoAutoplay")
        requireStatusMethod("pinVideoSound")
        val states = videoStates()
        val fresh = freshState(states)
        val idea = ideaPinStart()
        val sound = soundStarts(states)
        val answer = fresh.method.freeLocalsAt("$PATCH: a fresh video state", fresh.at, 1, reads = listOf(fresh.state)).single()
        val waits = idea.method.freeLocalsAt("$PATCH: the idea pin page's start", idea.play, 1, highest = 255, reads = listOf(idea.video)).single()
        val pages = listOf(sound.video, sound.idea).map { page ->
            page to page.freeLocalsAt("$PATCH: a pin page's sound", 0, 1, highest = 255).single()
        }

        // Don't autoplay pin videos: a fresh state waits, a pin page you leave keeps its video waiting,
        // and an idea pin page skips its own play.
        mutable(fresh.method).addInstructionsAtControlFlowLabel(fresh.at, """
            invoke-static {}, $PIN_VIDEO_WAITS_HOOK
            move-result v$answer
            iput-boolean v$answer, v${fresh.state}, ${states.paused}
        """)
        for ((method, at) in states.resets) {
            val register = (method.instructions()[at] as OneRegisterInstruction).registerA
            mutable(method).addInstructionsAtControlFlowLabel(at + 1, """
                invoke-static {}, $PIN_VIDEO_WAITS_HOOK
                move-result v$register
            """)
        }
        val start = mutable(idea.method)
        start.addInstructionsAtControlFlowLabel(idea.play, """
            invoke-static {}, $PIN_VIDEO_WAITS_HOOK
            move-result v$waits
            if-nez v$waits, :hush_video_waits
        """, ExternalLabel("hush_video_waits", start.getInstruction(idea.play + 1)))
        enableCapability("pinVideoAutoplay")

        // Start pin videos muted: on yes the flag each pin page reads next is muted. The hook's
        // answer is 0 or 1, the values the flag takes.
        for ((page, muted) in pages) {
            val method = mutable(page)
            method.addInstructionsAtControlFlowLabel(0, """
                invoke-static {}, $PIN_VIDEO_MUTED_HOOK
                move-result v$muted
                if-eqz v$muted, :hush_sound_kept
                sput-boolean v$muted, ${sound.flag}
            """, ExternalLabel("hush_sound_kept", method.getInstruction(0)))
        }
        enableCapability("pinVideoSound")
        enableStatus("pinVideoPlayback")
    }
}
