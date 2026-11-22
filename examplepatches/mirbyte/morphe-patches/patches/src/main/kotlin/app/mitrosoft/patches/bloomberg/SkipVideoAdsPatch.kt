package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG

private class DaiTargets(val className: String, val methodName: String, val backupMethod: String)

// Class and method names are obfuscated and change per build.
private val daiTargetsByVersion = mapOf(
    "6.66.0.5604504.069af9ffeb" to DaiTargets("Lcom/brentvatne/exoplayer/ReactExoplayerView;", "initializeDaiSource", "handleDaiBackupStream()Z"),
    "6.70.0.5693432.0411be1ed" to DaiTargets("Lcom/brentvatne/exoplayer/ReactExoplayerView;", "initializeDaiSource", "handleDaiBackupStream()Z"),
    "6.71.0.5706597.b05d0421" to DaiTargets("Lcom/brentvatne/exoplayer/a1;", "n2", "A1()Z"),
)

@Suppress("unused")
val skipVideoAdsPatch = bytecodePatch(
    name = "Skip video ads",
    description = "Skips Google dynamic ad insertion for on-demand videos and plays the backup stream instead, " +
        "when the stream provides one. Fixes video streams that do not play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    execute {
        val targets = daiTargetsByVersion[packageMetadata.versionName]
            ?: error("Unsupported Bloomberg version ${packageMetadata.versionName}")
        mutableClassDefBy(targets.className).methods
            .first { it.name == targets.methodName }
            .addInstructions(
                0,
                """
                    invoke-direct {p0}, ${targets.className}->${targets.backupMethod}
                    move-result v0
                    if-eqz v0, :cond_dai
                    return-void
                    :cond_dai
                """,
            )
    }
}
