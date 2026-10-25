package app.template.patches.fotmob.betting

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val hideBettingContentPatch = bytecodePatch(
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        // The odds gate answers Boolean.FALSE straight away, the result it gives when the user
        // turned odds off. A plain value is a finished suspend result, so callers go on without
        // suspending. The odds format setting is left alone: it also feeds the account settings
        // sync, and forcing it would push "No odds" to the user's server-side settings.
        val gate = OddsGateFingerprint.method
        if (gate.implementation == null) {
            throw PatchException("FotMob odds gate has no implementation")
        }
        gate.addInstructionsChecked(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
    }
}
