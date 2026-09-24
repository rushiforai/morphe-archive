/*
 * Copyright 2026 Morphe.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.googlephotos.misc.gms

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal val deviceComplianceCheckPatch = bytecodePatch {
    execute {
        // GmsCore answering "not compliant" sends the app to the background and opens
        // UncertifiedDeviceActivity. In Google Photos, compliance enforcement is triggered
        // by should_enforce_ip_protection. Force this check to false and stub
        // UncertifiedDeviceActivity.onCreate so the uncertified screen is never shown.

        // 1. Force should_enforce_ip_protection compliance check to return false.
        GmsDeviceComplianceCheckFingerprint.methodOrNull?.let { method ->
            val instructions = method.instructions
            val flagIndex = instructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                    (ref as? StringReference)?.string == "should_enforce_ip_protection"
                } == true
            }

            if (flagIndex != -1) {
                // Find the move-result instruction following bundle.getBoolean("should_enforce_ip_protection")
                val moveResultIndex = instructions.subList(flagIndex, minOf(instructions.size, flagIndex + 5))
                    .indexOfFirst { it.opcode == Opcode.MOVE_RESULT }

                if (moveResultIndex != -1) {
                    val actualIndex = flagIndex + moveResultIndex
                    val register = (instructions[actualIndex] as OneRegisterInstruction).registerA
                    method.replaceInstruction(
                        actualIndex,
                        "const/4 v$register, 0x0",
                    )
                }
            }

            // Also neutralize any startActivity or finish calls for UncertifiedDeviceActivity as a failsafe
            val uncertifiedType = "Lcom/google/android/gms/gmscompliance/ui/UncertifiedDeviceActivity;"
            val uncertifiedIdx = instructions.indexOfFirst { instr ->
                (instr as? ReferenceInstruction)?.reference?.let { ref ->
                    (ref as? TypeReference)?.type == uncertifiedType
                } == true
            }

            if (uncertifiedIdx != -1) {
                for (i in uncertifiedIdx until minOf(instructions.size, uncertifiedIdx + 15)) {
                    val instr = method.getInstruction(i)
                    val methodRef = (instr as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (methodRef.definingClass == "Landroid/app/Activity;" &&
                        (methodRef.name == "startActivity" || methodRef.name == "finish")
                    ) {
                        method.replaceInstruction(i, "nop")
                    }
                }
            }
        }

        // 2. If UncertifiedDeviceActivity is ever opened directly, immediately finish.
        UncertifiedDeviceActivityOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """,
        )
    }
}
