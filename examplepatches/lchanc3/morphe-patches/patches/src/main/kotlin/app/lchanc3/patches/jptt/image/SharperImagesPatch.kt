package app.lchanc3.patches.jptt.image

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_IMAGE_QUALITY_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val sharperImagesPatch = bytecodePatch(
    name = "Sharper images",
    description = "Shows pictures at the resolution they are drawn at. The full size " +
        "viewer no longer halves anything taller or wider than 2048 pixels, and previews " +
        "are no longer decoded smaller than their frame. Uses more memory for large pictures.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        // new-instance followed by its constructor, both replaced by one call
        // that returns the object into the register the constructor filled.
        ShowPictureFingerprint.let {
            val method = it.method
            val constructorIndex = it.instructionMatches.last().index
            val constructor = method.getInstruction<FiveRegisterInstruction>(constructorIndex)

            method.removeInstruction(constructorIndex)
            method.replaceInstruction(
                constructorIndex - 1,
                "invoke-static { v${constructor.registerD}, v${constructor.registerE} }, " +
                    "$EXTENSION_IMAGE_QUALITY_CLASS->previewResizeOptions(II)$RESIZE_OPTIONS_CLASS",
            )
            method.addInstruction(constructorIndex, "move-result-object v${constructor.registerC}")
        }

        // The view is the call's receiver, still in its register right after.
        LoadWithSubSamplingViewFingerprint.let {
            val index = it.instructionMatches.first().index
            val call = it.method.getInstruction<FiveRegisterInstruction>(index)

            it.method.addInstruction(
                index + 1,
                "invoke-static { v${call.registerC} }, " +
                    "$EXTENSION_IMAGE_QUALITY_CLASS->configureViewer($SUBSAMPLING_VIEW_CLASS)V",
            )
        }

        // Every large picture is drawn from tiles now, not from Fresco's
        // ARGB_8888 bitmap, so RGB_565 would leave banding in its gradients.
        DecodeRegionFingerprint.let {
            val index = it.instructionMatches.first().index
            val register = it.method.getInstruction<OneRegisterInstruction>(index).registerA

            it.method.replaceInstruction(
                index,
                "sget-object v$register, Landroid/graphics/Bitmap\$Config;->ARGB_8888:Landroid/graphics/Bitmap\$Config;",
            )
        }
    }
}
