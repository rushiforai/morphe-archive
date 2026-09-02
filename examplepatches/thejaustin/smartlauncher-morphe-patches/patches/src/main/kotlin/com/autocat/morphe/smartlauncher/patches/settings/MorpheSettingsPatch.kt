package com.autocat.morphe.smartlauncher.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
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
 * Smart Launcher's preferences menu (accessible via Smart Launcher Settings -> Dev options).
 */
@Suppress("unused")
val morpheSettingsPatch = bytecodePatch(
    name = "Morphe settings UI integration",
    description = "Integrates the Morphe Patches & App Archiving settings panel into Smart Launcher Settings (under Dev options).",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val match = DevOptionsFingerprint.matchOrNull()
            ?: throw PatchException("Could not find Dev options call site in PrefMenuActivity")

        val method = match.method
        val matchIndex = match.instructionMatches.first().index

        // Replace startActivity with our dialog trigger
        method.replaceInstruction(
            matchIndex,
            "invoke-static {p0}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->openMorpheSettings(Landroid/content/Context;)V",
        )
    }
}
