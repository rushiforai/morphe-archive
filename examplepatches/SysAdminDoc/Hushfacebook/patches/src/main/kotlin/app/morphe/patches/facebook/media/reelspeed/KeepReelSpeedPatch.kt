/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.reelspeed

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.resume.TRACK_START
import app.morphe.patches.facebook.media.resume.VIDEO_PLAYER_PARAMS
import app.morphe.patches.facebook.media.resume.paramsGetters
import app.morphe.patches.facebook.media.resume.reportedValues
import app.morphe.patches.facebook.media.resume.trackers
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val PATCH = "Keep the reel speed"

/**
 * The speed picked in a reel's menu stays for the next reels. See ReelSpeedAnchors.kt for where
 * Facebook sets, announces and forgets a reel's speed, and the extension's ReelSpeed for the rule.
 *
 * FbGrootPlayer's speed setter and its maybeTrackVideoStart tell the extension about themselves
 * first thing, and so does the Reels menu's speed toast, which follows a pick. The
 * extension's stubs are filled with the player's speed setter, its PlayerOrigin getter, its
 * VideoPlayerParams getter and the params' isFbShorts, isSponsored and isLiveNow.
 */
@Suppress("unused")
val keepReelSpeedPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Keep the reel speed",
    description = "A playback speed you pick in a reel's menu stays for the next reels until you pick another or " +
        "Facebook restarts.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val anchors = findReelSpeedAnchors()
        applyReelSpeedAnchors(anchors)
        enableStatus("keepReelSpeed")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** What [findReelSpeedAnchors] found, for [applyReelSpeedAnchors] to change. [flags] maps each flag stub to its field. */
internal class ReelSpeedAnchors(
    val owner: ClassDef,
    val setter: Method,
    val origin: Method,
    val start: Method,
    val toast: Method,
    val params: Method,
    val flags: Map<String, FieldReference>,
)

/**
 * FbGrootPlayer's setter, origin getter, start and params getter, the params' fields the rule
 * reads, and the Reels menu's speed toast. Changes nothing.
 */
