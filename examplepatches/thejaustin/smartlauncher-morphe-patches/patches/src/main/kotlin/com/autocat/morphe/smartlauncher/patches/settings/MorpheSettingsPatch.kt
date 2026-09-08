package com.autocat.morphe.smartlauncher.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
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

object ExperimentalSettingsFingerprint : Fingerprint(
    strings = listOf(
        "joinLeaveBetaTester",
        "forceResync",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            if (insn is ReferenceInstruction) {
                val ref = insn.reference
                ref is MethodReference &&
                    ref.returnType == "Ljava/util/ArrayList;" &&
                    ref.parameterTypes.size == 2
            } else false
        } ?: false
    },
)

/**
 * Injects Morphe Patches & App Archiving settings directly into
 * Smart Launcher's preferences menu (Dev options / Experimental features).
 */
@Suppress("unused")
val morpheSettingsPatch = bytecodePatch(
    name = "Morphe settings UI integration",
    description = "Integrates Morphe Patches & App Archiving settings panel into Smart Launcher Settings (Dev options & Experimental features).",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Hook Dev options to open the MorpheSettingsDialog (with toggles for Hide Archived Apps, Native Archiving, Shizuku Archiving, and live Shizuku status)
        DevOptionsFingerprint.matchOrNull()?.let { match ->
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

                method.replaceInstruction(
                    matchIndex,
                    "invoke-static {$regInstance, $regParam}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->openMorpheSettings(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            }
        }

        // 2. Safely hook Experimental Settings list merge to prevent crashes on select
        ExperimentalSettingsFingerprint.matchOrNull()?.let { match ->
            val method = match.method
            val instructions = method.implementation?.instructions ?: return@let

            var mergeInsnIndex = -1
            for ((idx, insn) in instructions.withIndex()) {
                if (insn is ReferenceInstruction) {
                    val ref = insn.reference
                    if (ref is MethodReference &&
                        ref.returnType == "Ljava/util/ArrayList;" &&
                        ref.parameterTypes.size == 2
                    ) {
                        mergeInsnIndex = idx
                    }
                }
            }

            if (mergeInsnIndex >= 0) {
                val (regA, regB) = try {
                    val insn = method.getInstruction<FiveRegisterInstruction>(mergeInsnIndex)
                    Pair("v${insn.registerC}", "v${insn.registerD}")
                } catch (t: Throwable) {
                    val insn = method.getInstruction<RegisterRangeInstruction>(mergeInsnIndex)
                    val start = insn.startRegister
                    Pair("v$start", "v${start + 1}")
                }

                method.replaceInstruction(
                    mergeInsnIndex,
                    "invoke-static {$regA, $regB}, Lcom/autocat/morphe/smartlauncher/extension/MorpheMenuInjector;->mergeAndInjectSettings(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/ArrayList;",
                )
            }
        }
    }
}
