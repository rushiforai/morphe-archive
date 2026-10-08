/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.pip

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootPauses
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.media.taptoplay.innerPause
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.extension.requireParameterIntact
import app.morphe.patches.facebook.misc.extension.requireThisIntact
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val PATCH = "Picture-in-picture"

/** The Reels viewer's picture-in-picture surface. Only ReelsPipUtil loads it, in 577, 580 and 581. */
internal const val PIP_SURFACE = "fb_shorts_viewer_pip"

/** Two player origins the Reels viewer's arming step turns down by name, held together nowhere else. */
internal const val AI_STYLES_DRAFTS = "ai_styles_drafts"
internal const val REELS_VIEWER = "fb_shorts_viewer"

internal const val ACTIVITY = "Landroid/app/Activity;"
internal const val RECT = "Landroid/graphics/Rect;"
internal const val RATIONAL = "Landroid/util/Rational;"
internal const val PIP_PARAMS = "Landroid/app/PictureInPictureParams;"
internal const val PIP_PARAMS_BUILDER = "Landroid/app/PictureInPictureParams\$Builder;"

internal const val PICTURE_IN_PICTURE = "Lapp/morphe/extension/facebook/media/PictureInPicture;"

internal const val ALLOWED = "$PICTURE_IN_PICTURE->allowed($ACTIVITY)Z"

internal const val SURFACE_ALLOWED = "$PICTURE_IN_PICTURE->surfaceAllowed()Z"

internal const val ARMED = "$PICTURE_IN_PICTURE->armed(${ACTIVITY}Ljava/lang/Object;[Ljava/lang/Object;)V"

/** The extension's stub the patch fills with a call of [REARM_HELPER]. */
internal const val REARM_STUB = "rearm"

/** Helpers the patch adds to ReelsPipUtil: one hands the arming's arguments over, one arms again with them. */
internal const val ARMING_HELPER = "hushfacebookPipArming"
internal const val REARM_HELPER = "hushfacebookPipRearm"

internal const val DISARMED = "$PICTURE_IN_PICTURE->disarmed()V"

internal const val PLAYER_PLAYING = "$PICTURE_IN_PICTURE->playerPlaying(Ljava/lang/Object;)V"

internal const val PLAYER_PAUSED = "$PICTURE_IN_PICTURE->playerPaused(Ljava/lang/Object;)V"

internal const val SET_ASIDE = "$PICTURE_IN_PICTURE->setAside()Z"

/** The window's viewer: the container it opens in, and the config it opens with. */
internal const val VIEWER_CONTAINER = "reels_pip_container"
internal const val VIEWER_CONFIG = "Lcom/facebook/video/reels/pip/ui/ReelsPipViewerConfig;"
internal const val FRAGMENT_ACTIVITY = "Landroidx/fragment/app/FragmentActivity;"

internal const val VIEWER_ID = "$PICTURE_IN_PICTURE->viewerId(${ACTIVITY}I)I"

/** The Watch topic feed's fragment is the one class holding this error text, in its engagement-state check. */
internal const val TOPIC_FEED = "isEngagementState(): Topic Params is null"

/** Facebook's MobileConfig reader. The class keeps its name; its methods are renamed, so a call is told by its shape. */
internal const val PIP_MOBILE_CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

internal const val IMMERSIVE_ALLOWED = "$PICTURE_IN_PICTURE->immersiveAllowed(Z)Z"

/**
 * The Video tab's deep-dive surface, named by the one method that arms the window for the Video
 * tab, next to the server flag that lets that surface keep it.
 */
internal const val VIDEO_TAB_SURFACE = "UNIFIED_PLAYER_VDD_IN_WARION"

internal const val HOME_GATE_ALLOWED = "$PICTURE_IN_PICTURE->homeGateAllowed(Z)Z"

internal const val HOME_FLAG_ALLOWED = "$PICTURE_IN_PICTURE->homeFlagAllowed(Z)Z"

