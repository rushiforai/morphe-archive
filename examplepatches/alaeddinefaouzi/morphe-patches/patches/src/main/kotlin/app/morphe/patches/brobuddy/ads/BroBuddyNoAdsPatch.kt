package app.morphe.patches.brobuddy.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants
import java.util.Locale

private val maxInterstitialShowFingerprint = Fingerprint(
    definingClass = "Lcom/applovin/mediation/unity/MaxUnityAdManager;",
    name = "showInterstitial",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

@Suppress("unused")
val broBuddyNoAdsPatch = bytecodePatch(
    name = "BroBuddy No Ads",
    description = "Removes the full-screen advert that plays at the end of every race, so the results screen comes up straight away instead of behind an ad you have to sit through or skip. The race still finishes normally — the game is told the advert opened and closed exactly as it would have been, so nothing gets stuck waiting for it. Works offline and survives restarts, because no part of the ad display depends on a network round trip.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_BROBUDDY)

    execute {
        val smali = """
            invoke-direct {p0, p1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->getAd(Ljava/lang/String;)Lcom/applovin/mediation/MaxAd;
            move-result-object v0
            if-eqz v0, :morphe_interstitial_skipped

            const-string v1, "OnInterstitialDisplayedEvent"
            invoke-direct {p0, v1, v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->getDefaultAdEventParameters(Ljava/lang/String;Lcom/applovin/mediation/MaxAd;)Lorg/json/JSONObject;
            move-result-object v1
            invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

            const-string v1, "OnInterstitialHiddenEvent"
            invoke-direct {p0, v1, v0}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->getDefaultAdEventParameters(Ljava/lang/String;Lcom/applovin/mediation/MaxAd;)Lorg/json/JSONObject;
            move-result-object v1
            invoke-static {v1}, Lcom/applovin/mediation/unity/MaxUnityAdManager;->forwardUnityEvent(Lorg/json/JSONObject;)V

            :morphe_interstitial_skipped
            return-void
        """.trimIndent()

        maxInterstitialShowFingerprint.method.addInstructions(0, smali)

        val classDef = maxInterstitialShowFingerprint.classDef
        for (m in classDef.methods) {
            val nameLower = m.name.lowercase(Locale.ROOT)
            if (nameLower.contains("banner") || nameLower.contains("adview") || nameLower.contains("mrec")) {
                if (m.returnType == "V") {
                    m.addInstructions(0, "return-void")
                } else if (m.returnType.startsWith("L")) {
                    m.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                } else if (m.returnType == "Z" || m.returnType == "I") {
                    m.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
                }
            }
        }
    }
}
