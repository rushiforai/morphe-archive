// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/mine/DisableMineRedesignPatch.kt.
package app.ru_apps.rustore_jl4ctuk.mine

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ru_apps.rustore_jl4ctuk.shared.Constants.COMPATIBILITY_RUSTORE
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableRuStoreMineRedesign")

@Suppress("unused")
val disableMineRedesignPatch = bytecodePatch(
    name = "Disable Mine redesign",
    description = "Reverts the Mine screen to the classic layout, " +
        "disabling the redesigned V2/V3 interface.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        // MineDestination used to choose MineV2Screen for true and the classic
        // MineScreen for false. A live decompile (2026-10) confirmed RuStore
        // 1.111.0.3 dropped the classic screen and the MineV2ViewModel/MineV2Screen
        // fork entirely (MineDestination is now a bare navigation-route marker with
        // no constructor flag at all) - there is nothing left to force back to
        // classic. This is a cosmetic/UX patch, not a privacy one, so skip quietly
        // instead of failing the whole run when the fork no longer exists.
        val method = MineDestinationClassicFlagFingerprint.methodOrNull
        if (method == null) {
            logger.info(
                "MineDestination classic/V2 fork not found - this RuStore build " +
                    "has no classic Mine screen left to restore, skipping",
            )
            return@execute
        }
        method.addInstructions(0, "const/4 p1, 0x0")
    }
}
