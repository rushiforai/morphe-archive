package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG

@Suppress("unused")
val skipVideoAdsPatch = bytecodePatch(
    name = "Skip video ads",
    description = "Skips Google dynamic ad insertion for on-demand videos and plays the backup stream instead, " +
        "when the stream provides one. Fixes video streams that do not play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    execute {
        mutableClassDefBy("Lcom/brentvatne/exoplayer/ReactExoplayerView;").methods
            .first { it.name == "initializeDaiSource" }
            .addInstructions(
                0,
                """
                    invoke-direct {p0}, Lcom/brentvatne/exoplayer/ReactExoplayerView;->handleDaiBackupStream()Z
                    move-result v0
                    if-eqz v0, :cond_dai
                    return-void
                    :cond_dai
                """,
            )
    }
}
