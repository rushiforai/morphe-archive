package app.morphe.patches.colonyflow

import app.morphe.patches.colonyflow.Constants.COMPATIBILITY_COLONY_FLOW
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val MAX_UNITY_AD_MANAGER = "Lcom/applovin/mediation/unity/MaxUnityAdManager;"

internal object IsInterstitialReadyFingerprint : Fingerprint(
    definingClass = MAX_UNITY_AD_MANAGER,
    name = "isInterstitialReady",
    returnType = "Z",
)

internal object IsAppOpenAdReadyFingerprint : Fingerprint(
    definingClass = MAX_UNITY_AD_MANAGER,
    name = "isAppOpenAdReady",
    returnType = "Z",
)

internal object ShowBannerFingerprint : Fingerprint(
    definingClass = MAX_UNITY_AD_MANAGER,
    name = "showBanner",
    parameters = listOf("Ljava/lang/String;"),
)

internal object CreateAdViewFingerprint : Fingerprint(
    definingClass = MAX_UNITY_AD_MANAGER,
    name = "createAdView",
    parameters = listOf("Ljava/lang/String;", "Lcom/applovin/mediation/MaxAdFormat;", "Ljava/lang/String;", "Landroid/graphics/Point;", "Z"),
)

@Suppress("unused")
val adBlockPatch =
    bytecodePatch(
        name = "Disable Interstitial, App Open & Banner Ads",
        description = "Bypasses interstitial, app-open and banner ads by intercepting readiness and show calls.",
    ) {
        compatibleWith(COMPATIBILITY_COLONY_FLOW)

        execute {
            IsInterstitialReadyFingerprint.method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent(),
            )

            IsAppOpenAdReadyFingerprint.method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent(),
            )

            ShowBannerFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )

            CreateAdViewFingerprint.method.addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
