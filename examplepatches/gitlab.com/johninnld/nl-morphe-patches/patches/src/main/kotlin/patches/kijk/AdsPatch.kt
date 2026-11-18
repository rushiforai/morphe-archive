package patches.kijk

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.atv.exact

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Removes the native player VMAP advertising configuration while preserving content, DRM and player lifecycle.",
) {
    dependsOn(originalInput)
    compatibleWith(kijk)
    execute {
        exact("Lcom/nakko/android/radio10gold/view/videoplayer/a0;",
            "g0(Lcom/jwplayer/pub/api/JWPlayer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;D)Lcom/jwplayer/pub/api/configuration/ads/AdvertisingConfig;", 7, 56)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        exact("Lcom/nakko/android/radio10gold/view/inline/Y;", "j()Ljava/lang/String;", 2, 2)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}
