package app.morphe.patches.vk.music

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK

internal object PlayerAdsComponentProviderFingerprint : Fingerprint(
    definingClass = "Lcom/vk/music/player/ads/impl/di/PlayerAdsComponentImpl\$a;",
    name = "a",
    returnType = "Lcom/vk/di/component/DiScopedComponent;"
)

@Suppress("unused")
val audioAdsPatch = bytecodePatch(
    name = "Disable audio ads",
    description = "Disables audio ads in the VK music player by routing to the built-in stub ads component.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)

    execute {
        PlayerAdsComponentProviderFingerprint.method.apply {
            addInstructions(
                0,
                """
                    sget-object v0, Lcom/vk/music/player/ads/api/di/PlayerAdsComponent;->Companion:Lcom/vk/music/player/ads/api/di/PlayerAdsComponent${'$'}Companion;
                    invoke-virtual { v0 }, Lcom/vk/music/player/ads/api/di/PlayerAdsComponent${'$'}Companion;->getSTUB()Lcom/vk/music/player/ads/api/di/PlayerAdsComponent;
                    move-result-object v0
                    check-cast v0, Lcom/vk/di/component/DiScopedComponent;
                    return-object v0
                """
            )
        }
    }
}