internal fun BytecodePatchContext.findReelSpeedAnchors(): ReelSpeedAnchors {
    val plays = classDefByStrings(GROOT_PLAY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap(::grootPlays)
    val play = plays.singleOrNull() ?: refuse("expected one player play holding \"$GROOT_PLAY\", found ${plays.size}")
    val owner = classDefBy(play.definingClass)
    val trigger = play.parameterTypes.single().toString()

    fun single(what: String, found: List<Method>): Method = found.singleOrNull()
        ?: refuse("expected one $what in ${owner.type}, found ${found.size}")

    val setter = single("speed setter reading HeroPlayerSetting's speed cache switch", speedSetters(owner))
    val origin = single("PlayerOrigin getter", originGetters(owner))
    val start = single("$TRACK_START($trigger)", trackers(owner, TRACK_START, trigger))
    val params = single("getter of its $VIDEO_PLAYER_PARAMS", paramsGetters(owner))

    val toasts = classDefByStrings(SPEED_TOAST, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { holder -> holder.methods.filter(::isSpeedToast) }
    val toast = toasts.singleOrNull()
        ?: refuse("expected one static (Context, float) speed toast holding \"$SPEED_TOAST\", found ${toasts.size}")

    val paramsClass = classDefByOrNull(VIDEO_PLAYER_PARAMS) ?: refuse("this build has no $VIDEO_PLAYER_PARAMS")
    val dumps = paramsClass.methods.filter { method -> REEL_PARAM_STUBS.keys.all { holdsString(method, it) } }
    val dump = dumps.singleOrNull()
        ?: refuse("expected one method of $VIDEO_PLAYER_PARAMS reporting ${REEL_PARAM_STUBS.keys.joinToString()}, found ${dumps.size}")
    val reported = reportedValues(dump)
    val flags = REEL_PARAM_STUBS.entries.associate { (name, stub) ->
        val field = reported[name] ?: refuse("$VIDEO_PLAYER_PARAMS->${dump.name} doesn't report $name")
        val declared = paramsClass.fields.singleOrNull {
            it.name == field.name && it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: refuse("$name is ${field.name}:${field.type}, not a boolean field of $VIDEO_PLAYER_PARAMS")
        if (!AccessFlags.PUBLIC.isSet(declared.accessFlags)) refuse("$name, ${field.name}, isn't public, so the extension can't read it")
        stub to field
    }

    // The extension's stubs call these from outside Facebook's package.
    listOf(owner, paramsClass).forEach { reachable ->
        if (!AccessFlags.PUBLIC.isSet(reachable.accessFlags)) refuse("${reachable.type} isn't public, so the extension can't reach it")
    }
    listOf(setter, origin, params).forEach { method ->
        if (!AccessFlags.PUBLIC.isSet(method.accessFlags)) {
            refuse("${owner.type}->${method.name} isn't public, so the extension can't call it")
        }
    }
    return ReelSpeedAnchors(owner, setter, origin, start, toast, params, flags)
}

/**
 * Each hook goes first in its method and hands the extension the method's own arguments through
 * the range form, which names any register and borrows none: the player and the speed for the
 * setter, the player for the start, and the speed, the toast's second argument.
 */
internal fun BytecodePatchContext.applyReelSpeedAnchors(anchors: ReelSpeedAnchors) {
    val owner = mutableClassDefBy(anchors.owner.type)
    owner.findMutableMethodOf(anchors.setter).addInstruction(0, "invoke-static/range { p0 .. p1 }, $SPEED_SET")
    owner.findMutableMethodOf(anchors.start).addInstruction(0, "invoke-static/range { p0 .. p0 }, $STARTED")
    mutableClassDefBy(anchors.toast.definingClass).findMutableMethodOf(anchors.toast)
        .addInstruction(0, "invoke-static/range { p1 .. p1 }, $PICKED")
    fillStubs(anchors)
}

/** Fills the extension's stubs. Each reads only its parameter registers, cast to the player's or the params' own type. */
private fun BytecodePatchContext.fillStubs(anchors: ReelSpeedAnchors) {
    val extension = mutableClassDefBy(REEL_SPEED)
    fun stub(name: String, parameters: List<String>, answer: String): MutableMethod = extension.methods.singleOrNull {
        it.name == name && it.returnType == answer && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map(CharSequence::toString) == parameters
    } ?: refuse("$REEL_SPEED has no static $answer $name(${parameters.joinToString("")})")

    val owner = anchors.owner.type
    val objectType = "Ljava/lang/Object;"
    stub(SET_SPEED_STUB, listOf(objectType, "F"), "V").addInstructions(
        0,
        """
            check-cast p0, $owner
            invoke-virtual/range { p0 .. p1 }, $owner->${anchors.setter.name}(F)V
            return-void
        """,
    )
    stub(ORIGIN_STUB, listOf(objectType), objectType).addInstructions(
        0,
        """
            check-cast p0, $owner
            invoke-virtual/range { p0 .. p0 }, $owner->${anchors.origin.name}()$PLAYER_ORIGIN
            move-result-object p0
            return-object p0
        """,
    )
    stub(REEL_PARAMS_STUB, listOf(objectType), objectType).addInstructions(
        0,
        """
            check-cast p0, $owner
            invoke-virtual/range { p0 .. p0 }, $owner->${anchors.params.name}()$VIDEO_PLAYER_PARAMS
            move-result-object p0
            return-object p0
        """,
    )
    anchors.flags.forEach { (name, field) ->
        stub(name, listOf(objectType), "Z").addInstructions(
            0,
            """
                check-cast p0, $VIDEO_PLAYER_PARAMS
                iget-boolean p0, p0, $VIDEO_PLAYER_PARAMS->${field.name}:Z
                return p0
            """,
        )
    }
}