/**
 * A playing reel keeps going in a small window when you leave Facebook. Facebook ships
 * picture-in-picture for its Reels viewer (ReelsPipUtil: 581 `LX/BB6;`, 580 `LX/B3H;`, 577
 * `LX/AIo;`) behind server flags, at two gates. The Reels viewer of the video tab first asks a gate
 * of its own whether its surface has picture-in-picture (581 `LX/Arj;->A01`), then ReelsPipUtil's
 * check whether the activity may use it: Android 12 or later, a server flag or a preference of
 * Facebook's, the phone's feature and a memory check. The patch puts the extension first in both;
 * its yes returns true, and Facebook's own code then sets the window's shape and Android's
 * auto-enter. The activities the viewer plays in already declare picture-in-picture in Facebook's
 * manifest.
 *
 * Facebook arms the window once as the viewer opens, and turns auto-enter off and on as that one
 * player pauses and plays, through a runnable ReelsPipUtil posts (581 `LX/Ciq;`). A swipe pauses
 * that player for good and starts the next reel's without arming again, so after one swipe
 * auto-enter stays off. The extension hears ReelsPipUtil arm and disarm, and FbGrootPlayer play (at
 * its trace, after Tap to play's gate) and pause. While the window is armed, it sets Facebook's
 * runnable aside and turns auto-enter off while the reel on screen, the player that started last,
 * is paused, and back on when a reel plays. A reel other than the armed one gets the window armed
 * again, through a helper the patch adds to ReelsPipUtil, with Facebook's own arguments and that
 * reel's player, so the window plays the reel on screen.
 *
 * In the window, Facebook's viewer (581 `LX/g7h;`) gives its container a new view id, and its
 * fragment finds the container by that id from the top of the screen. A React Native view can
 * already hold it (Marketplace's root holds 1, the first id Android hands out), and the viewer then
 * opens inside the hidden main screen at no size, which leaves the window black. The extension
 * swaps an id a view holds for a free one.
 *
 * Facebook's full-screen Watch viewer (the Watch topic feed fragment: 581 `LX/Anv;`, 580 `LX/Aex;`,
 * 577 `LX/ArV;`) arms the same window itself in onResume, behind a server flag of its own, for a
 * video in its engagement state. The flag is the MobileConfig read nearest before that onResume's
 * call of ReelsPipUtil's check (it reads the same in 577, 580 and 581, as the move-result before an
 * if-eqz), and the extension answers it. Facebook's own code then arms the window for the video on
 * screen, and the rest here treats it like any other arming. Its onStop disarm is left behind
 * the same flag, still Facebook's: a screen leaving with the video paused is held by the pause
 * hook, and an immersive screen that closes takes its window arming with it.
 *
 * The Video tab (video_home) arms the window too, as you scroll its videos, in one method of its
 * data controller (581 `LX/84s;->A0J`, 580 `LX/85e;->A0I`, 577 `LX/7s8;->A0J`), the one loading
 * [VIDEO_TAB_SURFACE] that calls ReelsPipUtil's check. Its questions before it arms, in order:
 * - its own copy of the Reels viewer's surface gate, inlined: the same fetch of the surface's
 *   settings (581 `LX/Cr0;->CKK()`) and the same two lambda cases (581 39 and 40, 580 165 and 166,
 *   577 178 and 179), reading one server flag in the Video tab's Reels and another elsewhere. A no
 *   skips the arming. The patch already answers the gate itself, so the extension answers the copy.
 * - Android 12, an activity, ReelsPipUtil's check (answered first by the extension already).
 * - For the deep-dive surface, a flag in the same MobileConfig config as the Reels arming's ad and
 *   live flags (581 0x10107b2 slot 5, 580 0x10107b6 slot 5, 577 0x10107bb slot 5). A no disarms.
 *   The extension answers it.
 * - An ad (one with ad info: disarmed unless it's an affiliate ad, `is_affiliate_ad`, and that
 *   config's slot 12 says yes), a live video (`if_video_broadcast.is_live_streaming` disarms unless
 *   slot 8 says yes), no video id, a shape picture-in-picture can't take. These stay Facebook's,
 *   so ads and live videos still arm no window, the way the Reels viewer leaves them.
 * Facebook's own code then arms the window for the video on screen, and the rest here treats that
 * arming like any other: a paused video is held by the pause hook.
 *
 * Off in the default selection: it changes what leaving Facebook does. Picked, its switch starts on.
 */
@Suppress("unused")
val pictureInPicturePatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Picture-in-picture",
    description = "A reel playing in the Reels tab, or a video playing in the Video tab or Facebook's full-screen " +
        "Watch viewer, keeps going in a small window when you leave Facebook, through the picture-in-picture " +
        "Facebook already has for them. Needs Android 12 or later.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val check = findPipCheck()
        val step = findArmingStep(check)
        val gate = findSurfaceGate(step)
        val player = findPlayer()
        val arming = findArming(check, player.play.definingClass)
        val videoParams = videoParamsCall(step, arming, player.play.definingClass)
            ?: refuse("${step.definingClass}->${step.name} asks the player for none of ${arming.name}'s arguments")
        val disarms = findDisarms(check)
        val stateChange = findStateChange(check)
        val opening = findViewerOpening()
        val topic = findTopicFlag(check)
        val home = findHome(check, gate, disarms)
        applyPipCheck(check)
        applySurfaceGate(gate)
        applyArming(arming, player.play.definingClass, videoParams)
        disarms.forEach { applyDisarm(it) }
        applyPlayer(player)
        applyStateChange(stateChange)
        applyViewerId(opening)
        applyTopicFlag(topic)
        applyHome(home)
        enableStatus("pictureInPicture")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

