package app.v4n1x.patches.parcello.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.v4n1x.patches.parcello.shared.Constants.COMPATIBILITY_PARCELLO
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val ADMOB_CLASS = "Lcom/getcapacitor/community/admob/AdMob;"
internal const val PLUGIN_CALL_CLASS = "Lcom/getcapacitor/PluginCall;"

// Every Capacitor promise must settle. A bare return would leave JavaScript
// waiting forever, so resolve each call with its normal response shape.
internal val adMobResponses = linkedMapOf(
    "initialize" to null,
    "requestTrackingAuthorization" to null,
    "trackingAuthorizationStatus" to """{"status":"denied"}""",
    "requestConsentInfo" to """{"status":"NOT_REQUIRED","isConsentFormAvailable":false,"canRequestAds":false,"privacyOptionsRequirementStatus":"NOT_REQUIRED"}""",
    "showPrivacyOptionsForm" to null,
    "showConsentForm" to null,
    "resetConsentInfo" to null,
    "setApplicationMuted" to null,
    "setApplicationVolume" to null,
    "showBanner" to null,
    "hideBanner" to null,
    "resumeBanner" to null,
    "removeBanner" to null,
    "prepareInterstitial" to """{"adUnitId":""}""",
    "showInterstitial" to null,
    "prepareRewardVideoAd" to """{"adUnitId":""}""",
    "showRewardVideoAd" to """{"type":"","amount":0}""",
    "prepareRewardInterstitialAd" to """{"adUnitId":""}""",
    "showRewardInterstitialAd" to """{"type":"","amount":0}""",
)

private val disableNativeAdsPatch = bytecodePatch {
    execute {
        val adMobClass = mutableClassDefBy(ADMOB_CLASS)
        adMobResponses.forEach { (name, response) ->
            val method = adMobClass.methods.singleOrNull {
                it.name == name && it.returnType == "V" &&
                    it.parameterTypes == listOf(PLUGIN_CALL_CLASS)
            } ?: error("Parcello AdMob method not found: $name(PluginCall)")

            // Replace the entire body, including old try/catch blocks and debug
            // locals. Allocate two locals only when returning a JSObject.
            val replacement = MutableMethod(ImmutableMethod(
                method.definingClass,
                method.name,
                method.parameters,
                method.returnType,
                method.accessFlags,
                method.annotations,
                method.hiddenApiRestrictions,
                MutableMethodImplementation(if (response == null) 2 else 4),
            ))
            replacement.addInstructions(
                0,
                if (response == null) {
                    """
                        invoke-virtual {p1}, $PLUGIN_CALL_CLASS->resolve()V
                        return-void
                    """
                } else {
                    """
                        new-instance v0, Lcom/getcapacitor/JSObject;
                        const-string v1, "${response.replace("\"", "\\\"")}"
                        invoke-direct {v0, v1}, Lcom/getcapacitor/JSObject;-><init>(Ljava/lang/String;)V
                        invoke-virtual {p1, v0}, $PLUGIN_CALL_CLASS->resolve(Lcom/getcapacitor/JSObject;)V
                        return-void
                    """
                }.trimIndent(),
            )
            adMobClass.methods.remove(method)
            adMobClass.methods.add(replacement)
        }
    }
}

@Suppress("unused")
val disableAdsPatch = resourcePatch(
    name = "Disable ads",
    description = "Disables AdMob banner, interstitial and rewarded ads, removes sponsored/promotional banners, and skips advertising consent prompts.",
) {
    compatibleWith(COMPATIBILITY_PARCELLO)
    dependsOn(disableNativeAdsPatch)

    execute {
        check(packageMetadata.packageName == "org.parcello" &&
            packageMetadata.versionName == "2.2.20" && packageMetadata.versionCode == "200220") {
            "This patch requires the original Parcello 2.2.20 APK (org.parcello, version code 200220)."
        }

        // Validate all asset anchors before writing any resource changes.
        val transformations = mapOf(
            ParcelloAdsResources.MAIN_SCRIPT to ParcelloAdsResources::patchMainScript,
            ParcelloAdsResources.INDEX_HTML to ParcelloAdsResources::patchIndexHtml,
        ) + ParcelloAdsResources.SPONSORED_SCRIPTS.associateWith { ParcelloAdsResources::patchSponsoredScript }
        val patchedAssets = transformations.map { (path, transform) ->
            val file = get(path)
            check(file.isFile) { "Parcello 2.2.20 asset not found: $path" }
            file to transform(file.readText())
        }

        document("AndroidManifest.xml").use { document ->
            // Remove the MobileAdsInitProvider too, so the SDK cannot initialize
            // automatically before the app's patched code starts.
            ParcelloAdsResources.patchManifest(document.documentElement)
        }
        patchedAssets.forEach { (file, content) -> file.writeText(content) }
    }
}
