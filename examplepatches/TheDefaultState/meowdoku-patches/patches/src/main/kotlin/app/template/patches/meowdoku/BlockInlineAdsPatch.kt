package app.template.patches.meowdoku

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val HELPER = "Lapp/template/extension/RewardAdSkipper;"

/**
 * Removes the inline ads: banners and native placements.
 *
 * Neither has a user gesture to fake, so both loads are skipped (no requests) and, if the
 * game asks to show one anyway, the view it would have rendered into is collapsed. The rest
 * of the UI keeps its behaviour, it just no longer shows an ad strip or ad card.
 */
val blockInlineAdsPatch = bytecodePatch(
    name = "Block banner and native ads",
    description = "Skips banner and native ads entirely and collapses their space in the UI.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MEOWDOKU)

    extendWith("extensions/extension.mpe")

    val blockInlineAds by booleanOption(
        key = "Block banner and native ads",
        description = "Stop loading inline ads and hide their containers.",
        default = true
    )

    execute {
        if (blockInlineAds != true) return@execute

        // Loads: nothing to fetch, so nothing to render.
        val bannerLoad = MaxAdapterLoadBannerFingerprint.matchOrNull()
            ?: throw PatchException("MaxAdapter.doLoadBannerAd(...) was not found.")
        bannerLoad.method.addInstructions(0, "return-void")

        val nativeLoad = MaxAdapterLoadNativeFingerprint.matchOrNull()
            ?: throw PatchException("MaxAdapter.doLoadNativeAd(...) was not found.")
        // doLoadNativeAd hands its loader back, so the skip has to return null.
        nativeLoad.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // Shows: collapse the ad view and the container it would fill.
        MaxAdapterShowBannerFingerprint.matchOrNull()?.let {
            it.method.addInstructions(
                0,
                """
                    invoke-static {p3, p4}, $HELPER->hideBanner(Ljava/lang/Object;Ljava/lang/Object;)V
                    return-void
                """
            )
        }

        MaxAdapterShowNativeFingerprint.matchOrNull()?.let {
            it.method.addInstructions(
                0,
                """
                    invoke-static {p5}, $HELPER->hideNative(Ljava/lang/Object;)V
                    return-void
                """
            )
        }

        println("Block banner and native ads: loads skipped, containers collapsed.")
    }
}