private fun Method.calls(): List<MethodReference> = implementation?.instructions?.toList().orEmpty().mapNotNull { instruction ->
    if (!instruction.opcode.name.startsWith("invoke")) null
    else (instruction as? ReferenceInstruction)?.reference as? MethodReference
}

private fun MethodReference.parameterList(): List<String> = parameterTypes.map(CharSequence::toString)

/** Whether [method] is ReelsPipUtil's check: (Activity) -> boolean, asking for the phone's feature. */
internal fun isPipCheck(method: Method): Boolean =
    method.returnType == "Z" && method.parameterTypes.map(CharSequence::toString) == listOf(ACTIVITY) &&
        method.calls().any { it.name == "hasSystemFeature" && it.definingClass == "Landroid/content/pm/PackageManager;" }

/** ReelsPipUtil, the one class loading [PIP_SURFACE], and its one check. Changes nothing. */
internal fun BytecodePatchContext.findPipCheck(): Method {
    val utils = classDefByStrings(PIP_SURFACE, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
    val util = utils.singleOrNull() ?: refuse("expected one class loading \"$PIP_SURFACE\", found ${utils.size}")
    val checks = util.methods.filter(::isPipCheck)
    return checks.singleOrNull()
        ?: refuse("${util.type} has ${checks.size} (Activity) -> boolean checks asking for the phone's feature, expected 1")
}

/** Whether [method] is the Reels viewer's arming step: both origins' names, and a call of [check]. */
internal fun isArmingStep(method: Method, check: Method): Boolean =
    holdsString(method, AI_STYLES_DRAFTS) && holdsString(method, REELS_VIEWER) &&
        method.calls().any { it.definingClass == check.definingClass && it.name == check.name && it.parameterList() == listOf(ACTIVITY) }

/**
 * The surface gate: the arming step's first static call of a method of its own class that takes
 * one of the step's own arguments and answers a boolean. Changes nothing.
 */
internal fun surfaceGateCall(arming: Method): MethodReference? {
    val arguments = arming.parameterTypes.map(CharSequence::toString).filter { it.startsWith("L") && it != ACTIVITY }
    return arming.implementation?.instructions?.toList().orEmpty().firstNotNullOfOrNull { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        call?.takeIf {
            instruction.opcode.name.startsWith("invoke-static") && it.definingClass == arming.definingClass &&
                it.returnType == "Z" && it.parameterList().size == 1 && it.parameterList()[0] in arguments
        }
    }
}

/** The Reels viewer's one arming step. Changes nothing. */
internal fun BytecodePatchContext.findArmingStep(check: Method): Method {
    val steps = classDefByStrings(AI_STYLES_DRAFTS, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { holder -> holder.methods.filter { isArmingStep(it, check) } }
    return steps.singleOrNull()
        ?: refuse("expected one step loading \"$AI_STYLES_DRAFTS\" and \"$REELS_VIEWER\" that calls the check, found ${steps.size}")
}

/** The Reels viewer's surface gate, found from its arming step. Changes nothing. */
internal fun BytecodePatchContext.findSurfaceGate(arming: Method): Method {
    val call = surfaceGateCall(arming)
        ?: refuse("${arming.definingClass}->${arming.name} calls no gate of its own class on one of its arguments")
    val holder: ClassDef = classDefBy(call.definingClass)
    return holder.methods.singleOrNull {
        it.name == call.name && it.parameterTypes.map(CharSequence::toString) == call.parameterList() &&
            it.returnType == "Z" && AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    } ?: refuse("${call.definingClass}->${call.name} isn't a static gate with a body")
}

/**
 * The extension goes first in the check, handed the activity through the range form, which names
 * any register. Its yes returns true from v0, free at the method's start; anything else runs
 * Facebook's check as it was.
 */
internal fun BytecodePatchContext.applyPipCheck(check: Method) {
    val method = mutableClassDefBy(check.definingClass).findMutableMethodOf(check)
    method.requireLocals(PATCH, 1)
    val activity = if (AccessFlags.STATIC.isSet(method.accessFlags)) "p0" else "p1"
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { $activity .. $activity }, $ALLOWED
            move-result v0
            if-eqz v0, :facebook
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("facebook", method.getInstruction(0)),
    )
}

/** The extension goes first in the surface gate the same way. Its yes, already 1 in v0, returns. */
internal fun BytecodePatchContext.applySurfaceGate(gate: Method) {
    val method = mutableClassDefBy(gate.definingClass).findMutableMethodOf(gate)
    method.requireLocals(PATCH, 1)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $SURFACE_ALLOWED
            move-result v0
            if-eqz v0, :facebook
            return v0
        """,
        ExternalLabel("facebook", method.getInstruction(0)),
    )
}

/** FbGrootPlayer's play and the pause every other pause hands on to, the two Tap to play gates. */
internal class Player(val play: Method, val pause: Method)

/** FbGrootPlayer's play and inner pause. Changes nothing. */
internal fun BytecodePatchContext.findPlayer(): Player {
    val plays = classDefByStrings(GROOT_PLAY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap(::grootPlays)
    val play = plays.singleOrNull() ?: refuse("expected one player play holding \"$GROOT_PLAY\", found ${plays.size}")
    val owner = classDefBy(play.definingClass)
    val pauses = grootPauses(owner, play.parameterTypes.single().toString())
    val pause = innerPause(pauses)
        ?: refuse("expected one pause in ${owner.type} that every other one hands on to, found ${pauses.size} pauses")
    return Player(play, pause)
}

private fun Method.shape() = parameterTypes.map(CharSequence::toString)

/**
 * Whether [method] is ReelsPipUtil's arming: it takes an activity, the window's place and its shape
 * first, [player] among the rest, and hands a PictureInPictureParams on. The step that only
 * schedules it takes the same arguments and hands none on.
 */
internal fun isArming(method: Method, player: String): Boolean =
    method.shape().take(3) == listOf(ACTIVITY, RECT, RATIONAL) && player in method.shape() &&
        method.calls().any { PIP_PARAMS in it.parameterList() }

/** ReelsPipUtil's one arming, in the class of [check]. Changes nothing. */
internal fun BytecodePatchContext.findArming(check: Method, player: String): Method {
    val armings = classDefBy(check.definingClass).methods.filter { isArming(it, player) }
    return armings.singleOrNull()
        ?: refuse("${check.definingClass} has ${armings.size} armings handing on a window's parameters, expected 1")
}

/** Whether [method] is one of ReelsPipUtil's disarms: (Activity) -> void, building auto-enter params of its own. */
internal fun isDisarm(method: Method): Boolean =
    method.returnType == "V" && method.shape() == listOf(ACTIVITY) &&
        method.calls().any { it.definingClass == PIP_PARAMS_BUILDER && it.name == "setAutoEnterEnabled" }

/** ReelsPipUtil's disarms, at least one. Changes nothing. */
internal fun BytecodePatchContext.findDisarms(check: Method): List<Method> =
    classDefBy(check.definingClass).methods.filter(::isDisarm).ifEmpty { refuse("${check.definingClass} has no disarm") }

/**
 * The call by which the arming step asks the player for the video's own arguments to the arming
 * (581 `LX/5EG;->C1z()LX/4sv;`): no arguments, on [player], answering one of [arming]'s other
 * argument types. Changes nothing.
 */
internal fun videoParamsCall(step: Method, arming: Method, player: String): VideoParams? {
    val others = arming.shape().filter { it != player }
    val calls = step.implementation?.instructions?.toList().orEmpty().mapNotNull { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        call?.takeIf {
            instruction.opcode.name.startsWith("invoke-virtual") || instruction.opcode.name.startsWith("invoke-interface")
        }?.takeIf { it.definingClass == player && it.parameterTypes.isEmpty() && it.returnType in others }
            ?.let { VideoParams(it, if (instruction.opcode.name.startsWith("invoke-interface")) "interface" else "virtual") }
    }
    return calls.distinctBy { it.call.toString() }.singleOrNull()
}

/** The player's call answering the video's own arguments to the arming, and how it's invoked. */
internal class VideoParams(val call: MethodReference, val kind: String)

/** How a capture boxes and a replay unboxes the arguments the arming takes that aren't objects. */
private val boxes = mapOf("I" to ("Ljava/lang/Integer;" to "intValue"), "Z" to ("Ljava/lang/Boolean;" to "booleanValue"))

/**
 * The arming first hands its activity, its player and all its arguments to the extension, through
 * a helper with registers of its own. A second helper arms again with those arguments for another
 * player and that player's own video arguments, and the extension's [REARM_STUB] calls it.
 */
internal fun BytecodePatchContext.applyArming(arming: Method, player: String, video: VideoParams) {
    if (!AccessFlags.STATIC.isSet(arming.accessFlags)) refuse("${arming.definingClass}->${arming.name} isn't static")
    val shape = arming.shape()
    shape.filter { !it.startsWith("L") && !it.startsWith("[") && it !in boxes }.forEach {
        refuse("${arming.definingClass}->${arming.name} takes a $it, which the capture has no box for")
    }
    val playerAt = shape.indexOf(player)
    val paramsAt = shape.indexOf(video.call.returnType)
    val kind = video.kind
    val videoParams = video.call
    val util = mutableClassDefBy(arming.definingClass)
    val parameters = shape.joinToString("")

    // Locals v0 (the array), v1 (an index) and v2 (a boxed value), then the arming's arguments.
    val capture = buildString {
        appendLine("const/16 v1, ${shape.size}")
        appendLine("new-array v0, v1, [Ljava/lang/Object;")
        shape.forEachIndexed { at, type ->
            appendLine("const/16 v1, $at")
            val box = boxes[type]
            if (box == null) {
                appendLine("aput-object p$at, v0, v1")
            } else {
                appendLine("invoke-static/range { p$at .. p$at }, ${box.first}->valueOf($type)${box.first}")
                appendLine("move-result-object v2")
                appendLine("aput-object v2, v0, v1")
            }
        }
        appendLine("move-object/from16 v1, p0")
        appendLine("move-object/from16 v2, p$playerAt")
        appendLine("invoke-static { v1, v2, v0 }, $ARMED")
        appendLine("return-void")
    }
    util.methods.add(helper(arming.definingClass, ARMING_HELPER, shape, 3 + shape.size, capture))
    util.findMutableMethodOf(arming).addInstruction(
        0,
        "invoke-static/range { p0 .. p${shape.size - 1} }, ${arming.definingClass}->$ARMING_HELPER($parameters)V",
    )

    // Locals v0 to v(n-1) (the arguments) and vn (an index); p0 the captured arguments, p1 the player.
    val index = "v${shape.size}"
    val replay = buildString {
        shape.forEachIndexed { at, type ->
            when (at) {
                playerAt -> {
                    appendLine("move-object/from16 v$at, p1")
                    appendLine("check-cast v$at, $type")
                }
                paramsAt -> Unit
                else -> {
                    appendLine("const/16 $index, $at")
                    appendLine("aget-object v$at, p0, $index")
                    val box = boxes[type]
                    if (box == null) {
                        appendLine("check-cast v$at, $type")
                    } else {
                        appendLine("check-cast v$at, ${box.first}")
                        appendLine("invoke-virtual/range { v$at .. v$at }, ${box.first}->${box.second}()$type")
                        appendLine("move-result v$at")
                    }
                }
            }
        }
        appendLine("invoke-$kind/range { v$playerAt .. v$playerAt }, $videoParams")
        appendLine("move-result-object v$paramsAt")
        appendLine("invoke-static/range { v0 .. v${shape.size - 1} }, ${arming.definingClass}->${arming.name}($parameters)V")
        appendLine("return-void")
    }
    util.methods.add(helper(arming.definingClass, REARM_HELPER, listOf("[Ljava/lang/Object;", "Ljava/lang/Object;"), shape.size + 3, replay))

    val stub = mutableClassDefBy(PICTURE_IN_PICTURE).methods.singleOrNull {
        it.name == REARM_STUB && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
            it.shape() == listOf("[Ljava/lang/Object;", "Ljava/lang/Object;")
    } ?: refuse("$PICTURE_IN_PICTURE has no static boolean $REARM_STUB(Object[], Object)")
    // d8 gives the stub no locals of its own, so the answer goes back in p0, used by then.
    stub.addInstructions(
        0,
        """
            invoke-static { p0, p1 }, ${arming.definingClass}->$REARM_HELPER([Ljava/lang/Object;Ljava/lang/Object;)V
            const/4 p0, 0x1
            return p0
        """,
    )
}

/** A public static void helper on [owner] with [registers] registers in all, running [smali]. */
private fun helper(owner: String, name: String, parameters: List<String>, registers: Int, smali: String) = ImmutableMethod(
    owner,
    name,
    parameters.map { ImmutableMethodParameter(it, null, null) },
    "V",
    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
    null,
    null,
    MutableMethodImplementation(registers),
).toMutable().apply { addInstructions(0, smali) }

/** Each disarm tells the extension first. */
internal fun BytecodePatchContext.applyDisarm(disarm: Method) {
    mutableClassDefBy(disarm.definingClass).findMutableMethodOf(disarm).addInstruction(0, "invoke-static { }, $DISARMED")
}

/**
 * The pause tells the extension first. The play tells it right after its trace, behind anything a
 * patch put in front, so a start Tap to play holds back isn't heard as playing.
 */
internal fun BytecodePatchContext.applyPlayer(player: Player) {
    val owner = mutableClassDefBy(player.play.definingClass)
    owner.findMutableMethodOf(player.pause).addInstruction(0, "invoke-static/range { p0 .. p0 }, $PLAYER_PAUSED")
    val play = owner.findMutableMethodOf(player.play)
    val trace = play.implementation!!.instructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == GROOT_PLAY
    }
    if (trace < 0) refuse("${play.definingClass}->${play.name} no longer loads \"$GROOT_PLAY\"")
    play.requireThisIntact(PATCH, listOf(trace + 1))
    play.addInstruction(trace + 1, "invoke-static/range { p0 .. p0 }, $PLAYER_PLAYING")
}

/** The types ReelsPipUtil builds from an activity and a boolean: the runnable its state change posts. */
internal fun stateRunnables(util: ClassDef): Set<String> = util.methods.flatMap { method ->
    method.calls().filter { it.name == "<init>" && it.parameterList() == listOf(ACTIVITY, "Z") }.map { it.definingClass }
}.toSet()

/** Whether [method] is a run() handing the window's parameters to ReelsPipUtil's setter in [util]. */
internal fun isStateChange(method: Method, util: String): Boolean =
    method.name == "run" && method.parameterTypes.isEmpty() && method.returnType == "V" &&
        method.calls().any { it.definingClass == util && it.parameterList() == listOf(ACTIVITY, PIP_PARAMS) }

/** The run() of the one runnable ReelsPipUtil posts when its player's state turns auto-enter off or on. Changes nothing. */
internal fun BytecodePatchContext.findStateChange(check: Method): Method {
    val types = stateRunnables(classDefBy(check.definingClass))
    val type = types.singleOrNull() ?: refuse("${check.definingClass} builds ${types.size} (Activity, boolean) objects, expected 1")
    val runs = classDefBy(type).methods.filter { isStateChange(it, check.definingClass) }
    return runs.singleOrNull() ?: refuse("$type has ${runs.size} run() handing the window's parameters on, expected 1")
}

/** The runnable asks the extension first. Its yes returns before Facebook sets anything. */
internal fun BytecodePatchContext.applyStateChange(run: Method) {
    val method = mutableClassDefBy(run.definingClass).findMutableMethodOf(run)
    method.requireLocals(PATCH, 1)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $SET_ASIDE
            move-result v0
            if-eqz v0, :facebook
            return-void
        """,
        ExternalLabel("facebook", method.getInstruction(0)),
    )
}

/** Whether [call] is View.generateViewId(). */
private fun isNewViewId(call: MethodReference?): Boolean =
    call != null && call.definingClass == "Landroid/view/View;" && call.name == "generateViewId" && call.parameterTypes.isEmpty()

/** Whether [method] opens the window's viewer: (FragmentActivity, ReelsPipViewerConfig), giving its container a new view id. */
internal fun isViewerOpening(method: Method): Boolean =
    method.returnType == "V" && method.parameterTypes.map(CharSequence::toString) == listOf(FRAGMENT_ACTIVITY, VIEWER_CONFIG) &&
        method.calls().any(::isNewViewId)

/** The one opening of the window's viewer, in the class loading [VIEWER_CONTAINER] (581 `LX/g7h;`). Changes nothing. */
internal fun BytecodePatchContext.findViewerOpening(): Method {
    val openings = classDefByStrings(VIEWER_CONTAINER, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { holder -> holder.methods.filter(::isViewerOpening) }
    return openings.singleOrNull()
        ?: refuse("expected one (FragmentActivity, ReelsPipViewerConfig) opening loading \"$VIEWER_CONTAINER\", found ${openings.size}")
}

/**
 * The viewer's new view id goes through the extension before its container takes it. The viewer's
 * fragment finds its container by that id from the top of the screen, and a React Native view
 * already holding it wins, which puts the viewer inside the hidden main screen at no size.
 */
internal fun BytecodePatchContext.applyViewerId(opening: Method) {
    val method = mutableClassDefBy(opening.definingClass).findMutableMethodOf(opening)
    val instructions = method.implementation!!.instructions.toList()
    val call = instructions.indexOfFirst { isNewViewId((it as? ReferenceInstruction)?.reference as? MethodReference) }
    val result = instructions.getOrNull(call + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) refuse("${method.definingClass}->${method.name} doesn't keep its new view id")
    val id = (result as OneRegisterInstruction).registerA
    val activity = method.parameterRegisterNumber(0)
    if (id > 15 || activity > 15) refuse("${method.definingClass}->${method.name} keeps its activity or new view id past v15")
    method.requireParameterIntact(PATCH, 0, listOf(call + 2))
    method.addInstructions(
        call + 2,
        """
            invoke-static { v$activity, v$id }, $VIEWER_ID
            move-result v$id
        """,
    )
}

/** Whether [call] is a MobileConfig boolean read: a static (Object, long) -> boolean call on Facebook's reader. */
internal fun isConfigRead(instruction: Instruction): Boolean {
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return instruction.opcode == Opcode.INVOKE_STATIC && call.definingClass == PIP_MOBILE_CONFIG && call.returnType == "Z" &&
        call.parameterList() == listOf("Ljava/lang/Object;", "J")
}

/**
 * Where the Watch topic feed's onResume asks its picture-in-picture flag: the index of the
 * move-result of the last MobileConfig boolean read before its call of [check], when an if-eqz
 * follows it. Changes nothing.
 */
internal fun topicFlagAt(onResume: Method, check: Method): Int {
    val code = onResume.implementation?.instructions?.toList().orEmpty()
    val asked = code.indexOfFirst { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        call != null && instruction.opcode.name.startsWith("invoke") && call.definingClass == check.definingClass &&
            call.name == check.name && call.parameterList() == listOf(ACTIVITY) && call.returnType == "Z"
    }
    if (asked < 0) return -1
    val read = (asked - 1 downTo 0).firstOrNull { isConfigRead(code[it]) } ?: return -1
    val result = code.getOrNull(read + 1)
    if (result?.opcode != Opcode.MOVE_RESULT || code.getOrNull(read + 2)?.opcode != Opcode.IF_EQZ) return -1
    return read + 1
}

/** The Watch topic feed's onResume and the move-result of its flag. Changes nothing. */
internal class TopicFlag(val onResume: Method, val result: Int)

/** The one Watch topic feed fragment's onResume, found by the text of its engagement-state check. Changes nothing. */
internal fun BytecodePatchContext.findTopicFlag(check: Method): TopicFlag {
    val topics = classDefByStrings(TOPIC_FEED, StringComparisonType.EQUALS).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
    val topic = topics.singleOrNull() ?: refuse("expected one class holding \"$TOPIC_FEED\", found ${topics.size}")
    val resumes = topic.methods.filter { it.name == "onResume" && it.parameterTypes.isEmpty() && it.returnType == "V" }
    val resume = resumes.singleOrNull() ?: refuse("${topic.type} has ${resumes.size} onResume(), expected 1")
    val at = topicFlagAt(resume, check)
    if (at < 0) refuse("${topic.type}->onResume reads no MobileConfig flag in front of if-eqz before it asks ${check.name}")
    return TopicFlag(resume, at)
}

/**
 * The flag's answer goes through the extension before the branch reads it, so the viewer arms its
 * window for the video on screen with Facebook's own code. The register is the move-result's own,
 * a local, and the range form names it wherever it is.
 */
internal fun BytecodePatchContext.applyTopicFlag(topic: TopicFlag) {
    val method = mutableClassDefBy(topic.onResume.definingClass).findMutableMethodOf(topic.onResume)
    val result = method.implementation!!.instructions.toList()[topic.result] as OneRegisterInstruction
    val register = result.registerA
    if (register >= method.localRegisterCount()) refuse("${method.definingClass}->${method.name} reads its flag into a parameter register")
    method.addInstructions(
        topic.result + 1,
        """
            invoke-static/range { v$register .. v$register }, $IMMERSIVE_ALLOWED
            move-result v$register
        """,
    )
}

/** Whether [instruction] calls ReelsPipUtil's [check]. */
private fun asksCheck(instruction: Instruction, check: Method): Boolean {
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return instruction.opcode.name.startsWith("invoke") && call.definingClass == check.definingClass &&
        call.name == check.name && call.parameterList() == listOf(ACTIVITY) && call.returnType == "Z"
}

/**
 * Whether [instruction] reads a MobileConfig boolean, in either form a build compiles one to: a
 * static (Object, long) -> boolean call on Facebook's reader, or a (long) -> boolean call on the
 * reader itself.
 */
internal fun isFlagRead(instruction: Instruction): Boolean {
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    if (call.definingClass != PIP_MOBILE_CONFIG || call.returnType != "Z") return false
    return when (instruction.opcode) {
        Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE -> call.parameterList() == listOf("Ljava/lang/Object;", "J")
        Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE, Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE ->
            call.parameterList() == listOf("J")
        else -> false
    }
}

private val literalLoads = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)

/**
 * From after [from], the index of the first call answering a boolean, and the numbers loaded on the
 * way there: where a surface gate reads its answer, and the cases of the lambdas it reads it
 * through. The index is -1 without such a call.
 */
internal fun gateRead(code: List<Instruction>, from: Int): Pair<Int, List<Int>> {
    val cases = mutableListOf<Int>()
    for (at in from + 1 until code.size) {
        val instruction = code[at]
        if (instruction.opcode in literalLoads) cases += (instruction as NarrowLiteralInstruction).narrowLiteral
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (instruction.opcode.name.startsWith("invoke") && call?.returnType == "Z") return at to cases
    }
    return -1 to cases
}

/**
 * Where the Reels viewer's surface [gate] fetches its surface's settings: its first interface call,
 * taking nothing, on the one argument it takes (581 `LX/Cr0;->CKK()`). -1 without one.
 */
internal fun settingsFetchAt(gate: Method): Int {
    val argument = gate.shape().singleOrNull() ?: return -1
    return gate.implementation?.instructions?.toList().orEmpty().indexOfFirst { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode.name.startsWith("invoke-interface") && call?.definingClass == argument && call.parameterTypes.isEmpty()
    }
}

/**
 * Where the Video tab's arming [home] answers its own copy of the surface [gate], inlined: the
 * move-result of the first boolean answer after its last fetch of the gate's settings before it asks
 * [check], when the numbers loaded on the way are the gate's own lambda cases. -1 otherwise.
 * Changes nothing.
 */
internal fun homeGateAt(home: Method, gate: Method, check: Method): Int {
    val gateCode = gate.implementation?.instructions?.toList().orEmpty()
    val fetch = settingsFetchAt(gate)
    if (fetch < 0) return -1
    val settings = ((gateCode[fetch] as ReferenceInstruction).reference as MethodReference).toString()
    val (gateAnswer, cases) = gateRead(gateCode, fetch)
    if (gateAnswer < 0 || cases.isEmpty()) return -1
    val code = home.implementation?.instructions?.toList().orEmpty()
    val asked = code.indexOfFirst { asksCheck(it, check) }
    if (asked < 0) return -1
    val fetched = (asked - 1 downTo 0).firstOrNull { at ->
        code[at].opcode.name.startsWith("invoke") &&
            ((code[at] as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == settings
    } ?: return -1
    val (answer, homeCases) = gateRead(code, fetched)
    if (answer < 0 || answer >= asked || homeCases != cases) return -1
    return if (code.getOrNull(answer + 1)?.opcode == Opcode.MOVE_RESULT) answer + 1 else -1
}

/**
 * Where the Video tab's arming [home] reads its flag for [VIDEO_TAB_SURFACE]: the move-result of the
 * first MobileConfig boolean read after it loads that name, when an if-nez on it follows and a no
 * falls through into one of ReelsPipUtil's [disarms]. -1 otherwise. Changes nothing.
 */
internal fun homeFlagAt(home: Method, disarms: List<Method>): Int {
    val code = home.implementation?.instructions?.toList().orEmpty()
    val named = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == VIDEO_TAB_SURFACE }
    if (named < 0) return -1
    val read = (named + 1 until code.size).firstOrNull { isFlagRead(code[it]) } ?: return -1
    val result = code.getOrNull(read + 1)
    val branch = code.getOrNull(read + 2)
    if (result?.opcode != Opcode.MOVE_RESULT || branch?.opcode != Opcode.IF_NEZ) return -1
    if ((branch as OneRegisterInstruction).registerA != (result as OneRegisterInstruction).registerA) return -1
    val next = code.getOrNull(read + 3) ?: return -1
    val disarm = (next as? ReferenceInstruction)?.reference as? MethodReference ?: return -1
    if (!next.opcode.name.startsWith("invoke")) return -1
    val disarming = disarms.any {
        it.definingClass == disarm.definingClass && it.name == disarm.name && it.shape() == disarm.parameterList() &&
            disarm.returnType == "V"
    }
    return if (disarming) read + 1 else -1
}

/** Whether [method] is the Video tab's arming: it loads [VIDEO_TAB_SURFACE] and asks ReelsPipUtil's [check]. */
internal fun isHome(method: Method, check: Method): Boolean =
    holdsString(method, VIDEO_TAB_SURFACE) && method.implementation?.instructions?.any { asksCheck(it, check) } == true

/** The Video tab's arming and the move-results of its copy of the gate and of its flag. */
internal class Home(val method: Method, val gate: Int, val flag: Int)

/** The one Video tab arming, with both answers found, each in a local. Changes nothing. */
internal fun BytecodePatchContext.findHome(check: Method, gate: Method, disarms: List<Method>): Home {
    val homes = classDefByStrings(VIDEO_TAB_SURFACE, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { holder -> holder.methods.filter { isHome(it, check) } }
    val home = homes.singleOrNull()
        ?: refuse("expected one method loading \"$VIDEO_TAB_SURFACE\" that calls the check, found ${homes.size}")
    val where = "${home.definingClass}->${home.name}"
    val gateAt = homeGateAt(home, gate, check)
    if (gateAt < 0) refuse("$where has no copy of ${gate.definingClass}->${gate.name} before it asks ${check.name}")
    val flagAt = homeFlagAt(home, disarms)
    if (flagAt < 0) refuse("$where reads no MobileConfig flag after \"$VIDEO_TAB_SURFACE\" whose no disarms")
    val code = home.implementation!!.instructions.toList()
    for (at in listOf(gateAt, flagAt)) {
        if ((code[at] as OneRegisterInstruction).registerA >= home.localRegisterCount()) {
            refuse("$where reads an answer into a parameter register")
        }
    }
    return Home(home, gateAt, flagAt)
}

/**
 * Both answers go through the extension before the branch reads them, the later one first so the
 * earlier index still holds. Each register is the move-result's own, a local, and the range form
 * names it wherever it is.
 */
internal fun BytecodePatchContext.applyHome(home: Home) {
    val method = mutableClassDefBy(home.method.definingClass).findMutableMethodOf(home.method)
    val code = method.implementation!!.instructions.toList()
    for ((at, hook) in listOf(home.flag to HOME_FLAG_ALLOWED, home.gate to HOME_GATE_ALLOWED).sortedByDescending { it.first }) {
        val register = (code[at] as OneRegisterInstruction).registerA
        method.addInstructions(
            at + 1,
            """
                invoke-static/range { v$register .. v$register }, $hook
                move-result v$register
            """,
        )
    }
}
