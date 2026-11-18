/*
 * YTAfterglow for Android.
 *
 * Adapted from the custom and remember playback speed patches of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which were forked from ReVanced
 * patches (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for
 * YTAfterglow: rewritten for patcher 2.1.0, the tap and hold speed and speed ceiling only,
 * the default speed applied through VideoState. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.video.debugMatch
import app.afterglow.patches.video.installAtStartup
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PLAYBACK_SPEED_CLASS = "$EXTENSION_PLAYBACK/PlaybackSpeed;"
private const val UPSTREAM_SPEED_CLASS =
    "Lapp/morphe/extension/youtube/patches/playback/speed/CustomPlaybackSpeedPatch;"

/**
 * Starts playing faster while the player is held: after the long press runnable fires it
 * checks the gesture is still allowed, then plays at 2.0x.
 *
 * 21.43.523: `Lmui;->run()V`.
 */
internal object TapAndHoldSpeedFingerprint : Fingerprint(
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Landroid/os/Handler;"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, smali = "Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = listOf(), returnType = "Z"),
        opcode(Opcode.IF_EQZ),
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
        opcode(Opcode.IF_NEZ),
        opcode(Opcode.IGET_OBJECT),
        literal(2.0f),
    ),
)

/**
 * Applies a playback rate to the player and logs it: the rate is clamped between the
 * server's limits (flag on) or 0.25x and 4x.
 *
 * 21.43.523: `Laowv;->l(Lapad;)V`, clamp `Lafyg;->X(FFF)F` at 0x015e with the maximum in v5.
 */
internal object SpeedLimiterParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("Playback rate: %f"),
        // Original Morphe custom speeds replaces the stock limits with 0x and 8x.
        anyInstruction(literal(0.25f), literal(0.0f)),
        anyInstruction(literal(4.0f), literal(8.0f)),
    ),
)

/**
 * Sets the playback rate of the player, clamped the same way.
 *
 * 21.43.523: `Laowv;->y(FLalew;)V`, clamp `Lafyg;->X(FFF)F` at 0x0047 with the maximum in v2.
 */
internal object SpeedLimiterFingerprint : Fingerprint(
    classFingerprint = SpeedLimiterParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        anyInstruction(literal(0.25f), literal(0.0f)),
        anyInstruction(literal(4.0f), literal(8.0f)),
        methodCall(opcode = Opcode.INVOKE_INTERFACE, parameters = listOf("F"), returnType = "V"),
    ),
    custom = { method, _ -> method.parameterTypes.firstOrNull() == "F" },
)

/** The stock 4x limit or the original Morphe patch's 8x replacement. */
private fun MutableMethod.maximumSpeedIndex(): Int =
    implementation!!.instructions.indexOfFirst { instruction ->
        val value = (instruction as? WideLiteralInstruction)?.wideLiteral
        value == 4.0f.toRawBits().toLong() || value == 8.0f.toRawBits().toLong()
    }.takeIf { it >= 0 } ?: throw PatchException("No stock or upstream speed limit in $this")

/**
 * Compose after the original Morphe provider when it already owns this constant. If it is
 * applied later, its own constant+1 insertion naturally runs before our transform too.
 */
internal fun MutableMethod.holdSpeedInsertIndex(speedIndex: Int): Int {
    val instructions = implementation!!.instructions
    val nextIndex = speedIndex + 1
    val next = instructions[nextIndex]
    val call = (next as? ReferenceInstruction)?.reference as? MethodReference
    if (call?.definingClass != UPSTREAM_SPEED_CLASS || call.name != "getTapAndHoldSpeed") {
        return nextIndex
    }
    require(next.opcode == Opcode.INVOKE_STATIC && call.parameterTypes.isEmpty() && call.returnType == "F") {
        "Unexpected upstream tap-and-hold provider in $this"
    }
    val result = instructions[nextIndex + 1]
    require(result.opcode == Opcode.MOVE_RESULT
        && (result as OneRegisterInstruction).registerA ==
            (instructions[speedIndex] as OneRegisterInstruction).registerA) {
        "Upstream tap-and-hold provider has no matching adjacent result in $this"
    }
    return nextIndex + 2
}

/**
 * Raises the maximum of the speed clamp after its limit literal: the first static `(FFF)F` call
 * after it is the clamp (rate, minimum, maximum). Inserted at the call's label, so every path
 * to the clamp passes through.
 */
internal fun MutableMethod.raiseSpeedClampMaximum() {
    val instructions = implementation!!.instructions
    val clampIndex = (maximumSpeedIndex() until instructions.size).firstOrNull { index ->
        val instruction = instructions[index]
        val method = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_STATIC && method?.returnType == "F" &&
            method.parameterTypes.map { it.toString() } == listOf("F", "F", "F")
    } ?: throw PatchException("No speed clamp in $this")
    val maximumRegister = getInstruction<FiveRegisterInstruction>(clampIndex).registerE
    addInstructionsAtControlFlowLabel(
        clampIndex,
        """
            ${invokeStaticOne(maximumRegister, "$PLAYBACK_SPEED_CLASS->raiseSpeedCeiling(F)F")}
            move-result v$maximumRegister
        """,
    )
}

/**
 * Playback speed hooks for the iOS settings of the "playback-speed" tweak:
 *
 * - `speedIndex` (Hold to speed): the 2.0x of YouTube's tap and hold gesture comes from the
 *   extension, which keeps 2.0x for "Default" and turns the gesture off for "Disabled".
 * - `autoSpeedIndex` (Default playback rate): the extension sets the rate once per video on
 *   the watch page through VideoState, as iOS does.
 * - Both go up to 5x. YouTube clamps every rate to the server's limit (2x for ordinary videos)
 *   or its own 4x, so a limit of 2x or more is raised to 5x, as iOS does; lower limits stay.
 */
internal val playbackSpeedHookPatch = bytecodePatch(
    description = "Sets YouTube's hold-to-speed rate and default playback rate from Afterglow.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, videoStatePatch)

    execute {
        val tapAndHold = TapAndHoldSpeedFingerprint.method
        val tapAndHoldSpeedIndex = TapAndHoldSpeedFingerprint.instructionMatches.last().index
        val tapAndHoldEnabledIndex = TapAndHoldSpeedFingerprint.instructionMatches[3].index
        val limiters = listOf(SpeedLimiterParentFingerprint.method, SpeedLimiterFingerprint.method)
        debugMatch("tapAndHold", tapAndHold)
        limiters.forEach { debugMatch("speedLimiter", it) }

        tapAndHold.apply {
            // Highest index first: the speed, then the "still allowed" check before its branch.
            val speedRegister = getInstruction<OneRegisterInstruction>(tapAndHoldSpeedIndex).registerA
            addInstructions(
                holdSpeedInsertIndex(tapAndHoldSpeedIndex),
                """
                    ${invokeStaticOne(speedRegister, "$PLAYBACK_SPEED_CLASS->getHoldSpeed(F)F")}
                    move-result v$speedRegister
                """,
            )
            val enabledRegister = getInstruction<OneRegisterInstruction>(tapAndHoldEnabledIndex).registerA
            addInstructions(
                tapAndHoldEnabledIndex,
                """
                    ${invokeStaticOne(enabledRegister, "$PLAYBACK_SPEED_CLASS->isHoldSpeedEnabled(Z)Z")}
                    move-result v$enabledRegister
                """,
            )
        }

        limiters.forEach { it.raiseSpeedClampMaximum() }

        installAtStartup(PLAYBACK_SPEED_CLASS)
    }
}
