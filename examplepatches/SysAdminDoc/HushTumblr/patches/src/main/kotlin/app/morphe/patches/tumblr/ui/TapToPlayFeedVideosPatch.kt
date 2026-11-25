/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Tap to play feed videos"
internal const val HUSH_FEED_VIDEO = "$EXTENSION_PACKAGE/ui/HushFeedVideo;"
internal const val FEED_VIDEO_TAP_HOOK = "$EXTENSION_PACKAGE/ui/FeedVideoTap;->onTap(Ljava/lang/Object;)I"
internal const val FEED_VIDEO_PLAY = "hushPlayInPlace"
internal const val FEED_VIDEO_PAUSE = "hushPausePlayback"
internal const val TUMBLR_IDS = "Lcom/tumblr/R\$id;"
internal const val REPLAY_BUTTON = "replay_button"
private const val VIEW = "Landroid/view/View;"
private const val CONTEXT = "Landroid/content/Context;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val SCREEN_TYPE = "Lcom/tumblr/analytics/ScreenType;"
private val OVERLAY_IDS = setOf("play_button", REPLAY_BUTTON, "sound_button", "sponsored_text")

/**
 * What the patch adds to the video overlay [overlay]: [tap] asks the extension first, with [self]
 * holding the overlay and [spare] the view Tumblr never reads, and skips to [done] when the tap
 * started the video. [opener] is the tap callback that opens the full-screen player.
 */
internal class FeedVideoTapPlan(
    val overlay: String,
    val tap: MutableMethod,
    val self: Int,
    val spare: Int,
    val done: Int,
    val opener: String,
    val bridges: List<MutableMethod>,
)

/**
 * Tumblr's video overlay (`c1m` in 47.3.0.110) sends a tap anywhere on a feed video to its callback,
 * and the feed's callback (`pom$b`) opens the full-screen player, even over a stopped video showing
 * a play button. The overlay's own play and replay handlers are only wired to that button for ads.
 * The tap now asks the extension first, and the overlay answers it with those same handlers.
 * The composer's preview and ad videos have callbacks of their own, and those keep every tap.
 */
@Suppress("unused")
val tapToPlayFeedVideosPatch = bytecodePatch(
    name = PATCH,
    description = "Tapping a stopped video in your feed plays it right there, and a tap while it plays opens it " +
        "full screen. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("tapToPlayFeedVideos")
        requireStatusMethod("feedVideoTap")
        val plan = resolveFeedVideoTap()
        val overlay = mutableClassDefBy(plan.overlay)
        overlay.interfaces.add(HUSH_FEED_VIDEO)
        overlay.methods.addAll(plan.bridges)
        plan.tap.addInstructionsWithLabels(
            0,
            """
                invoke-static { v${plan.self} }, $FEED_VIDEO_TAP_HOOK
                move-result v${plan.spare}
                if-nez v${plan.spare}, :hush_tap_handled
            """,
            ExternalLabel("hush_tap_handled", plan.tap.getInstruction(plan.done)),
        )
        enableCapability("feedVideoTap")
        enableStatus("tapToPlayFeedVideos")
    }
}

private fun Method.isPrivateInstance() =
    AccessFlags.PRIVATE.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags)

private fun Method.shape(): String = parameterTypes.joinToString("", "(", ")") + returnType

private fun Instruction.typeRef(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun Method.readsOverlayIds(): Boolean {
    val read = instructionList().mapNotNull { step -> step.fieldRef()?.takeIf { it.definingClass == TUMBLR_IDS }?.name }
    return read.containsAll(OVERLAY_IDS)
}

/** The field a tap handler reads its callback from, or null when [method] isn't one. */
internal fun tapCallbackField(method: Method, overlay: String): FieldReference? {
    val steps = method.instructionList()
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.shape() != "($overlay$VIEW)V") return null
    if (steps.map { it.opcode } != listOf(Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID)) return null
    val self = method.parameterRegisterNumber(0)
    val spare = method.parameterRegisterNumber(1)
    val read = steps[0] as TwoRegisterInstruction
    val field = steps[0].fieldRef() ?: return null
    val call = steps[2].methodRef() ?: return null
    val passed = steps[2] as FiveRegisterInstruction
    val shaped = read.registerB == self && read.registerA != spare && field.definingClass == overlay &&
        (steps[1] as OneRegisterInstruction).registerA == read.registerA &&
        call.definingClass == field.type && call.parameterTypes.isEmpty() && call.returnType == "V" &&
        passed.registerCount == 1 && passed.registerC == read.registerA
    return field.takeIf { shaped }
}

