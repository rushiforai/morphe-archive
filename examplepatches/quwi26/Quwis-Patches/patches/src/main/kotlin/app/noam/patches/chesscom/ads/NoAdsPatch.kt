package app.noam.patches.chesscom.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val ADS = "${Constants.EXTENSION_PACKAGE}/ads/Ads;"
private const val ADS_INITIALIZER = "Lcom/chess/internal/ads/AditudeAdsInitializer;"

@Suppress("unused")
val noAdsPatch = bytecodePatch(
    name = "No ads",
    description = "Banner, full-screen and game-over ads are not loaded or shown, and neither are " +
        "their Remove Ads links: the app's own \"ads enabled\" state and the account's show-ads " +
        "flag, which are off for members, stay off.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("noAdsPatched")

        // The ads initializer's one interface method: the "ads enabled" state everything waits on.
        val initializer = mutableClassDefBy(ADS_INITIALIZER)
        val api = initializer.interfaces.flatMap { type ->
            classDefByOrNull { it.type == type }?.methods?.toList().orEmpty()
        }.filter { it.parameterTypes.isEmpty() }
        val accessor = initializer.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType.startsWith("L") &&
                api.any { it.name == method.name && it.returnType == method.returnType }
        } ?: throw PatchException("The ads-enabled state was not found")
        // The account's show-ads flag, which the game-over screens check for their ad slot and
        // its Remove Ads link.
        mutableClassDefBy("Lcom/chess/net/model/LoginData;").methods.single {
            it.name == "getShow_ads" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN }
            val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static { v$register }, $ADS->showAds(Z)Z
                    move-result v$register
                """,
            )
        }

        accessor.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static/range { v$register .. v$register }, $ADS->adsEnabled(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, ${accessor.returnType}
                """,
            )
        }
    }
}
