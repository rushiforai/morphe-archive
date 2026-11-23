package app.template.patches.smartlauncher.widgets

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTLAUNCHER
import app.template.patches.smartlauncher.misc.signature.spoofSignaturePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc

/**
 * Ported from MrCool-888/mrcool-patches (GPL-3.0), where the Galaxy Buds3 widget fix was
 * developed; see the commit trailer and NOTICE.
 */
private val widgetExtensionPatch = bytecodePatch {
    extendWith("extensions/smartlauncher.mpe")
}

/**
 * Samsung's Galaxy Buds3 Pro widget could not be added on One UI 8.5/9: the provider still
 * points at the One UI 6/7 configure activity, which redirects without forwarding the
 * launcher's result, so the host never sees a successful configuration. The patch replaces
 * both stock config launches with a helper that starts the One UI 8.5 activity directly
 * (`WidgetSettingActivityUI85`, when the widget belongs to the Buds package, runs in this
 * profile and One UI is at least 80500) and falls back to the stock call otherwise.
 *
 * The provider also renders every size the launcher reports, so the host's history of
 * candidate sizes produces the wrong layout. The measurement publisher is wrapped: for Buds
 * only the current size is published (min = max = current), and the invalidation coroutine
 * keeps the last usable size instead of clearing it. Other widgets keep the stock path.
 */
@Suppress("unused")
val fixBudsWidgetPatch = bytecodePatch(
    name = "Fix Galaxy Buds3 Pro widget",
    description = "Fixes widget configuration on Samsung One UI 8.5 and keeps the widget layout in sync with its size.",
) {
    compatibleWith(COMPATIBILITY_SMARTLAUNCHER)

    // The app exits at start when its signature is not the original one.
    dependsOn(widgetExtensionPatch, spoofSignaturePatch)

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
                    "Lapp/template/extension/smartlauncher/WidgetConfiguration;" +
                    "->startConfiguration(Landroid/appwidget/AppWidgetHost;" +
                    "Landroid/app/Activity;IIILandroid/os/Bundle;)V",
            )
        }

        val sizing = "Lapp/template/extension/smartlauncher/WidgetSizing;"
        WidgetSizeUpdateFingerprint.apply {
            val match = instructionMatches.single()
            val call = match.getInstruction<Instruction35c>()
            val scratch = method.instructions[match.index + 2]
            val width = method.implementation!!.registerCount - 3
            val height = width + 1
            if (call.registerCount != 2 || height > 15 ||
                scratch.opcode != Opcode.NEW_INSTANCE ||
                (scratch as OneRegisterInstruction).registerA != 1
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
                ExternalLabel("stock_size", method.instructions[match.index]),
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
                    "$sizing->invalidateWidgetSize(Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V",
            )
        }
    }
}
