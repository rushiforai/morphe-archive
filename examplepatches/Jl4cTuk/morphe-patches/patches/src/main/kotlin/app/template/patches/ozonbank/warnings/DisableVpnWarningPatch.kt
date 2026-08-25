package app.template.patches.ozonbank.warnings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozonbank.shared.Constants.COMPATIBILITY_OZON_BANK_CURRENT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val disableOzonBankVpnWarningPatch = bytecodePatch(
    name = "Disable Ozon Bank VPN warning",
    description = "Removes the warning shown when Ozon Bank detects an active VPN connection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_BANK_CURRENT)

    execute {
        WebViewVpnStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        val networkTypeMethod = WebViewNetworkTypeFingerprint.method
        val networkTypeInstructions = networkTypeMethod.implementation!!.instructions
        val vpnTransportConstants = networkTypeInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.CONST_4 &&
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 4
        }
        require(vpnTransportConstants.size == 1) {
            "Expected one VPN transport constant, found ${vpnTransportConstants.size}"
        }

        val vpnTransportRegister =
            (vpnTransportConstants.single().value as OneRegisterInstruction).registerA
        val vpnChecks = networkTypeInstructions.withIndex().filter { (_, instruction) ->
            val method = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            val registers = instruction as? FiveRegisterInstruction

            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                method?.definingClass == "Landroid/net/NetworkCapabilities;" &&
                method.name == "hasTransport" &&
                method.parameterTypes == listOf("I") &&
                method.returnType == "Z" &&
                registers?.registerCount == 2 &&
                registers.registerD == vpnTransportRegister
        }
        require(vpnChecks.size == 2) {
            "Expected two WebView VPN transport checks, found ${vpnChecks.size}"
        }

        val vpnResultOverrides = vpnChecks.map { (index, _) ->
            val resultInstruction = networkTypeInstructions[index + 1]
            require(resultInstruction.opcode == Opcode.MOVE_RESULT) {
                "Expected a WebView VPN check result"
            }
            val resultRegister = (resultInstruction as OneRegisterInstruction).registerA
            require(resultRegister <= 15) {
                "WebView VPN result register does not fit const/4"
            }
            index + 2 to resultRegister
        }

        vpnResultOverrides.sortedByDescending { it.first }.forEach { (index, register) ->
            networkTypeMethod.addInstructions(index, "const/4 v$register, 0x0")
        }
    }
}
