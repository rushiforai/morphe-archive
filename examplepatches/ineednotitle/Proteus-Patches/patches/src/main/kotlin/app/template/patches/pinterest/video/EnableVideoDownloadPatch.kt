// Adapted from archivesteak/Quest Pinterest patches (GPL-3.0).
package app.template.patches.pinterest.video

import app.template.patches.shared.Constants.PINTEREST_COMPATIBILITY
import app.morphe.patcher.Fingerprint
import app.template.patches.pinterest.enableMediaDownloadPatch
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.ReferenceType
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val enableVideoDownloadPatch = bytecodePatch(
    name = "Enable video download",
    description = "Experimental: enables the download row on video Pins and saves an available MP4. " +
        "Streaming-only or unavailable videos are reported instead of saved as images.",
    default = false
) {
    compatibleWith(PINTEREST_COMPATIBILITY)

    // The menu row also requires the Pin to be eligible for image download.
    dependsOn(enableMediaDownloadPatch, menuDownloadHookPatch)

    execute {
        // region Show the download row for video Pins.

        // The menu builders skip the download row when GridActionsViewParams.isVideo is set,
        // and for Idea Pins, which most video Pins are, unless OverflowMenuCreationConfig.isStaticImageIdeaPin is set.
        val isVideoField = GridActionsViewParamsToStringFingerprint.originalMethod
            .fieldPrintedAfter(IS_VIDEO_LABEL)
        val isStaticImageIdeaPinField = OverflowMenuCreationConfigToStringFingerprint.originalMethod
            .fieldPrintedAfter(IS_STATIC_IMAGE_IDEA_PIN_LABEL)
        val menuItemType = OverflowMenuItemEnumFingerprint.originalClassDef.type

        val menuBuilders = Fingerprint(
            filters = listOf(
                fieldAccess(reference = isVideoField, opcode = Opcode.IGET_BOOLEAN),
                fieldAccess(definingClass = menuItemType, name = "DOWNLOAD", opcode = Opcode.SGET_OBJECT),
            )
        ).matchAll()

        // Both are only used for the download row in these methods, so they can be read as constants.
        menuBuilders.forEach { match ->
            match.method.replaceBooleanReads(isVideoField, false)
            match.method.replaceBooleanReads(isStaticImageIdeaPinField, true)
        }

        // The extension is only injected when this video patch is selected.
    }
}

/**
 * The boolean field a data class `toString()` prints after [label].
 *
 * R8 moves the appends into helpers such as `append(sb, previousValue, label, value, nextLabel)`
 * and loads values out of order, so the field is found by following the label's register
 * to the call that prints it, then the value register back to the field read.
 */
private fun MutableMethod.replaceBooleanReads(field: FieldReference, value: Boolean) {
    implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_BOOLEAN &&
            ((instruction as ReferenceInstruction).reference as FieldReference).let {
                it.definingClass == field.definingClass && it.name == field.name
            }
    }.map { it.index }.reversed().forEach { index ->
        val register = getInstruction<TwoRegisterInstruction>(index).registerA
        replaceInstruction(index, "const/4 v$register, ${if (value) "0x1" else "0x0"}")
    }
}

private fun Method.fieldPrintedAfter(label: String): FieldReference {
    val instructions = implementation!!.instructions.toList()

    val labelIndex = instructions.indexOfFirst {
        it.opcode == Opcode.CONST_STRING &&
            ((it as ReferenceInstruction).reference as StringReference).string == label
    }
    val labelRegister = (instructions[labelIndex] as OneRegisterInstruction).registerA

    val calls = instructions.withIndex().drop(labelIndex + 1)
        .filter { (_, instruction) -> instruction.opcode.referenceType == ReferenceType.METHOD }
    val labelCall = calls.first { (_, instruction) -> labelRegister in instruction.argumentRegisters }

    val labelCallArguments = labelCall.value.argumentRegisters
    val valueArgumentIndex = labelCallArguments.indexOf(labelRegister) + 1
    // A plain StringBuilder.append(label) prints the value in the next call.
    val valueCall = if (valueArgumentIndex < labelCallArguments.size) labelCall
    else calls.first { (index, _) -> index > labelCall.index }
    val valueRegister = if (valueCall === labelCall) labelCallArguments[valueArgumentIndex]
    else valueCall.value.argumentRegisters.last()

    val valueRead = instructions.subList(0, valueCall.index).last {
        it.opcode == Opcode.IGET_BOOLEAN && (it as TwoRegisterInstruction).registerA == valueRegister
    }
    return (valueRead as ReferenceInstruction).reference as FieldReference
}

private val Instruction.argumentRegisters: List<Int>
    get() = when (this) {
        is RegisterRangeInstruction -> List(registerCount) { startRegister + it }
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG)
            .take(registerCount)
        else -> emptyList()
    }
