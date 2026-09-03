package com.autocat.morphe.smartlauncher.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.autocat.morphe.smartlauncher.shared.Constants

object DevOptionsFingerprint : Fingerprint(
    strings = listOf(
        "android.settings.APPLICATION_DEVELOPMENT_SETTINGS",
    ),
    filters = listOf(
        methodCall(
            smali = "Lginlemon/flower/preferences/prefMenu/PrefMenuActivity;->startActivity(Landroid/content/Intent;)V",
        ),
    ),
)

/**
 * Injects the Morphe Patches & App Archiving settings panel directly into
 * Smart Launcher's preferences menu (accessible via Smart Launcher Settings -> Dev options / Experimental features).
 */
@Suppress("unused")
val morpheSettingsPatch = bytecodePatch(
    name = "Morphe settings UI integration",
    description = "Integrates the Morphe Patches & App Archiving settings panel into Smart Launcher Settings (under Dev options / Experimental features).",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val match = DevOptionsFingerprint.matchOrNull()
            ?: throw PatchException("Could not find Dev options call site in PrefMenuActivity")

        val method = match.method
        for (insnMatch in match.instructionMatches) {
            val matchIndex = insnMatch.index
            val (regInstance, regParam) = try {
                val insn = method.getInstruction<FiveRegisterInstruction>(matchIndex)
                Pair("v${insn.registerC}", "v${insn.registerD}")
            } catch (t: Throwable) {
                val insn = method.getInstruction<RegisterRangeInstruction>(matchIndex)
                val start = insn.startRegister
                Pair("v$start", "v${start + 1}")
            }

            // Replace startActivity with our safe dual-object context-resolved dialog trigger
            method.replaceInstruction(
                matchIndex,
                "invoke-static {$regInstance, $regParam}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->openMorpheSettings(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }
    }
}
