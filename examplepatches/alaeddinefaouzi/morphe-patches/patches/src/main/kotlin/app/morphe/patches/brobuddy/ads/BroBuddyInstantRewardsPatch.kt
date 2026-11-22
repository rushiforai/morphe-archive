package app.morphe.patches.brobuddy.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants

private val maxRewardedAdReadyFingerprint = Fingerprint(
    definingClass = "Lcom/applovin/mediation/unity/MaxUnityAdManager;",
    name = "isRewardedAdReady",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

private val maxRewardedAdShowFingerprint = Fingerprint(
    definingClass = "Lcom/applovin/mediation/unity/MaxUnityAdManager;",
    name = "showRewardedAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

@Suppress("unused")
val broBuddyInstantRewardsPatch = bytecodePatch(
    name = "BroBuddy Instant Ad Rewards",
    description = "Turns every \"watch a video\" offer into an instant payout. Coins, gems and boosters that the game offers in exchange for sitting through a rewarded advert are credited the moment you tap, with no video to play, no countdown and no waiting — and the offer stays repeatable afterwards, so you can claim it as often as you like. Works with no internet connection and the reward stays credited after restarting the game.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_BROBUDDY)

    execute {
        maxRewardedAdReadyFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        val smali = """
            invoke-direct {p0, p1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->getAd(Ljava/lang/String;)Lcom/applovin/mediation/MaxAd;
            move-result-object v0
            if-eqz v0, :morphe_reward_skipped

            const-string v1, "OnRewardedAdDisplayedEvent"
            invoke-direct {p0, v1, v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->getDefaultAdEventParameters(Ljava/lang/String;Lcom/applovin/mediation/MaxAd;)Lorg/json/JSONObject;
            move-result-object v1
            invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

            const-string v1, "OnRewardedAdReceivedRewardEvent"
            invoke-direct {p0, v1, v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->getDefaultAdEventParameters(Ljava/lang/String;Lcom/applovin/mediation/MaxAd;)Lorg/json/JSONObject;
            move-result-object v1
            const-string v2, "rewardLabel"
            const-string v3, "coins"
            invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
            const-string v2, "rewardAmount"
            const-string v3, "1"
            invoke-static {v1, v2, v3}, Lcom/applovin/impl/sdk/utils/JsonUtils;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
            invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

            const-string v1, "OnRewardedAdHiddenEvent"
            invoke-direct {p0, v1, v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->getDefaultAdEventParameters(Ljava/lang/String;Lcom/applovin/mediation/MaxAd;)Lorg/json/JSONObject;
            move-result-object v1
            invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

            :morphe_reward_skipped
            return-void
        """.trimIndent()

        maxRewardedAdShowFingerprint.method.addInstructions(0, smali)
    }
}
