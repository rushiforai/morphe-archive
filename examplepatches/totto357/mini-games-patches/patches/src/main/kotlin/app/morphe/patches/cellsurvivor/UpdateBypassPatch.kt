package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val FORCE_UPDATE_PROVIDER = "Lcom/common/route/upgrade/ForceUpdateProvider;"

internal object ForceUpdateStartCheckFingerprint : Fingerprint(
    name = "startCheck",
    parameters = listOf("Landroid/app/Activity;"),
    custom = { _, classDef ->
        classDef.interfaces.contains(FORCE_UPDATE_PROVIDER)
    },
)

@Suppress("unused")
val updateBypassPatch =
    bytecodePatch(
        name = "Bypass Force Update",
        description = "Bypasses in-game force update check, treating app always as up-to-date.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            ForceUpdateStartCheckFingerprint.method.apply {
                ensureLocals(2)
                addInstructions(
                    0,
                    """
                    invoke-static {}, Lcom/common/game/callback/GameCallback;->getInstance()Lcom/common/game/callback/GameCallback;
                    move-result-object v0
                    const/4 v1, 0x0
                    invoke-virtual {v0, v1}, Lcom/common/game/callback/GameCallback;->checkForceUpdateCallback(I)V
                    return-void
                    """.trimIndent(),
                )
            }
        }
    }
