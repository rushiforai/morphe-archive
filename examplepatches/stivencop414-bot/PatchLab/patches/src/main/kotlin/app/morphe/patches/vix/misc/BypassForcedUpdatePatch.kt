package app.morphe.patches.vix.misc

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val bypassForcedUpdatePatch = patch(
    name = "Bypass forced app update",
    description = "Prevents SplashScreenFragment from displaying the blocking AppUpdateDialog.",
    default = true,
) {
    category("Misc")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        // Confirm AppUpdateDialog is the call target before suppressing the splash presenter method.
        val updateDialogType = AppUpdateDialogFingerprint.classDef.type
        val splashMethod = SplashShowUpdateDialogFingerprint.method
        val showsUpdateDialog = splashMethod.instructions.any { insn ->
            insn.getReference<MethodReference>()?.definingClass == updateDialogType
        }
        if (!showsUpdateDialog) {
            throw PatchException("SplashScreenFragment update dialog caller does not target $updateDialogType")
        }
        splashMethod.returnEarly()

        RequireUpgradeCheckFingerprint.method.apply {
            val insns = instructions.toList()
            val storeIndex = insns.indexOfFirst { insn ->
                val ref = insn.getReference<MethodReference>()
                ref?.definingClass == "Lcom/univision/descarga/ui/views/base/m;" && ref.name == "W6"
            }
            if (storeIndex < 0) {
                throw PatchException("Could not find W6(Boolean) call in $definingClass->$name")
            }
            val callInsn = insns[storeIndex] as? FiveRegisterInstruction
                ?: throw PatchException("Unexpected W6 instruction format in $definingClass->$name")
            val flagReg = callInsn.registerD
            addInstructions(
                storeIndex,
                """
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v$flagReg
                """.trimIndent(),
            )
        }
    }
}
