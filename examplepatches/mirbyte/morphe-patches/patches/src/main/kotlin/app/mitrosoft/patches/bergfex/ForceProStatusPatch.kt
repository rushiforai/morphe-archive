package app.mitrosoft.patches.bergfex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BERGFEX

@Suppress("unused")
val forceProStatusPatch = bytecodePatch(
    name = "Force Pro status",
    description = "Forces the license status to Subscription (Pro) for all users.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BERGFEX)

    execute {
        // Subscription (tce.c) rather than Lifetime: the live tracking gate in hsc.C only accepts tce.c.
        ResolveProStatusFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Ltce;->c:Ltce;
                return-object p0
            """,
        )
    }
}
