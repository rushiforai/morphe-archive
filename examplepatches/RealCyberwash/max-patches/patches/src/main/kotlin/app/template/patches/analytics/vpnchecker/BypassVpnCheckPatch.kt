package app.template.patches.analytics.vpnchecker

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CHMAX
import app.template.patches.shared.Constants.IP_CHECKER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

val bypassVpnCheckPatch = bytecodePatch(
    name = "Bypass VPN Check",
    description = "Forces you to check the IP address only on Yandex",
    default = true
) {
    compatibleWith(COMPATIBILITY_CHMAX)

    execute {
        VpnCheckerFingerprint.method.apply {
            val targetIndex = instructions.indexOfFirst { it.opcode == Opcode.FILLED_NEW_ARRAY_RANGE }
            val startReg = getInstruction<RegisterRangeInstruction>(targetIndex).startRegister

            replaceInstruction(
                targetIndex,
                "const-string v$startReg, \"$IP_CHECKER\""
            )

            addInstructions(
                targetIndex + 1,
                """
                    filled-new-array/range {v$startReg .. v$startReg}, [Ljava/lang/String;
                """
            )
        }
    }
}