package app.jouss.patches.jiohotstar.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes pre-roll, mid-roll, and live match video ads."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // Force: disablePreRoll=true(p1), disableMidRoll=true(p2),
        //        hasPreRoll=false(p3), hasPlayablePreRoll=false(p4), enableMidRollLoad=false(p5)
        // Also clear ssaiTag (p6) to block live match SSAI ads
        AdMetadataConstructorFingerprint.method.addInstructions(0, """
            const/4 p1, 0x1
            const/4 p2, 0x1
            const/4 p3, 0x0
            const/4 p4, 0x0
            const/4 p5, 0x0
            const-string p6, ""
        """)

        // Neuter live ad initializer to prevent Ad SDK engagement
        WatchLiveAdsInitFingerprint.method.addInstructions(0, """
            return-void
        """)

        // Hide home feed banner/display ads
        DisplayAdComposableFingerprint.method.addInstructions(0, """
            return-void
        """)

        // Block SGAI prefetcher from fetching live ads — return empty list
        SgaiPrefetcherGetAdFingerprint.method.addInstructions(0, """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)

        // Block LiveAdsManager ad processing loop
        LiveAdsManagerProcessFingerprint.method.addInstructions(0, """
            sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object v0
        """)
    }
}
