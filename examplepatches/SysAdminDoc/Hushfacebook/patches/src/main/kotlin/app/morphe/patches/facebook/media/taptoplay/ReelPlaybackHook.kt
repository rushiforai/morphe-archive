/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.taptoplay

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.ads.sponsoredsearch.enumConstantFields
import app.morphe.patches.facebook.ads.sponsoredsearch.invokeRegisters
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val REELS_PLAYBACK_STARTED = "reels_autoplay_started"
internal const val CLEAR_REEL_PLAY_BUTTON = "$TAP_TO_PLAY->clearReelPlayButton(ZLjava/lang/Object;)Z"
internal val REEL_CONTROL_NAMES = listOf("AUTOPLAY_OFF_INIT_STATE", "PLAYING", "PAUSED", "PLAYBACK_COMPLETE")
internal val PLAYBACK_STATE_NAMES = listOf("UNINITIALIZED", "PREPARED", "ATTEMPT_TO_PLAY", "PLAYING", "PAUSED", "SEEKING")

/**
 * The playback event listener's PLAYING branch clears controls only behind viewer flags. Extend
 * that decision, rather than forcing a control state or hiding the whole component. The existing
 * reset still updates Litho, cancels the hide timer and delivers Facebook's own visibility events.
 * Both 577 and 580 use this flow; pause, seek, errors and completion branch past the injection.
 */
internal fun BytecodePatchContext.hookReelPlayback() {
    fun refuse(detail: String): Nothing = throw PatchException("$PATCH: Reels playback controls: $detail")
    val handler = classDefByStrings(REELS_PLAYBACK_STARTED, StringComparisonType.EQUALS)
        .flatMap { it.methods }.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.parameterTypes.size == 1 && holdsString(it, REELS_PLAYBACK_STARTED)
        }.singleOrNull() ?: refuse("expected one playback event listener")
    val code = handler.implementation!!.instructions.toList()
    val fields = code.map { ((it as? ReferenceInstruction)?.reference as? FieldReference) }
    val stateReads = code.indices.filter { index ->
        code[index].opcode == Opcode.IGET_OBJECT && fields[index]?.type?.let { type ->
            classDefByOrNull(type)?.let { isEnumNaming(it, PLAYBACK_STATE_NAMES) }
        } == true
    }
    val read = stateReads.singleOrNull() ?: refuse("expected one player state read")
    val state = classDefBy(fields[read]!!.type)
    val playing = enumConstantFields(state).entries.singleOrNull { it.value == "PLAYING" }?.key
        ?: refuse("the player state has no unique PLAYING constant")
    val branch = read + 2
    if (fields.getOrNull(read + 1)?.let { it.definingClass == state.type && it.name == playing } != true ||
        code.getOrNull(read + 1)?.opcode != Opcode.SGET_OBJECT || code.getOrNull(branch)?.opcode != Opcode.IF_NE) {
        refuse("the state read does not branch on PLAYING")
    }
    val compare = code[branch] as TwoRegisterInstruction
    if (compare.registerA != (code[read] as OneRegisterInstruction).registerA ||
        compare.registerB != (code[read + 1] as OneRegisterInstruction).registerA) refuse("unexpected state comparison")
    val flow = ControlFlow.of(handler)
    val end = flow.normal[branch].first()
    val reset = (branch + 1 until end).firstOrNull { index ->
        val call = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
        call != null && code[index].opcode == Opcode.INVOKE_VIRTUAL && call.returnType == "V" &&
            call.parameterTypes.size == 2 && call.parameterTypes[1].toString() == "Z"
    } ?: refuse("the PLAYING branch has no control reset")
    val controller = fields.getOrNull(reset - 1) ?: refuse("the reset has no controller field")
    val call = (code[reset] as ReferenceInstruction).reference as MethodReference
    val load = code[reset - 1] as? TwoRegisterInstruction ?: refuse("unexpected controller load")
    if (code[reset - 1].opcode != Opcode.IGET_OBJECT || controller.definingClass != handler.definingClass ||
        controller.type != call.definingClass || invokeRegisters(code[reset]).first() != load.registerA ||
        code[reset - 3].opcode != Opcode.IF_NEZ || code[reset - 2].opcode != Opcode.IF_EQZ ||
        flow.normal[reset - 3].first() != reset - 1 || flow.normal[reset - 2].first() != reset + 1) {
        refuse("the reset is not guarded by the two viewer conditions")
    }
    val controls = classDefBy(controller.type)
    val control = controls.fields.singleOrNull { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && classDefByOrNull(field.type)?.let {
            isEnumNaming(it, REEL_CONTROL_NAMES)
        } == true
    } ?: refuse("expected one control state field")
    val clear = methodNamed(controls, call.toString()) ?: refuse("missing native reset")
    val clearCode = clear.implementation!!.instructions.toList()
    val writes = clearCode.filter { it.opcode == Opcode.IPUT_OBJECT &&
        (it as ReferenceInstruction).reference.toString() == control.toString() }
    val zero = clearCode.getOrNull(1)
    if (zero?.opcode != Opcode.CONST_4 || (zero as WideLiteralInstruction).wideLiteral != 0L ||
        writes.isEmpty() || writes.any { (it as OneRegisterInstruction).registerA != (zero as OneRegisterInstruction).registerA } ||
        clearCode.any { it.opcode == Opcode.SGET_OBJECT &&
            ((it as ReferenceInstruction).reference as? FieldReference)?.type == control.type }) {
        refuse("the native reset does not clear the control state")
    }
    val mutable = mutableClassDefBy(handler.definingClass).findMutableMethodOf(handler)
    val index = reset - 2
    val answer = (code[index] as OneRegisterInstruction).registerA
    val scratch = mutable.freeLocalsAt(PATCH, index, 1).single()
    if (answer > 15 || load.registerB > 15) refuse("viewer decision registers do not fit")
    mutable.addInstructionsAtControlFlowLabel(index, """
        iget-object v$scratch, v${load.registerB}, $controller
        iget-object v$scratch, v$scratch, $control
        invoke-static { v$answer, v$scratch }, $CLEAR_REEL_PLAY_BUTTON
        move-result v$answer
    """)
}
