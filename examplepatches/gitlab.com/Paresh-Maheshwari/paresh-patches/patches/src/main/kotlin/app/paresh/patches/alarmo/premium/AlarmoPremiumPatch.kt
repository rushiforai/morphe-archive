package app.paresh.patches.alarmo.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.alarmo.shared.Constants.COMPATIBILITY_ALARMO

@Suppress("unused")
val alarmoPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium missions — Lights On, Step & Walk Off, Push-Up, Squats, Jumping Jack, and Wake Up check."
) {
    compatibleWith(COMPATIBILITY_ALARMO)

    execute {
        // Bypass pairip license check — force responseCode to 0 (success)
        PairipProcessResponseFingerprint.method.addInstructions(0, """
            const/4 p1, 0x0
            return-void
        """)

        // Skip signature validation entirely
        PairipValidateResponseFingerprint.method.addInstructions(0, """
            return-void
        """)

        // Force isPremiumUser to always return true
        IsPremiumUserFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
