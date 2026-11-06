package app.mrcool.patches.smartlauncher.widgets

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import app.mrcool.patches.smartlauncher.shared.signature.disableSignatureCheckPatch
import app.mrcool.patches.smartlauncher.smartLauncher

private val widgetExtensionPatch = bytecodePatch {
    extendWith("extensions/smartlauncher.mpe")
}

@Suppress("unused")
val fixBudsWidgetPatch = bytecodePatch(
    name = "Fix Galaxy Buds3 Pro widget",
    description = "Fixes widget configuration returning cancelled on Samsung One UI 8.5 and later."
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
    }
}
