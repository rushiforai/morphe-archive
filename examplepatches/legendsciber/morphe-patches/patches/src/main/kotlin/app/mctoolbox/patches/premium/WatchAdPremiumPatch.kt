package app.mctoolbox.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mctoolbox.patches.shared.Constants.COMPATIBILITY_MCTOOLBOX

/**
 * MCToolbox Premium - Direct Enable
 *
 * 1. ya0.H(Z)V → force Q=true, skip F() → premium features active
 * 2. tz0.a()V → return-void → blocks premium overlay decision point
 *    tz0.a() checks Q and shows overlay (crashes). Making it a no-op
 *    prevents the crash while keeping toolbox UI and mod menu working
 *    (they use different xs0$a implementations).
 */
@Suppress("unused")
val mctoolboxPremiumPatch = bytecodePatch(
    name = "Premium (Under Testing)",
    description = "Enables premium directly without watching ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MCTOOLBOX)

    execute {
        // 1. ya0.H() → Q=true, skip F()
        SetPremiumStateFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            iput-boolean v0, p0, Lya0;->Q:Z
            return-void
        """.trimIndent())

        // 2. tz0.a() → return-void (no-op, prevents overlay crash)
        PopupDecisionFingerprint.method.addInstructions(0, "return-void")
    }
}
