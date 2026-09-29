package io.github.bakwudo.uyu.patches.twitch.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch
import io.github.bakwudo.uyu.patches.util.addInstructionsAtControlFlowLabel

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/settings/SettingsPatch;"
private const val PATCH_STATUS_CLASS = "$EXTENSION_PACKAGE/settings/PatchStatus;"

/**
 * Adds an "uyu" row to the top of Twitch's settings screen. It opens the uyu settings screen.
 * Patches with settings depend on this patch.
 */
internal val settingsPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        MainSettingsOnCreateViewFingerprint.method.apply {
            val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
            if (returnIndices.isEmpty()) throw PatchException("Settings screen onCreateView has no return.")

            returnIndices.asReversed().forEach { returnIndex ->
                val viewRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        invoke-static/range { v$viewRegister .. v$viewRegister }, $EXTENSION_CLASS->addSettingsEntry(Landroid/view/View;)Landroid/view/View;
                        move-result-object v$viewRegister
                    """,
                )
            }
        }
    }
}

/**
 * Makes the settings screen show the settings of the calling patch.
 *
 * @param methodName Name of the method in the extension's PatchStatus class.
 */
internal fun BytecodePatchContext.setPatchIncluded(methodName: String) {
    val method = mutableClassDefBy(PATCH_STATUS_CLASS).methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("PatchStatus.$methodName not found.")
    method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """,
    )
}
