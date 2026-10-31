package app.kurageno8156lgtm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val forceShowAutoScrollPatch = bytecodePatch(
    name = "Force show Auto scroll",
    description = "TikTok Lite 43.5.3の自動スクロール機能ゲートと表示ゲートを強制的に有効化します",
    default = true
) {
    compatibleWith("com.ss.android.ugc.tiktok.lite"("43.5.3"))

    execute {
        // Bypass the fyp_auto_scroll rollout gate.
        AutoScrollFeatureGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Override the boolean result of the panel_auto_scroll gate while
        // preserving TikTok Lite's original action factory and action object.
        AutoScrollActionFactoryFingerprint.method.apply {
            val instructions = implementation?.instructions
                ?: error("Auto scroll action factory has no implementation")

            val panelGateStringIndex = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    (instruction as? ReferenceInstruction)
                        ?.reference.let { it is StringReference && it.string == "panel_auto_scroll" }
            }
            check(panelGateStringIndex >= 0) {
                "Could not find panel_auto_scroll string in AutoScrollActionFactoryFingerprint"
            }

            val panelGateResultIndex = instructions
                .drop(panelGateStringIndex + 1)
                .indexOfFirst { it.opcode == Opcode.MOVE_RESULT }
                .let { relativeIndex ->
                    check(relativeIndex >= 0) {
                        "Could not find MOVE_RESULT after panel_auto_scroll string"
                    }
                    panelGateStringIndex + 1 + relativeIndex
                }

            val panelGateResultRegister =
                getInstruction<OneRegisterInstruction>(panelGateResultIndex).registerA

            addInstructions(
                panelGateResultIndex + 1,
                """
                    const/4 v$panelGateResultRegister, 0x1
                """
            )
        }
    }
}
