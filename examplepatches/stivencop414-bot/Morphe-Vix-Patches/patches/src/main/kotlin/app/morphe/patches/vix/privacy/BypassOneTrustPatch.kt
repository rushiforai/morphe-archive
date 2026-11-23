package app.morphe.patches.vix.privacy

import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructions

@Suppress("unused")
val bypassOneTrustPatch = patch(
    name = "Bypass OneTrust consent delay",
    description = "Skips OneTrust CMP SDK initialization at startup and invokes the startup continuation immediately.",
    default = false,
) {
    category("Privacy")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        OneTrustInitFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p2
                invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
                return-void
            """.trimIndent(),
        )
    }
}
