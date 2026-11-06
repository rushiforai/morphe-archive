package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ADS_MANAGER_HELPER = "Lcom/common/common/helper/AdsManagerHelper;"

internal object IsVideoReadyFingerprint : Fingerprint(
    definingClass = ADS_MANAGER_HELPER,
    name = "isVideoReady",
    parameters = emptyList(),
)

internal object IsVideoReadyIntFingerprint : Fingerprint(
    definingClass = ADS_MANAGER_HELPER,
    name = "isVideoReady",
    parameters = listOf("I"),
)

internal object ShowVideoFingerprint : Fingerprint(
    definingClass = ADS_MANAGER_HELPER,
    name = "showVideo",
    parameters = listOf("I", "Ljava/lang/String;"),
)

internal object PlayVideoStaticFingerprint : Fingerprint(
    definingClass = ADS_MANAGER_HELPER,
    name = "playVideoStatic",
    parameters = listOf("Z", "Ljava/lang/String;"),
)

@Suppress("unused")
val rewardedAdPatch =
    bytecodePatch(
        name = "Instant Rewarded Ads",
        description = "Makes rewarded videos always ready and immediately grants rewards without playing ads.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            IsVideoReadyFingerprint.method.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )

            IsVideoReadyIntFingerprint.method.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )

            PlayVideoStaticFingerprint.method.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )

            ShowVideoFingerprint.method.ensureLocals(2)
            ShowVideoFingerprint.method.addInstructions(
                0,
                """
                invoke-static {p1}, Lcom/common/game/UserGameHelper;->videoShow(I)V
                const-wide/16 v0, 0x0
                invoke-static {p1, v0, v1}, Lcom/common/game/UserGameHelper;->afterVideo(IJ)V
                return-void
                """.trimIndent(),
            )
        }
    }
