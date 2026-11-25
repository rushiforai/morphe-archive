package patches.detijd

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

internal val nativeAds = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val method = nativeMethod(
            "Lcom/endare/mediafin/modules/NativeAdLoaderModule;",
            "loadAd(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V",
            6, 12, listOf("adUnitId", "customTemplateId", "promise"),
        )
        // One local and four reference parameters: p1=v2, p2=v3, p4=v5.
        // Reject once through the JS caller's existing onError path; never
        // leave its loading Promise pending or construct a native ad holder.
        method.addInstructions(0, """
            const-string p1, "E_AD_DISABLED"
            const-string p2, "Ads disabled"
            invoke-interface {p4, p1, p2}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V
            return-void
        """.trimIndent())
    }
}
