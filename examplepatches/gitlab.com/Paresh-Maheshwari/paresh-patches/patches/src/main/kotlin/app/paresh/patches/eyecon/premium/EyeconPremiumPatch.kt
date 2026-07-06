package app.paresh.patches.eyecon.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.eyecon.shared.Constants.COMPATIBILITY_EYECON
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val eyeconPremiumPatch = bytecodePatch(
    name = "Eyecon Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_EYECON)

    execute {
        CombinedPremiumCheckFingerprint.method.addInstructions(0, """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
        """)

        FreePremiumCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Hide premium button in bottom bar
        PremiumButtonVisibilityFingerprint.method.addInstructions(0, """
            return-void
        """)

        // Hide premium container in settings — after field w is loaded into register,
        // set its visibility to GONE (8)
        SettingsPremiumSetupFingerprint.let {
            val index = it.instructionMatches[0].index
            val reg = it.instructionMatches[0].getInstruction<TwoRegisterInstruction>().registerA
            it.method.addInstructions(index + 1, """
                const/16 v1, 0x8
                invoke-virtual {v$reg, v1}, Landroid/view/View;->setVisibility(I)V
            """)
        }
    }
}
