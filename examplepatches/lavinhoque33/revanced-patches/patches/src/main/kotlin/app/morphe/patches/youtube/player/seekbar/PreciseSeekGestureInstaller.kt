/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.patches.youtube.player.seekbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.patches.youtube.utils.extension.Constants.PLAYER_CLASS_DESCRIPTOR
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val DISABLE_PRECISE_SEEK_HOOK = "$PLAYER_CLASS_DESCRIPTOR->disablePreciseSeekingGesture()Z"

// Identifies the fine-scrubbing controller; the flag itself is shared with other paths and is not overridden.
private object PrecisionControllerFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(literal(45379021L)),
)

private object PrecisionTouchHandlerFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(resourceLiteral(ResourceType.DIMEN, "vertical_touch_offset_to_start_fine_scrubbing")),
)

private object PrecisionMoveFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(MOTION_EVENT, "J"),
    filters = listOf(opcode(Opcode.NEG_FLOAT)),
)

private object PrecisionGuideReasonFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("SPEEDMASTER_FAST_FORWARD", "SEEK_UNDO"),
    filters = listOf(
        string("FINE_SCRUBBING"),
        opcode(Opcode.CONST_4, location = MatchAfterImmediately()),
        opcode(Opcode.INVOKE_DIRECT, location = MatchAfterImmediately()),
        opcode(Opcode.SPUT_OBJECT, location = MatchAfterImmediately()),
    ),
)

private object PrecisionGuideFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z", "L"),
    filters = listOf(resourceLiteral(ResourceType.STRING, "fine_scrubbing_edu_text")),
)

private data class PrecisionEntry(val index: Int, val scratch: Int, val decline: BuilderInstruction)

private fun MutableMethod.findPrecisionEntry(controller: String, closedIndex: Int): PrecisionEntry? {
    val instructions = implementation?.instructions ?: return null
    val closedBranch = instructions.indices.singleOrNull { index ->
        val branch = instructions[index] as? BuilderInstruction21t
        branch?.opcode == Opcode.IF_EQZ && branch.target.location.index == closedIndex
    } ?: return null

    if (instructions.getOrNull(closedBranch - 2)?.getReference<MethodReference>()?.name != "ordinal" ||
        instructions.getOrNull(closedBranch - 1)?.opcode != Opcode.MOVE_RESULT
    ) return null

    // CLOSED checks the upward displacement and velocity before touching precision state.
    val threshold = instructions.getOrNull(closedIndex + 4) as? BuilderInstruction21t ?: return null
    if (threshold.opcode != Opcode.IF_LEZ) return null
    val declineIndex = threshold.target.location.index
    val decline = instructions[declineIndex]
    if (decline.opcode != Opcode.RETURN) return null

    val updateIndex = (closedIndex + 5 until declineIndex).singleOrNull { index ->
        val instruction = instructions[index]
        val target = instruction.getReference<MethodReference>()
        instruction.opcode == Opcode.INVOKE_VIRTUAL && target?.definingClass == controller &&
            target.parameterTypes == listOf("F") && target.returnType == "Z"
    } ?: return null

    // The legacy handler reloads the controller after the last check; modern handlers invoke it directly.
    val guardIndex = (updateIndex - 2 until updateIndex).singleOrNull { index ->
        val branch = instructions[index] as? BuilderInstruction21t
        branch?.opcode == Opcode.IF_EQZ && branch.target.location.index == declineIndex
    } ?: return null
    val declineRegister = (decline as OneRegisterInstruction).registerA
    val scratch = runCatching { findFreeRegister(guardIndex + 1, declineRegister) }.getOrNull() ?: return null

    return PrecisionEntry(guardIndex + 1, scratch, decline)
}

internal fun BytecodePatchContext.installPreciseSeekGestureSwitch(): Boolean {
    val controller = PrecisionControllerFingerprint.matchAllOrNull()?.singleOrNull()?.originalMethod?.definingClass
        ?: return false
    val touchHandler = PrecisionTouchHandlerFingerprint.matchAllOrNull()?.singleOrNull {
        it.originalMethod.parameterTypes.contains(controller)
    } ?: return false
    val movement = PrecisionMoveFingerprint.matchAllOrNull(touchHandler.originalClassDef)?.singleOrNull()
        ?: return false
    val entry = movement.method.findPrecisionEntry(controller, movement.instructionMatches.single().index)
        ?: return false

    val guideReason = PrecisionGuideReasonFingerprint.matchAllOrNull()?.singleOrNull()
        ?.instructionMatches?.lastOrNull()?.getInstruction<ReferenceInstruction>()?.getReference<FieldReference>()
        ?: return false
    val guide = PrecisionGuideFingerprint.matchAllOrNull()?.singleOrNull {
        it.originalMethod.parameterTypes.last() == guideReason.type &&
            !AccessFlags.STATIC.isSet(it.originalMethod.accessFlags)
    }?.method ?: return false
    val guideRegisterCount = guide.implementation?.registerCount ?: return false
    if (guideRegisterCount !in 4..16) return false

    movement.method.addInstructionsWithLabels(
        entry.index,
        """
            invoke-static {}, $DISABLE_PRECISE_SEEK_HOOK
            move-result v${entry.scratch}
            if-nez v${entry.scratch}, :not_consumed
        """,
        ExternalLabel("not_consumed", entry.decline),
    )

    // This dispatcher also handles speed and seek-undo hints. Suppress only showing the precision guide.
    guide.addInstructionsWithLabels(
        0,
        """
            if-eqz p1, :stock
            sget-object v0, $guideReason
            if-ne p2, v0, :stock
            invoke-static {}, $DISABLE_PRECISE_SEEK_HOOK
            move-result v0
            if-eqz v0, :stock
            return-void
        """,
        ExternalLabel("stock", guide.getInstruction(0)),
    )

    return true
}
