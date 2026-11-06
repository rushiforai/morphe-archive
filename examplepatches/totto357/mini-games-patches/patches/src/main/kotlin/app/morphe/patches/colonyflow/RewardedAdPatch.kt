package app.morphe.patches.colonyflow

import app.morphe.patches.colonyflow.Constants.COMPATIBILITY_COLONY_FLOW
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val MAX_UNITY_AD_MANAGER = "Lcom/applovin/mediation/unity/MaxUnityAdManager;"

internal object IsRewardedAdReadyFingerprint : Fingerprint(
    definingClass = MAX_UNITY_AD_MANAGER,
    name = "isRewardedAdReady",
    returnType = "Z",
)

internal object ShowRewardedAdFingerprint : Fingerprint(
    definingClass = MAX_UNITY_AD_MANAGER,
    name = "showRewardedAd",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

@Suppress("unused")
val rewardedAdPatch =
    bytecodePatch(
        name = "Instant Rewarded Ads",
        description = "Bypasses rewarded video ads and immediately grants the reward.",
    ) {
        compatibleWith(COMPATIBILITY_COLONY_FLOW)

        execute {
            IsRewardedAdReadyFingerprint.method.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )

            ShowRewardedAdFingerprint.method.addInstructions(
                0,
                """
                new-instance v0, Lorg/json/JSONObject;
                invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
                const-string v1, "name"
                const-string v2, "OnRewardedAdDisplayedEvent"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "adUnitId"
                invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                invoke-static {v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

                new-instance v0, Lorg/json/JSONObject;
                invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
                const-string v1, "name"
                const-string v2, "OnRewardedAdReceivedRewardEvent"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "adUnitId"
                invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "rewardLabel"
                const-string v2, ""
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "rewardAmount"
                const-string v2, "1"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                invoke-static {v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

                new-instance v0, Lorg/json/JSONObject;
                invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
                const-string v1, "name"
                const-string v2, "OnRewardedAdHiddenEvent"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "adUnitId"
                invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                invoke-static {v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

                return-void
                """.trimIndent(),
            )
        }
    }