/** The player call a play or replay handler starts with, or null when [method] isn't one. */
private fun playerGetter(method: Method): MethodReference? {
    val steps = method.instructionList()
    if (!method.isPrivateInstance() || method.shape() != "()V" || steps.size < 3) return null
    val getter = steps[0].methodRef() ?: return null
    if (steps[0].opcode != Opcode.INVOKE_VIRTUAL || steps[1].opcode != Opcode.MOVE_RESULT_OBJECT) return null
    if (getter.parameterTypes.isNotEmpty() || !getter.returnType.startsWith("L")) return null
    val passed = steps[0] as FiveRegisterInstruction
    return getter.takeIf { passed.registerCount == 1 && passed.registerC == method.implementation!!.registerCount - 1 }
}

private fun Method.callsOn(type: String, name: String, shape: String) = instructionList().any { step ->
    step.methodRef()?.let { it.definingClass == type && it.name == name &&
        it.parameterTypes.joinToString("", "(", ")") + it.returnType == shape } == true
}

/** The boolean a constructor stores straight from its last parameter, Tumblr's "this is an ad". */
private fun sponsoredField(overlay: ClassDef): FieldReference {
    val constructor = overlay.methods.filter {
        it.name == "<init>" && it.parameterTypes.lastOrNull()?.toString() == "Z"
    }.only(PATCH, "the video overlay's full constructor")
    val flag = constructor.parameterRegisterNumber(constructor.parameterTypes.lastIndex)
    val self = constructor.parameterRegisterNumber(0) - 1
    return constructor.instructionList().filter { step ->
        step.opcode == Opcode.IPUT_BOOLEAN && (step as TwoRegisterInstruction).let { it.registerA == flag && it.registerB == self }
    }.only(PATCH, "the video overlay's ad flag").fieldRef()!!
}

/** The boolean the overlay's state handler sets when a video reaches its FINISHED state. */
private fun finishedField(overlay: ClassDef): FieldReference {
    val handler = overlay.methods.filter { method ->
        val first = method.instructionList().firstOrNull()
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes.size == 1 &&
            first?.opcode == Opcode.SGET_OBJECT && first.fieldRef()?.let {
                it.name == "FINISHED" && it.type == method.parameterTypes[0].toString()
            } == true
    }.only(PATCH, "the video overlay's state handler")
    val steps = handler.instructionList()
    val state = handler.parameterRegisterNumber(0)
    val finished = (steps[0] as OneRegisterInstruction).registerA
    val test = steps.indexOfFirst { it.opcode == Opcode.IF_NE }
    requireShape(PATCH, test > 0 && test + 1 < steps.size && (steps[test] as TwoRegisterInstruction).let {
        it.registerA == state && it.registerB == finished
    } && steps[test + 1].opcode == Opcode.IPUT_BOOLEAN, "the video overlay no longer records a finished video first")
    val stored = steps[test + 1] as TwoRegisterInstruction
    requireShape(PATCH, stored.registerB == state - 1 && steps.subList(1, test).any { step ->
        step.opcode == Opcode.CONST_4 && (step as OneRegisterInstruction).registerA == stored.registerA &&
            (step as NarrowLiteralInstruction).narrowLiteral == 1
    }, "the video overlay no longer marks a finished video as finished")
    return steps[test + 1].fieldRef()!!
}

private fun opensFullScreen(callback: Method): Boolean {
    val steps = callback.instructionList()
    return steps.any { it.opcode == Opcode.INSTANCE_OF && it.typeRef() == ACTIVITY } && steps.any { step ->
        step.opcode == Opcode.INVOKE_STATIC && step.methodRef()?.let { call ->
            call.returnType == "Z" && call.parameterTypes.map(CharSequence::toString).drop(1) == listOf(SCREEN_TYPE, CONTEXT, "Z")
        } == true
    }
}

private fun bridge(owner: String, name: String, returnType: String, smali: String): MutableMethod =
    ImmutableMethod(owner, name, emptyList(), returnType, AccessFlags.PUBLIC.value, null, null,
        MutableMethodImplementation(2)).toMutable().apply { addInstructions(0, smali) }

