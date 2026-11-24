/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.idn.shared.Constants.HOME_TABS
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Whether [instruction] is a call to an app enum's valueOf(String); the enum class is obfuscated, so only its shape is checked. */
private fun isEnumValueOf(instruction: Instruction): Boolean {
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.name == "valueOf" && reference.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
        reference.returnType == reference.definingClass && !reference.definingClass.startsWith("Ljava/")
}

/** The constructor of the home tab adapter: it turns each tab of the remote config into a HomeMenu. */
private object HomeTabsFingerprint : Fingerprint(
    name = "<init>",
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList() ?: emptyList()
        val valueOf = instructions.firstOrNull(::isEnumValueOf)?.let { ((it as ReferenceInstruction).reference as MethodReference).returnType }
        valueOf != null && instructions.any {
            val field = (it as? ReferenceInstruction)?.reference as? FieldReference
            field != null && field.name == "UNKNOWN" && field.type == valueOf
        }
    },
)

@Suppress("unused")
val hideHomeTabsPatch = patch(
    name = "Hide home tabs",
    description = "Adds switches to hide the Nonton, IDN Live, Berita and Quiz tabs in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        register(*HOME_TABS.toTypedArray())
        HomeTabsFingerprint.method.apply {
            val valueOf = instructions.indexOfFirst(::isEnumValueOf)
            if (valueOf < 0) throw PatchException("IDN: HomeMenu.valueOf was not found in the home tab adapter.")
            val name = (instructions[valueOf] as FiveRegisterInstruction).registerC
            // A hidden tab is renamed UNKNOWN, which the adapter already skips.
            addInstructions(
                valueOf,
                """
                    invoke-static { v$name }, $EXTENSION_SETTINGS->tab(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$name
                """,
            )
        }
    }
}
