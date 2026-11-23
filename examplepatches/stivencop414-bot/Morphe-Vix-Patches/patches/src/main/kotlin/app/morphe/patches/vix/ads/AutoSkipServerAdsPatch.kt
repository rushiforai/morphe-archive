package app.morphe.patches.vix.ads

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsWithLabels

@Suppress("unused")
val autoSkipServerAdsPatch = patch(
    name = "Auto-skip server-side ads",
    description = "Automatically calls LuraPlayer.skipAd() when an ad starts on non-live VOD streams.",
    default = true,
) {
    category("Ads")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        val playerClassDef = AktaOnAdStartedFingerprint.classDef
        val getLuraPlayerMethod = playerClassDef.methods.singleOrNull {
            it.returnType == LURA_PLAYER_DESCRIPTOR && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Could not locate LuraPlayer getter in ${playerClassDef.type}")
        val skipAdMethod = playerClassDef.methods.singleOrNull {
            it.name == "skipAd" && it.returnType == "V" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Could not locate skipAd() in ${playerClassDef.type}")

        AktaOnAdStartedFingerprint.method.apply {
            val originalEntry = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p1
                    if-eqz v0, :skip_end
                    move-object/from16 v0, p0
                    invoke-virtual {v0}, ${playerClassDef.type}->${getLuraPlayerMethod.name}()$LURA_PLAYER_DESCRIPTOR
                    move-result-object v1
                    if-eqz v1, :skip_end
                    invoke-interface {v1}, $LURA_PLAYER_DESCRIPTOR->isLive()Z
                    move-result v1
                    if-nez v1, :skip_end
                    invoke-virtual {v0}, ${playerClassDef.type}->${skipAdMethod.name}()V
                """.trimIndent(),
                ExternalLabel("skip_end", originalEntry),
            )
        }
    }
}
