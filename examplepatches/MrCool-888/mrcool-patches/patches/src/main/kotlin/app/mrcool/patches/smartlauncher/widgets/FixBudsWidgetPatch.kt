package app.mrcool.patches.smartlauncher.widgets

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import app.mrcool.patches.smartlauncher.shared.signature.disableSignatureCheckPatch
import app.mrcool.patches.smartlauncher.smartLauncher

private val widgetExtensionPatch = bytecodePatch {
    extendWith("extensions/smartlauncher.mpe")
}

@Suppress("unused")
val fixBudsWidgetPatch = bytecodePatch(
    name = "Fix Galaxy Buds3 Pro widget",
    description = "Fixes widget configuration on Samsung One UI 8.5 and keeps the widget layout in sync with its size."
) {
    compatibleWith(smartLauncher)
    dependsOn(widgetExtensionPatch, disableSignatureCheckPatch)

    execute {
        listOf(WidgetConfigurationFingerprint, WidgetReconfigurationFingerprint).forEach { fingerprint ->
            val match = fingerprint.instructionMatches.single()
            val instruction = match.getInstruction<Instruction3rc>()
            if (instruction.registerCount != 6) {
                throw PatchException("Unexpected widget configuration arguments")
            }
            val first = instruction.startRegister
            val last = first + instruction.registerCount - 1
            fingerprint.method.replaceInstruction(
                match.index,
                "invoke-static/range {v$first .. v$last}, " +
                    "Lapp/mrcool/extension/smartlauncher/WidgetConfiguration;" +
                    "->startConfiguration(Landroid/appwidget/AppWidgetHost;" +
                    "Landroid/app/Activity;IIILandroid/os/Bundle;)V"
            )
        }

        val sizing = "Lapp/mrcool/extension/smartlauncher/WidgetSizing;"
        WidgetSizeUpdateFingerprint.apply {
            val match = instructionMatches.single()
            val call = match.getInstruction<Instruction35c>()
            val scratch = method.instructions[match.index + 2]
            val width = method.implementation!!.registerCount - 3
            val height = width + 1
            if (call.registerCount != 2 || height > 15
                || scratch.opcode != Opcode.NEW_INSTANCE || (scratch as OneRegisterInstruction).registerA != 1
            ) {
                throw PatchException("Unexpected widget size update instructions")
            }
            method.addInstructionsWithLabels(
                match.index,
                """
                    invoke-static {v${call.registerC}, v${call.registerD}, v$width, v$height}, $sizing->updateBudsSize(Landroid/appwidget/AppWidgetManager;IFF)Z
                    move-result v1
                    if-eqz v1, :stock_size
                    return-void
                """.trimIndent(),
                ExternalLabel("stock_size", method.instructions[match.index])
            )
        }

        WidgetSizeInvalidationFingerprint.apply {
            val match = instructionMatches.single()
            val call = match.getInstruction<Instruction35c>()
            if (call.registerCount != 3) {
                throw PatchException("Unexpected widget size invalidation arguments")
            }
            method.replaceInstruction(
                match.index,
                "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, " +
                    "$sizing->invalidateWidgetSize(Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V"
            )
        }
    }
}
