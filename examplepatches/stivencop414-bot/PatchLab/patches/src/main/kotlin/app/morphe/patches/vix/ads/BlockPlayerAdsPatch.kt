package app.morphe.patches.vix.ads

import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructions
import app.morphe.util.returnEarly
import app.morphe.util.returnEarlyNull

@Suppress("unused")
val blockPlayerAdsPatch = patch(
    name = "Block player ads",
    description = "Disables Lura client-side prerolls, pause ads, GAM pod-serve DAI configurations, " +
        "clip ad tags, and Google IMA ad tag resolution in ViX players.",
    default = true,
) {
    category("Ads")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        LuraGenericBreaksFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/akta/luraplayer/api/configs/ads/LuraGenericConfiguration;
                new-instance v1, Ljava/util/ArrayList;
                invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                const/4 v2, 0x0
                const/4 v3, 0x2
                invoke-direct {v0, v1, v2, v3, v2}, Lcom/akta/luraplayer/api/configs/ads/LuraGenericConfiguration;-><init>(Ljava/util/List;Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
                return-object v0
            """.trimIndent(),
        )

        LuraServerSideConfigFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/akta/luraplayer/api/configs/ads/LuraServerSideConfiguration;
                const-string v1, "lura"
                const/4 v2, 0x0
                invoke-direct {v0, v1, v2}, Lcom/akta/luraplayer/api/configs/ads/LuraServerSideConfiguration;-><init>(Ljava/lang/String;Lcom/akta/luraplayer/api/configs/ads/LuraGamConfiguration;)V
                return-object v0
            """.trimIndent(),
        )

        LuraPauseAdGateFingerprint.method.returnEarly(false)

        LuraPauseAndPrerollParserFingerprint.method.returnEarly()

        LuraConfigUtilsAdsFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/akta/luraplayer/api/configs/ads/LuraAdsConfiguration;
                invoke-direct {v0}, Lcom/akta/luraplayer/api/configs/ads/LuraAdsConfiguration;-><init>()V
                return-object v0
            """.trimIndent(),
        )

        ImaAdTagUriBuilderFingerprint.method.returnEarlyNull()
    }
}