/** All shape checks and bridge assembly happen before anything in Tumblr changes. */
internal fun BytecodePatchContext.resolveFeedVideoTap(): FeedVideoTapPlan {
    requireExtensionHook(PATCH, FEED_VIDEO_TAP_HOOK)
    val face = classDefByOrNull(HUSH_FEED_VIDEO)
    requireShape(PATCH, face != null && AccessFlags.INTERFACE.isSet(face.accessFlags) &&
        face.methods.map { it.name + it.shape() }.toSet() == setOf("$FEED_VIDEO_PLAY()I", "$FEED_VIDEO_PAUSE()V"),
        "the extension's feed video interface is missing or changed")

    val overlays = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (!owner.type.startsWith(EXTENSION_ROOT) && owner.methods.any { it.readsOverlayIds() }) overlays += owner
    }
    val overlay = overlays.only(PATCH, "the video overlay")
    val type = overlay.type
    requireShape(PATCH, HUSH_FEED_VIDEO !in overlay.interfaces &&
        overlay.methods.none { it.name == FEED_VIDEO_PLAY || it.name == FEED_VIDEO_PAUSE },
        "the video overlay is already bridged")

    val original = overlay.methods.filter { tapCallbackField(it, type) != null }.only(PATCH, "the video overlay's tap handler")
    val callbackField = tapCallbackField(original, type)!!
    val callback = original.instructionList()[2].methodRef()!!

    val starting = overlay.methods.filter { method ->
        playerGetter(method)?.let { method.callsOn(it.returnType, "start", "()V") } == true
    }
    val getters = starting.map { playerGetter(it)!! }
    val player = getters.firstOrNull()?.returnType
    requireShape(PATCH, player != null && getters.all { it.toString() == getters[0].toString() },
        "the video overlay's handlers don't share one player")
    player!!
    val play = starting.filter { !it.callsOn(player, "seekTo", "(I)V") }.only(PATCH, "the video overlay's play handler")
    val replay = starting.filter { it.callsOn(player, "seekTo", "(I)V") }.only(PATCH, "the video overlay's replay handler")
    val playerClass = classDefByOrNull(player)
    requireShape(PATCH, playerClass != null && listOf("isPlaying()Z", "pause()V").all { wanted ->
        playerClass.methods.any { it.name + it.shape() == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags) }
    }, "the video player no longer answers isPlaying and pause")

    val openers = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (callback.definingClass in owner.interfaces &&
            owner.methods.any { it.name == callback.name && it.shape() == "()V" && opensFullScreen(it) }
        ) openers += owner
    }
    val opener = openers.only(PATCH, "the tap callback that opens the full-screen player").type

    val getter = getters[0]
    val sponsored = sponsoredField(overlay)
    val finished = finishedField(overlay)
    val playInPlace = bridge(type, FEED_VIDEO_PLAY, "I", """
        iget-boolean v0, p0, $sponsored
        if-nez v0, :stock
        iget-object v0, p0, $callbackField
        instance-of v0, v0, $opener
        if-eqz v0, :stock
        invoke-virtual { p0 }, $getter
        move-result-object v0
        if-eqz v0, :stock
        invoke-virtual { v0 }, $player->isPlaying()Z
        move-result v0
        if-nez v0, :stock
        iget-boolean v0, p0, $finished
        if-nez v0, :replay
        invoke-direct { p0 }, $type->${play.name}()V
        goto :used
        :replay
        invoke-direct { p0 }, $type->${replay.name}()V
        :used
        const/4 v0, 0x1
        return v0
        :stock
        const/4 v0, 0x0
        return v0
    """)
    val pausePlayback = bridge(type, FEED_VIDEO_PAUSE, "V", """
        invoke-virtual { p0 }, $getter
        move-result-object v0
        if-eqz v0, :none
        invoke-virtual { v0 }, $player->pause()V
        :none
        return-void
    """)

    val tap = mutableOf(original)
    requireShape(PATCH, (tap.implementation!!.instructions[1] as BuilderOffsetInstruction).target.location.index == 3,
        "the video overlay's tap handler jumps somewhere new")
    return FeedVideoTapPlan(type, tap, tap.parameterRegisterNumber(0), tap.parameterRegisterNumber(1), 3, opener,
        listOf(playInPlace, pausePlayback))
}
